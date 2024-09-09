#!/bin/bash

roles=$(aws iam list-roles --query "Roles[].Arn" --output text)

for role in $roles
do
    echo "Intentando asumir el rol: $role"
    assume_role_output=$(aws sts assume-role --role-arn "$role" --role-session-name "AssumeRoleSession" 2>/dev/null)

    if [ $? -eq 0 ]; then
        echo "Rol asumido exitosamente: $role"
        
        assumed_role_arn=$(echo "$assume_role_output" | jq -r '.Credentials.Arn')

        echo "Rol asumido: $assumed_role_arn"
        echo "$assume_role_output"
        
        break
    else
        echo "No se pudo asumir el rol: $role"
    fi
done
