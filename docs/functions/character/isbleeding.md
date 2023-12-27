# isbleeding()

Returns true if your character is bleeding, false otherwise.

{% code lineNumbers="true" %}
```lua
auto(200)
if not isbleeding() and (vocation() == 'knight' or vocation() == 'druid') then
    cast('exana kor') 
    wait(100, 200)
end
```
{% endcode %}

_Each 200 milliseconds, it will check if you are bleeding, and you are a 'knight' or a 'druid'. If so, it will cast 'cure bleeding' spell._