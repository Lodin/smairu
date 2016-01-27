const gulp = require('gulp');
const env = require('gulp-env');
const sass = require('gulp-sass');
const jade = require('gulp-jade');
const source = require('gulp-sourcemaps');
const path = require('path');

const routes = (() => {
    var routes = {
        dir: {
            app: path.join(__dirname, 'lib'),
        }
    }; 

    routes.files = {
        app: type => path.join(routes.dir.app, '**/*.' + type),
    };

    return routes;
})();

// Processes sass files
gulp.task('sass', () => {
    var files = gulp.src(routes.files.app('scss'));

    if (process.env.DEV) {
        files = files.pipe(source.init())
                .pipe(sass())
            .pipe(source.write());
    } else {
        files = files.pipe(sass({output: 'compressed'}))
    }

    return files.pipe(gulp.dest(file => file.base));
});

// Processes `jade` files
gulp.task('jade', () => {
    return gulp.src(routes.files.app('jade'))
        .pipe(jade())
        .pipe(gulp.dest(routes.dir.app));
});


// Sets developer environment
gulp.task('env-dev', () => {
    env({
        vars: {
            DEV: true
        }
    });
});

// Sets production environment:
// - No sourcemaps for scss and ts files
// - Compressed html & css
gulp.task('env-prod', () => {
    env({
        vars: {
            DEV: false
        }
    });
});

// Runs developer environment
gulp.task('run', ['env-dev', 'sass', 'jade']);

// Runs production environment
gulp.task('run-prod', ['env-prod', 'sass', 'jade']);

// Watches changes of all files
gulp.task('watch', function(){
    const run = 'run';

    gulp.watch(routes.files.app('scss'), [run]);
    gulp.watch(routes.files.app('jade'), [run]);
});
