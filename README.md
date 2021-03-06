# SVG to Sass Variables

This is a bash script, that will make Sass variables from SVG files.

A use case could be, if you are using your SVGs inline. Look at the example in [this link][link-inline-svg].

## Make Variables

Run the bash script with arguments containing a path to an output file and an input directory.

```bash
./svg-to-sass-variable.sh ./output/file.scss input/
```

## Use Variables

This is just an example of using variables with SVGs. There are probably many more. 

The function is an example from [this link][link-inline-svg].

```sass
...
@function inline-svg($string) {
    @return url('data:image/svg+xml,#{url-encode($string)}');
}

$svg-example: '<svg></svg>';

.icon {
    background-image: inline-svg($svg-example);
}
```

[link-inline-svg]: https://gist.github.com/steffenpedersen/66641c05e99b93d84d4296f8f5808b47
