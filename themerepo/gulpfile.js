var host = "http://localhost";


// REQUIRED
var gulp = require("gulp");
var sass = require("gulp-sass");
var postcss = require("gulp-postcss");
var autoprefixer = require("autoprefixer");
var cssnano = require("cssnano");
var sourcemaps = require("gulp-sourcemaps");
var browserSync = require("browser-sync").create();
var paths = {
  styles: {
    src: "./scss/**/*.scss",
    dest: "./css",
    reload: "index.html",
  }
};


// FUNCTION style
function style() {
  return (
    gulp
      .src(paths.styles.src)
      .pipe(sourcemaps.init())
      .pipe(sass())
      .on("error", sass.logError)
      // .pipe(postcss([autoprefixer(), cssnano()]))
      .pipe(postcss([autoprefixer()]))
      .pipe(sourcemaps.write())
      .pipe(gulp.dest(paths.styles.dest))
      .pipe(browserSync.stream())
  );
}


// FUNCTION reload
function reload() {
  browserSync.reload();
}


// FUNCTION watch
function watch() {
  browserSync.init({
    // server: {
    //     baseDir: "./"
    // },
    proxy: host
  });
  gulp.watch(paths.styles.src, style)
  gulp.watch(paths.styles.reload, reload);
}


// TASKS EXPORT
exports.style = style;
exports.watch = watch
exports.default = watch;
