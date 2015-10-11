# Ejemplo de Dashboard - guillehorno.com

Para poder usar este dashboard solo tienen que clonar este repositorio y ajustarlo a sus necesidades.

Es necesario contar con ruby (https://www.ruby-lang.org/es/documentation/installation/) y bundler (http://bundler.io/)

Para instalar Dashing hace falta correr el comando:

```
gem install dashing
```

Con Dashing instalado, correr este comando dentro de la carpeta donde clonaron este dashboard:

```
bundle install
```

Esto instalará las dependencias necesarias.

Para usar el widget de twitter hace falta sacar credenciales para el uso de la api, lo cual pueden hacer aquí: [https://dev.twitter.com/oauth/overview/application-owner-access-tokens](https://dev.twitter.com/oauth/overview/application-owner-access-tokens)

Para correr el dashboard usen el siguiente comando:
```
dashing start
```

Si quieren dejar corriendolo en el modo "background", cuando esté en produccion:

```
dashing start -d
```
