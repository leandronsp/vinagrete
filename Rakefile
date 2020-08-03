require_relative './lib/vinagrete'

task default: %w[start]

task :start do
  ticker = Vinagrete::Ticker.new(
    vinagretes: (ENV['VINAGRETES'] || 1).to_i,
    minutes_per_vinagrete: (ENV['MINUTES_PER_VINAGRETE'] || 1).to_i
  )

  ticker.check!
end
