#!/usr/bin/env bats
@test "test fa_reader_test" {
    cd /tmp/kitchen/cache/RNASkim/src
    run ./fa_reader_test
    [ "$status" -eq 0 ]
}
@test "test karp_robin_hash_test" {
    cd /tmp/kitchen/cache/RNASkim/src
    run ./karp_robin_hash_test
    [ "$status" -eq 0 ]
}
@test "test rolling_hash_counter_test" {
    cd /tmp/kitchen/cache/RNASkim/src
    run ./rolling_hash_counter_test
    [ "$status" -eq 0 ]
}
@test "test rs_bloom_test" {
    cd /tmp/kitchen/cache/RNASkim/src
    run ./rs_bloom_test
    [ "$status" -eq 0 ]
}
@test "test rs_common_test" {
    cd /tmp/kitchen/cache/RNASkim/src
    run ./rs_common_test
    [ "$status" -eq 0 ]
}
