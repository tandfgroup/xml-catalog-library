import module namespace resolver = "xml-catalog-resolver" at "https://raw.githubusercontent.com/vincentml/xml-catalog-resolver/main/xml-catalog-resolver.xqm";

let $catalog := "schemas/catalog.xml"

for $file in file:descendants("test/examples")[matches(., '\.xml$', 'i')]
order by $file
let $original := unparsed-text(file:resolve-path($file))
let $resolved := resolver:resolveDOCTYPE($original, $catalog)
return if ($original eq $resolved) then (
  file:name($file) || " error: not resolved by catalog"
) else (
  file:name($file) || " ok"
)
