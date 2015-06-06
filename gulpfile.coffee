gulp = require 'gulp'
coffee = require 'gulp-coffee'
concat = require 'gulp-concat'
watch = require 'gulp-watch'

gulp.task 'default', ->
	gulp.src 'src/*.coffee'
		.pipe coffee()
		.pipe concat 'dist.js'
		.pipe gulp.dest './dist'


gulp.task 'watch', ->
	watch 'src/*', ->
		gulp.start 'default'

