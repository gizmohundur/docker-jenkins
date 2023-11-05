group "alpine" {
  targets = [
    "alpine_jdk11",
    "alpine_jdk17",
    "alpine_jdk21",
  ]
}

group "ubi" {
  targets = [
    "ubi_jdk11",
    "ubi_jdk17",
    "ubi_jdk21",
  ]
}

group "ubuntu" {
  targets = [
    "ubuntu_jdk11",
    "ubuntu_jdk17",
    "ubuntu_jdk21",
  ]
}

// variables
variable "JENKINS_REPO_URL" {
  default = "https://nexus.home.jpconsulted.com/repository/jenkins"
}

variable "JENKINS_VERSION" {
  default = "2.429"
}

variable "JENKINS_SHA" {
  default = "1dc21a394e6450bae158e5415396b8dc50fb80e60321b8abee5d460b0f214241"
}

variable "REGISTRY" {
  default = "registry.pupgizmo.com"
}

variable "JENKINS_REPO" {
  default = "library/jenkins"
}

variable "PLUGIN_CLI_VERSION" {
  default = "2.12.13"
}

variable "COMMIT_SHA" {
  default = ""
}

// functions
// return a tag prefixed by the Jenkins version
function "_tag_jenkins_version" {
  params = [tag]
  result = notequal(tag, "") ? "${REGISTRY}/${JENKINS_REPO}:${JENKINS_VERSION}-${tag}" : "${REGISTRY}/${JENKINS_REPO}:${JENKINS_VERSION}"
}

// return a tag optionaly prefixed by the Jenkins version
function "tag" {
  params = [prepend_jenkins_version, tag]
  result = equal(prepend_jenkins_version, true) ? _tag_jenkins_version(tag) : "${REGISTRY}/${JENKINS_REPO}:${tag}"
}

target "alpine_jdk11" {
  dockerfile = "11/alpine/Dockerfile"
  context    = "."
  args = {
    JENKINS_VERSION    = JENKINS_VERSION
    JENKINS_SHA        = JENKINS_SHA
    COMMIT_SHA         = COMMIT_SHA
    PLUGIN_CLI_VERSION = PLUGIN_CLI_VERSION
    JENKINS_REPO_URL   = JENKINS_REPO_URL 
  }
  tags = [
    tag(true, "alpine-jdk11"),
  ]
  platforms = ["linux/amd64", "linux/arm64"]
}
target "alpine_jdk17" {
  dockerfile = "17/alpine/Dockerfile"
  context    = "."
  args = {
    JENKINS_VERSION    = JENKINS_VERSION
    JENKINS_SHA        = JENKINS_SHA
    COMMIT_SHA         = COMMIT_SHA
    PLUGIN_CLI_VERSION = PLUGIN_CLI_VERSION
    JENKINS_REPO_URL   = JENKINS_REPO_URL 
  }
  tags = [
    tag(true, "alpine-jdk17"),
  ]
  platforms = ["linux/amd64", "linux/arm64"]
}
target "alpine_jdk21" {
  dockerfile = "21/alpine/Dockerfile"
  context    = "."
  args = {
    JENKINS_VERSION    = JENKINS_VERSION
    JENKINS_SHA        = JENKINS_SHA
    COMMIT_SHA         = COMMIT_SHA
    PLUGIN_CLI_VERSION = PLUGIN_CLI_VERSION
    JENKINS_REPO_URL   = JENKINS_REPO_URL 
  }
  tags = [
    tag(true, "alpine-latest"),
    tag(true, "alpine-jdk21"),
    tag(true, "alpine"),
  ]
  platforms = ["linux/amd64", "linux/arm64"]
}
target "ubi_jdk11" {
  dockerfile = "11/ubi/Dockerfile"
  context    = "."
  args = {
    JENKINS_VERSION    = JENKINS_VERSION
    JENKINS_SHA        = JENKINS_SHA
    COMMIT_SHA         = COMMIT_SHA
    PLUGIN_CLI_VERSION = PLUGIN_CLI_VERSION
    JENKINS_REPO_URL   = JENKINS_REPO_URL 
  }
  tags = [
    tag(true, "ubi-jdk11"),
  ]
  platforms = ["linux/amd64", "linux/arm64"]
}
target "ubi_jdk17" {
  dockerfile = "17/ubi/Dockerfile"
  context    = "."
  args = {
    JENKINS_VERSION    = JENKINS_VERSION
    JENKINS_SHA        = JENKINS_SHA
    COMMIT_SHA         = COMMIT_SHA
    PLUGIN_CLI_VERSION = PLUGIN_CLI_VERSION
    JENKINS_REPO_URL   = JENKINS_REPO_URL 
  }
  tags = [
    tag(true, "ubi-jdk17"),
  ]
  platforms = ["linux/amd64", "linux/arm64"]
}
target "ubi_jdk21" {
  dockerfile = "21/ubi/Dockerfile"
  context    = "."
  args = {
    JENKINS_VERSION    = JENKINS_VERSION
    JENKINS_SHA        = JENKINS_SHA
    COMMIT_SHA         = COMMIT_SHA
    PLUGIN_CLI_VERSION = PLUGIN_CLI_VERSION
    JENKINS_REPO_URL   = JENKINS_REPO_URL 
  }
  tags = [
    tag(true, "ubi-latest"),
    tag(true, "ubi-jdk21"),
    tag(true, "ubi"),
  ]
  platforms = ["linux/amd64", "linux/arm64"]
}
target "ubuntu_jdk11" {
  dockerfile = "11/ubuntu/Dockerfile"
  context    = "."
  args = {
    JENKINS_VERSION    = JENKINS_VERSION
    JENKINS_SHA        = JENKINS_SHA
    COMMIT_SHA         = COMMIT_SHA
    PLUGIN_CLI_VERSION = PLUGIN_CLI_VERSION
    JENKINS_REPO_URL   = JENKINS_REPO_URL 
  }
  tags = [
    tag(true, "ubuntu-jdk11"),
  ]
  platforms = ["linux/amd64", "linux/arm64"]
}
target "ubuntu_jdk17" {
  dockerfile = "17/ubuntu/Dockerfile"
  context    = "."
  args = {
    JENKINS_VERSION    = JENKINS_VERSION
    JENKINS_SHA        = JENKINS_SHA
    COMMIT_SHA         = COMMIT_SHA
    PLUGIN_CLI_VERSION = PLUGIN_CLI_VERSION
    JENKINS_REPO_URL   = JENKINS_REPO_URL 
  }
  tags = [
    tag(true, "ubuntu-jdk17"),
  ]
  platforms = ["linux/amd64", "linux/arm64"]
}
target "ubuntu_jdk21" {
  dockerfile = "21/ubuntu/Dockerfile"
  context    = "."
  args = {
    JENKINS_VERSION    = JENKINS_VERSION
    JENKINS_SHA        = JENKINS_SHA
    COMMIT_SHA         = COMMIT_SHA
    PLUGIN_CLI_VERSION = PLUGIN_CLI_VERSION
    JENKINS_REPO_URL   = JENKINS_REPO_URL 
  }
  tags = [
    tag(true, "latest"),
    tag(true, "ubuntu-latest"),
    tag(true, "ubuntu-jdk21"),
    tag(true, "ubuntu"),
  ]
  platforms = ["linux/amd64", "linux/arm64"]
}