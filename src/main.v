import os
import cli
import dicevvare

fn execute(cmd cli.Command) ! {
    die := dicevvare.Die{
		eyes: u32(cmd.flags.get_int('eyes')!)
	}
    die.init()

	for word in 0 .. cmd.flags.get_int('words')! {
		mut word_index := ''
		for roll in 0 .. cmd.flags.get_int('rolls')! {
			word_index += die.roll().str()
		}
		println(word_index + ' ')
	}
}

fn main() {
    mut app := cli.Command{
		name: 'Dicevvare'
		description: 'Simple passphrase generator based on the original Diceware word list'
		execute: execute
		flags: [
	        cli.Flag{flag: cli.FlagType.int, name: 'rolls', abbrev: 'r', description: 'Number of dice thrown each time', default_value: ['5']}
	        cli.Flag{flag: cli.FlagType.int, name: 'eyes', abbrev: 'e', description: 'Number of eyes each die has', default_value: ['6']}
	        cli.Flag{flag: cli.FlagType.int, name: 'words', abbrev: 'w', description: 'Number of words the dice will be rolled for', default_value: ['5']}
		]
		posix_mode: true
    }

    app.setup()
    app.parse(os.args)
}
