gulp = require 'gulp'
coffee = require 'gulp-coffee'
concat = require 'gulp-concat'
watch = require 'gulp-watch'
sass = require 'gulp-sass'

gulp.task 'scripts', ->
	gulp.src 'src/*.coffee'
		.pipe coffee()
		.pipe concat 'dist.js'
		.pipe gulp.dest './dist'

gulp.task 'styles', ->
	gulp.src 'src/*.sass'
		.pipe sass()
		.pipe concat 'style.css'
		.pipe gulp.dest './dist'

gulp.task 'default', ->
	gulp.start 'scripts'
	gulp.start 'styles'

gulp.task 'watch', ->
	watch 'src/*', ->
		gulp.start 'default'

