pipeline {
    agent any

    environment {
        DOCKERHUB_USER = 'tejasparab17'
        IMAGE_NAME = "${DOCKERHUB_USER}/node-app"
    }

        stage('Build & Push Docker Image') {
            steps {
                script {
                    def GIT_COMMIT = sh(script: "git rev-parse --short HEAD", returnStdout: true).trim()
                    sh "chmod +x scripts/build_and_push.sh"
                    sh "./scripts/build_and_push.sh ${DOCKERHUB_USER} ${GIT_COMMIT}"
                }
            }
        }

        stage('Deploy via Ansible') {
            steps {
                sh "ansible-playbook -i ansible/hosts.ini ansible/deploy.yml"
            }
        }
    }
}

