pipeline {
  agent any
  stages{
    stage("checkout") {
      steps {
        checkout scm
      }
    }
    stage("terraform init") {
      steps {
        sh "terragrunt init -no-color"
      }
    }
    stage("terraform plan") {
      steps {
        sh "terragrunt plan -no-color -out=plan.out"
        input message: "Apply Plan?", ok: "Apply"
      }
    }
    stage("terraform apply") {
      steps {
        sh "terragrunt apply plan.out -no-color"
      }
    }
  }
}
