
## Proceso para obtener configuracion dinamica con env
 
```bash
set -a && source .exmaple.env && set +a

envsubst < provider.tf.template > provider.tf

terraform init

terraform plan 
```

## Get configuracion

aws ssm get-parameter \
--name /test/devsu-demo-devops-java \
--query "Parameter.Value" \
--output text \
--region us-east-1  > ./.env

### Deploy

```bash
set -a && source .exmaple.env && set +a

envsubst < provider.tf.template > provider.tf

terraform apply 
```