local event_manager = {}

-- Table to hold registered events and their listeners
event_manager.events = {}

-- Register an event listener
function event_manager:on(eventName, listener)
    if not self.events[eventName] then
        self.events[eventName] = {}
    end
    table.insert(self.events[eventName], listener)
end

-- Trigger an event
function event_manager:trigger(eventName, ...)
    local listeners = self.events[eventName]
    if listeners then
        for _, listener in ipairs(listeners) do
            listener(...) -- Call listener with arguments
        end
    end
end

-- Remove all listeners for an event
function event_manager:clear(eventName)
    self.events[eventName] = nil
end

return event_manager