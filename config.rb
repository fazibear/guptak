require 'slim'
require 'action_view'

activate :directory_indexes

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false
page '/*.html', layout: false

(1...@app.data.data.length).each do |index|
  proxy "#{index}.html", '/index.html', locals: {index: index}
end

helpers do
  def text(locals)
    @app.data.data[locals[:index] || 0].first.first
  end

  def icon(locals)
    @app.data.data[locals[:index] || 0].first.last
  end
end

configure :build do
  activate :minify_css
  activate :minify_javascript
end
