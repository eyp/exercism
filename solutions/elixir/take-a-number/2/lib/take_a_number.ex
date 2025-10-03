defmodule TakeANumber do
  defp update_state(state), do: state + 1
  
  defp receive_loop(state \\ 0) do
    receive do
      {:report_state, sender_pid}  -> 
        send(sender_pid, state)
        receive_loop(state)
      
      {:take_a_number, sender_pid}  -> 
        state = update_state(state)
        send(sender_pid, state)
        receive_loop(state)
      
      :stop -> nil
      
      _ -> receive_loop(state)
    end
  end
  
  def start() do
    spawn(&receive_loop/0)
  end
end
