pipeline {
    agent any

    environment {
        // Task 2: Infrastructure Environment & Credentials
        TF_IN_AUTOMATION = 'true'
        TF_CLI_ARGS      = '-no-color'
        
        // UPDATED: Using the exact IDs from your screenshot
        AWS_ACCESS_KEY_ID     = credentials('AWS_Access_Key')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_Secret_Key')
        SSH_CRED_ID           = 'ansible_ssh_key' 
    }

    stages {
        stage('Task 3: Initialization & Variable Inspection') {
            steps {
                sh 'terraform init'
                
                // Show the content of dev.tfvars in the console logs
                sh "echo '--- Content of ${env.BRANCH_NAME}.tfvars ---'"
                sh "cat ${env.BRANCH_NAME}.tfvars"
            }
        }

        stage('Task 4: Branch-Specific Terraform Planning') {
            steps {
                // Generate a plan using dev.tfvars
                sh "terraform plan -var-file=${env.BRANCH_NAME}.tfvars -out=tfplan"
            }
        }

        stage('Task 5: Conditional Manual Approval Gate') {
            when {
                branch 'dev'
            }
            steps {
                input message: "Plan generated successfully. Proceed to Apply?", ok: "Proceed"
            }
        }
    }
}