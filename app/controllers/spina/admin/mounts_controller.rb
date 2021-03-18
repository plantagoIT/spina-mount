module Spina
  module Admin
      class MountsController < AdminController
        before_action :set_breadcrumbs
        before_action :verify_editable_model
        before_action :set_model

        def index
          @mounts = @model.all.order(updated_at: :desc)
        end

        def new
          @mount = @model.new
          @id    = @model.count == 0 ? 1 : @model.last.id + 1
        end

        def edit
          if params[:new_record] == 'true'
            flash.now[:notice] = t 'spina.mounts.new_record', mount: @model.name
          end
          @mount = @model.find(params[:id])
        end

        private

          def set_breadcrumbs
            add_breadcrumb params[:model].capitalize, admin_mounts_path(model: params[:model])
          end

          def set_model
            begin
              @model = ActiveRecord.const_get params[:model].capitalize
              @attrs = current_theme.mounted_models[params[:model].to_sym]
            rescue NameError
              raise StandardError.new 'The model you mounted to Spina does not exist in your app.'
            end
          end

          # Only allow editable models to be edited
          def verify_editable_model
            redirect_to admin_root_path unless (current_theme.mounted_models.include?(params[:model].downcase.to_sym))
          end
      end
  end
end
