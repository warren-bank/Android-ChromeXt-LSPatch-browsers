#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source '/e//PortableApps/Java/env.sh'

assets_dir="${DIR}/../../assets"

output_dir="${DIR}/out"
output_log="${output_dir}/patch.log"
[ -d "$output_dir" ] && rm -rf "$output_dir"
mkdir "$output_dir"

browser_apk="${DIR}/net.slions.fulguris.full.fdroid_230.apk"
chromext_apk="${assets_dir}/ChromeXt-signed.apk"
lspatch_jar="${assets_dir}/jar-v0.6-426-release.jar"

java -jar "$lspatch_jar" "$browser_apk" -d -v -m "$chromext_apk" -o "$output_dir" --force >"$output_log" 2>&1
