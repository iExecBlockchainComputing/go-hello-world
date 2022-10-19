@Library('global-jenkins-library@2.2.0') _

buildInfo = getBuildInfo()

def nativeImage = buildSimpleDocker_v3(
    buildInfo: buildInfo,
    dockerfileDir: '.',
    visibility: 'iex.ec'
)

sconeBuildUnlocked(
    nativeImage:     nativeImage,
    imageName:       'go-hello-world',
    imageTag:        buildInfo.imageTag,
    sconifyArgsPath: 'scone/sconify.args',
    sconifyVersion:  '5.7.1'
)
