-- Registered events and associated callback functions
local registeredEvents = {}

--- Registers a callback handler to an event.
-- @param name event name
-- @param callback handler
--
function Cauldron_RegisterEvent(name, callback)
    if not registeredEvents[name] then
        registeredEvents[name] = {}
    end

    table.insert(registeredEvents[name], callback)

    Cauldron_Debug('Handler "%s" registered with event "%s".', tostring(callback), name)
end

--- Raises an event and executes the registered handlers.
-- @param name event name
-- @param target who triggers the event
-- @param ... additional arguments
-- @return whether succeed
--
function Cauldron_RaiseEvent(name, target, ...)
    Cauldron_Debug('Event "%s" triggered by target "%s".', name, tostring(target))

    if not registeredEvents[name] or #registeredEvents[name] == 0 then
        Cauldron_Warning('No handlers registered with event "%s".', event)
        return false
    end

    for i = 1, #registeredEvents[name] do
        if registeredEvents[name][i](name, target, ...) == false then
            Cauldron_Debug('Event "%s" stopped by target "%s" at #%d handler.', name, tostring(target), i)
            return false
        else
            Cauldron_Debug('#%d handler "%s" for event "%s" proceeded.', i, name, tostring(registeredEvents[name][i]))
        end
    end

    return true
end
