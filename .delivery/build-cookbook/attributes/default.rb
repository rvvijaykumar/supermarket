default['components']['supermarket']['src'] = File.join(node['delivery_builder']['repo'], 'src/supermarket')

supermarket_version_file = File.join(node['delivery_builder']['repo'], 'src/supermarket/.ruby_version')
default['components']['supermarket']['ruby_version'] = IO.read(supermarket_version_file).strip
