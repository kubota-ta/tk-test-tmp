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
        sh "terraform init -no-color"
      }
    }
    stage("terraform plan") {
      steps {
        sh "terraform plan -no-color -out=plan.out"
        input message: "Apply Plan?", ok: "Apply"
      }
    }
    stage("terraform apply") {
      steps {
        sh "terraform apply plan.out -no-color"
      }
    }
  }
}
