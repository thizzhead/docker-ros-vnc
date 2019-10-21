docker rm -f rosvnc >/dev/null 2>/dev/null
docker run -d --name rosvnc --privileged -it \
        --volume=$(pwd)/shared:/home/ros/Desktop/shared \
        henry2423/ros-vnc-ubuntu:kinetic >/dev/null 2>/dev/null
$(xdg-open 'http://'$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' rosvnc)':'$(docker exec rosvnc printenv NO_VNC_PORT)"/?password="$(docker exec rosvnc printenv VNC_PW)) >/dev/null 2>/dev/null
