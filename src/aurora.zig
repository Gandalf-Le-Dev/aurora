const std = @import("std");
const Styles = @import("styles.zig");
const Utils = @import("utils.zig");
const Aurora = @This();

open: []const u8 = "",
close: []const u8 = "",
preset: bool = false,

/// Returns the formatted text.
pub inline fn fmt(self: *Aurora, comptime text: []const u8) []const u8 {
    defer self.removeAll();
    return self.open ++ text ++ self.close;
}

/// Print the formatted text to stdout.
pub inline fn printOut(self: *Aurora, comptime format: []const u8, args: anytype) !void {
    defer self.removeAll();
    try std.io.getStdOut().writer().print(self.fmt(format), args);
}

/// Print the formatted text to stderr.
pub inline fn printErr(self: *Aurora, comptime format: []const u8, args: anytype) !void {
    defer self.removeAll();
    try std.io.getStdErr().writer().print(self.fmt(format), args);
}

inline fn addStyle(self: *Aurora, comptime style_name: []const u8) *Aurora {
    const style = Utils.wrapStyle(@field(Styles, style_name));
    self.open = self.open ++ style[0];
    self.close = style[1] ++ self.close;
    return self;
}

inline fn removeAll(self: *Aurora) void {
    if (self.preset) return;
    self.open = "";
    self.close = "";
}

pub inline fn reset(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub inline fn bold(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub inline fn dim(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub inline fn italic(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub inline fn underline(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub inline fn blink(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub inline fn inverse(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub inline fn hidden(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub inline fn strikethrough(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub inline fn doubleUnderline(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub inline fn overline(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub inline fn black(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub inline fn red(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub inline fn green(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub inline fn yellow(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub inline fn blue(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub inline fn magenta(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub inline fn cyan(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub inline fn white(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub inline fn blackBright(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub inline fn gray(self: *Aurora) *Aurora {
    return blackBright(self);
}

pub inline fn grey(self: *Aurora) *Aurora {
    return blackBright(self);
}

pub inline fn redBright(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub inline fn greenBright(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub inline fn yellowBright(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub inline fn blueBright(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub inline fn magentaBright(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub inline fn cyanBright(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub inline fn whiteBright(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub inline fn bgBlack(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub inline fn bgRed(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub inline fn bgGreen(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub inline fn bgYellow(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub inline fn bgBlue(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub inline fn bgMagenta(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub inline fn bgCyan(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub inline fn bgWhite(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub inline fn bgBlackBright(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub inline fn bgGray(self: *Aurora) *Aurora {
    return bgBlackBright(self);
}

pub inline fn bgGrey(self: *Aurora) *Aurora {
    return bgBlackBright(self);
}

pub inline fn bgRedBright(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub inline fn bgGreenBright(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub inline fn bgYellowBright(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub inline fn bgBlueBright(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub inline fn bgMagentaBright(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub inline fn bgCyanBright(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

pub inline fn bgWhiteBright(self: *Aurora) *Aurora {
    return self.addStyle(@src().fn_name);
}

/// Set the foreground color to the rgb color values.
pub inline fn rgb(self: *Aurora, comptime r: u8, comptime g: u8, comptime b: u8) *Aurora {
    self.open = self.open ++ Utils.wrapAnsi16m(false, r, g, b);
    self.close = "\u{001B}[39m" ++ self.close;
    return self;
}

/// Set the background color to the rgb color values.
pub inline fn bgRgb(self: *Aurora, comptime r: u8, comptime g: u8, comptime b: u8) *Aurora {
    self.open = self.open ++ Utils.wrapAnsi16m(true, r, g, b);
    self.close = "\u{001B}[49m" ++ self.close;
    return self;
}

/// Set the foreground color to the hex color code.
///
/// NOTE:
/// - The `#` prefix is optional.
/// - Hex triplets are allowed. (e.g. `#FFAA00` is equivalent to `#FA0`)
///
pub inline fn hex(self: *Aurora, comptime hex_code: []const u8) *Aurora {
    const rgb_val = Utils.rgbFromHex(hex_code);
    return self.rgb(rgb_val[0], rgb_val[1], rgb_val[2]);
}

/// Set the background color to the hex color code.
///
/// NOTE:
/// - The `#` prefix is optional.
/// - Hex triplets are allowed. (e.g. `#FFAA00` is equivalent to `#FA0`)
///
pub inline fn bgHex(self: *Aurora, comptime hex_code: []const u8) *Aurora {
    const rgb_val = Utils.rgbFromHex(hex_code);
    return self.bgRgb(rgb_val[0], rgb_val[1], rgb_val[2]);
}

/// Create a new instance with the current styles as a preset.
pub inline fn createPreset(self: *Aurora) Aurora {
    defer self.removeAll();
    return .{
        .open = self.open,
        .close = self.close,
        .preset = true,
    };
}