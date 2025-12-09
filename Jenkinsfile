pipeline {
    agent any

    environment {
        KUBE_CONFIG_PATH = '/home/jenkins/.kube/config' // adjust to your kubeconfig
        HELM_RELEASE = 'snyk-broker'
        HELM_NAMESPACE = 'default'
        CHART_PATH = './' // path to your Helm chart in the repo
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'git@github.com:msnops/snyk-broker-helm.git',
                    credentialsId: 'jenkins-github'
            }
        }

        stage('Helm Upgrade / Install') {
            steps {
                sh """
                helm upgrade --install ${HELM_RELEASE} ${CHART_PATH} \
                  --namespace ${HELM_NAMESPACE} \
                  --create-namespace \
                  --values ${CHART_PATH}/values.yaml
                """
            }
        }
    }

    post {
        success {
            echo 'Helm deployment succeeded!'
        }
        failure {
            echo 'Helm deployment failed!'
        }
    }
}
