# project-maven-jenkins-CI-CD-

AWS_ACCOUNT_ID = credentials('ACCOUNT_ID')     ##our aws account id should be mention in jeenkins credential in secret text     
            ex: Secret=9893849798834232,,        ID=ACCOUNT_ID

 AWS_ECR_REPO_NAME = credentials('ecr_repo')    ###first create cre repo in aws then take the ecr repo name and place in jenkins credentials in secret text formate
           ex:  Secret=vardhan1212              ID=ecr_repo


   withCredentials([string(credentialsId: 'git_hub', variable: 'git_token')])

   git_hub credential mens generate a pat token in git hub place in jenkins credentials
           ex: secret:ghpzgjhusdahdshsd      ID=git_hub
     git_token credential mens generate a pat token in git hub place in jenkins credentials
            ex:  secret=ghpygsjdhfjfdfbh     ID=git_token


        build number = latest
