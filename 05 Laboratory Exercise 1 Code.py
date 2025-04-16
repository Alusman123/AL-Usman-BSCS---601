start_location = input("Enter the starting location: ")
destination = input("Enter the destination: ")
mode_of_transport = input("Enter the mode of transport (Motorcicle, Car, Bike, Train): ")

distance = float(input("Enter the distance in kilometers: "))
speed = float(input("Enter the speed in km/h: "))

# Using the formula to compute the estimated travel time
travel_time = distance / speed

needs_rest_stop = travel_time > 5.0

print("\n--- Travel Details ---")
print(f"From: {start_location}")
print(f"To: {destination}")
print(f"Mode of Transport: {mode_of_transport}")
print(f"Distance: {distance} km")
print(f"Speed: {speed} km/h")
print(f"Estimated Travel Time: {travel_time:.2f} hours")

if needs_rest_stop:
    print("Warning: The trip takes more than 5 hours. A rest stop is recommended.")
else:
    print("No rest stop needed. Travel time is under 5 hours.")