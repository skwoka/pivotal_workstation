app="Quicksilver"

pivotal_workstation_package app do
  source "http://cloud.github.com/downloads/quicksilver/Quicksilver/Quicksilver%20B70.dmg"
  action :install
  checksum "7df0f97ed008f626516c6478d997c02e"
end

execute "chown /Applications/#{app}.app" do
  command "chown -R #{WS_USER} '/Applications/#{app}.app'"
end
