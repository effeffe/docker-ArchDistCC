#!/usr/bin/bash
export PATH=/opt/x-tools7h/arm-unknown-linux-gnueabihf/bin:/opt/x-tools8/aarch64-unknown-linux-gnu/bin:$PATH

/usr/bin/distccd --no-detach --daemon --user distcc --log-level info --log-stderr --port 3632 --stats --stats-port 3633 --listen 0.0.0.0 --jobs 10 & \
/usr/bin/distccd --no-detach --daemon --user distcc --log-level info --log-stderr --port 3635 --stats --stats-port 3637 --listen 0.0.0.0 --jobs 10 & \
/usr/bin/distccd --no-detach --daemon --user distcc --log-level info --log-stderr --port 3636 --stats --stats-port 3638 --listen 0.0.0.0 --jobs 10
