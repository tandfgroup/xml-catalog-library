# XML Catalog Library


To flatten (minify) a DTD run:

```cmd
bin\dtdflatten.bat filename.dtd path\to\original.dtd
```

This command downloads DtdAnalyzer and runs dtdflatten and dtdcompare to produce:

1. flat DTD saved to schemas\filename.dtd
2. comparison of the flat DTD to the original DTD saved to build\filename.dtd-compare.html


