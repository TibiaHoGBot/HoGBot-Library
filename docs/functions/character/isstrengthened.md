# isstrengthened()

Returns true if your character is strenghtened, false otherwise.

{% code lineNumbers="true" %}
```lua
auto(200)
if not isstrengthened() then
    cast('utito tempo')
    wait(100, 200)
end
```
{% endcode %}

_Each 200 milliseconds, it will check if you are strengthened. If not, it cast 'blood rage' spell._