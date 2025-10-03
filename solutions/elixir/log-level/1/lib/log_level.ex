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
      level > 0 && level < 5 -> labels[level]
      not legacy? and (level == 0 || level == 5) -> labels[level]
      true -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    label = to_label(level, legacy?)
    
    cond do
      label == :error || label == :fatal -> :ops
      label == :unknown and legacy? -> :dev1
      label == :unknown and not legacy? -> :dev2
      true -> false
    end
  end
end
