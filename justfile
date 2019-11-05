# https://github.com/casey/just

serve:
	zola serve

gh-pages:
	zola build
	git checkout gh-pages && cp -r public/* .

theme:
	cd semantic && ../node_modules/.bin/gulp build
	rm -rf static/components static/themes static/semantic*
	cp -r semantic/dist/semantic.min.* static/

bump oldversion version:
    sed --in-place 's/{{oldversion}}/{{version}}/g' content/doc/setup.md

# https://github.com/getzola/zola
@zola version='0.9.0' dest='~/bin':
    echo Installing zola
    curl -s -L https://github.com/getzola/zola/releases/download/v{{version}}/zola-v{{version}}-x86_64-unknown-linux-gnu.tar.gz | tar xzf - -C {{dest}}
    which zola; zola --version
