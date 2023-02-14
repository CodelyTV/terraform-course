```
└── terraform
    ├── s3
    │   └── main.tf
    │   └── backend.tf //Key = s3/terraform.tfstate
    │   └── provider.tf
    ├── dynamodb
	│   └── main.tf
	│   └── backend.tf //Key = dynamodb/terraform.tfstate
	│   └── provider.tf
    └── lambda
	    └── main.tf
	    └── backend.tf //Key = lambda/terraform.tfstate
	    └── provider.tf
```
