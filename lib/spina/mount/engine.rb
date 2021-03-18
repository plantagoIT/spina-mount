module Spina
  module Mount
    class Engine < ::Rails::Engine
      isolate_namespace Spina::Mount

      config.before_initialize do
        ::Spina::Plugin.register do |plugin|
          plugin.name = 'mount'
          plugin.namespace = 'mount'
        end
      end

      config.generators do |g|
        g.assets false
        g.helper false
      end
    end
  end
end