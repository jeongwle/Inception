set:
	sudo mkdir data
	sudo mkdir data/db
	sudo mkdir data/wp
	sudo chmod 777 /etc/hosts
	echo "127.0.0.1        jeongwle.42.fr" >> /etc/hosts

start:
	cd srcs; \
	sudo docker-compose up --build -d

down:
	cd srcs; \
	sudo docker-compose down

clean:
	cd srcs; \
	sudo docker rmi $$(sudo docker images -q)
	sudo docker volume rm srcs_db srcs_wp
	sudo rm -rf /home/jeongwle/data
