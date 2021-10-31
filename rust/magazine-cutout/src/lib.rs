// This stub file contains items which aren't used yet; feel free to remove this module attribute
// to enable stricter warnings.
#![allow(unused)]

use std::collections::{hash_map::Entry, HashMap};

fn count_words<'a>(text: &[&'a str]) -> HashMap<&'a str, usize> {
    let mut ret = HashMap::new();
    text.iter()
        .for_each(|&w| *ret.entry(w).or_insert(0usize) += 1);
    ret
}

pub fn can_construct_note(magazine: &[&str], note: &[&str]) -> bool {
    let maga_words = count_words(magazine);
    count_words(note)
        .iter()
        .all(|(w, c)| maga_words.get(w).unwrap_or(&0) >= c)
}
