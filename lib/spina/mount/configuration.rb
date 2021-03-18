module Spina
  module Mount
    include ActiveSupport::Configurable

    config_accessor :title, :controller, :description, :spina_icon, :plugin_type

    self.title       = 'Mount'
    self.controller  = 'mount'
    self.description = 'Mount custom rails models into spina CMS'
    self.spina_icon  = 'pencil-outline'

    self.plugin_type = 'website_resource'
  end
end