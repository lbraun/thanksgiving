// Twitter typeahead example.

// Instantiate the bloodhound suggestion engine
var recipients = new Bloodhound({
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name'),
  prefetch: '../../api/recipients.json' // Relative path, will not work on some pages
})

// Initialize the bloodhound suggestion engine
recipients.initialize();

// Instantiate the typeahead UI
function instantiateRecipientsTypeahead() {
  $('.typeahead').typeahead(null, {
    displayKey: 'name',
    source: recipients.ttAdapter()
  })
}
