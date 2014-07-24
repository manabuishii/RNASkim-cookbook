package "apt"
package "git"
package "build-essential"
package "python-setuptools"
package "unzip"

#
git "#{Chef::Config[:file_cache_path]}/RNASkim" do
  repository "https://github.com/zzj/RNASkim.git"
  revision "master"
  action :sync
end
execute "RNASkim extract source and execute prepare" do
  command <<-CODE
set -e
(cd #{Chef::Config[:file_cache_path]}/RNASkim && ./prepare.sh)
CODE
  action :run
end

# make all ends with fail.
# so make small
%w{
proto/rnasigs.pb.h
rs/rnasigs_pb2.py
gtest_main.a
rs_index
rs_cluster
rs_select
rs_count
rs_estimate
gtest.a
fa_reader_test
rs_bloom_test
rolling_hash_counter_test
rs_common_test
karp_robin_hash_test
all
}.each do |t|
  execute "make #{t}" do
    command <<-CODE
set -e
(cd #{Chef::Config[:file_cache_path]}/RNASkim/src && make #{t})
CODE
    action :run
  end
end

