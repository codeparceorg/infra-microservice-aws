
## Proceso para obtener configuracion dinamica con env
 
```bash
set -a && source .exmaple.env && set +a

envsubst < provider.tf.template > provider.tf

terraform init

terraform plan 
```