MySQL + MySQL Workbench via Docker Compose
This project sets up a local MySQL 8.3 database server and a web-based MySQL Workbench GUI using Docker Compose. It's ideal for quick testing, development, and local database management with a GUI.

🚀 Features
✅ MySQL 8.3 container

✅ Web-based MySQL Workbench (via noVNC)

✅ Persistent data storage via volumes

✅ Easy access via browser on port 3000



📂 Setup
Clone the project or copy the docker-compose.yml file into your working directory:


git clone https://github.com/YOUR_USERNAME/mysql-workbench-docker.git
cd mysql-workbench-docker




Edit the docker-compose.yml file and replace these placeholders:

PLACE_ROOT_PASS_HERE    # Root password for MySQL
PLACE_USERNAME_HERE     # MySQL user
PLACE_PASS_HERE         # Password for the user




Start the containers:

docker compose up -d



MySQL Workbench Web UI

http://localhost:3000