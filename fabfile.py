from __future__ import with_statement
from fabric.api import *
from fabric.contrib.console import confirm
import os
import time

SPLASH_HOSTS = ['splash1',
                'splash2',
                'splash3',
                'splash4',]

env.hosts = SPLASH_HOSTS
env.user = 'ubuntu'
env.key_filename = '/home/andresport/.ssh/scrapinghub_ops.pem'

def reset_splash_prod():
    sudo('/home/ubuntu/splash/reset.sh')

def update_splash_prod():
    run('mkdir -p splash/splash')
    put("splash/*.py", "/home/ubuntu/splash/splash", use_sudo=True)
    put("splash.sh", "/home/ubuntu/splash", use_sudo=True,  mirror_local_mode=True)
    put("run.sh", "/home/ubuntu/splash", use_sudo=True,  mirror_local_mode=True)
    put("setup.py", "/home/ubuntu/splash", use_sudo=True,  mirror_local_mode=True)
    put("monitor.py", "/home/ubuntu/splash", use_sudo=True,  mirror_local_mode=True)
    put("reset.sh", "/home/ubuntu/splash", use_sudo=True,  mirror_local_mode=True)
    put("monitor.sh", "/home/ubuntu/splash", use_sudo=True,  mirror_local_mode=True)

def update_splash_proxy():
    sudo('mkdir -p /opt/proxy_profiles')
    put("/home/andresport/oasis/proxy/*", "/opt/proxy_profiles", use_sudo=True)

def update_splash_js():
    sudo('mkdir -p /opt/proxy_profiles')
    put("/home/andresport/oasis/proxy/*", "/opt/proxy_profiles", use_sudo=True)
