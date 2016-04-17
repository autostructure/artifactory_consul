@Grab(group='org.codehaus.groovy.modules.http-builder', module='http-builder', version='0.7.2')


import org.artifactory.fs.ItemInfo
import org.artifactory.fs.FileLayoutInfo
import org.artifactory.repo.RepoPath
import groovyx.net.http.RESTClient

/**
* A section for handling and manipulating storage events.
*
* If you wish to abort an action you can do that in 'before' methods by throwing a runtime
* org.artifactory.exception.CancelException with an error message and a proper http error code.
*/
storage {

  /**
  * Handle after create events.
  *
  * Closure parameters:
  * item (org.artifactory.fs.ItemInfo) - the original item being created.
  */
  afterCreate { ItemInfo item ->
    RepoPath repoPath = item.repoPath

    // Gets the full path of the artifact, including the repo
    FileLayoutInfo currentLayout = repositories.getLayoutInfo(repoPath)

    // Gets the actual layout of the repository the artifact is deployed to
    if (currentLayout.isValid()) {
      String application = repositories.getProperty(repoPath, 'module')
      String applicationTier = repositories.getProperty(repoPath, 'tier')

      log.warn(repositories.getProperties(repoPath))

      String _applicationTier = null

      // If tier is not available deploy DEV
      if(applicationTier) {
        _applicationTier = applicationTier
      }
      else {
        _applicationTier = 'DEV'
      }

      RESTClient create = new RESTClient( 'http://localhost:8500/')

      def response = create.put(path: 'v1/event/fire/create_' + _applicationTier + '_' + application)
    }
    else {
      log.warn("Layout is invalid for storage creation")
    }
  }
}
