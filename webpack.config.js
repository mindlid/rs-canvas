// @ts-check
/** @typedef { import('webpack').Configuration } Configuration*/

const path = require('path')
const HtmlWebpackPlugin = require('html-webpack-plugin')

/** @returns { Configuration } */
module.exports = (env, argv) => {
    const mode = argv.mode
    const isDevelopment = mode === "development"
    return {
        target: 'web',
        mode: isDevelopment ? 'development' : 'production',
        entry: './src/index.res.js',
        devtool: 'inline-source-map',
        devServer: {
            hot: true,
            static: './dist',
        },
        resolve: {
            extensions: ['.tsx', '.ts', '.js'],
        },
        plugins: [
            new HtmlWebpackPlugin({
                template: "src/index.html",
            }),
        ],
        output: {
            filename: '[name].bundle.js',
            path: path.resolve(__dirname, 'dist'),
            clean: true
        },
        module: {
            rules: [
                {
                    test: /\.bs.js/,
                    exclude: /node_modules/,
                    type: 'javascript/auto'
                },
                {
                    test: /\.css$/i,
                    use: ['style-loader', 'css-loader'],
                },
                {
                    test: /\.(png|svg|jpg|jpeg|gif)$/i,
                    type: 'asset/resource',
                },
                {
                    test: /\.(woff|woff2|eot|ttf|otf)$/i,
                    type: 'asset/resource',
                }
            ],
        }
    }
}