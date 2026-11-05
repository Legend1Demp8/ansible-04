## Часть Terrafrom
```
Данный проект разворачивает с помощью terraform проект из 3 виртуальных машин в Yandex cloud
Склонируйте проект и используйте terrafrom apply 
Teraform сам создаст необходимый файл inventory для всего плейбука
```

## Часть Ansible
```
Используйте команду ansible-playbook -i inventory/prod.yml site.yml
Команда установит на определенную машину определенный иснтрумент из списка:
1) clickhouse
2) lighthouse
3) vector

Переменные хранятся в папке group_vars

```

