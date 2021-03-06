#---
# Excerpted from "Cucumber Recipes",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/dhwcr for more book information.
#---
require 'parallel'

class Shipping
  @@logger = Logger.new 'shipping.log'
  def self.pack_container(container)
    @@logger.info "Container ##{container} - START"
    sleep 2
    @@logger.info "Container ##{container} - DONE"
  end
end
