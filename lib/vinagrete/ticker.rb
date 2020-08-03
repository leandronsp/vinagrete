module Vinagrete
  class Ticker
    def initialize(vinagretes: 1, minutes_per_vinagrete: 1)
      @initial_time = Time.now
      @limit_in_minutes = vinagretes * minutes_per_vinagrete
    end

    def check!
      time_spent_in_minutes = 0
      minutes_to_display = "%02d" % @limit_in_minutes
      seconds_to_display = '00'

      while time_spent_in_minutes <  @limit_in_minutes do
        time_spent_in_seconds = Time.now - @initial_time
        time_spent_in_minutes = (time_spent_in_seconds / 60).to_i

        remaining_minutes = calculate_remaining_minutes(
          time_spent_in_minutes
        )

        break if (remaining_minutes - 1) < 0

        remaining_seconds = calculate_remaining_seconds(
          time_spent_in_seconds,
          time_spent_in_minutes
        )

        File.open('timer.out', 'wb') do |file|
          file.print "\e[2J\e[f"
          file.puts display_message(remaining_minutes, remaining_seconds)
        end

        sleep 1
      end

      send_notification!
    end

    def calculate_remaining_minutes(time_spent_in_minutes)
      @limit_in_minutes - time_spent_in_minutes
    end

    def calculate_remaining_seconds(time_spent_in_seconds, time_spent_in_minutes)
      60 - (time_spent_in_seconds - (time_spent_in_minutes * 60))
    end


    def minutes_to_display(remaining_minutes)
      return '00' if remaining_minutes < 1
      '%02d' % (remaining_minutes - 1)
    end

    def seconds_to_display(remaining_seconds)
      '%02d' % remaining_seconds
    end

    def display_message(remaining_minutes, remaining_seconds)
      "#{minutes_to_display(remaining_minutes)}:#{seconds_to_display(remaining_seconds)}"
    end

    private

    def send_notification!
      webhook = Slack::Incoming::Webhooks.new(
        ENV['SLACK_WEBHOOK_URL'],
        channel: ENV['SLACK_CHANNEL_ID'],
        username: 'Timer Bot'
      )

      webhook.post 'Hora da Pausa. Anda, vai mas é beber outro café!'
    end
  end
end
