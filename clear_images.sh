docker rmi $(docker images | grep '<none>\s*<none>' | sed 's/\(<none>\s*\)*\([a-f0-9]*\).*/\2/')
