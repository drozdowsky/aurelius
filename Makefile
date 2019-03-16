PREFIX = /usr/local

aurelius: aurelius.sh aurelius.awk aurelius.tsv
	cat aurelius.sh > $@
	echo 'exit 0' >> $@
	echo '#EOF' >> $@
	tar cz aurelius.awk aurelius.tsv >> $@
	chmod +x $@

test: aurelius.sh
	shellcheck -s sh aurelius.sh

clean:
	rm -f aurelius

install: aurelius
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f aurelius $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/aurelius

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/aurelius

.PHONY: test clean install uninstall
