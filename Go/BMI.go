package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

// Function to calculate BMI and return the category
func calculateBMI(weight, height float64) (float64, string) {
	if height <= 0 || weight <= 0 {
		return 0, "Invalid input: Height and weight must be greater than zero."
	}

	bmi := weight / (height * height)
	var category string

	// Determine BMI category
	if bmi < 18.5 {
		category = "Underweight"
	} else if bmi >= 18.5 && bmi < 24.9 {
		category = "Normal weight"
	} else if bmi >= 25 && bmi < 29.9 {
		category = "Overweight"
	} else {
		category = "Obese"
	}

	return bmi, category
}

func main() {
	reader := bufio.NewReader(os.Stdin)

	// Prompt user for weight
	fmt.Print("Enter your weight (kg): ")
	weightInput, _ := reader.ReadString('\n')
	weightInput = strings.TrimSpace(weightInput)
	weight, err := strconv.ParseFloat(weightInput, 64)
	if err != nil {
		fmt.Println("Invalid weight input. Please enter a number.")
		return
	}

	// Prompt user for height
	fmt.Print("Enter your height (m): ")
	heightInput, _ := reader.ReadString('\n')
	heightInput = strings.TrimSpace(heightInput)
	height, err := strconv.ParseFloat(heightInput, 64)
	if err != nil {
		fmt.Println("Invalid height input. Please enter a number.")
		return
	}

	// Calculate BMI
	bmi, category := calculateBMI(weight, height)

	// Display result
	if bmi == 0 {
		fmt.Println(category)
	} else {
		fmt.Printf("Your BMI is: %.2f\n", bmi)
		fmt.Println("Category:", category)
	}
}
