<?php include('includes/header.php'); ?>

<div class="container-fluid px-4">
    <div class="card mt-4 shadow-sm">
        <div class="card-header">
            <h4 class="mb-0">Add Supplier Ingredients
                <a href="suppliers.php" class="btn btn-outline-secondary float-end">Back</a>
            </h4>
        </div>
        <div class="card-body">
            <?php alertMessage(); ?>
            <form action="code.php" method="POST">
                
                <!-- Supplier Selection -->
                <div class="col-md-12 mb-3">
                    <label>Select Supplier</label>
                    <select name="supplier_id" class="form-select" required>
                        <option value="">Select Supplier</option>
                        <?php
                        $suppliersQuery = "
                        SELECT s.id, s.firstname 
                        FROM suppliers s 
                        LEFT JOIN supplier_ingredients si ON s.id = si.supplier_id
                        WHERE si.supplier_id IS NULL";  // Only select suppliers with no ingredients yet
                    
                        $suppliers = mysqli_query($conn, $suppliersQuery);
                        if ($suppliers && mysqli_num_rows($suppliers) > 0) {
                            while ($supItem = mysqli_fetch_assoc($suppliers)) {
                                echo '<option value="' . htmlspecialchars($supItem['id']) . '">' . htmlspecialchars($supItem['firstname']) . '</option>';
                            }
                        } else {
                            echo '<option value="">No suppliers found</option>';
                        }
                        ?>
                    </select>
                </div>

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
                        <!-- Default Row -->
                        <tr>
                            <td>
                                <select name="ingredient_id[]" class="form-select" required>
                                    <option value="">Select Ingredient</option>
                                    <?php
                                    // Run the query to fetch ingredients along with units
                                    $ingredientsQuery = "SELECT ingredients.id, ingredients.name, units.name AS unit_name FROM ingredients 
                                        LEFT JOIN units ON ingredients.unit_id = units.id";
                                    $ingredientsResult = mysqli_query($conn, $ingredientsQuery);

                                    // Display ingredients options
                                    if ($ingredientsResult && mysqli_num_rows($ingredientsResult) > 0) {
                                        while ($cItem = mysqli_fetch_assoc($ingredientsResult)) {
                                            echo '<option value="' . htmlspecialchars($cItem['id']) . '" data-unit="' . htmlspecialchars($cItem['unit_name']) . '">' . htmlspecialchars($cItem['name']) . '</option>';
                                        }
                                    } else {
                                        echo '<option value="">No ingredients found</option>';
                                    }
                                    ?>
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
                        </tr>
                    </tbody>
                </table>

                <!-- Add Row Button -->
                <button type="button" class="btn btn-outline-success addRow mt-3">Add Ingredient</button>

                <!-- Submit Button -->
                <button type="submit" name="saveSupplierIngredient" class="btn btn-outline-primary mt-3">Save Supplier</button>
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
        $ingredients = "SELECT ingredients.id, ingredients.name, units.name AS unit_name FROM ingredients 
        LEFT JOIN units ON ingredients.unit_id = units.id";
        $ingredientsResult = mysqli_query($conn, $ingredients);
        
        $optionsHtml = '<option value=\"\">Select Ingredient</option>';
        if ($ingredientsResult && mysqli_num_rows($ingredientsResult) > 0) {
            while ($cItem = mysqli_fetch_assoc($ingredientsResult)) {
                $optionsHtml .= '<option value=\"' . htmlspecialchars($cItem['id']) . '\" data-unit=\"' . htmlspecialchars($cItem['unit_name']) . '\">' . htmlspecialchars($cItem['name']) . '</option>';
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

        // Add event listener to update the unit when ingredient is selected
        newRow.querySelector("select[name='ingredient_id[]']").addEventListener("change", function () {
            const selectedOption = this.options[this.selectedIndex];
            const unitText = selectedOption.getAttribute("data-unit") || "-";
            newRow.querySelector(".unit-text").textContent = unitText;
        });

        // Add event listener to the new row's remove button
        newRow.querySelector(".removeRow").addEventListener("click", function () {
            newRow.remove();
        });
    });

    // Remove row functionality for initial row
    document.querySelectorAll(".removeRow").forEach(function(button) {
        button.addEventListener("click", function () {
            this.closest("tr").remove();
        });
    });

    // Initial row unit update on ingredient change
    document.querySelectorAll("select[name='ingredient_id[]']").forEach(function(selectElement) {
        selectElement.addEventListener("change", function () {
            const selectedOption = this.options[this.selectedIndex];
            const unitText = selectedOption.getAttribute("data-unit") || "-";
            this.closest("tr").querySelector(".unit-text").textContent = unitText;
        });
    });
});
</script>

