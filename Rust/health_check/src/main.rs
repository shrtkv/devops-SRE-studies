extern crate reqwest;
use reqwest::blocking::Client;
use std::env;

fn main() {
    let args: Vec<String> = env::args().collect();

    if args.len() < 2 {
        eprintln!("Usage: {} <URL> [-s|--silent]", args[0]);
        return;
    }

    let url = &args[1];
    let silent = args.iter().any(|arg| arg == "-s" || arg == "--silent");

    match Client::new().get(url).send() {
        Ok(response) => {
            if response.status().is_success() {
                if !silent {
                    println!("Health check OK");
                }
            } else {
                println!("Health check failed");
            }
        }
        Err(_) => {
            println!("Health check failed");
        }
    }
}

