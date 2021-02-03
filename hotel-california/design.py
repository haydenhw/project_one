
def queryClickstream(referrer, offset): pass


permuation = [1, 1, 1, 1]
permutations = [
    [1, 1, 1, 1], # turn each of these into a list of
    [1, 2, 1, 1],
    [2, 2, 1, 1],
]




def collectClickstream(referrer, offsetSequence, clickstream=[]):
  if len(clickstream) == len(offsetSequence): return clickstream

  result = queryClickstream(referrer, offsetSequence[len(clickstream)])
  clickstream.append({
        "referrer": result.referrer,
        "source": result.source,
        "occurrences": result.occurrencs
    })

  collectClickstream(
      result.referrer
      # offsetSequence
      # clickstream
  )


referrer = 'Hotel_California'
result = [collectClickstream(referrer, path) for path in permutations ]

# want a [
#     [{ page: 'n1', viewcount: n1 }, { page: 'Don_Henely', viewcount: n2}, { page: 'Eagles_Band', viewcount: n3}],
#     [{ page: 'n1', viewcount: n1 }, { page: 'n3', viewcount: n3}, { page: 'n4', viewcount: n4}],
#     [{ page: 'n1', viewcount: n1 }, { page: 'n4', viewcount: n4}, { page: 'n5', viewcount: n5}],
# ]

# reduced
# output wanted { clickstream: 'Hotel_California-> n1-> Don_Henely -> Eagles_Band', totalClicksPerPageView: 3434 }
