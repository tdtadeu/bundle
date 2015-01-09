def install(users)
  install_libxml2_dev

  users.each do |user|
    run_bundle_install(user)
  end
end

def install_libxml2_dev
  package "libxml2-dev" do
    options "--force-yes"
    action :upgrade
  end
end

def run_bundle_install(user)
  execute "bundle-install-#{user}" do
    action :run
    command "bundle install"
    cwd "/vagrant"
  end
end

users = node[:bundle][:users]
install(users)
