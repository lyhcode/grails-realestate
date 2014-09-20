export theme=default
pandoc -t revealjs -V theme="$theme" -V revealjs-url="https://cdnjs.cloudflare.com/ajax/libs/reveal.js/2.6.2" --slide-level=2 -s README.md -o slides.html
sed -i .bak "s/simple/$theme/g" slides.html
sed -i .bak "s/<head>/<head><meta property=\"og:image\" content=\"https:\/\/raw.githubusercontent.com\/lyhcode\/grails-realestate\/master\/slides.png\">/g" slides.html
sed -i .bak "s/<head>/<head><meta property=\"og:type\" content=\"article\">/g" slides.html
sed -i .bak "s/<head>/<head><meta property=\"og:title\" content=\"Groovy on Grails\">/g" slides.html
sed -i .bak "s/<head>/<head><meta property=\"og:description\" content=\"TWJUG Sep 20, 2014\">/g" slides.html

