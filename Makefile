
TEMPLATE = template.xml

SOURCES = \
	abstract.mkd \
	DLEP_lid.mkd \
	appendices.mkd
	
REFERENCES = 

draft.txt: $(TEMPLATE) $(SOURCES) $(REFERENCES) safewords.txt
	pandoc2rfc -t $(TEMPLATE) $(SOURCES)
	@echo "Check spelling of:"
	@aspell list --lang=en_us --personal=./safewords.txt < draft.txt  | sort -u -f 
	
draft.html: $(TEMPLATE) $(SOURCES) $(REFERENCES)
	pandoc2rfc -t $(TEMPLATE) -M $(SOURCES)

draft.xml: $(TEMPLATE) $(SOURCES) $(REFERENCES)
	pandoc2rfc -t $(TEMPLATE) -X $(SOURCES)

.PHONY: clean html txt xml
clean:
	pandoc2rfc -C

all: html xml txt
html: draft.html
xml: draft.xml
txt: draft.txt
