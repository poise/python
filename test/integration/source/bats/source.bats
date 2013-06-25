#!/usr/bin/env bats

@test "python bin should exist" {
    [ -x "/opt/bin/python" ]
}

@test "python should be version 2.7.1" {
    /opt/bin/python -c 'import sys; print sys.version' | grep '2.7.1'
}
