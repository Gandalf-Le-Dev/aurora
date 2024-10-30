const std = @import("std");
const Aurora = @import("aurora");

pub fn main() !void {
    comptime var c: Aurora = Aurora{};
    comptime var header = c.underline().bold().italic().blink().createPreset();

    std.debug.print("\t\t  {s}{s}{s}{s}{s}{s}\n\n", .{
        header.green().fmt("A"),
        header.blue().fmt("U"),
        header.cyan().fmt("R"),
        header.magenta().fmt("O"),
        header.red().fmt("R"),
        header.green().fmt("A"),
    });
    std.debug.print("{s} {s} {s} {s} {s} {s}\n{s} {s} {s} {s} {s} {s} {s} {s}\n{s} {s} {s} {s} {s} {s}\n", .{
        c.bold().fmt("bold"),
        c.dim().fmt("dim"),
        c.italic().fmt("italic"),
        c.underline().fmt("underline"),
        c.inverse().fmt("inverse"),
        c.strikethrough().fmt("strikethrough"),
        c.red().fmt("red"),
        c.green().fmt("green"),
        c.yellow().fmt("yellow"),
        c.blue().fmt("blue"),
        c.magenta().fmt("magenta"),
        c.cyan().fmt("cyan"),
        c.white().fmt("white"),
        c.gray().fmt("gray"),
        c.black().bgRed().fmt("bgRed"),
        c.black().bgGreen().fmt("bgGreen"),
        c.black().bgYellow().fmt("bgYellow"),
        c.black().bgBlue().fmt("bgBlue"),
        c.black().bgMagenta().fmt("bgMagenta"),
        c.black().bgCyan().fmt("bgCyan"),
    });
}
