<?php
// Function to calculate BMI and determine category
function calculateBMI($weight, $height) {
    if ($height <= 0 || $weight <= 0) {
        return ["error" => "Invalid input values. Height and weight must be greater than zero."];
    }
    
    $bmi = $weight / ($height * $height);
    $category = "";

    // Determine BMI category
    if ($bmi < 18.5) {
        $category = "Underweight";
    } elseif ($bmi >= 18.5 && $bmi < 24.9) {
        $category = "Normal weight";
    } elseif ($bmi >= 25 && $bmi < 29.9) {
        $category = "Overweight";
    } else {
        $category = "Obese";
    }

    return ["bmi" => round($bmi, 2), "category" => $category];
}

// Prompt user for weight
echo "Enter your weight (kg): ";
$weight = trim(fgets(STDIN)); // Read input from user
$weight = floatval($weight); // Convert input to float

// Prompt user for height
echo "Enter your height (m): ";
$height = trim(fgets(STDIN)); // Read input from user
$height = floatval($height); // Convert input to float

// Calculate BMI
$result = calculateBMI($weight, $height);

// Display result
if (isset($result["error"])) {
    echo "Error: " . $result["error"] . "\n";
} else {
    echo "Your BMI is: " . $result["bmi"] . "\n";
    echo "Category: " . $result["category"] . "\n";
}
?>