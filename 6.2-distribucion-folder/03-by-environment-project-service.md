```
└── terraform
    ├── dev
	│   └── catalog
	│   │   └── s3
	│	│   │   └── main.tf
	│	│	│   │   └── backend.tf //Key = dev/catalog/s3/terraform.tfstate
	│	│	│   │   └── provider.tf
	│	│   └── dynamodb
	│	│	│   └── main.tf
	│	│	│   └── backend.tf //Key = dev/catalog/dynamodb/terraform.tfstate
	│	│	│   └── provider.tf
	│	│   └── lambda
	│	│	    └── main.tf
	│	│	    └── backend.tf //Key = dev/catalog/lambda/terraform.tfstate
	│	│	    └── provider.tf
	│   └── stock
	│       └── s3
	│		    └── main.tf
	│		    └── backend.tf //Key = dev/stock/s3/terraform.tfstate
	│		    └── provider.tf
    ├── pre
	│   └── catalog
		...
```
