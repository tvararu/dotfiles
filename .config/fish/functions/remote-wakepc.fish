function remote-wakepc
  ssh pi@pirrent 'wakeonlan -i 10.0.0.5 9C:5C:8E:71:8B:C6'
end
