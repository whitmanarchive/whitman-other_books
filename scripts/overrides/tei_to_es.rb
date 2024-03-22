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

  def text
    # handling separate fields in array
    # means no worrying about handling spacing between words
    text_all = []
    body = get_text(@xpaths["text"], keep_tags: false, delimiter: '')
    text_all << body
    # TODO: do we need to preserve tags like <i> in text? if so, turn get_text to true
    # text_all << CommonXml.convert_tags_in_string(body)
    text_all += text_additional
    Datura::Helpers.normalize_space(text_all.join(" "))[0..900000]
  end



end
