# Usuario

¿Quién soy?
```
aws sts get-caller-identity
```
Detalles de un usuario:
```
aws iam get-user --user-name <user>
```
Listar las *Access Keys* de un usuario:
```
aws iam list-access-keys --user-name <user>
```
Listar usuarios:
```
aws iam list-users
```
Listar los grupos a los que pertenece un usuario
```
aws iam list-groups-for-user --user-name <user>
```
Listar las políticas asociadas a unu usuario
```
aws iam list-attached-user-policies --user-name <user>
```
Listar las políticas *inline* de un usuario
```
aws iam list-user-policies --user-name <user>
```

# Grupo

Listar los grupos
```
aws iam list-groups
```
Listar las políticas administradas que están asociadas un grupo
```
aws iam list-attached-group-policies --group-name <group>
```
Listar las políticas *in-line* asociadas un grupo
```
aws iam list-group-policies --group-name <group>
```
Obtener el contenido de una política en línea específica de un grupo
```
aws iam get-group-policy --group-name <group> --policy-name <policy>
```
Listar los usuarios en un grupo
```
aws iam get-group --group-name <group>
```
Obtener detalles de un grupo específico
```
aws iam get-group --group-name <group>
```
