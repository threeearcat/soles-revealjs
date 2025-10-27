all:
	quarto render

pdf:
	@QMD_FILE=$$(find . -maxdepth 1 -name "*.qmd" ! -name "template.qmd" -print -quit); \
	if [ -z "$$QMD_FILE" ]; then \
		echo "Error: No .qmd file found (excluding template.qmd)"; \
		exit 1; \
	fi; \
	BASENAME=$$(basename "$$QMD_FILE" .qmd); \
	HTML_FILE="$$BASENAME.html"; \
	PDF_FILE="$$BASENAME.pdf"; \
	FULL_PATH="file://$(shell pwd)/$$HTML_FILE"; \
	echo "Generating PDF from $$HTML_FILE..."; \
	decktape reveal --size=1440x1080 "$$FULL_PATH" "$$PDF_FILE"

.PHONY: all pdf
