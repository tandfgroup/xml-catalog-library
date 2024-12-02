declare option db:intparse "false";
declare option db:dtd "true";
declare option db:catalog "schemas/catalog.xml";

let $files := file:descendants("test/examples")[matches(., '\.xml$', 'i')]
return (
  void(doc(file:resolve-path(head($files)))) (: first parsing always takes longer so do an extra parse before measuring :),
  
  for $file in $files
  order by $file
  return try {
    let $time := prof:track(void(doc(file:resolve-path($file))))?time
    return file:name($file) || " parsed " || $time || " ms"  || (if ($time gt 50) then " slow check Catalog and DOCTYPE")
  } catch * {
    file:name($file) || " error " || $err:description
  }
)
