pipeline {
    agent any

    // 1. 定义四个动态参数
    parameters {
        string(name: 'OPENBMC_HOST', defaultValue: '10.17.32.12', description: 'BMC的IP地址或主机名')
        string(name: 'TEST_CASE_NAME', defaultValue: '', description: '要运行的测试用例名称 (-t)')
        string(name: 'INCLUDE_TAGS', defaultValue: '', description: '要包含的测试标签 (--include)')
        string(name: 'TEST_FILE_PATH', defaultValue: 'templates/test_openbmc_setup.robot', description: '测试文件的路径')
    }

    stages {
        stage('拉取代码') {
            steps {
                // 2. 从git仓库拉取代码
                // Jenkins会自动将代码克隆到工作目录（避免了其他指定路径的权限问题）
                git branch: 'main',
                    url: 'https://github.com/nostory19/Robot-Test-Script.git'
            }
        }
        stage('执行测试') {
            steps {
                // 3. 安全注入 BMC 登录凭据
                withCredentials([usernamePassword(
                    credentialsId: 'openbmc-bmc-credentials',
                    usernameVariable: 'BMC_USER',
                    passwordVariable: 'BMC_PASS'
                )]) {
                    echo "开始执行测试用例：${params.TEST_CASE_NAME}"


                    sh '''
                        #!/bin/bash
                        # 激活虚拟环境
                        . /home/bmc/openbmc-test-automation/openbmc-venv/bin/activate
                        # cd /home/bmc/Robot-Test-Script/

                        # 2. 【核心改动】将报告输出目录改为 test-reports-${BUILD_NUMBER}
                        # 例如：第一次构建生成 test-reports-1，第二次生成 test-reports-2
                        REPORT_DIR="test-reports-${BUILD_NUMBER}"
                        mkdir -p ${REPORT_DIR}
                        # 直接执行 robot 命令，遇到非空参数才传入（全程使用数组或独立判断，避免空格被拆分）
                        robot -d ${REPORT_DIR} \\
                              -v OPENBMC_HOST:${OPENBMC_HOST} \\
                              -v OPENBMC_USERNAME:$BMC_USER \\
                              -v OPENBMC_PASSWORD:$BMC_PASS \\
                              ${TEST_CASE_NAME:+-t "$TEST_CASE_NAME"} \\
                              ${INCLUDE_TAGS:+--include "$INCLUDE_TAGS"} \\
                              "${TEST_FILE_PATH}"
                    '''
                }
            }
        }
    }

    // 6. 后置处理，归档测试报告
    post {
        always {
            echo '测试执行完毕，正在归档测试报告...'

            // 【核心修改】在 Groovy 层面定义报告目录变量
            // 这样 Shell 和后续的 publishHTML 都能通过 ${REPORT_DIR} 访问到它
            script {
                REPORT_DIR = "test-reports-${BUILD_NUMBER}"
            }

            // 1. 生成自定义摘要文件（注意使用双引号以解析 Groovy 变量）
//            sh """
//                echo "========================================" > custom_summary.txt
//                echo "🤖 Robot Framework 自动化测试报告" >> custom_summary.txt
//                echo "========================================" >> custom_summary.txt
//                echo "测试目标: ${OPENBMC_HOST}" >> custom_summary.txt
//                echo "构建编号: #${BUILD_NUMBER}" >> custom_summary.txt
//                echo "构建结果: ${currentBuild.currentResult}" >> custom_summary.txt
//                echo "构建时间: \$(date)" >> custom_summary.txt
//                echo "========================================" >> custom_summary.txt
//                echo "📂 报告目录路径: ${WORKSPACE}/${REPORT_DIR}" >> custom_summary.txt
//                echo "========================================" >> custom_summary.txt
//            """

          sh """
    # 1. 先切换到报告目录
    cd ${REPORT_DIR}

    # 2. 下面的 cat 命令和 EOF 内容必须完全顶格，前面不能有任何空格或 Tab！
    cat > custom_summary.json <<EOF
{
  "jobName": "${JOB_NAME}",
  "buildNumber": ${BUILD_NUMBER},
  "buildResult": "${currentBuild.currentResult}",
  "targetHost": "${params.OPENBMC_HOST}",
  "timestamp": "\$(date -u +"%Y-%m-%dT%H:%M:%SZ")",
  "jenkins": {
    "buildUrl": "${BUILD_URL}",
    "consoleUrl": "${BUILD_URL}console",
    "reportUrl": "${BUILD_URL}Robot_20Test_20Report/"
  },
  "report": {
    "directory": "${WORKSPACE}/${REPORT_DIR}",
    "html": "${BUILD_URL}artifact/${REPORT_DIR}/report.html",
    "log": "${BUILD_URL}artifact/${REPORT_DIR}/log.html",
    "outputXml": "${BUILD_URL}artifact/${REPORT_DIR}/output.xml"
  }
}
EOF
"""

            // 2. 归档测试报告
            // 归档测试报告
            archiveArtifacts artifacts: "${REPORT_DIR}/*.html, ${REPORT_DIR}/output.xml, ${REPORT_DIR}/custom_summary.json", allowEmptyArchive: true

//            archiveArtifacts(
//                artifacts: "custom_summary.json",
//                allowEmptyArchive: true
//            )


            // 3. 发布 HTML 报告（现在可以完美识别 REPORT_DIR 了）
            publishHTML([
                allowMissing: true,
                alwaysLinkToLastBuild: true,
                keepAll: true,
                reportDir: "${REPORT_DIR}",
                reportFiles: 'log.html',
                reportName: 'Robot Test Report'
            ])
        }
        success {
//            emailext to: 'your-email@example.com',
//                     subject: "✅ [Jenkins] Robot测试成功 - ${params.OPENBMC_HOST} (Build #${BUILD_NUMBER})",
//                     body: "测试在 ${params.OPENBMC_HOST} 上执行成功。\n查看报告: ${env.BUILD_URL}Robot_20Test_20Report/"
            echo "测试成功"
        }
        failure {
//            emailext to: 'your-email@example.com',
//                     subject: "❌ [Jenkins] Robot测试失败 - ${params.OPENBMC_HOST} (Build #${BUILD_NUMBER})",
//                     body: "测试失败！请检查日志。\n查看控制台: ${env.BUILD_URL}console"
            echo "测试失败"
        }
    }
}