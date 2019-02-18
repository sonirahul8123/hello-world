#!/usr/bin/env bash

trap 'ret=$?; test $ret -ne 0 && printf "failed\n\n" >&2; exit $ret' EXIT

set -e
log_info() {
  printf "\n\e[0;35m $1\e[0m\n\n"
}

log_info "Removing exisiting docker packages ..."
  sudo apt-get remove docker docker-engine docker.io containerd runc

log_info "Updating apt ..."
  sudo apt-get update

log_info "Installing packages to allow apt to use a repository over HTTPS ..."
  sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common

log_info "Adding Dockers official GPG key ..."
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

log_info "Verifying the key with the fingerprint ..."
  sudo apt-key fingerprint 0EBFCD88
  
log_info "Setting up the stable repository ..."
  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
  
log_info "Updating the apt package index ..."
  sudo apt-get update

log_info "Installing the latest version of Docker CE and containerd ..."
  sudo apt-get install docker-ce docker-ce-cli containerd.io
