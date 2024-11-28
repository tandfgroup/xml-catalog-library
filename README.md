# XML Catalog Library

The `schemas` folder contains XML Catalog `catalog.xml` and DTD files that are often needed. The entire `schemas` folder or selected parts of its contents can be used in other projects.


To flatten (minify) a DTD run:

```cmd
bin\dtdflatten.bat filename.dtd path\to\original.dtd
```

This command downloads DtdAnalyzer and runs dtdflatten and dtdcompare to produce:

1. flat DTD saved to schemas\filename.dtd
2. comparison of the flat DTD to the original DTD saved to build\filename.dtd-compare.html


