// gulp/tasks/default.js
var gulp = require('gulp');
var runSequence = require('run-sequence');

gulp.task('default', function() {
  runSequence(
    'clean',
    ['compile-sass', 'compile-scss', 'compile-image'],
    'webpack'
  );
});
