var gulp = require("gulp");
var purescript = require("gulp-purescript");
var run = require("gulp-run");
var clean = require('gulp-clean');


var sources = [
  "src/**/*.purs",
  "bower_components/purescript-*/src/**/*.purs",
];

var foreigns = [
  "src/**/*.js",
  "bower_components/purescript-*/src/**/*.js"
];

gulp.task("make", function () {
  return purescript.psc({ src: sources, ffi: foreigns });
});

gulp.task("bundle", ["make"], function () {
  return purescript.pscBundle({ src: "output/**/*.js", output: "dist/bundle.js" });
});

gulp.task("docs", function () {
  return purescript.pscDocs({
      src: sources,
      docgen: {
        // "Name.Of.Module1": "docs/Name/Of/Module1.md",
        // "Name.Of.Module2": "docs/Name/Of/Module2.md"
      }
    });
});

gulp.task("dotpsci", function () {
  return purescript.psci({ src: sources, ffi: foreigns })
    .pipe(gulp.dest("."));
});

gulp.task("test", ["make"], function() {
  return purescript.pscBundle({ src: "output/**/*.js", main: "Main" })
    .pipe(run("node"));
});

gulp.task('clean', function () {
	return gulp.src(['output','dist'], {read: false})
		.pipe(clean());
});

gulp.task("purescript-all", ["bundle", "docs", "dotpsci"/*, "test"*/]);

gulp.task("default", ["clean", "purescript-all"])
