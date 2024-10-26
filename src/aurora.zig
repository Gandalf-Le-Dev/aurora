const std = @import("std");
const Styles = @import("styles.zig");
const Utils = @import("utils.zig");
const Aurora = @This();

open: std.ArrayList(u8),
close: std.ArrayList(u8),
preset: bool = false,
allocator: std.mem.Allocator,
no_color: bool,

pub const Config = struct {
    allocator: std.mem.Allocator,
    detect_no_color: bool = true,
};

pub fn init(config: Config) Aurora {
    return .{
        .open = std.ArrayList(u8).init(config.allocator),
        .close = std.ArrayList(u8).init(config.allocator),
        .allocator = config.allocator,
        .no_color = if (!config.detect_no_color) false else std.process.hasEnvVarConstant("NO_COLOR"),
    };
}

pub fn deinit(self: *Aurora) void {
    self.open.deinit();
    self.close.deinit();
}

/// Returns the formatted text.
pub fn fmt(self: *Aurora, comptime format: []const u8, args: anytype) []u8 {
    defer self.removeAll();
    const formatted = std.fmt.allocPrint(self.allocator, format, args) catch unreachable;
    return if (self.no_color) formatted else std.mem.concat(self.allocator, u8, &.{ self.open.items, formatted, self.close.items }) catch unreachable;
}

/// Print the formatted text to stdout.
pub fn printOut(self: *Aurora, comptime format: []const u8, args: anytype) void {
    defer self.removeAll();
    const writer = std.io.getStdOut().writer();
    try writer.writeAll(self.open.items);
    try writer.print(format, args);
    try writer.writeAll(self.close.items);
}

/// Print the formatted text to stderr.
pub fn printErr(self: *Aurora, comptime format: []const u8, args: anytype) void {
    defer self.removeAll();
    const writer = std.io.getStdErr().writer();
    try writer.writeAll(self.open.items);
    try writer.print(format, args);
    try writer.writeAll(self.close.items);
}

fn addStyle(self: *Aurora, comptime style_name: []const u8) *Aurora {
    if (!self.no_color) {
        const style = Utils.wrapStyle(@field(Styles, style_name));
        self.open.appendSlice(style[0]) catch {};
        self.close.appendSlice(style[1]) catch {};
    }
    return self;
}

fn removeAll(self: *Aurora) void {
    if (self.preset) return;
    self.open.clearAndFree();
    self.close.clearAndFree();
}

pub fn reset(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub fn bold(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub fn dim(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub fn italic(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub fn underline(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub fn blink(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub fn inverse(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub fn hidden(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub fn strikethrough(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub fn doubleUnderline(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub fn overline(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub fn black(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub fn red(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub fn green(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub fn yellow(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub fn blue(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub fn magenta(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub fn cyan(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub fn white(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub fn blackBright(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub fn gray(self: *Aurora) *Aurora {
    return blackBright(self);
}

pub fn grey(self: *Aurora) *Aurora {
    return blackBright(self);
}

pub fn redBright(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub fn greenBright(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub fn yellowBright(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub fn blueBright(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub fn magentaBright(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub fn cyanBright(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub fn whiteBright(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub fn bgBlack(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub fn bgRed(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub fn bgGreen(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub fn bgYellow(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub fn bgBlue(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub fn bgMagenta(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub fn bgCyan(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub fn bgWhite(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub fn bgBlackBright(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub fn bgGray(self: *Aurora) *Aurora {
    return bgBlackBright(self);
}

pub fn bgGrey(self: *Aurora) *Aurora {
    return bgBlackBright(self);
}

pub fn bgRedBright(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub fn bgGreenBright(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub fn bgYellowBright(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub fn bgBlueBright(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub fn bgMagentaBright(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub fn bgCyanBright(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub fn bgWhiteBright(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

/// Set the foreground color to the rgb color values.
pub fn rgb(self: *Aurora, comptime r: u8, comptime g: u8, comptime b: u8) *Aurora {
    if (!self.no_color) {
        self.open.appendSlice(Utils.wrapAnsi16m(false, r, g, b)) catch {};
        self.close.appendSlice("\u{001B}[39m") catch {};
    }
    return self;
}

/// Set the background color to the rgb color values.
pub fn bgRgb(self: *Aurora, comptime r: u8, comptime g: u8, comptime b: u8) *Aurora {
    if (!self.no_color) {
        self.open.appendSlice(Utils.wrapAnsi16m(true, r, g, b)) catch {};
        self.close.appendSlice("\u{001B}[49m") catch {};
    }
    return self;
}

/// Set the foreground color to the hex color code.
///
/// NOTE:
/// - The `#` prefix is optional.
/// - Hex triplets are allowed. (e.g. `#FFAA00` is equivalent to `#FA0`)
///
pub fn hex(self: *Aurora, comptime hex_code: []const u8) *Aurora {
    if (!self.no_color) {
        const rgb_val = Utils.rgbFromHex(hex_code);
        return self.rgb(rgb_val[0], rgb_val[1], rgb_val[2]);
    }
    return self;
}

/// Set the background color to the hex color code.
///
/// NOTE:
/// - The `#` prefix is optional.
/// - Hex triplets are allowed. (e.g. `#FFAA00` is equivalent to `#FA0`)
///
pub fn bgHex(self: *Aurora, comptime hex_code: []const u8) *Aurora {
    if (!self.no_color) {
        const rgb_val = Utils.rgbFromHex(hex_code);
        return self.bgRgb(rgb_val[0], rgb_val[1], rgb_val[2]);
    }
    return self;
}

/// Create a new instance with the current styles as a preset.
pub inline fn createPreset(self: *Aurora) Aurora {
    defer self.removeAll();
    return .{
        .open = self.open.clone() catch unreachable,
        .close = self.close.clone() catch unreachable,
        .preset = true,
        .allocator = self.allocator,
        .no_color = self.no_color,
    };
}
