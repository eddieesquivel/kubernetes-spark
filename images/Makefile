all: spark 
push: push-spark
.PHONY: push push-spark spark 

# To bump the Spark version, bump the spark_ver in Dockerfile, bump
# this tag and reset to v1. You should also double check the native
# Hadoop libs at that point (we grab the 2.6.1 libs, which are
# appropriate for 1.5.2-with-2.6).
SPARK_TAG = 2.2.0

spark-base:
	docker build -t quay.io/eddie_esquivel/spark-base . -f Dockerfile.base
	docker tag quay.io/eddie_esquivel/spark-base quay.io/eddie_esquivel/spark-base:$(SPARK_TAG)

spark-master: spark-base
	docker build -t quay.io/eddie_esquivel/spark-master . -f Dockerfile.master
	docker tag quay.io/eddie_esquivel/spark-master quay.io/eddie_esquivel/spark-master:$(SPARK_TAG)

spark-worker: spark-base
	docker build -t quay.io/eddie_esquivel/spark-worker . -f Dockerfile.worker
	docker tag quay.io/eddie_esquivel/spark-worker quay.io/eddie_esquivel/spark-worker:$(SPARK_TAG)

spark: spark-base spark-master spark-worker

push-spark-base: spark-base
	docker push quay.io/eddie_esquivel/spark-base
	docker push quay.io/eddie_esquivel/spark-base:$(SPARK_TAG)

push-spark-master: spark-master
	docker push quay.io/eddie_esquivel/spark-master
	docker push quay.io/eddie_esquivel/spark-master:$(SPARK_TAG)

push-spark-worker: spark-worker
	docker push quay.io/eddie_esquivel/spark-worker
	docker push quay.io/eddie_esquivel/spark-worker:$(SPARK_TAG)

push-spark: push-spark-base push-spark-master push-spark-worker

clean:
	docker rm -f $$(docker ps -aq) > /dev/null 2>&1 ;true
	docker rmi -f $$(docker images -a | grep "^quay.io/eddie_esquivel/spark-master" | awk '{print $3}') > /dev/null 2>&1 ;true
	docker rmi -f $$(docker images -a | grep "^quay.io/eddie_esquivel/spark-worker" | awk '{print $3}') > /dev/null 2>&1 ;true
	docker rmi -f $$(docker images -a | grep "^quay.io/eddie_esquivel/spark-base" | awk '{print $3}') > /dev/null 2>&1 ;true
	docker rmi -f $$(docker images -a | grep "^<none>" | awk '{print $3}') > /dev/null 2>&1 ;true
