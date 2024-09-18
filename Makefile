build:
	docker build --tag whale .
images:
	docker images
remove-img:
	docker rmi whale:latest
run:
	docker run -d -p 5000:5000 --name whale_running whale
stop:
	docker stop $(container_id)
id:
	docker ps -a
remove-cnt:
	docker container rm $(container_id)