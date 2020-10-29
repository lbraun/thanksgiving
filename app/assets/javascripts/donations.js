// Twitter typeahead example.

// instantiate the bloodhound suggestion engine
var numbers = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.obj.whitespace('num'),
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  local: [
    { num: 'one' },
    { num: 'two' },
    { num: 'three' },
    { num: 'four' },
    { num: 'five' },
    { num: 'six' },
    { num: 'seven' },
    { num: 'eight' },
    { num: 'nine' },
    { num: 'ten' }
  ]
})

// initialize the bloodhound suggestion engine
numbers.initialize();

// instantiate the typeahead UI
function instantiateTypeahead() {
  console.log("Instatiating :))))")
  $('.typeahead').typeahead(null, {
    displayKey: 'num',
    source: numbers.ttAdapter()
  })
}
