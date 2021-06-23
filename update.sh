
echo Pulling image...
docker pull docker.pkg.github.com/shaunakg/sixtysecondshell/sixtysecondshell:latest

echo Stopping current container...
docker kill sixtyseconds-container
docker rm sixtyseconds-container

echo Starting new container...
docker run --privileged -d -v /var/tmp:/usr/src/app/__code_store -v /var/run/docker.sock:/var/run/docker.sock -p 80:80 --name "sixtyseconds-container" docker.pkg.github.com/shaunakg/sixtysecondshell/sixtysecondshell:latest

echo Pruning all unused images to save disk space...
docker system prune -af

echo Done.
