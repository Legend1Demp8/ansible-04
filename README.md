## Часть Terrafrom
```
Данный проект разворачивает с помощью terraform проект из 3 виртуальных машин в Yandex cloud
Склонируйте проект и используйте terrafrom apply 
Teraform сам создаст необходимый файл inventory для плейбука
```

## Часть Ansible
### Обновите роли до актуальных версий
```
ansible-galaxy install -r requirements.yml -p ./roles/
```
```
Используйте команду ansible-playbook -i inventory/prod.yml site.yml
Команда установит на определенную машину определенный инструмент из списка:
1) clickhouse
2) lighthouse
3) vector
```

