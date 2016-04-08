livreiro
==========

[![Build Status](https://travis-ci.org/webgoal/livreiro.svg?branch=master)](https://travis-ci.org/webgoal/livreiro)
[![Code Climate](https://codeclimate.com/github/webgoal/livreiro/badges/gpa.svg)](https://codeclimate.com/github/webgoal/livreiro)
[![Test Coverage](https://codeclimate.com/github/webgoal/livreiro/badges/coverage.svg)](https://codeclimate.com/github/webgoal/livreiro/coverage)

Desenvolvimento
---------------
### Instale:

  - Linux
    - [virtualbox](https://www.virtualbox.org/)
    - [docker](https://docs.docker.com/engine/installation/linux/ubuntulinux/)
    - [docker-compose](https://docs.docker.com/compose/install/)
    - [docker-machine](https://docs.docker.com/machine/install-machine/)

  - Mac / Windows
    - [docker-toolbox](https://www.docker.com/products/docker-toolbox)

### Executando a aplicação em desenvolvimento

#### Linux
Simplesmente vá para o passo `Subindo os containers`
- Atente-se para o fato que desta maneira, todos os arquivos que criar ficarão com o owner `root`. Após executar tarefas no container que criam arquivos, sempre execute:
```sh
sudo chown -R $USER:$USER .
```

#### Mac / Windows
Com o docker-machine, crie uma VM local:

```sh
docker-machine create default --driver virtualbox
```

Caso já tenha a VM `default`, apenas certifique-se que ela esteja atualizada e em execução:
```sh
docker-machine start default
docker-machine upgrade default
```

Faça o seu docker (client) apontar para o docker (server):
```sh
eval $(docker-machine env default)
```

#### Subindo os containers
```sh
  docker-compose up
```

##### Modo desacoplado (detached)

```sh
docker-compose up -d
```
Visualizando os logs. Caso não informar nenhuma imagem, ele exibirá os logs de todos os containers
```sh
docker-compose [imagem] logs
```

#### Acessando a aplicação
- Linux (sem docker-machine)
```sh
echo "127.0.0.1 dev.livreiro.net" | sudo tee -a /etc/hosts > /dev/null
```
- Mac / Linux com docker-machine
```sh
echo "$(docker-machine ip default) dev.livreiro.net" | sudo tee -a /etc/hosts > /dev/null
```
- Windows
Adicione o ip do docker-machine seguido do host `dev.livreiro.net` no arquivo `C:\Windows\System32\drivers\hosts`

### Instalando novas gems

Adicione a gem necessária no Gemfile e faça o build da imagem novamente

```sh
docker-compose build
docker-compose up
```

#### Executando testes
Quaisquer outras tarefas administrativas como:
  - migrations
  - generators
  - console
  - seeds
  - rake

Também podem ser executadas dessa mesma maneira
```sh
docker-compose run web rake spec
```

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
