#---
# Excerpted from "Metaprogramming Ruby 2",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/ppmetr2 for more book information.
#---
require 'abstract_unit'

class LoggingController < ActionController::Base
  def show
    render :nothing => true
  end
end

class LoggingTest < ActionController::TestCase
  tests LoggingController

  class MockLogger
    attr_reader :logged
    
    def method_missing(method, *args)
      @logged ||= []
      @logged << args.first
    end
  end

  setup :set_logger

  def test_logging_without_parameters
    get :show
    assert_equal 2, logs.size
    assert_nil logs.detect {|l| l =~ /Parameters/ }
  end

  def test_logging_with_parameters
    get :show, :id => 10
    assert_equal 3, logs.size

    params = logs.detect {|l| l =~ /Parameters/ }
    assert_equal 'Parameters: {"id"=>"10"}', params
  end
  
  private

  def set_logger
    @controller.logger = MockLogger.new
  end
  
  def logs
    @logs ||= @controller.logger.logged.compact.map {|l| l.strip}
  end
end
