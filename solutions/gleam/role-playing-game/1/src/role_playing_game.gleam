import gleam/option.{type Option, None, Some}
import gleam/int

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  option.unwrap(player.name, "Mighty Magician")
}

pub fn revive(player: Player) -> Option(Player) {
  case player {
    Player(health: 0, level: level, ..) ->
      Some(
        Player(
          ..player,
          health: 100,
          mana: case level {
            x if x >= 10 -> Some(100)
            _ -> None
          },
        ),
      )
    _ -> None
  }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  case player {
    Player(mana: Some(mana), ..) if cost < mana -> #(
      Player(..player, mana: Some(mana - cost)),
      cost * 2,
    )
    Player(mana: None, ..) -> #(
      Player(..player, health: int.max(player.health - cost, 0)),
      0,
    )
    _ -> #(player, 0)
  }
}
