defmodule ExpensiveThing do
  use SemaphoreResource, max: 5

  def call do
    SemaphoreResource.call(__MODULE__, fn ->
      # Do some work..
      Process.sleep(1000)
    end)
  end
end

ExpensiveThing.start_link()

tasks = Enum.map(1..20, fn i ->
  Task.async(fn ->
    ExpensiveThing.call()
    IO.puts("#{i} complete")
  end)
end)

# Will print `x complete` in batches of 5
Task.await_many(tasks, :infinity)
