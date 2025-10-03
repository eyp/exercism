defmodule LogLevel do
  def to_label(level, legacy?) do
    labels = %{
      0 => :trace, 
      1 => :debug, 
      2 => :info, 
      3 => :warning, 
      4 => :error, 
      5 => :fatal
    }
    
    cond do
      should_return_label(level, legacy?) -> labels[level]
      true -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    label = to_label(level, legacy?)
    
    cond do
      label == :error or label == :fatal -> :ops
      label == :unknown and legacy? -> :dev1
      label == :unknown and not legacy? -> :dev2
      true -> false
    end
  end

  defp should_return_label(level, legacy?) do
    (level > 0 and level < 5) or not legacy? and (level == 0 or level == 5)
  end
end
