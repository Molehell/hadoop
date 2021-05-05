## 创建配置和数据目录，让数据永久化或方便更改配置

mkdir -p /opt/data_hadoop/config/{mysql,hadoop,hue}
mkdir -p /opt/data_hadoop/{master,slave1,slave2}

## 创建docker 网络

docker create network hadoop

## 运行docker 环境并初始化

## hadoop

docker run -itd \
           --net=hadoop \
           --name hadoop-master \
           --hostname hadoop-master \
           fjr19940207/hadoop:v1 &> /dev/null

docker run -itd \
           --net=hadoop \
           --name hadoop-slave1 \
           --hostname hadoop-slave1 \
           fjr19940207/hadoop:v1 &> /dev/null

docker run -itd \
           --net=hadoop \
           --name hadoop-slave2 \
           --hostname hadoop-slave2 \
           fjr19940207/hadoop:v1 &> /dev/null

## 初始化namenode
docker exec hadoop-master /opt/hadoop/bin/hdfs namenode -format
docker 

## 永久化
docker cp hadoop-master:/opt/hadoop/etc/hadoop /opt/data_hadoop/config/hadoop
docker cp hadoop-master:/opt/hdfs /opt/data_hadoop/master/
docker cp hadoop-slave1:/opt/hdfs /opt/data_hadoop/slave1/
docker cp hadoop-slave2:/opt/hdfs /opt/data_hadoop/slave2/
 
