require File.expand_path("../karma", __FILE__)

module Karma
  class Unit
    def self.test!(opts = {})
      sprockets = Rails.application.assets
      sprockets.append_path Rails.root.join("test/karma")

      files = sprockets.find_asset("unit.js").to_a.map {|e| e.pathname.to_s }
      files << Rails.root.join("app/assets/javascripts/**/*.spec.*").to_s

      Karma.start!({:files => files}.merge(opts))
    end
  end
end
