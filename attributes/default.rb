# Little recap on ERB (embedded ruby)
# to embed (or interpolate) some ruby you use the ice cream cones <% %>

# There are two types of embedded logic
  # One returns something
    # <%= %>
  # The other does not returns
    # <% %>

#    <% @proxy_port = 'hello' %>
#    <% sleep(3) %>
#    <% @proxy_port = 5050 %>

default['nginx']['proxy_port'] = 3000
default['nginx']['proxy_port2'] = 3030
