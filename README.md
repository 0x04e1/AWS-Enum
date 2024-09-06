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
Listar las políticas
```
aws iam list-policies
```
Detalle de una política
```
aws iam get-policy --policy-arn <policy-arn>
```
Detalle sobre las versiones de una política
```
aws iam list-policy-versions --policy-arn <policy-arn>
```
Detalle sobre la versión de una política administrada
```
aws iam get-policy-version --policy-arn <policy-arn> --version-id <version-id>
```
Detalle de una política en línea aplicada sobre usuario, grupo o rol:
```
aws iam get-user-policy --user-name <user-name> --policy-name <policy-name>
aws iam get-group-policy --group-name <group-name> --policy-name <policy-name>
aws iam get-role-policy --role-name <role-name> --policy-name <policy-name>
```
Listar las políticas administradas (attached policies) asociadas a un usuario, grupo o rol
```
aws iam list-attached-user-policies --user-name <user-name>
aws iam list-attached-group-policies --group-name <group-name>
aws iam list-attached-role-policies --role-name <role-name>
```
# EC2
Información relacionada con las instancias EC2
```
aws ec2 describe-instances
```
Detalle de inforamción de una instancia específica
```
aws ec2 describe-instances --instance-ids instance-id
```
Información realacionada con el *user*-*data*
```
aws ec2 describe-instance-attribute –attribute userData --instance-id <instance-id>
```
Inforamción relacionada con roles asociados a las instancias
```
aws ec2 describe-iam-instance-profile-associations
```
Información de la configuración de red
```
aws ec2 describe-instances --instance-ids <instance-id> --query 'Reservations[*].Instances[*].[InstanceId, PublicIpAddress, PrivateIpAddress]'
```
Inforamción de los *Tags* de la instancia
```
aws ec2 describe-tags --filters "Name=resource-id,Values=<instance-id>"
```
Para verificar los volúmenes de EBS asociados con las instancias
```
aws ec2 describe-volumes
```
Para obtener información sobre los grupos de seguridad
```
aws ec2 describe-security-groups
```
Para detalles específicos sobre un grupo de seguridad
```
aws ec2 describe-security-groups --group-ids <security-group-id>
```
Para obtener información sobre las reglas de entrada y salida de un grupo de seguridad específico
```
aws ec2 describe-security-groups --group-ids <security-group-id>
```
# Lambda

Listar las funciones Lambdas
```
aws lambda list-functions
```
Obtener la configuración de la función Lambda 
```
aws lambda get-function-configuration --function-name <function-name>
```
Listar versiones de una función Lambda
```
aws lambda list-versions-by-function --function-name <function-name>
```
Recuperar información sobre una función lambda
```
aws lambda get-function --function-name <function-name>
```
Listar alias de una función Lambda
```
aws lambda list-aliases --function-name <function-name>
```
Listar capas (layers) asociadas a una función Lambda
```
aws lambda get-function-configuration --function-name <function-name>
```
Recuperar información de la política sobre una función lambda
```
aws lambda get-policy --function-name <function-name>
```
Recuperar información de mapeo de la fuente del evento sobre la función lambda especificada
```
aws lambda list-event-source-mappings --function-name <function-name>
```
Obtener detalles sobre una versión específica de una capa (*layer*) de una función Lambda
```
aws lambda get-layer-version --layer-name <LayerName> --version-number <VersionNumber>
```

# API Gateway

Listar todas las APIs REST
```
aws apigateway get-rest-apis
```
Obtener información sobre una API REST específica
```
aws apigateway get-rest-api --rest-api-id <ApiId>
```
Listar todos los recursos de una API REST
```
aws apigateway get-resources --rest-api-id <ApiId>
```
Obtener información sobre un recurso específico
```
aws apigateway get-resource --rest-api-id <ApiId> --resource-id <ResourceID>
```
Obtener información sobre el método de un recurso
```
aws apigateway get-method --rest-api-id <ApiId> --resource-id <ResourceID> --http-method <Method>
```
Listar todas las etapas para una API REST
```
aws apigateway get-stages --rest-api-id <ApiId>
```
Obtener información sobre una etapa específica de una API REST
```
aws apigateway get-stage --rest-api-id <ApiId> --stage-name <StageName>
```
Listar todas las claves de API
```
aws apigateway get-api-keys --include-values
```
Obtener información sobre una clave de API específica
```
aws apigateway get-api-key --api-key <ApiKey>
```
Listar las políticas de autorización
```
aws apigateway get-authorizers --rest-api-id <ApiId>
```
Obtener información sobre un autorizador específico
```
aws apigateway get-authorizer --rest-api-id <ApiId> --authorizer-id <AuthorizerId>
```
Listar las configuraciones de despliegue de API
```
aws apigateway get-deployments --rest-api-id <ApiId>
```
Obtener información sobre una implementación específica
```
aws apigateway get-deployment --rest-api-id <ApiId> --deployment-id <DeploymentId>
```
Listar las configuraciones de documentación de una API
```
aws apigateway get-documentation-parts --rest-api-id <ApiId>
```
Obtener información sobre una parte de documentación específica
```
aws apigateway get-documentation-part --rest-api-id <ApiId> --documentation-part-id <PartId>
```
## Container

### ECR
Describir todos los repositorios en el contenedor registro (ECR)
```
aws ecr describe-repositories
```
Obtener la política de repositorio
```
aws ecr get-repository-policy --repository-name <RepositoryName>
```
Listar todas las imágenes en un repositorio específico
```
aws ecr list-images --repository-name <RepositoryName>
```
Describir la información sobre una imagen de contenedor
```
aws ecr describe-images --repository-name <RepositoryName> --image-ids imageTag=<ImageTag>
```
Listar todos los clusters ECS
```
aws ecs list-clusters
```
Describir la información sobre un cluster ECS específico
```
aws ecs describe-clusters --clusters <ClusterName>
```
Listar todos los servicios en un cluster ECS específico
```
aws ecs list-services --cluster <ClusterName>
```
Describir la información sobre un servicio ECS específico
```
aws ecs describe-services --cluster <ClusterName> --services <ServiceName>
```
Listar todas las tareas en un cluster ECS específico
```
aws ecs list-tasks --cluster <ClusterName>
```
Describir la información sobre una tarea ECS específica
```
aws ecs describe-tasks --cluster <ClusterName> --tasks <TaskArn>
```
Listar todos los contenedores en un cluster ECS específico
```
aws ecs list-container-instances --cluster <ClusterName>
```
Describir la configuración de la instancia de contenedor
```
aws ecs describe-container-instances --cluster <ClusterName> --container-instances <ContainerInstanceArn>
```
Describir la definición de tarea
```
aws ecs describe-task-definition --task-definition <TaskDefinitionArn>
```
Listar las definiciones de tarea
```
aws ecs list-task-definitions
```
Obtener los detalles de una definición de tarea específica
```
aws ecs describe-task-definition --task-definition <TaskDefinitionArn>
```
