#
#  MyDocument.rb
#  �PROJECTNAME�
#
#  Created by �FULLUSERNAME� on �DATE�.
#  Copyright (c) �YEAR� �ORGANIZATIONNAME�. All rights reserved.
#


require 'osx/cocoa'
require 'osx/coredata'

class MyDocument < OSX:: NSPersistentDocument

  ns_overrides 'windowNibName', 'windowControllerDidLoadNib:',
    'setManagedObjectContext:'

  def windowNibName
    return "MyDocument"
  end

  def windowControllerDidLoadNib (aController)
    super_windowControllerDidLoadNib(aController)
    # user interface preparation code
  end

  # define accessors for properties of models
  def setManagedObjectContext(context)
    super_setManagedObjectContext(context)
    OSX::CoreData.define_wrapper(managedObjectModel)
  end

end
