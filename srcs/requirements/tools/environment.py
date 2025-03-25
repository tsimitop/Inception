import os
import shutil
import re

# Function to get the password from a file
def get_password_from_file(file_path):
    try:
        with open(file_path, 'r') as file:
            return file.read().strip()  # Rm extra whitespace
    except FileNotFoundError:
        raise Exception(f"Password file not found at {file_path}")
    except Exception as e:
        raise Exception(f"Error reading password from file: {e}")

def prompt_input(prompt, default_value):
    user_input = input(f"{prompt}")
    return user_input if user_input else default_value


WP_ADMIN_USER = prompt_input("Enter name for wordpress admin (default: thalia): ", "thalia")
default_password = get_password_from_file("secrets/admin_credentials.txt")
WP_ADMIN_PASSWORD = prompt_input("Enter password for wordpress admin: ", default_password)
WP_ADMIN_EMAIL = prompt_input("Enter email for wordpress admin (default: thalia@thalia.com): ", "thalia@thalia.com")
WP_DB_USER = prompt_input("Enter user of database (default: wpuser): ", "wpuser")
default_password = get_password_from_file("secrets/db_password.txt")
WP_DB_PASSWORD = prompt_input("Enter password for wordpress admin: ", default_password)
default_password = get_password_from_file("secrets/db_root_password.txt")
WP_ROOT_DB_PASSWORD = prompt_input("Enter password of database root: ", default_password)
WP_USER = prompt_input("Enter worpress user (default: dummy): ", "dummy")
default_password = get_password_from_file("secrets/wp_user_password.txt")
WP_PASS = prompt_input("Enter password for wordpress user: ", default_password)
WP_EMAIL = prompt_input("Enter worpress user email (default: dummy@dummy.com): ", "dummy@dummy.com")

with open(".env", "w") as environment_template:
	environment_template.write(f"WP_DB_NAME=wordpress\n")
	environment_template.write(f"WP_DB_HOST=mariadb:3306\n")
	environment_template.write(f"WP_TITLE=inception\n")
	environment_template.write(f"WP_URL=tsimitop.42.fr\n")
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
