```
└── terraform
    └── base
    │   └── aws-mango-kubernetes
    │   │   └── network
    │   │   │   └── vpc
    │   │   │   │   └── main.tf
    │   │   │   │   └── backend.tf   //Key = $PATH/terraform.tfstate
    │   │   │   │   └── provider.tf
    │   │   └── storage
    │   │       └── s3
    │   │       └── dynamodb
    │   └── digitalocean //Cuenta de Digitalocean
    └── services
    │   └── catalog
    │   └── stock
    └── shared
    │   └── jenkins
    │   └── sonar
    │   └── nexus
```
