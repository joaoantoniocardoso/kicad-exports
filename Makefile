build:
	docker build -t kicad-exports . > build.log

install:
#	echo 'docker run -u $$(id -u $$USER):$$(id -g $$USER) -v "$$PWD:$$HOME:rw" kicad-exports $$@' > kicad-exports
	echo 'docker run -v "$$PWD:/mnt:rw" kicad-exports $$@' > kicad-exports
	chmod +x kicad-exports
	mv -f kicad-exports ~/.local/bin/kicad-exports

clean:
	docker image rm -f kicad-exports
	git clean -f -x

test:
# https://github.com/nektos/act
	act

shell: 
	docker run -it --entrypoint '/bin/bash' -v "$$PWD:/mnt:rw" kicad-exports 