# Megli Common Helper

A set of helpers to be used in Ruby projects.

## How to use it?

Install the gem:

```
  gem install megli_common_helper
```  
or
```  
  gem 'megli_common_helper', '~> 1.0', '>= 1.0.4'
```

Just require the gem like:

```
  require 'megli_helper'
```

Include the module:

```
  include MegliHelper
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
