declare option db:intparse "false";
declare option db:dtd "true";
declare option db:catalog "schemas/catalog.xml";

for $file in file:descendants("test\examples")[matches(., '\.xml$', 'i')]
order by $file
return try {
  let $time := prof:track(void(doc(file:resolve-path($file))))?time
  return file:name($file) || " parsed " || $time || " ms"  || (if ($time gt 50) then " slow check Catalog and DOCTYPE")
} catch * {
  file:name($file) || " error " || $err:description
}
