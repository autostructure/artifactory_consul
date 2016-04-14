@Grab(group='org.codehaus.groovy.modules.http-builder', module='http-builder', version='0.7.2')


import org.artifactory.fs.ItemInfo
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
    def create = new RESTClient( 'http://localhost:8500/v1/event/fire/create')
    create.put()
  }
}
