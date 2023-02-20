# To-do List Server - Rails

To-do list back-end using Ruby on Rails API.

[To do lists - Main Repo](https://github.com/harryuan65/To-do-Lists)

## Environments

| env  | version  |
| ---- | -------- |
| yarn | 1.22.19  |
| ruby | 3.0.3    |
| node | v16.15.1 |

## API Doc

<img width="721" alt="image" src="https://user-images.githubusercontent.com/33657734/210796727-98726fc2-e30d-4f75-8101-654c814f3491.png">

Documentation is available [here](https://editor.swagger.io/?url=https://raw.githubusercontent.com/harryuan65/to-do-list-api-rails/main/swagger/v1/swagger.yaml)

# Docker

## Building

ruby:3.0.3

```bash
docker build --platform=linux/amd64 -t tdl-rails .
```

ruby:3.0.3-alpine

```bash
docker build -t tdl-rails .
```

## Running

```bash
docker run --rm --env-file=./.env.docker -p 9999:3000 tdl-rails
```
