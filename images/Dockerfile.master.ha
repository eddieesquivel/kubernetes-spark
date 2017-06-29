FROM quay.io/eddie_esquivel/spark-base:2.1.1-ha 
ADD start-master-ha /
ENTRYPOINT ["/bin/bash", "-c", "./start-master-ha"]
