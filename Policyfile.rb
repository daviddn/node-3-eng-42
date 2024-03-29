# Policyfile.rb - Describe how you want Chef Infra Client to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile.html

# A name that describes what the system you're building with Chef does.
name 'node_3'

# Where to find external cookbooks:
default_source :supermarket

# run_list: chef-client will run these recipes in the order specified.
# run_list 'nodejs::default'
run_list 'node_3::default'


# Specify a custom source for a single cookbook:
cookbook 'node_3', path: '.'
# cookbook 'apt'
# cookbook 'nodejs', '~> 6.0.0', :supermarket
