module TracksHelper
  def ugly_lyrics(lyrics)
    (
      '<pre>' +
      @track.lyrics.split("\n").map { |line| "&#9835; #{h(line)}" }.join("\n") +
      '</pre>'
    ).html_safe
  end
end
