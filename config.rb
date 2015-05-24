######################################################################
# General settings.
######################################################################

# Meta.
set :meta, {
  title: 'Foo',
  url: 'http://foo.com',
}

# Change to your Google Analytics key (e.g. UA-XXXXXXXX-Y).
# To disable GA, leave unset or set to nil
# Code will only be injected in build environment
set :ga_key, 'UA-XXXXXXX-Y'

# Locations.
set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'
set :fonts_dir, 'assets/fonts'
set :partials_dir, 'partials'

after_configuration do
  # Add bower's directory to sprockets asset path.
  @bower_config = JSON.parse(IO.read("#{root}/.bowerrc"))
  sprockets.append_path File.join "#{root}", @bower_config["directory"]
end

######################################################################
# Development environment.
######################################################################

configure :development do
  activate :livereload, apply_js_live: false, apply_css_live: false
  activate :directory_indexes
end


######################################################################
# Build environment.
######################################################################

configure :build do
  activate :relative_assets
  activate :directory_indexes
  activate :asset_hash

  # Ensmallen assets
  activate :minify_html, remove_input_attributes: false
  activate :minify_css
  activate :minify_javascript
  activate :gzip, exts: %w(.js .css .html .htm .svg .ttf .otf .woff .eot)
end

activate :blog do |blog|
  blog.layout = 'blog'
  # use first paragraph as article summary
  blog.summary_generator = -> (article, html, length, ellipsis) do
    Nokogiri::HTML(html).css('p').first.to_s
  end
end

activate :disqus do |d|
  # Disqus shotname, without '.disqus.com' on the end (default = nil)
  d.shortname = 'zizkovrb'
end

helpers do
  def date(value)
    value.strftime('%b %e, %Y')
  end

  def link_to_page(name, url)
    path = '/' + request.path.gsub('/index.html', '').gsub('index.html', '')
    current = path == url

    # handle blog /2012/02/09/my-blog urls
    if url == '/' and path =~ /\/\d{4}\/\d{2}\/\d{2}\/\S+/
      current = true
    end

    class_name = current ? ' class="active"' : ''

    "<li#{class_name}><a href=\"#{url}\">#{name}</a></li>"
  end
end
