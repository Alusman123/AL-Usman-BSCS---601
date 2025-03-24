#!/usr/bin/perl

use strict;
use warnings;

# Function to calculate BMI and determine the category
sub calculate_bmi {
    my ($weight, $height) = @_;
    
    # Validate input values
    if ($height <= 0 || $weight <= 0) {
        return (0, "Invalid input: Height and weight must be greater than zero.");
    }
    
    my $bmi = $weight / ($height * $height);
    my $category;
    
    # Determine BMI category
    if ($bmi < 18.5) {
        $category = "Underweight";
    } elsif ($bmi >= 18.5 && $bmi < 24.9) {
        $category = "Normal weight";
    } elsif ($bmi >= 25 && $bmi < 29.9) {
        $category = "Overweight";
    } else {
        $category = "Obese";
    }
    
    return ($bmi, $category);
}

# Prompt user for weight
print "Enter your weight (kg): ";
my $weight = <STDIN>;
chomp($weight);

# Prompt user for height
print "Enter your height (m): ";
my $height = <STDIN>;
chomp($height);

# Convert inputs to numeric values
$weight += 0;
$height += 0;

# Calculate BMI
my ($bmi, $category) = calculate_bmi($weight, $height);

# Display result
if ($bmi == 0) {
    print "$category\n";
} else {
    printf "Your BMI is: %.2f\n", $bmi;
    print "Category: $category\n";
}