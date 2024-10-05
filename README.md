# test_workflow
Entrenamiento de workflow
1- Configuración GCP
    1.1- Crear cuenta de servicio en GCP con permisos necesarios
        1.-- roles/cloudfunctions.admin
        -- roles/iam.serviceAccountUser
        -- roles/storage.admin
        -- roles/cloudbuild.builds.editor
    - Agregar clave en cuenta de servicio guardar archivo que se genera para usarlo luego lo usaremos como credenciales para ejecutar workflow.
    - Activar API Cloud function en su proyecto https://console.cloud.google.com/apis/api/cloudfunctions.googleapis.com/
    - Activar Cloud Run Admin API en su proyecto https://console.cloud.google.com/apis/api/run.googleapis.com/
    
2- Configuración GitHub
    - Crear repositorio con proyecto
    - Agregar al proyecto el secreto de acción y variable que es lo que contiene nuestro archivo de credenciales generado en pasos atrás.
    - Ahora clonamos nuestro proyecto en alguna carpeta de nuestro escritorio 
        - Abrimos con cualquier editor y vamos a modificar en el archivo infrastructure/terraform.tfvars la variable proyecto_id por el proyecto donde queremos que se despliegue nuestra Cloud Function.
        - Luego pasamos estos cambios a nuestra rama principal para que el proyecto se ejecute.
