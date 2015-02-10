require 'libxml'
class ImportXml
  def self.import
    Dir.entries("#{Rails.root}/XML/").grep(/.xml/).each do |line|
      doc=LibXML::XML::Document.file("#{Rails.root}/XML/#{line}")
      s=SampleTable.new
      s.name=doc.find("/author/name").first.content
      s.email=doc.find("/author/email").first.content
      s.save
    end 
  end
end
#rails r ImportXml.import
