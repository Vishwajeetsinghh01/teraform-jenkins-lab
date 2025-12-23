pipeline {
    agent any

    environment {
        // Task 2: Infrastructure Environment & Credentials
        TF_IN_AUTOMATION = 'true'
        TF_CLI_ARGS      = '-no-color'
        
        // These look for credentials in Jenkins with IDs: 'aws-access-key-id' and 'aws-secret-access-key'
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
        SSH_CRED_ID           = 'my-ssh-key-id' 
    }

    stages {
        stage('Task 3: Initialization & Variable Inspection') {
            steps {
                // Initialize Terraform
                sh 'terraform init'
                
                // Show the content of dev.tfvars in the console logs
                sh "echo '--- Content of ${env.BRANCH_NAME}.tfvars ---'"
                sh "cat ${env.BRANCH_NAME}.tfvars"
            }
        }

        stage('Task 4: Branch-Specific Terraform Planning') {
            steps {
                // Generate a plan using dev.tfvars and save it to a file named 'tfplan'
                sh "terraform plan -var-file=${env.BRANCH_NAME}.tfvars -out=tfplan"
            }
        }

        stage('Task 5: Conditional Manual Approval Gate') {
            when {
                // This stage ONLY runs if the branch is named 'dev'
                branch 'dev'
            }
            steps {
                // Pauses the pipeline and waits for you to click "Proceed" in Jenkins
                input message: "Plan generated successfully. Proceed to Apply?", ok: "Proceed"
            }
        }
    }
}