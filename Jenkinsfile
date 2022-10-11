@Library('global-jenkins-library@2.2.0') _

buildInfo = getBuildInfo()

def nativeImage = buildSimpleDocker_v3(
    buildInfo: buildInfo,
    dockerfileDir: '.',
    visibility: 'iex.ec'
)
