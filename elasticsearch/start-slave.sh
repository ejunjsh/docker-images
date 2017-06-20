sudo docker rm -f ec-slave$1 &> /dev/null
        sleep 1
        echo "start ec-slave$1 container..."
        sudo docker run -itd \
                --net=hadoop \
                --name ec-slave$1 \
                --hostname ec-slave$1 \
                --privileged=true \
                jackshao/elasticsearch:1.0 &> /dev/null
        sleep 1 

sudo docker exec -it ec-slave$1 bash