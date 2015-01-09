def install(users)
  users.each do |user|
    execute "bundle-install-#{user}" do
      action :run
      command "bundle install"
      cwd "/vagrant"
    end
  end
end

users = node[:bundle][:users]
install(users)
