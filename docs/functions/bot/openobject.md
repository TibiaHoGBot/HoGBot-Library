# openobject(itemID, locationFrom, asNew, parentIndex, stackIndex)

Opens object of given ID.

### opens first visible object by it's ID
{% code lineNumbers="true" %}
```lua
openobject(2709)   
```
{% endcode %}

### opens item by it's ID in specific location (orange backpack)
{% code lineNumbers="true" %}
```lua
openobject(2709, "orange backpack")   
```
{% endcode %}

### opens item by it's ID inside orange backpack as a new container
{% code lineNumbers="true" %}
```lua
openobject(2709, "orange backpack", true)   
```
{% endcode %}

### opens item by it's ID from inside second orange backpack
{% code lineNumbers="true" %}
```lua
openobject(2709, "orange backpack", false, 2)
```
{% endcode %}

### opens item by it's ID from inside second orange backpack at a second position in the stack
{% code lineNumbers="true" %}
```lua
openobject(2709, "orange backpack", false, 2, 2)
```
{% endcode %}

