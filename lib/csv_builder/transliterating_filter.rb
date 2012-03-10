#encoding: utf-8

class CsvBuilder::TransliteratingFilter
  # Transliterate into the required encoding if necessary
  def initialize(faster_csv, input_encoding = 'UTF-8', output_encoding = 'LATIN1')
    @faster_csv = faster_csv
  end

  # Transliterate before passing to FasterCSV so that the right characters (e.g. quotes) get escaped
  def <<(row)
    @faster_csv << row.map { |value| value.force_encoding("UTF-8") }
  end

  alias :add_row :<<
end
