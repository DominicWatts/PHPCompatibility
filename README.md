# phpcs docker image with PHPCompatibility Ruleset

[Docker_Hub](https://hub.docker.com/r/domw/phpcompatibility)

## Compilation

    docker login

    docker build -t domw/phpcompatibility:latest --build-arg="PHP_VER=php:8.1-cli" --build-arg="COMP_VER=2.5.8" --build-arg="EMAIL=dominic@pixie.agency" ./

    docker push domw/phpcompatibility:latest

    docker build -t domw/phpcompatibility:8.1-cli --build-arg="PHP_VER=php:8.1-cli" --build-arg="COMP_VER=2.5.8" --build-arg="EMAIL=dominic@pixie.agency" ./

    docker push domw/phpcompatibility:8.1-cli 

## Test

    docker-compose run --rm phpcs phpcs
    
    docker-compose run --rm phpcs phpcs -i
    
## Usage
    
    docker pull domw/phpcompatibility

    docker run --rm -v $PWD:/code domw/phpcompatibility php -v

    docker run --rm -v $PWD:/code domw/phpcompatibility:8.2-cli php -v
    
    docker run --rm -v $PWD:/code domw/phpcompatibility phpcs --version
    
    docker run --rm -v $PWD:/code domw/phpcompatibility phpcs -i
       
    docker run --rm -v $PWD:/code domw/phpcompatibility phpcs --standard=PHPCompatibility --runtime-set testVersion 5.6 /path/to/code
    
    docker run --rm -v $PWD:/code domw/phpcompatibility phpcs --standard=PHPCompatibility --runtime-set testVersion 5.5-5.6 --report=full,summary,gitblame /path/to/code
    
    docker run --rm -v $PWD:/code domw/phpcompatibility phpcs --standard=PHPCompatibility --runtime-set testVersion 7.0 --colors --warning-severity=0  --report=full,summary,gitblame /path/to/code
    
    docker run --rm -v $PWD:/code domw/phpcompatibility phpcs --standard=PHPCompatibility --runtime-set testVersion 7.0 --colors --warning-severity=0 --report=full,summary --extensions=php,phtml /path/to/code
