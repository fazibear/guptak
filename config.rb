require 'slim'
require 'action_view'

activate :directory_indexes

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false
page '/*.html', layout: false

@app.data.opr.each_with_index do |opr, index|
  proxy "#{index + 1}.html", '/index.html', locals: { opr: opr }
end

configure :build do
  activate :minify_css
  activate :minify_javascript
end
