livreiro
==========

[![Build Status](https://drone.io/github.com/webgoal/livreiro/status.png)](https://drone.io/github.com/webgoal/livreiro/latest)

Deploy
------

Para colocar em Produção:

Realizar o build da imagem e mandar para o [hub.docker.com](http://hub.docker.com)
~~~sh
docker-compose build
docker tag livreiro_web webgoal/livreiro
docker push webgoal/livreiro
~~~

Preferencialmente em outra aba...

Fazer nosso docker client apontar para o DOCKER_HOST de produção
```sh
../docker-atelie
export MACHINE_STORAGE_PATH=`pwd`
eval $(docker-machine env docker-atelie)
```

Executar os comandos:

- Atualiza a versão da imagem
```sh
docker-compose -f docker-compose-production.yml pull
```

- Executa as migrations
```sh
docker-compose -f docker-compose-production.yml run web bundle exec rake db:migrate
```

- Compila os assets para produção
```sh
docker-compose -f docker-compose-production.yml run web bundle exec rake assets:precompile
```

Executar a nova versão da aplicação

Caso os containers NÃO estejam em execução
```sh
docker-compose -f docker-compose-production.yml up -d
```

Caso esteja
```sh
docker-compose -f docker-compose-production.yml restart
```
