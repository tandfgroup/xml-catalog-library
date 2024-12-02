import module namespace resolver = "xml-catalog-resolver" at "https://raw.githubusercontent.com/vincentml/xml-catalog-resolver/main/xml-catalog-resolver.xqm";


declare %unit:test function local:test() {
  let $catalog := "schemas/catalog.xml"
  for $file in file:descendants("test\examples")[matches(., '\.xml$', 'i')]
  order by $file
  let $original := unparsed-text(file:resolve-path($file))
  let $resolved := resolver:resolveDOCTYPE($original, $catalog)
  let $report := validate:dtd-report($resolved)
  return (
    file:name($file) || ' ' || $report/status,
    if ($report/status ne 'valid') then ($resolved),
    unit:assert($original ne $resolved, file:name($file) || " not resolved by catalog"),
    unit:assert($report/status eq 'valid', file:name($file) || " not validated " || string-join($report//text(), ' '))
  )
  
};

local:test()
