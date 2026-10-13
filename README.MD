
## Proceso para obtener configuracion dinamica con env
 
```bash
set -a && source .exmaple.env && set +a

envsubst < backend.hcl.template > backend.hcl

terraform init -backend-config=backend.hcl

terraform plan 
```