# Megli Common Helper

A set of helpers to be used in Ruby projects.

## How to use it?

Just require the gem like:

```
  require 'megli_common_helper'
```

And, include the module:
```
  include MegliCommonHelper
```

Then, use it!
```
  CommonHelper.nil_or_empty? ''
    => true 
  
  Time.now
    => 2017-08-07 12:03:02 +0200
  TimeHelper.get_time(:iso8601, 60)
    => "2017-08-07T13:03:34+02:00"
```

Feel free to contribute.
