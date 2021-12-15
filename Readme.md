# Hexlet CI/CD demo

Статический блог на [Pelican](https://github.com/getpelican/pelican), предназначенный для демонстрации CI/CD пайплайна на GitHub Actions

## Структура проекта

* `.ansible` - плейбуки для деплоя сайта на сервер
* `.github` - описание CI/CD пайплайна
* `docker` - файлы для docker-образа
* `pelican_configs` - конфиги блога
* `pelican_content` - контент блога

## Как использовать

* `make local-dev` - запуск сервера для локальной разработки. Блог будет доступен на localhost:8000, изменения в коде будут вызывать hot reload
* `make build-dev` - сборка докер-образа `strangeman/pelican-blog:dev` (с незакоммиченными изменениями)
* `make push-dev` - пуш докер-образа `strangeman/pelican-blog:dev` (с незакоммиченными изменениями)
* `make tag=tagname deploy` - деплой докер-образа c тэгом tagname на сервер
