<?php 
include('includes/header.php'); 

if (isset($_GET['id'])) {
    $supplierId = $_GET['id'];

    // Fetch the supplier details
    $supplierQuery = "SELECT * FROM suppliers WHERE id = '$supplierId' LIMIT 1";
    $supplierResult = mysqli_query($conn, $supplierQuery);
    $supplier = mysqli_fetch_assoc($supplierResult);

    if ($supplier) {
        // Fetch supplier ingredients
        $ingredientQuery = "
            SELECT supplier_ingredients.id AS supplier_ingredient_id, 
                   ingredients.name AS ingredient_name, 
                   units.name AS unit_name, 
                   supplier_ingredients.price
            FROM supplier_ingredients
            JOIN ingredients ON supplier_ingredients.ingredient_id = ingredients.id
            JOIN units ON ingredients.unit_id = units.id
            WHERE supplier_ingredients.supplier_id = $supplierId
        ";
        $ingredientResult = mysqli_query($conn, $ingredientQuery);

        // Fetch all ingredients and units for dropdowns
        $ingredients = mysqli_query($conn, "SELECT * FROM ingredients");
        $units = mysqli_query($conn, "SELECT * FROM units");
    } else {
        echo "Supplier not found!";
        exit();
    }
} else {
    echo "No supplier ID provided!";
    exit();
}
?>

<div class="container-fluid px-4">
    <div class="card mt-4 shadow-sm">
        <div class="card-header">
            <h4 class="mb-0">Update Supplier Ingredients
                <a href="suppliers.php" class="btn btn-outline-secondary float-end">Back</a>
            </h4>
        </div>
        <div class="card-body">
            <?php alertMessage(); ?>

            <!-- Display Supplier Name -->
            <h5>Supplier: <?php echo htmlspecialchars($supplier['firstname'] . ' ' . $supplier['lastname']); ?></h5>

            <form action="code.php" method="POST">
                
                <!-- Supplier ID (hidden, as selection is not needed) -->
                <input type="hidden" name="supplier_id" value="<?php echo htmlspecialchars($supplierId); ?>">

                <!-- Ingredients Table -->
                <table id="ingredientsTable" class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Ingredients Name</th>
                            <th>Unit</th>
                            <th>Price</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody id="tableBody">
                        <?php
                        // Fetch existing ingredients for the supplier
                        $ingredientsQuery = "SELECT si.id AS supplier_ingredient_id, si.ingredient_id, si.price, i.name AS ingredient_name, u.name AS unit_name FROM supplier_ingredients si
                        LEFT JOIN ingredients i ON si.ingredient_id = i.id
                        LEFT JOIN units u ON i.unit_id = u.id
                        WHERE si.supplier_id = $supplierId";

                        $ingredientsResult = mysqli_query($conn, $ingredientsQuery);

                        // Display existing ingredients
                        if ($ingredientsResult && mysqli_num_rows($ingredientsResult) > 0) {
                            while ($cItem = mysqli_fetch_assoc($ingredientsResult)) {
                                echo '<tr>
                                    <td>
                                        <select name="ingredient_id[]" class="form-select" required>
                                            <option value="">Select Ingredient</option>';
                                            // Fetch all ingredients again for the dropdown
                                            $allIngredientsQuery = "SELECT id, name, unit_id FROM ingredients";
                                            $allIngredientsResult = mysqli_query($conn, $allIngredientsQuery);
                                            if ($allIngredientsResult && mysqli_num_rows($allIngredientsResult) > 0) {
                                                while ($allItem = mysqli_fetch_assoc($allIngredientsResult)) {
                                                    $selected = ($allItem['id'] == $cItem['ingredient_id']) ? 'selected' : '';
                                                    echo '<option value="' . htmlspecialchars($allItem['id']) . '" data-unit="' . htmlspecialchars($allItem['unit_id']) . '" ' . $selected . '>' . htmlspecialchars($allItem['name']) . '</option>';
                                                }
                                            }
                                        echo '</select>
                                    </td>
                                    <td>
                                        <span class="unit-text">' . htmlspecialchars($cItem['unit_name']) . '</span>
                                    </td>
                                    <td>
                                        <input type="number" name="price[]" class="form-control" value="' . htmlspecialchars($cItem['price']) . '" placeholder="Enter Price" min="0" step="0.01" required>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-danger removeRow">Remove Ingredient</button>
                                        <input type="hidden" name="remove_recipe_ingredient_id[]" value="' . htmlspecialchars($cItem['supplier_ingredient_id']) . '">
                                    </td>
                                </tr>';
                            }
                        } else {
                            echo '<tr><td colspan="4" class="text-center">No ingredients found for this supplier.</td></tr>';
                        }

                        ?>
                    </tbody>
                </table>

                <!-- Add Row Button -->
                <button type="button" class="btn btn-outline-success addRow mt-3">Add Ingredient</button>

                <!-- Submit Button -->
                <button type="submit" name="updateSupplierIngredient" class="btn btn-outline-primary mt-3">Update Supplier</button>
            </form>
        </div>
    </div>
</div>

<?php include('includes/footer.php'); ?>

<script>
document.addEventListener("DOMContentLoaded", function () {
    const tableBody = document.getElementById("tableBody");
    const addRowButton = document.querySelector(".addRow");

    // Store ingredient options in a variable
    const ingredientOptions = `<?php
    $ingredients = "SELECT id, name, unit_id FROM ingredients";
    $ingredientsResult = mysqli_query($conn, $ingredients);
    
    $optionsHtml = '<option value=\"\">Select Ingredient</option>';
    if ($ingredientsResult && mysqli_num_rows($ingredientsResult) > 0) {
        while ($cItem = mysqli_fetch_assoc($ingredientsResult)) {
            // Fetch the unit name for the ingredient
            $unitQuery = "SELECT name FROM units WHERE id = " . $cItem['unit_id'];
            $unitResult = mysqli_query($conn, $unitQuery);
            $unitName = mysqli_fetch_assoc($unitResult)['name'];

            $optionsHtml .= '<option value=\"' . htmlspecialchars($cItem['id']) . '\" data-unit-id=\"' . htmlspecialchars($cItem['unit_id']) . '\" data-unit-name=\"' . htmlspecialchars($unitName) . '\">' . htmlspecialchars($cItem['name']) . '</option>';
        }
    } else {
        $optionsHtml .= '<option value=\"\">No ingredients found</option>';
    }
    echo $optionsHtml;
?>`;

    // Function to dynamically add a new row
    addRowButton.addEventListener("click", function () {
        const newRow = document.createElement("tr");

        newRow.innerHTML = `
            <td>
                <select name="ingredient_id[]" class="form-select" required>
                    ${ingredientOptions}
                </select>
            </td>
            <td>
                <span class="unit-text">-</span>
            </td>
            <td>
                <input type="number" name="price[]" class="form-control" placeholder="Enter Price" min="0" step="0.01" required>
            </td>
            <td>
                <button type="button" class="btn btn-danger removeRow">Remove Ingredient</button>
            </td>
        `;
        tableBody.appendChild(newRow);

        // Add event listener to update the unit when an ingredient is selected
        const ingredientSelect = newRow.querySelector("select[name='ingredient_id[]']");
        
        ingredientSelect.addEventListener("change", function () {
            const selectedOption = this.options[this.selectedIndex];
            const unitText = selectedOption.getAttribute("data-unit-name") || "-"; // Update this to use the correct attribute
            newRow.querySelector(".unit-text").textContent = unitText;
        });
    });

    // Remove row functionality using event delegation
    tableBody.addEventListener("click", function (e) {
        if (e.target.classList.contains("removeRow")) {
            // Mark the row for deletion (add a hidden field if it's an existing ingredient)
            const supplierIngredientId = e.target.closest("tr").querySelector('input[name="remove_recipe_ingredient_id[]"]').value;
            if (supplierIngredientId) {
                // Add a hidden field to submit for deletion
                const removeInput = document.createElement("input");
                removeInput.type = "hidden";
                removeInput.name = "remove_recipe_ingredient_id[]";
                removeInput.value = supplierIngredientId;
                e.target.closest("form").appendChild(removeInput);
            }
            // Remove the row visually
            e.target.closest("tr").remove();
        }
    });


    // Initial row unit update on ingredient change
    tableBody.addEventListener("change", function (e) {
        if (e.target.name === "ingredient_id[]") {
            const selectedOption = e.target.options[e.target.selectedIndex];
            const unitText = selectedOption.getAttribute("data-unit-name") || "-";
            e.target.closest("tr").querySelector(".unit-text").textContent = unitText;
        }
    });
});
</script>
