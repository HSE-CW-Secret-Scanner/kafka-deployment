version: '3'
services:
 zookeeper:
   image: confluentinc/cp-zookeeper:7.0.0
   environment:
     ZOOKEEPER_CLIENT_PORT: 2181

 kafka:
   image: confluentinc/cp-kafka:7.0.0
   depends_on:
     - zookeeper
   ports:
     - "9092:9092"
   environment:
     KAFKA_ZOOKEEPER_CONNECT: "zookeeper:2181"
     KAFKA_ADVERTISED_LISTENERS: "PLAINTEXT://localhost:9092"
     KAFKA_AUTO_CREATE_TOPICS_ENABLE: "true"
