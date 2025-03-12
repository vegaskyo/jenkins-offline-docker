// Disable all update sites
import jenkins.model.Jenkins
Jenkins.instance.updateCenter.siteList.each { site ->
  site.updateDirectly(false)
}