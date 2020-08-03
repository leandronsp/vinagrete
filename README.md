# Vinagrete

You will no longer miss that remarkable pause while working!

### Why Vinagrete?

We think that a Pomodoro (25 minutes) is too much. We believe in shorter steps.
Each `vinagrete` is equal to a single minute.

Just that simple.

### Requirements

- A decent Operating System
- Docker

### Configuration

Export the following environment variables to your preferred configuration file:

```
- SLACK_WEBHOOK_URL
- SLACK_CHANNEL_ID
```

### Usage

```
VINAGRETES=25 docker-compose up
```

Or simply:

```
bash start # which mimics a 25-minutes Pomodoro
```

By default, each minute represents a single `vinagrete`. You can customize on
your own:

```
export MINUTES_PER_VINAGRETE=5
VINAGRETES=5 docker-compose up # 25 minutes timer, like the classical Pomodoro
```

### Check the elapsed time

```
bash check_time
```

### Testing

```
bundle exec rspec
```

### Contibute

Yep. It's free, it's open.
