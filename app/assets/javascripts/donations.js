// Twitter typeahead example.

// Instantiate the bloodhound suggestion engine
var recipients = new Bloodhound({
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name'),
  prefetch: '../../api/recipients.json' // Relative path, will not work on some pages
})

// Initialize the bloodhound suggestion engine
recipients.initialize();

function makeAddNewLink({query}) {
  return `<i><a class="tt-suggestion" href="#" data-toggle="modal" data-target="#newRecipientModal">Add new recipient "${query}"</a></i>`
}

function makeFooter({query}) {
  return '<i><a class="tt-suggestion" target="_blank" href="/recipients">See all recipients ></a></i>'
}

function makeNotFound(object) {
  $('#recipient_name').val($('#donation_recipient_name').val())
  return [
    makeAddNewLink(object),
    makeFooter(object),
  ].join("\n")
}

function makeHeader({query, suggestions}) {
  if (!suggestions.some((s) => s.name.toUpperCase() === query.toUpperCase())) {
    return makeAddNewLink({query})
  }
}

// Instantiate the typeahead UI
function instantiateRecipientsTypeahead() {
  $('.typeahead').typeahead({
    highlight: true,
  }, {
    displayKey: 'name',
    source: recipients.ttAdapter(),
    templates: {
      header: makeHeader,
      notFound: makeNotFound,
      footer: makeFooter,
    }
  })
}
