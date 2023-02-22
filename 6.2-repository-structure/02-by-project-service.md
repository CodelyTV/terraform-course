```
└── terraform
    ├── catalog
    │   └── s3
    │   │   └── main.tf
    │   │   └── backend.tf //Key = catalog/s3/terraform.tfstate
    │   │   └── provider.tf
    │   └── dynamodb
    │   │   └── main.tf
    │   │   └── backend.tf //Key = catalog/dynamodb/terraform.tfstate
    │   │   └── provider.tf
    │   └── lambda
    │       └── main.tf
    │       └── backend.tf //Key = catalog/lambda/terraform.tfstate
    │       └── provider.tf
    ├── stock
	    └── s3
	        └── main.tf
	        └── backend.tf //Key = stock/s3/terraform.tfstate
	        └── provider.tf
```