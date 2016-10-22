module RactiveAssets
  class Engine < ::Rails::Engine
    initializer "sprockets.ractive", :after => "sprockets.environment", :group => :all do |app|
      next unless app.assets
      if app.assets.respond_to?(:register_transformer)
        app.assets.register_mime_type 'text/ractive', extensions: ['.rac', '.ractive']
        app.assets.register_transformer 'text/ractive', 'application/javascript', RactiveTransformer
      elsif app.assets.respond_to?(:register_engine)
        app.assets.register_engine '.rac',         TiltRactive
        app.assets.register_engine '.ractive',     TiltRactive
        app.assets.register_engine('.ractivehaml', TiltRactive) if RactiveAssets::Config.haml_available?
        app.assets.register_engine('.ractiveslim', TiltRactive) if RactiveAssets::Config.slim_available?
      end
    end
  end
end
