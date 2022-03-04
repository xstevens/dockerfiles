const btoa = (text) => {
    return Buffer.from(text, 'binary').toString('base64');
};
const atob = (base64) => {
    return Buffer.from(base64, 'base64').toString('binary');
};
