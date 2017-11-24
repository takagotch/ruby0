#---
# Excerpted from "Metaprogramming Ruby 2",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/ppmetr2 for more book information.
#---
module ActiveSupport #:nodoc:
  module CoreExtensions #:nodoc:
    module Hash #:nodoc:
      # Slice a hash to include only the given keys. This is useful for
      # limiting an options hash to valid keys before passing to a method:
      #
      #   def search(criteria = {})
      #     assert_valid_keys(:mass, :velocity, :time)
      #   end
      #
      #   search(options.slice(:mass, :velocity, :time))
      #
      # If you have an array of keys you want to limit to, you should splat them:
      #
      #   valid_keys = [:mass, :velocity, :time]
      #   search(options.slice(*valid_keys))
      module Slice
        # Returns a new hash with only the given keys.
        def slice(*keys)
          keys = keys.map! { |key| convert_key(key) } if respond_to?(:convert_key)
          hash = self.class.new
          keys.each { |k| hash[k] = self[k] if has_key?(k) }
          hash
        end

        # Replaces the hash with only the given keys.
        # Returns a hash contained the removed key/value pairs
        #   {:a => 1, :b => 2, :c => 3, :d => 4}.slice!(:a, :b) # => {:c => 3, :d =>4}
        def slice!(*keys)
          keys = keys.map! { |key| convert_key(key) } if respond_to?(:convert_key)
          omit = slice(*self.keys - keys)
          hash = slice(*keys)
          replace(hash)
          omit
        end
      end
    end
  end
end

