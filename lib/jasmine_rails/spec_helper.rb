# in lib/jasmine_rails/spec_helper.rb
module JasmineRails
  module SpecHelper
    # Gives us access to the require_js_include_tag helper
    include RequirejsHelper
  end
end
