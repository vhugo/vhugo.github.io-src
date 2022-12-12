MD_FILES = $(shell \
				find ./content/pages -type f -name \*.md | \
				grep -v index.md | grep -v format.md | sort)


THEME = "default"
TH_HEADER = ./theme/${THEME}/header.html
TH_NAV = ./theme/${THEME}/nav.html
TH_FOOTER = ./theme/${THEME}/footer.html

SITE = ./site
INDEX_MD = ./content/pages/index.md
INDEX_HTML = ${SITE}/index.html

WRITER_LUA = pandoc-writer.lua
TEST_FORMAT_MD = ./content/pages/format.md
TEST_FORMAT_HTML = ${SITE}/format.html

all: clean build index css media check-html

test:
	@echo "- Generating ${TEST_FORMAT_HTML}"
	@cat ${TH_HEADER} > ${TEST_FORMAT_HTML}; \
	cat ${TH_NAV} >> ${TEST_FORMAT_HTML}; \
	echo "<main>" >> ${TEST_FORMAT_HTML}; \
	pandoc -t ${WRITER_LUA} ${TEST_FORMAT_MD} >> ${TEST_FORMAT_HTML}; \
	echo "</main>" >> ${TEST_FORMAT_HTML}; \
	cat ${TH_FOOTER} >> ${TEST_FORMAT_HTML}

page:
	@read -p "new page name: " PAGE_NAME; \
	FILE_NAME=$$(echo "$$PAGE_NAME" | \
	iconv -t ascii//TRANSLIT | \
	sed -r s/[^a-zA-Z0-9]+/-/g | \
	sed -r s/^-+\|-+$$//g | \
	tr A-Z a-z); \
	echo "- Editing page: $$PAGE_NAME and $$FILE_NAME"; \
	${EDITOR} ./content/pages/$$FILE_NAME.md

clean:
	@echo "- Cleaning up last site build"
	@echo "  - Removing HTML files"; \
		rm -rf ${SITE}/*.html ${SITE}/index.txt
	@echo "  - Removing media files"; \
		rm -rf ${SITE}/media/*
	@echo "  - Removing CSS files"; \
		rm -rf ${SITE}/links/*

css:
	@echo "- Copying CSS files"; \
		cp -r ./theme/${THEME}/links/* ${SITE}/links/

media:
	@echo "- Optimizing Media files"; \
		jpegoptim -fos -d ${SITE}/media/ ./content/pages/media/{*.jpg,*.jpeg} 

index:
	@echo "- Generating the index page"
	@> ${SITE}/index.txt
	@for markdown in $(MD_FILES) ; do \
		HTML_FILE=$$(echo "$$markdown" | sed -re 's/^.+\/([^\/]+)\.md/\1.html/'); \
		HTML_NAME=$$(echo "$$markdown" | sed -re 's/^.+\/([^\/]+)\.md/\1/' | sed -re 's/[-_]/ /'); \
		echo "- [$$HTML_NAME]($$HTML_FILE)" >> ${SITE}/index.txt; \
	done
	@cat ${TH_HEADER} > ${INDEX_HTML}; \
	cat ${TH_NAV} >> ${INDEX_HTML}; \
	echo "<main>" >> ${INDEX_HTML}; \
	pandoc ./content/pages/index.md >> ${INDEX_HTML}; \
	pandoc ${SITE}/index.txt >> ${INDEX_HTML}; \
	echo "</main>" >> ${INDEX_HTML}; \
	cat ${TH_FOOTER} >> ${INDEX_HTML}; \
	rm ${SITE}/index.txt

build:
	@echo "- Building up the site"
	@for markdown in $(MD_FILES) ; do \
		echo "  - Building $$markdown"; \
		HTML_FILE=$$(echo "$$markdown" | sed -re 's/^.+\/([^\/]+)\.md/\1.html/'); \
		cat ${TH_HEADER} > ${SITE}/$$HTML_FILE; \
		cat ${TH_NAV} >> ${SITE}/$$HTML_FILE; \
		echo "<main>" >> ${SITE}/$$HTML_FILE; \
		pandoc -t ${WRITER_LUA} $$markdown >> ${SITE}/$$HTML_FILE; \
		echo "</main>" >> ${SITE}/$$HTML_FILE; \
		cat ${TH_FOOTER} >> ${SITE}/$$HTML_FILE; \
	done

check-html:
	@LINKS_HTML=$$(grep -EIro "href=\"([^\"]+)\"" site/ | grep -vE "https?://" ); \
		for link in $$LINKS_HTML ; do \
			SOURCE=$$(echo "$$link" | awk -F":" '{print $$1}'); \
			TARGET=$$(echo "$$link" | awk -F"=" '{print $$2}' | sed -e 's/["]//g' ); \
			if [ ! -f ./site/$$TARGET ]; then \
				echo "$$SOURCE has a link to $$TARGET, but file is not found!"; \
			fi \
		done

check-html-links:
	@LINKS_HTML=$$(grep -EIro "href=\"([^\"]+)\"" site/ | \
		grep -vE "https?://" | \
		awk -F'=' '{print $$2}' | \
		sed -e 's/["]//g' | \
		sort | \
		uniq); \
		for link in $$LINKS_HTML ; do \
			if [ ! -f ./site/$$link ]; then \
				echo "$$link not found!"; \
			fi \
		done

check-md:
	@grep -EIro "\(([^\)]+)\)" content/pages/ | \
		grep -vE "https?://" | \
		awk -F':' '{print $2}' | \
		sed -e 's/[\(\)]//g' | \
		sort | \
		uniq
