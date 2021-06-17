#!/usr/bin/env ruby -wU

SETUP_RUBY_VERSION = "2.7.3"

MACOS = %w[
  intro
  zoom
  macos_apple_silicon
  macos_command_line_tools
  github
  homebrew
  macos_vscode
  vscode_extensions
  macos_oh_my_zsh
  github_rsa
  gh_cli
  dotfiles
  macos_rbenv
  ruby
  nvm
  yarn
  macos_postgresql
  macos_security
  checkup
  kitt
  macos_slack
  slack_settings
  macos_preferences
  macos_dock].freeze

WINDOWS = %w[
  intro
  zoom
  windows_version
  windows_virtualization
  windows_wsl
  windows_ubuntu
  windows_vscode
  windows_terminal
  vscode_extensions
  github
  windows_git
  oh_my_zsh
  github_rsa
  windows_browser
  gh_cli
  dotfiles
  windows_dotfiles
  rbenv
  ruby
  nvm
  yarn
  windows_postgresql
  checkup
  windows_explorer
  kitt
  windows_slack
  slack_settings
  windows_taskbar].freeze

UBUNTU = %w[
  intro
  zoom
  github
  ubuntu_git
  ubuntu_vscode
  vscode_extensions
  oh_my_zsh
  github_rsa
  gh_cli
  dotfiles
  rbenv
  ruby
  nvm
  yarn
  ubuntu_postgresql
  ubuntu_inotify
  ubuntu_extra
  checkup
  kitt
  ubuntu_slack
  slack_settings
  ubuntu_dock].freeze

filenames = {
  'macos.md' => MACOS,
  'windows.md' => WINDOWS,
  'ubuntu.md' => UBUNTU
}

["", "cn"].each do |locale|
  filenames.each do |filename, partials|
    filename = "#{filename.split('.md').first}.#{locale}.md" unless locale.empty?
    File.open(filename, 'w:utf-8') do |f|
      partials.each do |partial|
        folder = locale.empty? ? "_partials" : "_partials/#{locale}"
        f << File.read(File.join(folder, "#{partial}.md"), encoding: "utf-8").gsub("<RUBY_VERSION>", SETUP_RUBY_VERSION)
        f << "\n\n"
      end
    end
  end
end
