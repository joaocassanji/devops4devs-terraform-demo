location      = "eastus"
naming_prefix = "devops4devs"
environment = "dev"

virtual_network = {
  address_space = "11.0.0.0/16"
  subnets = [
    {
      name = "backend"
      cidr = "11.0.1.0/24"
    },
    {
      name = "frontend"
      cidr = "11.0.2.0/24"
    },
    {
      name = "database"
      cidr = "11.0.3.0/24"
    }
  ]
}

virtual_machine = [ 
    {
        name = "backend"
        instances = 1
        subnet_name = "backend"
        size = "Standard_B1s"
    },
    {
        name = "frontend"
        instances = 2
        subnet_name = "frontend"
        size = "Standard_B1s"
    },
]

database = {
  server_name = "dbserver-devops4devs"
  database_name = "development"
}