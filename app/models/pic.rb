class Pic < ApplicationRecord

def mypic=(uploaded_io)
File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
  file.write(uploaded_io.read)
end
write_attribute(:mypic, uploaded_io.original_filename)
end
def mypic
read_attribute(:mypic)
end

end
