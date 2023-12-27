# cast()

Casts the specified message in Local Chat.

{% code lineNumbers="true" %}
```lua
auto(100)
if hppc() < 80 or mppc() > 95 then
	cast('exura')
	wait(200)
end  
```
{% endcode %}

Will cast exura if your HP drops below 80% or your Mana will be above 95%.

