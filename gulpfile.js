const gulp = require('gulp');
const env = require('gulp-env');
const sass = require('gulp-sass');
const jade = require('gulp-jade');
const source = require('gulp-sourcemaps');
const path = require('path');
const shell = require('gulp-shell');
const del = require('del');

const routes = (() => {
    var files = (folder) => type => path.join(folder, '**/*.' + type);

    var routes = {
        dir: {
            app: path.join(__dirname, 'lib'),
            build: path.join(__dirname, 'build'),
            metadata: path.join(__dirname, 'metadata'),
            js: path.join(__dirname, 'js'),
            images: path.join(__dirname, 'images')
        }
    }; 

    routes.files = {
        app: files(routes.dir.app),
        metadata: files(routes.dir.metadata),
        js: files(routes.dir.js),
        images: files(routes.dir.images)
    };

    routes.build = (folder) => folder !== undefined
        ? path.join(routes.dir.build, folder)
        : routes.dir.build

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

// Compiles dart project
gulp.task('dart', ['sass', 'jade'], shell.task([
    'pub build'
]));

// Copies files from `metadata` folder to `build` folder
gulp.task('copy-meta', ['dart'], () => {
    return gulp.src(routes.files.metadata('json'))
        .pipe(gulp.dest(routes.build()))
});

// Copies files from `js` folder to `build` folder
gulp.task('copy-js', ['dart'], () => {
    return gulp.src(routes.files.js('js'))
        .pipe(gulp.dest(routes.build('js')));
});

// Copies files from `images` folder to `build` folder
gulp.task('copy-images', ['dart'], () => {
    return gulp.src(routes.files.images('png'))
        .pipe(gulp.dest(routes.build('images')));
});

// Removes generated unnesessary files from `lib` folder
gulp.task('clean', ['copy-meta', 'copy-js', 'copy-images'], () => {
    del([
        routes.files.app('html'),
        routes.files.app('css')
    ]);
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
gulp.task('run-prod', ['env-prod', 'clean']);

// Watches changes of all files
gulp.task('watch', function(){
    const run = 'run';

    gulp.watch(routes.files.app('scss'), [run]);
    gulp.watch(routes.files.app('jade'), [run]);
});
