# XML Catalog Library

This repository contains a library of XML Catalog entries and corresponding XML DTDs. The main purpose of using XML Catalogs is to resolve the location of XML DTDs and XML Schemas to files stored on a local file system, which can greatly speed up processing by avoiding the automatic downloading of DTD files from a remote location. This can also help to solve problems such as: DTD files not being found at a location indicate in the DOCTYPE portion of an XML file, and subtle errors that might be encountered when an XML file is processed without using the DTD specified in the DOCTYPE.

The `schemas` folder contains XML Catalog files `catalog.xml` and DTD files. The entire `schemas` folder or selected parts of its contents can be used in other projects.

A recent version of Java is required to use the tools that are included in this library, although Java is not required in if you just want to use the XML Catalogs and DTDs in another project.

## DTD Flatten

Most of the DTDs in the schemas folder are flattened versions of publicly available DTDs. Flattening a DTD is a process that compresses (or minifies) a DTD, which might have many files, into a single file while preserving the logical functioning of the DTD. For many common use cases a flattened DTD is equivalent to the original DTD.

To flatten (minify) a DTD run:

```cmd
bin\dtdflatten.bat filename.dtd path\to\original.dtd
```

This command downloads DtdAnalyzer and runs dtdflatten and dtdcompare to produce:

1. flat DTD saved to schemas\filename.dtd
2. comparison of the flat DTD to the original DTD saved to build\filename.dtd-compare.html

## Testing

The `test` folder contains scripts and many sample files for testing XML Catalogs included in this library. To run the tests, run `bin\test.bat`
