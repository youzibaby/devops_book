#### kafka安装
```
# install zk
docker run -d --name zookeeper -p 2181:2181 -v /etc/localtime:/etc/localtime wurstmeister/zookeeper
# install kafka
docker run -d --name kafka -p 9092:9092 -e KAFKA_BROKER_ID=0 -e KAFKA_ZOOKEEPER_CONNECT={zkip}:2181/kafka -e KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://{kafkaip}:9092 -e KAFKA_LISTENERS=PLAINTEXT://0.0.0.0:9092 -v /etc/localtime:/etc/localtime wurstmeister/kafka:2.12-2.1.1