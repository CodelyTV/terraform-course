```
└── terraform
    ├── dev
    │   └── base  //Infra relacionadas con la configuración base de la plataforma
    │   │   └── aws-mango-kubernetes  //Cuenta de AWS destinada a Kubernetes
    │	│   │   └── network //Infra relacionadas con el networking de la cuenta
	│	│   │   │   └── vpc
    │   │   │	│   │   └── main.tf
    │   │   │	│	│   └── backend.tf //Key = dev/catalog/s3/terraform.tfstate
    │   │   │	│	│   └── provider.tf
	│	│   │   └── storage
	│	│   │       └── s3
	│	│   │       └── dynamodb
    │   │   └── digitalocean //Cuenta de Digitalocean
    │   └── services
    │   │   └── catalog // Infra del servicio "catalog"
    │   │   └── stock   // Infra del servicio "stcok"
    │   └── shared      // Infra compartida por varios equipos
    │   │   └── jenkins
    │   │   └── sonar
    │   │   └── nexus
    ├── pre
    ...
    ├── pro
		...
```
