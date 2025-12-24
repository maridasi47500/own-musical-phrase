class Fragment < ApplicationRecord
def key_signature=(hey)
write_attribute(:key_signature, hey.downcase.gsub("♯", "is").gsub("♭", "es"))
end
def time_signature=(hey)
write_attribute(:time_signature, hey.downcase.gsub(" beats per bar", "/4"))
end
def tempo=(hey)
if hey.include?("BPM")
x=hey.gsub(" BPM", "")
write_attribute(:tempo, "4 = "+x.strip.squish)
else
write_attribute(:tempo, hey)
end
end

end
