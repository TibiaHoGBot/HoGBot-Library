# isbattlesigned()

Returns true if your character is battle signed, false otherwise.

{% code lineNumbers="true" %}
```lua
auto(200)
if not isbattlesigned() then
    logout()
end
```
{% endcode %}

_Each 200 milliseconds, it will check if you are battle signed. If not, it will logout._