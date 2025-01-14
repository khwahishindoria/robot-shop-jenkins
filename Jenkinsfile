pipeline {
    agent any
    stages {
        stage('terraform-pull') {
            steps {
                echo 'Building...'
                sh '''
                cd
                echo "workspace is: ${WORKSPACE}"
                cd ${WORKSPACE}
                if [ -d ${WORKSPACE}/robot-shop-jenkins ]
                then
                cd ${WORKSPACE}/robot-shop-jenkins/
                git pull
                else
                rm -rf ${WORKSPACE}/robot-shop-jenkins/
                git clone https://github.com/khwahishindoria/robot-shop-jenkins.git
                fi
                echo "intialization terraform"
                ls -lrth
                cd ${WORKSPACE}/robot-shop-jenkins/kubeadm-with-ec2/
                terraform init
                terraform apply -auto-approve
                '''
            }
        }
        stage('ELB size extend') {
            steps {
                echo 'Testing...'
                // Add your test steps here
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying...'
                // Add your deployment steps here
            }
        }
    }
}
