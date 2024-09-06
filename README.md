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

# Rol

Listar los roles
```
aws iam list-roles
```
Enumerar las políticas asociadas a un rol
```
aws iam list-attached-role-policies --role-name role-name
```
Enumerar las políticas *in-line* asociadas a un rol
```
aws iam list-role-policies --role-name role-name
```
Obtener detalles de un rol específico
```
aws iam get-role --role-name <role-name>
```
Obtener el contenido de una política administrada específica
```
aws iam get-policy --policy-arn <policy-arn>
```
Obtener la versión específica de esa política
```
aws iam get-policy-version --policy-arn <policy-arn> --version-id <version-id>
```
Obtener el contenido de una política en línea específica 
```
aws iam get-role-policy --role-name <role-name> --policy-name <policy-name>
```
# Políticas
Listar las políticas :
```
aws iam list-policies
```
Detalle de una política
```
aws iam get-policy --policy-arn policy-arn
```
Detalle sobre las versiones de una política
```
aws iam list-policy-versions --policy-arn policy-arn
```
Detalle sobre la versión de una política administrada
```
aws iam get-policy-version --policy-arn policy-arn --version-id version-id
```
Detalle de una política en línea aplicada sobre usuario, grupo o rol:
```
aws iam get-user-policy --user-name user-name --policy-name policy-name
aws iam get-group-policy --group-name group-name --policy-name policy-name
aws iam get-role-policy --role-name role-name --policy-name policy-name
```
Listar las políticas administradas (attached policies) asociadas a un usuario, grupo o rol
```
aws iam list-attached-user-policies --user-name <user-name>
aws iam list-attached-group-policies --group-name <group-name>
aws iam list-attached-role-policies --role-name <role-name>
```
