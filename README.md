# BitrixDock
BitrixDock позволяет легко и просто запускать **Bitrix CMS** на **Docker**.

## Содержит:
- php7 / php 5.6
- apache / nginx
- mysql 5.7
- memcached
- phpmyadmin

## Порядок разработки в Windows
Если вы работаете в Windows, то требуется установить виртуальную машину.
Желательно использовать Virtualbox, сделать сеть "Сетевой мост", поставить Ubuntu Server.
Сетевой мост даст возможность обращаться к машине по IP и не делать лишних пробросов портов.
Ваш рабочий проект должен хранится в двух местах, первое - локальная папка с проектами на хосте (открывается в IDE), второе - виртуальная машина
(например ```/var/www/bitrix```). Проект на хосте мапится в IDE к гостевой OC.

### Начало работы
- Склонируйте репозиторий bitrixdock
```
git clone https://github.com/barysh/bitrixdock.git
```

- Выполните настройку окружения


⚠️ Если у вас не мак и не windows, то добавьте строчку /etc/localtime:/etc/localtime/:ro в docker-compose (source)

По умолчнию используется apache php7, эти настройки можно изменить в файле ```.env```. Также можно задать путь к каталогу с сайтом и параметры базы данных MySQL.


```
PHP_VERSION=php7           # Версия php 
WEB_SERVER_TYPE=apache     # Веб-сервер nginx/apache
MYSQL_DATABASE=bitrix      # Имя базы данных
MYSQL_USER=bitrix          # Пользователь базы данных
MYSQL_PASSWORD=123         # Пароль для доступа к базе данных
MYSQL_ROOT_PASSWORD=123    # Пароль для пользователя root от базы данных
INTERFACE=127.0.0.1        # На данный интерфейс будут проксироваться порты
SITE_PATH=/var/www/bitrix  # Фактический путь к директории Вашего сайта

```

- Запустите bitrixdock
```
docker-compose up -d
```
## Некоторые пояснения
- docker-compose.yml
```
PHP_IDE_CONFIG: "serverName=Docker"     # имя сервера для настройки xdebug в PhpStorm (9001 порт)
${SITE_PATH}:/var/www/bitrix            # $_SERVER["DOCUMENT_ROOT"] для первого сайта

# (при необходимости)
${SITE_PATH2}:/var/www/bitrix2          # $_SERVER["DOCUMENT_ROOT"] для второго сайта
```
- /apache/conf/httpd.conf
```
# настройка $_SERVER["DOCUMENT_ROOT"] для первого сайта
<Directory "/var/www/bitrix/">
    AllowOverride ALL
    Options FollowSymLinks
    Require all granted
</Directory>

# (при необходимости)
# настройка $_SERVER["DOCUMENT_ROOT"] для второго сайта
# также необходимо поправить файл /apache/conf/conf.d/default.conf
<Directory "/var/www/bitrix2/">
    AllowOverride ALL
    Options FollowSymLinks
    Require all granted
</Directory>
```
- /php7/Dockerfile
```
# настройка директорий для работы php
WORKDIR "/var/www/bitrix"
WORKDIR "/var/www/bitrix2"
```
- /php7/php.ini
```
xdebug.remote_host = "host.docker.internal"     # хост для xdebug (если запуск не на MacOS, указать IP)
xdebug.remote_port = 9001                       # порт для xdebug
```

## Примечание
- В настройках подключения требуется указывать имя сервиса, например для подключения к mysql нужно указывать "mysql", а не "localhost". Пример [конфига](configs/.settings.php)  с подклчюением к mysql и memcached.
