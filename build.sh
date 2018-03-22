docker build --no-cache -t misterio92/ci-php-node:1.0 1.0
docker build --no-cache -t misterio92/ci-php-node:2.0 .
docker push misterio92/ci-php-node
