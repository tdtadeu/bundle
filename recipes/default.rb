def install(users, path)
  install_libxml2_dev

  users.each do |user|
    if path
      run_bundle_install_with_path user, path
    else
      run_bundle_install user
    end
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
    user user
    group user
    cwd "/vagrant"
  end
end

def run_bundle_install_with_path(user, path)
  execute "bundle-install-#{user}" do
    action :run
    command "bundle install --path #{path}"
    user user
    group user
    cwd "/vagrant"
  end
end

users = node[:bundle][:users]
path = node[:bundle][:path]
install users, path
