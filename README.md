# Spina-Mount

## How to Mount a Model

1. First the plugin must be enabled in your Spina-theme. Therefore add the following line to your themes file under `config/initializers/themes/`:

``` ruby
# config/initializer/themes/my_theme.rb
theme.plugin = 'mount'
```

2. After that, you have to mount all models that should be editable in the same file. Also you have to add the fields that should be editable as array. So if you have a model `Article` you can do as follows:

``` ruby
# config/initializer/themes/my_theme.rb
theme.mounted_models = {
  article: [:title, :content]
}
```


## How to Handle Requests in the Controller

Since the goal is to keep the logic within your application you still need a controller. Spina-Mount expects you to respond to AJAX request via `format.js`. You can send error messages as `json` formated string. 
Therefore your controller could look like:

``` ruby
# /app/controllers/article_controller.rb
class ArticlesController < ApplicationController
  def create
    @article = Article.new(article_params)
    respond_to do |format|
      if @article.save
        format.js { }
      else
        # To provide error messages render as json
        format.js { render json: @article.errors, status: :unprocessable_entity}
      end
    end
  end
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.js { }
      else
        # To provide error messages render as json
        format.js { render json: @article.errors, status: :unprocessable_entity}
      end
    end
  end
  def destroy
    @article.destroy
    respond_to do |format|
      format.js {}
    end
  end
end
```