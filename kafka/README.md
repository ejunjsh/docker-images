# Build kafka image
```
sh build-image.sh
```

# Run zookeeper cluster
see [zookeeper](https://github.com/ejunjsh/docker-images/tree/master/zookeeper)

## Run kafka cluster, you can pass different slave-id to create more slaves.
```
sh start-container.sh <slave-id>
```

