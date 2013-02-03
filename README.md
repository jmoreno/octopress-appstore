# Octopress AppStore Plugin

An octopress plugin that displays app info from the AppStore. Please note that it only works with apps availables at the US AppStore.

## Syntax

```ruby
{% app_store app_id %}
```

## Example

Magically this:

```ruby
{% app_store 364709193 %}
```

will become this:

```html
<div id='app-widget'>
  <img src='http://a368.phobos.apple.com/us/r1000/110/Purple/v4/a0/93/08/a0930815-e79b-fb7a-8ea0-8793ddba49f9/Icon-iPhone.png' class='app-icon' style='width:60px; height:60px; vertical-align:middle;' />
	<span class='app-name'>
		<a class='com.apple.iBooks' href='https://itunes.apple.com/us/app/ibooks/id364709193?mt=8&uo=4' target='_blank'>
			iBooks
		</a>
	</span>
</div>
```

## License

Copyright (c) 2013 Otavio Cordeiro. All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
