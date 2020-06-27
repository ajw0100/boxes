const micromatch = require('micromatch');

module.exports = {
  '**/*.{js,jsx,ts,tsx}': [`eslint --fix`],
  '**/*.md': (files) => {
    const match = micromatch.not(files, [`${__dirname}/CHANGELOG.md`, `${__dirname}/LICENSE.md`]);
    if (match.length) {
      return [`markdownlint --fix ${match.join(' ')}`, `vale ${match.join(' ')}`];
    } else {
      return [];
    }
  }
};
