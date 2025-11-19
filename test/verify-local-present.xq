(:~ Verify catalog entries by checking that each local file mentioned in the catalog is present. :)

import module namespace resolver = "xml-catalog-resolver" at "https://raw.githubusercontent.com/vincentml/xml-catalog-resolver/main/xml-catalog-resolver.xqm";

declare namespace catalog = "urn:oasis:names:tc:entity:xmlns:xml:catalog";


declare variable $catalog as xs:string external := "schemas/catalog.xml";

(:~ Check whether file name mentioned in @uri is present in a case sensitive way.
 : Does not catch all errors.
 :)
declare function local:existsCaseSensitive($path as xs:string) as xs:boolean {
  let $full := file:resolve-path($path)
  let $found := $full => file:parent() => file:children() =!> file:resolve-path()
  return $full = $found
};

for $entry in resolver:catalogEntries($catalog)
let $resolved := string($entry/@uri)
let $name := file:name($resolved)
where not(file:exists($resolved)
  and local:existsCaseSensitive($resolved))
return $entry
  
