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
        stage('执行测试') {
            steps {
                // 2. 安全注入 BMC 登录凭据
                withCredentials([usernamePassword(
                    credentialsId: 'openbmc-bmc-credentials',
                    usernameVariable: 'BMC_USER',
                    passwordVariable: 'BMC_PASS'
                )]) {
                    echo "开始执行测试用例：${params.TEST_CASE_NAME}"

//                    sh '''
//                        #!/bin/bash
//                        . /home/bmc/openbmc-test-automation/openbmc-venv/bin/activate
//                        cd /home/bmc/openbmc-test-automation
//
//                        # 动态构建 Robot Framework 命令参数（注意：变量必须用双引号包裹！）
//                        ROBOT_ARGS=""
//                        if [ -n "${TEST_CASE_NAME}" ]; then
//                            ROBOT_ARGS="$ROBOT_ARGS -t \"${TEST_CASE_NAME}\""
//                        fi
//                        if [ -n "${INCLUDE_TAGS}" ]; then
//                            ROBOT_ARGS="$ROBOT_ARGS --include \"${INCLUDE_TAGS}\""
//                        fi
//
//                        # 执行 Robot 命令
//                        robot -v OPENBMC_HOST:${OPENBMC_HOST} \
//                              -v OPENBMC_USERNAME:$BMC_USER \
//                              -v OPENBMC_PASSWORD:$BMC_PASS \
//                              $ROBOT_ARGS \
//                              "${TEST_FILE_PATH}"
//                    '''
                    sh '''
                        #!/bin/bash
                        . /home/bmc/openbmc-test-automation/openbmc-venv/bin/activate
                        cd /home/bmc/Robot-Test-Script/

                        # 创建自定义报告输出目录
                        mkdir -p test-reports
                        # 直接执行 robot 命令，遇到非空参数才传入（全程使用数组或独立判断，避免空格被拆分）
                        robot -d test-reports \
                              -v OPENBMC_HOST:${OPENBMC_HOST} \
                              -v OPENBMC_USERNAME:$BMC_USER \
                              -v OPENBMC_PASSWORD:$BMC_PASS \
                              ${TEST_CASE_NAME:+-t "$TEST_CASE_NAME"} \
                              ${INCLUDE_TAGS:+--include "$INCLUDE_TAGS"} \
                              "${TEST_FILE_PATH}"
                    '''
                }
            }
        }
    }

    // 6. 后置处理，归档测试报告
    post {
        always {
            // 1. 归档原始测试产物（保留 xml 用于其他插件解析，如趋势图）
            archiveArtifacts artifacts: 'test-reports/*.html, test-reports/output.xml', allowEmptyArchive: true

            // 2. 使用 HTML Publisher 插件发布在线预览报告
            publishHTML([
                allowMissing: true,          // 如果测试失败没生成报告，允许构建继续
                alwaysLinkToLastBuild: true, // 始终链接到最新的构建报告
                keepAll: true,               // 保留过去每次构建的 HTML 报告
                reportDir: 'test-reports',   // 报告所在的相对目录
                reportFiles: 'log.html',     // 默认展示的入口页面
                reportName: 'Robot Test Report' // 在 Jenkins 左侧菜单显示的名称
            ])
        }
        success {
            echo '✅ 测试成功'
        }
        failure {
            echo '❌ 测试失败'
        }
    }
}