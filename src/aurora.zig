const std = @import("std");
const ComptimeAurora = @import("api/Comptime.zig");
const RuntimeAurora = @import("api/Runtime.zig");
pub const HexColors = @import("colors.zig");

pub fn initComptime() ComptimeAurora {
    return .{};
}

const Config = struct {
    allocator: std.mem.Allocator,
    detect_no_color: bool = true,
};

pub fn initRuntime(config: Config) RuntimeAurora {
    return .{
        .open = std.ArrayList(u8).init(config.allocator),
        .close = std.ArrayList(u8).init(config.allocator),
        .allocator = config.allocator,
        .no_color = if (!config.detect_no_color) false else std.process.hasEnvVarConstant("NO_COLOR"),
    };
}
