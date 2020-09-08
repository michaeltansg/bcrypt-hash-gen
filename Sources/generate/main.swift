import ArgumentParser
import Crypto

let uuid = UUID().uuidString.lowercased()
print(uuid)

struct Generate: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "A Swift command-line tool to create BCrypt passwords and UUID generator.",
        subcommands: [Password.self])

    init() { }
}

struct Password: ParsableCommand {

    public static let configuration = CommandConfiguration(abstract: "Generate a hash from a provided password")

    @Argument(help: "The password to use")
    private var password: String

    func run() throws {
        let command = readLine()
        guard let hashedPassword = try? BCrypt.hash(password) else {
            fatalError("Failed to create password hash!")
        }
        print(hashedPassword)
        let confirm = try BCrypt.verify(password, created: hashedPassword)
        print(confirm)
    }
}

struct Uuid: ParsableCommand {

    public static let configuration = CommandConfiguration(abstract: "Generate a hash from a provided password")

    @Argument(help: "The password to use")
    private var password: String

    func run() throws {
        guard let hashedPassword = try? BCrypt.hash(password) else {
            fatalError("Failed to create password hash!")
        }
        print(hashedPassword)
        let confirm = try BCrypt.verify(password, created: hashedPassword)
        print(confirm)
    }
}

Generate.main()
