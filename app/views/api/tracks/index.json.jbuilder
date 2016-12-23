json.tracks @tracks do |track|
  json.partial! partial: 'track', locals: { track: track }
end
