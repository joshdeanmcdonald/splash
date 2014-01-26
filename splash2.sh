env DISPLAY=0
maxrss=${SPLASH_MAXRSS:-$(awk '/MemTotal/{print $2*0.75/1024}' /proc/meminfo)}

python -m splash.server \
   --maxrss $maxrss \
   --cache --cache-size=10240 \
   --js-profiles-path=/opt/js_profiles
