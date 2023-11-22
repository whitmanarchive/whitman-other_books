require_relative "../../../whitman-scripts/scripts/archive-wide/overrides.rb"

class TeiToEs < XmlToEs

  # overriding because contributors are in an unusual place
  def override_xpaths
    # create an empty container for your overrides
    xpaths = {}
    # add the publisher xpath
    xpaths["contributor"] = [
      "/TEI/teiHeader/fileDesc/titleStmt/editor",
      "/TEI/teiHeader/fileDesc/titleStmt/respStmt/persName",
      "/TEI/teiHeader//notesStmt//persName"
    ]
    # the last line should always be your new xpaths
    xpaths
  end

  def category
    "Published Writings"
  end

  def category2
    "Published Writings / Other Books"
  end

end
