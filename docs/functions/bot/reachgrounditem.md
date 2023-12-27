# reachgrounditem(itemid, avoid)

Returns true if reached specified item on ground, false otherwise. Avoid is optional parameter to avoid sqms with objects with that id.

{% code lineNumbers="true" %}
```lua
--Example 1
reachgrounditem(xxx, yyy)
--Example 2
reachgrounditem(xxx)
```

{% endcode %}

Example 1: _Will try to reach xxx item on ground, but won't try on sqms that yyy lays._
Example 2: _Will try to reach xxx item on ground._