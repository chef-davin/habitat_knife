pkg_name=knife
pkg_origin=chef-davin
pkg_version="17.2.18"
pkg_maintainer="Davin Taddeo <davin@chef.io>"
pkg_license=("Apache-2.0")
pkg_upstream_url="https://github.com/chef/chef/tree/master/knife"
ruby_pkg="core/ruby30"
pkg_deps=(${ruby_pkg} core/coreutils core/cacerts core/openssl)
pkg_build_deps=(core/make core/gcc)
pkg_bin_dirs=(bin)
​
do_prepare() {
  GEM_HOME=$pkg_prefix
  GEM_PATH="$GEM_HOME"
  export SSL_CERT_FILE=$(pkg_path_for cacerts)/ssl/cert.pem
  export GEM_HOME GEM_PATH
}
​
do_build() {
  gem install --bindir "$pkg_prefix/ruby-bin" knife -v $pkg_version --no-document
  fix_interpreter "$pkg_prefix/ruby-bin/*" core/coreutils bin/env
  fix_interpreter "$pkg_prefix/bin/*" core/coreutils bin/env
}
​
do_install() {
  wrap_ruby_bin "knife"
}
​
wrap_ruby_bin() {
  local name="$1"
  local original="$pkg_prefix/ruby-bin/$name"
  local wrapper="$pkg_prefix/bin/$name"
  build_line "Adding wrapper $original to $wrapper"
  cat <<EOF > "$wrapper"
#!/bin/sh
set -e
if test -n "$DEBUG"; then set -x; fi
export GEM_HOME="$GEM_HOME"
export GEM_PATH="$GEM_PATH"
export SSL_CERT_FILE=$(pkg_path_for core/cacerts)/ssl/cert.pem
unset RUBYOPT GEMRC
exec $(pkg_path_for ${ruby_pkg})/bin/ruby $original \$@
EOF
  chmod -v 755 "$wrapper"
}
