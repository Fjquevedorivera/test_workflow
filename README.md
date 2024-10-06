Configuración GCP
	1. Crear cuenta de servicio en GCP con permisos necesarios
		• roles/cloudfunctions.admin
		• roles/iam.serviceAccountUser
		• roles/storage.admin
		• roles/cloudbuild.builds.editor
	2. Agregar la clave a la cuenta de servicio y guardar el archivo generado (se usará más tarde como credenciales para el workflow).
	3. Activar API Cloud function en el proyecto https://console.cloud.google.com/apis/api/cloudfunctions.googleapis.com/
	4. Activar Cloud Run Admin API en el proyecto https://console.cloud.google.com/apis/api/run.googleapis.com/
	
Configuración GitHub
	1. Crear repositorio con la carpeta test_workflow.
	2. Agregar el secreto y la variable que contienen las credenciales generadas anteriormente.
		2.1 Acceder a los secretos del repositorio:
			• Ve a tu repositorio en GitHub.
			• Haz clic en la pestaña "Settings" (Configuración) en la parte superior.
			• En el menú lateral izquierdo, desplázate hacia abajo y busca la sección "Secrets and variables".
			• Haz clic en "Actions" para ver las opciones de secretos y variables.
		2.2 Agregar el secreto (archivo de credenciales):
			• En la sección "Secrets", haz clic en el botón "New repository secret".
			• En el campo "Name", escribe un nombre descriptivo para tu secreto, como GCP_CREDENTIALS.
			• En el campo "Secret", debes pegar el contenido del archivo JSON de la clave de la cuenta de servicio que descargaste en el paso anterior de la configuración de GCP. Puedes abrir el archivo en un editor de texto, copiar todo el contenido y pegarlo aquí.
			• Haz clic en "Add secret" para guardar.
	3. Clonar el proyecto en una carpeta local. 
		• Abrir el proyecto en un editor y modificar el archivo infrastructure/terraform.tfvars, 
		actualizando la variable proyecto_id con el ID del proyecto donde se desplegará la Cloud Function.
	4. Subir los cambios a la rama principal para ejecutar el proyecto.
		