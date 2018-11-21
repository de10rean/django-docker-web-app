Quick start
==

* Copy `.env.example` file in the same folder with name `.env`
* In terminal change directory to root dir of the project (it's dir with docker-compose.yml) 
* Exec command `docker-compose up --build -d` 
* Open `0.0.0.0/admin` in your browser. You will see login page
* To create new admin-user exec 'docker exec -it <django app container name> /bin/bash' 
* Then create user via `./manage.py createsuperuser`