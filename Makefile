# Prerequisites
# pandoc 
# 
# sudo apt install pandoc
#
# Parameters and Variables
# https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html#Automatic-Variables
GENERATED=	arf.html \
			arf.docx

all: $(GENERATED)

# Gerenate html, doc from the html
arf.html: ARF.md
	pandoc -s -o $@ $< --toc --metadata title="The European Digital Identity Wallet Architecture and Reference Framework" --metadata lang="en" --self-contained --css=style.css
	node fix.js
	cp output.html $@ && rm output.html
	pandoc -o $@.docx $@

# Generate docx
arf.docx: ARF.md
	pandoc -o $@ $<

# Run a local http server
serve:
	npx http-server .

clean:
	echo $(GENERATED)
	rm -f $(GENERATED) arf.html.docx