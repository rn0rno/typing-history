guard :shell do
  watch(/data\/(.*).json/) do |m|
    `git add #{m[0]} && git commit -m 'Automatically commit: #{m[0]}'`
  end
end
