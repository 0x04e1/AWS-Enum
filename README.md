## AWS-Enum

- [IAM](#IAM)
  - [Grupo](#Grupo)
  - [Rol](#Rol)
  - [Políticas](#Políticas)
- [EC2](#EC2)
  - [Security Groups](#Security-Groups)
- [Lambda](#Lambda)
- [API Gateway](#API-Gateway)
- [Container](#Container)
  - [ECR](#ECR)
  - [ECS](#ECS)
  - [EKS](#EKS)
- [S3](#S3)
- [RDS](#RDS)
- [Secrets Manager](#Secrets-Manager)
- [KMS](#KMS)

### IAM

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

### Grupo

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

### Rol

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
### Políticas
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
## EC2
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
aws ec2 describe-instances \
  --instance-ids <instance-id> \
  --query 'Reservations[*].Instances[*].[InstanceId, PublicIpAddress, PrivateIpAddress]'
```
Inforamción de los *Tags* de la instancia
```
aws ec2 describe-tags --filters "Name=resource-id,Values=<instance-id>"
```
Para verificar los volúmenes de EBS asociados con las instancias
```
aws ec2 describe-volumes
```
### Security Groups
Obtén una lista de todos los grupos de seguridad
```
aws ec2 describe-security-groups
```
Obtener información sobre los grupos de seguridad
```
aws ec2 describe-security-groups
```
Listar detalles específicos sobre un grupo de seguridad
```
aws ec2 describe-security-groups --group-ids <security-group-id>
```
Para obtener información sobre las reglas de entrada y salida de un grupo de seguridad específico
```
aws ec2 describe-security-groups --group-ids <security-group-id>
```
Listar los grupos de seguridad asociados con un *Load Balancer*
```
aws elb describe-load-balancers --query 'LoadBalancerDescriptions[*].SecurityGroups' --output text
```
Listar Reglas de Seguridad de Red
```
aws ec2 describe-network-acls --query 'NetworkAcls[*].Entries'
```
### Lambda

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

### API Gateway

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
### ECS
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
### EKS

Listar todos los clústeres EKS
```
aws eks list-clusters
```
Obtener detalles de un clúster específico
```
aws eks describe-cluster --name <Cluster-Name>
```
Listar todos los node groups en un clúster específico
```
aws eks list-nodegroups --cluster-name <Cluster-Name>
```
Describir un node group específico
```
aws eks describe-nodegroup --cluster-name <Cluster-Name> --nodegroup-name <Node-Group>
```
Listar todos los perfiles de *Fargate* en un clúster específico
```
aws eks list-fargate-profiles --cluster-name <Cluster-Name>
```
Describir un perfil de Fargate específico
```
aws eks describe-fargate-profile --cluster-name <Cluster-Name> --fargate-profile-name <Profile-Name>
```

### S3

Listar todos los *buckets* en la cuenta
```
aws s3api list-buckets
```
Obtener la configuración de ACLs de un *bucket* específico
```
aws s3api get-bucket-acl --bucket <bucket-name>
```
Obtener la política de un *bucket* específico
```
aws s3api get-bucket-policy --bucket <bucket-name>
```
Revisar la configuración de bloque de acceso público de un bucket
```
aws s3api get-public-access-block --bucket <bucket-name>
```
Obtener la configuración de versionado de un *bucket*
```
aws s3api get-bucket-versioning --bucket <bucket-name>
```
Obtener la configuración de replicación de un *bucket*
```
aws s3api get-bucket-replication --bucket <bucket-name>
```
Listar todos los objetos en un *bucket* específico
```
aws s3api list-objects --bucket <bucket-name>
```
Obtener la configuración de ACLs de un objeto específico
```
aws s3api get-object-acl --bucket <bucket-name> --key <object-name>
```
Obtener la configuración de CORS para un *bucket* específico
```
aws s3api get-bucket-cors --bucket <bucket-name>
```
Obtener la configuración de encriptación para un *bucket* específico
```
aws s3api get-bucket-encryption --bucket <bucket-name>
```
Obtener la configuración de *logging* de acceso de un *bucket*
```
aws s3api get-bucket-logging --bucket <bucket-name>
```
Obtener la configuración de bloqueo de objetos
```
aws s3api get-object-lock-configuration --bucket <bucket-name>
```
Revisar la Configuración de Políticas de *bucket* en VPC
```
aws s3api get-bucket-policy-status --bucket <bucket-name>
```

### RDS

Obtener información sobre los clústeres de RDS
```
aws rds describe-db-clusters
```
Obtener información sobre las instancias de base de datos
```
aws rds describe-db-instances
```
Obtener información sobre los grupos de subredes de RDS
```
aws rds describe-db-subnet-groups
```
Obtener información sobre los grupos de seguridad de RDS
```
aws rds describe-db-security-groups
```
Obtener información sobre los proxies de RDS
```
aws rds describe-db-proxies
```
Obtener información sobre las copias de seguridad automáticas de las instancias de RDS
```
aws rds describe-db-instances --query "DBInstances[*].[DBInstanceIdentifier,BackupRetentionPeriod]"
```
Listar snapshots de bases de datos
```
aws rds describe-db-snapshots
```
Obtener la configuración de logs para una instancia de base de datos
```
aws rds describe-db-log-files --db-instance-identifier <instance-id>
```
Obtener información sobre los grupos de parámetros de RDS
```
aws rds describe-db-parameter-groups
```
Describir un grupo de parámetros específico
```
aws rds describe-db-parameters --db-parameter-group-name <parameter-group-name>
```
Obtener información sobre las claves KMS utilizadas para cifrar tus instancias de RDS
```
aws rds describe-db-instances --query "DBInstances[*].[DBInstanceIdentifier,StorageEncrypted,KmsKeyId]"
```
Obtener información sobre las configuraciones de VPC asociadas a tus instancias de RDS
```
aws rds describe-db-instances --query "DBInstances[*].[DBInstanceIdentifier,VpcSecurityGroups]"
```
Obtener detalles sobre la configuración de autenticación de la base de datos
```
aws rds describe-db-instances --query "DBInstances[*].[DBInstanceIdentifier,MasterUsername]"
```

### Secrets Manager

Listar todos los secretos en *Secrets Manager*
```
aws secretsmanager list-secrets
```
Obtener información detallada sobre un secreto específico
```
aws secretsmanager describe-secret --secret-id <SecretName>
```
Obtener la política de recursos asociada a un secreto específico
```
aws secretsmanager get-resource-policy --secret-id <SecretID>
```
Obtener el valor de un secreto específico (cuidado con la exposición de datos sensibles)
```
aws secretsmanager get-secret-value --secret-id <SecretName>
```
Listar las versiones de un secreto específico
```
aws secretsmanager list-secret-version-ids --secret-id <SecretID>
```
Describir una versión específica de un secreto
```
aws secretsmanager describe-secret --secret-id <SecretID> --version-id <VersionID>
```
Obtener la configuración de rotación de un secreto específico
```
aws secretsmanager describe-secret --secret-id <SecretID>
```
Obtener las políticas de acceso de un secreto (ya cubierto por get-resource-policy)
```
aws secretsmanager get-resource-policy --secret-id <SecretID>
```
Listar las etiquetas asociadas a un secreto específico
```
aws secretsmanager list-secret-tags --secret-id <SecretID>
```
Agregar o eliminar etiquetas de un secreto
```
aws secretsmanager tag-resource --secret-id <SecretID> --tags Key=tag-key,Value=tag-value
aws secretsmanager untage-resource --secret-id <SecretID> --tag-keys tag-key
```
### KMS
Listar claves
```
aws kms list-keys
```
Listar detalles específicos sobre una clave en particular, incluyendo su estado y la política asociada
```
aws kms describe-key --key-id <key-id>
```
Revisa la política de una clave específica para verificar los permisos.
```
aws kms get-key-policy --key-id <key-id> --policy-name default
```
Listar todos los alias de claves
```
aws kms list-aliases
```
Listar detalles sobre un alias específico
```
aws kms describe-alias --alias-name <alias-name>
```
Verifica si la rotación automática de claves está habilitada para una clave específica.
```
aws kms get-key-rotation-status --key-id <key-id>
```
Obtén un resumen de todas las claves en tu cuenta.
```
aws kms list-keys --output table
```
Verifica los permisos asociados a una clave, incluyendo los permisos de IAM que están en la política de la clave
```
aws kms list-grants --key-id <key-id>
```
Listar las políticas y grants para todas las claves
```
aws kms list-grants --key-id <key-id> --output table
```
Obtener detalles sobre el estado de la clave
```
aws kms describe-key --key-id <key-id> --query 'KeyMetadata.KeyState'
```
Información sobre las claves en uso en los servicios de AWS, como en EBS, S3, etc.
```
aws kms list-aliases --query 'Aliases[*].[AliasName, TargetKeyId]'
```
Detalle de las políticas de acceso y permisos asociados a las clave
```
aws kms list-grants --key-id <key-id>
```
