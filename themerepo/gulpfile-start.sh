#!/bin/bash

GLOBAL_PACKAGES="node-gyp gulp gulp-cli"
sudo npm install --global $GLOBAL_PACKAGES

LOCAL_PACKAGES="node-gyp gulp browser-sync gulp-cli gulp-sass gulp-postcss autoprefixer gulp-autoprefixer cssnano gulp-sourcemaps"
npm install --save-dev $LOCAL_PACKAGES

npm install --no-optional

gulp
