maxrss=${SPLASH_MAXRSS:-$(awk '/MemTotal/{print $2*0.75/1024}' /proc/meminfo)}

xvfb-run --server-args="+extension RANDR -screen 0 30000x7000x24" python -m splash.server \
   --manhole \
   --maxrss $maxrss \
   --cache --cache-size=4096 \
   --proxy-profiles-path=/opt/proxy_profiles \
   --js-profiles-path=/opt/js_profiles

