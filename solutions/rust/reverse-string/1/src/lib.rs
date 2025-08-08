use unicode_segmentation::UnicodeSegmentation;

pub fn reverse(input: &str) -> String {
    // Easy solution
    // input
    //     .chars()
    //     .fold(String::new(), |a, b| b.to_string() + &*a)

    // Bonus
    input
        .graphemes(true)
        .fold(String::new(), |a, b| b.to_string() + &*a)
}
