// gulp/tasks/watch.js
var config = require('./config');
var gulp   = require('gulp');
var browserSync = require('browser-sync').create();

gulp.task('watch', function() {

  browserSync.init({
    proxy: 'localhost:3000'
  });

  gulp.watch(config.watch.stylesheetSass, ['compile-sass']);
  gulp.watch(config.watch.stylesheetScss, ['compile-scss']);
  gulp.watch(config.watch.stylesheetNodeSass, ['compile-node-sass']);
  gulp.watch(config.watch.stylesheetNodeScss, ['compile-node-scss']);
  gulp.watch(config.watch.javascript,     ['webpack']);

  gulp.watch(config.watch.browserSync).on('change', browserSync.reload);
});
