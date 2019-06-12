# Notas del tutorial para pipeline

Plugin de VS Code intalado
https://jenkins.io/blog/2018/11/07/Validate-Jenkinsfile/

Configurado como se indica
Ejecutando shift-alt-v

Instalando NodeJS plugin
https://medium.com/@gustavo.guss/jenkins-starting-with-pipeline-doing-a-node-js-test-72c6057b67d4
https://wiki.jenkins.io/display/JENKINS/NodeJS+Plugin

Siguiendo este tutorial
https://medium.com/@gustavo.guss/jenkins-building-docker-image-and-sending-to-registry-64b84ea45ee9
usando este comando

## Docker cheatsheet
Descargar imagen: sudo docker pull gustavoapolinario/jenkins-docker
Crear contenedor con la imagen: docker run --name jenkins-docker -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock gustavoapolinario/jenkins-docker
Levantar imagen jenkins-docker: sudo docker start jenkins-docker
Listar contenedores activos: sudo docker ps