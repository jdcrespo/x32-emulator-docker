up:
	docker-compose up -d --no-deps --build x32-emulator

down:
	docker-compose stop x32-emulator

command:
	docker exec -it x32-emulator /X32_Command

shell:
	docker exec -it x32-emulator ash

logs:
	docker logs -f x32-emulator