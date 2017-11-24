/***
 * Excerpted from "Pragmatic Guide to Sass 3",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material,
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose.
 * Visit http://www.pragmaticprogrammer.com/titles/pg_sass3 for more book information.
***/
var BroccoliEyeglass = require('broccoli-eyeglass');

var options = {
  cssDir: "css"
}
var outputTree = new BroccoliEyeglass(["src"], options);

module.exports = outputTree;
