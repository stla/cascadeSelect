var path = require("path");

module.exports = {
  entry: path.join(__dirname, "srcjs", "cascadeSelect.jsx"),
  output: {
    path: path.join(__dirname, "inst/www/cS"),
    filename: "cascadeSelect.js"
  },
  module: {
    rules: [
      {
        test: /\.jsx?$/,
        loader: "babel-loader",
        options: {
          presets: ["@babel/preset-env", "@babel/preset-react"]
        }
      },
      // For CSS so that import "path/style.css"; works
      {
        test: /\.css$/,
        use: ["style-loader", "css-loader"]
      },
      {
        test: /\.(woff(2)?|ttf|eot|svg)(\?v=\d+\.\d+\.\d+)?$/,
        use: [
          {
            loader: "file-loader",
            options: {
              name: "[name].[ext]",
              outputPath: "."
            }
          }
        ]
      },
      {
        test: /\.(png|jpe?g|gif)$/i,
        use: [
          {
            loader: "file-loader"
          }
        ]
      }
    ]
  },
  externals: {
    react: "window.React",
    "react-dom": "window.ReactDOM",
    reactR: "window.reactR"
  },
  stats: {
    colors: true
  },
  devtool: "source-map"
};
