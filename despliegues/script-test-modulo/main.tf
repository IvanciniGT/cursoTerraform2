module "misclaves" {
    source = "../modulo"
 
#    force_generate = false
#    keys_path = "./claves"
#    algorithm ={
#                        name    = "RSA"
#                        config  = 2048 # Terraform nos hará la conversión a texto, él solito ! QUE GUAY !
#                    }
}

output "misclaves" {
    value = module.misclaves.keys
}