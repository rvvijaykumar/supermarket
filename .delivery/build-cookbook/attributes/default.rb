default['components']['supermarket']['src'] = File.join(node['delivery_builder']['repo'], 'src/supermarket')

supermarket_version_file = File.join(node['delivery_builder']['repo'], 'src/supermarket/.ruby-version')
default['components']['supermarket']['ruby_version'] = IO.read(supermarket_version_file).strip

default['components']['supermarket']['gem_cache'] = File.join(node['delivery']['workspace']['cache'], '../../../supermarket_gems')
