// gulpのアセットファイルを配置する場所
gulpAssets   = 'app/assets';
// publicのアセットファイルを配置する場所
publicAssets = 'public/assets';
nodeModuleAssets = 'node_modules'

module.exports = {
  gulpAssets:   gulpAssets,
  nodeModuleAssets: nodeModuleAssets,
  publicAssets: publicAssets,

  javascript: {
    src:  gulpAssets   + '/javascripts/**/*',
    dest: publicAssets + '/javascripts'
  },
  stylesheet: {
    srcSass:  gulpAssets   + '/stylesheets/**/*.sass',
    srcScss:  gulpAssets   + '/stylesheets/**/*.scss',
    dest: publicAssets + '/stylesheets'
  },
  watch: {
    javascript:     gulpAssets + '/javascripts/**/*',
    stylesheetSass: gulpAssets + '/stylesheets/**/*.sass',
    stylesheetScss: gulpAssets + '/stylesheets/**/*.scss',
    browserSync: 'public/**/*'
  },
  browserSync: {
    proxy: 'localhost:3000'
  },
  rev: {
    dest: publicAssets + '/rev-manifest.json',
    opts: {
      base:  process.cwd() + '/' + publicAssets,
      merge: true
    }
  }
}