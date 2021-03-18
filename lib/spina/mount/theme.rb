module Spina
  module Mount

    module Theme
      attr_accessor :mounted_models
    end
  end
end

Spina::Theme.include Spina::Mount::Theme