# NextHop Unbound Recursive DNS w/ Docker

[![N|Solid](http://www.nexthop.net.br/static/images/logo.png)](http://www.nexthop.net.br)

Container Docker para DNS Recursivo Unbound com DNSSEC


A imagem por padrão, binda a porta 53 tcp e udp no host do container.

Certifique-se que ela está liberada.

### Criando e inicializando o container:

```sh
$ docker run -it --name nexthop-unbound -d -p 53:53/udp -p 53:53 nexthopsolutions/docker-unbound
```

Para verificar o status:

```sh
$ docker ps
```
 
Para liberar seus prefixos:

```sh
$ docker exec -it nexthop-unbound bash
$ vim /etc/unbound/unbound.conf
```

Edite o arquivo conforme deseja, adicionando seus prefixos e restarte o serviço.

```sh
$ /etc/init.d/unbound restart
$ exit
```

Dúvidas ou informações: <elizandro@nexthop.net.br>
