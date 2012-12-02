# Adapted from shiftit.rb

unless File.exists?("/Applications/Postgres.app")
  remote_file "#{Chef::Config[:file_cache_path]}/Postgres.app.zip" do
    source "https://mesmerize.s3.amazonaws.com/Postgres/Postgres-11.zip"
    mode "0644"
  end

  # start up on login
  execute "Start Postgres automatically" do
    command "defaults write loginwindow AutoLaunchedApplicationDictionary -array-add '{ \"Path\" = \"/Applications/Postgres.app\"; \"Hide\" = 0; }'"
    user WS_USER
  end

  execute "unzip Postgres" do
    command "unzip #{Chef::Config[:file_cache_path]}/Postgres.app.zip Postgres.app/* -d /Applications/"
    user WS_USER
    group "admin"
  end
end
