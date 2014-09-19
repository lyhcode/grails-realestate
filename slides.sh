
export theme=default
pandoc -t revealjs -V theme="$theme" -V revealjs-url="http://cdnjs.cloudflare.com/ajax/libs/reveal.js/2.6.2" --slide-level=2 -s slides/README.md -o slides.html
sed -i .bak "s/simple/$theme/g" slides.html

