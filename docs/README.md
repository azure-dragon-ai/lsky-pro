```shell
composer install

chmod 777 public
chmod 777 storage
chmod 777 storage/app
chmod 777 storage/app/public
chmod 777 storage/app/uploads
chmod 777 storage/framework
chmod 777 storage/framework/cache
chmod 777 storage/framework/cache/data
chmod 777 storage/framework/sessions
chmod 777 storage/framework/testing
chmod 777 storage/framework/views
chmod 777 storage/logs
chmod -R 777 storage/logs/laravel.log
chmod 777 bootstrap/cache/

create database hjh_image default character set utf8mb4 collate utf8mb4_unicode_ci;

mysqldump -h 127.0.0.1 -u root -p hjh_image > hjh_image.sql

https://hjh-image1.wepromo.cn/
admin@ai-space.net
admin11
```