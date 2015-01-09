execute "bundle-install" do
  action :run
  command "bundle install"
  user user
end
