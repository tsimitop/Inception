import os
import shutil
import re

def get_non_empty_input(prompt):
	"""Prompt the user until they provide a non-empty input."""
	while True:
		value = input(prompt).strip()
		if value:
			return value
		print("This field cannot be empty. Please enter a valid value.")

def prompt_input(prompt, default_value):
    user_input = input(f"{prompt} (default: {default_value}): ")
    return user_input if user_input else default_value


WP_ADMIN_USER = prompt_input("Enter name for wordpress admin (default: thalia): ", "thalia")
WP_ADMIN_PASSWORD = get_non_empty_input("Enter password for wordpress admin: ")
WP_ADMIN_EMAIL = prompt_input("Enter email for wordpress admin (default: thalia@thalia.com): ", "thalia@thalia.com")
WP_DB_USER = prompt_input("Enter user of database (default: wpuser): ", "wpuser")
WP_DB_PASSWORD = get_non_empty_input("Enter password of database: ")
WP_ROOT_DB_PASSWORD = get_non_empty_input("Enter password of database root: ")
WP_USER = prompt_input("Enter worpress user (default: dummy): ", "dummy")
WP_PASS = get_non_empty_input("Enter WP_PASS: ")
WP_EMAIL = prompt_input("Enter worpress user email (default: dummy@dummy.com): ", "dummy@dummy.com")

with open(".env", "w") as environment_template:
	environment_template.write(f"WP_DB_NAME=wordpress\n")
	environment_template.write(f"WP_DB_HOST=mariadb\n")
	environment_template.write(f"WP_TITLE=inception\n")
	environment_template.write(f"WP_URL=localhost\n")
	environment_template.write(f"WP_ADMIN_USER={WP_ADMIN_USER}\n")
	environment_template.write(f"WP_ADMIN_PASSWORD={WP_ADMIN_PASSWORD}\n")
	environment_template.write(f"WP_ADMIN_EMAIL={WP_ADMIN_EMAIL}\n")
	environment_template.write(f"WP_DB_USER={WP_DB_USER}\n")
	environment_template.write(f"WP_DB_PASSWORD={WP_DB_PASSWORD}\n")
	environment_template.write(f"WP_ROOT_DB_PASSWORD={WP_ROOT_DB_PASSWORD}\n")
	environment_template.write(f"WP_USER={WP_USER}\n")
	environment_template.write(f"WP_PASS={WP_PASS}\n")
	environment_template.write(f"WP_EMAIL={WP_EMAIL}\n")

print(".env created successfully")

filename = ".env"
destination_folder = "srcs/"

if not os.path.exists(filename):
	print(f"Error: {filename} does not exist!")
	exit(1)

os.makedirs(destination_folder, exist_ok=True)

shutil.move(filename, os.path.join(destination_folder, filename))

print(".env moved to srcs")
