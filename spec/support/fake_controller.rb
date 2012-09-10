require 'decent_exposure'
require 'action_controller'

class PostsController < ActionController::Base
  def params
    @_params = {}
  end

  decent_configuration(:collection) do
    strategy ::Scopeater::Exposures::ScopeStrategy
    scope_hooks [:taged_hook, :pagination_hook, :order_hook]
  end

  decent_configuration(:item) do
    strategy ::Scopeater::Exposures::ScopeStrategy
    scope_hooks [:current_user_hook, :taged_hook]
  end

  decent_configuration(:named_tag) do
    strategy ::Scopeater::Exposures::ScopeStrategy
    scope_hooks :tag_name_hook
    finder :first
  end

  expose(:posts, config: :collection)
  expose(:tag, config: :named_tag)
  expose(:post, config: :item)

protected
  # all of hooks can be droped into a module to include

  def pagination_hook scope
    scope.limit params[:limit] if params[:limit].kind_of? Integer
    scope.skip params[:offset] if params[:offset].kind_of? Integer
  end
  
  def order_hook scope
    reorder = params[:order] == 'asc' ? :asc : :dsc
    scope.send reorder, :created_at
  end
  
  def taged_hook scope
    puts "taged_hook -> #{tag}"
    scope.where(tag_ids: tag.id) if tag
  end
  
  def tag_name_hook scope
    scope.where(tag_name: params[:tag_name]) if params[:tag_name]
  end
  
  def current_user_hook scope
    # ...
  end
end