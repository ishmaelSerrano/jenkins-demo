pipelineJob('pipelineJob') {
    definition {
        cps {
            script(readFileFromWorkspace('pipelineJob.groovy'))
            sandbox()
        }
    }
}

pipelineJob('theme-park-job') {
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        url 'https://github.com/ishmaelSerrano/spring-boot-crud-operation.git'
                    }
                    branch 'main'
                }
            }
        }
    }

}

pipelineJob('theme-park-job-angular') {
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        url 'https://github.com/ishmaelSerrano/angular-frontend-books.git'
                    }
                    branch 'master'
                }
            }
        }
    }

}

pipelineJob('theme-park-job-docker') {
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        url 'https://github.com/ishmaelSerrano/spring-boot-crud-operation.git'
                    }
                    branch 'main'
                    scriptPath 'Jenkinsfile-docker'
                }
            }
        }
    }

}

pipelineJob('theme-park-job-aws') {
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        url 'https://github.com/ishmaelSerrano/spring-boot-crud-operation.git'
                    }
                    branch 'main'
                    scriptPath('Jenkinsfile-aws')
                }
            }
        }
    }
}
