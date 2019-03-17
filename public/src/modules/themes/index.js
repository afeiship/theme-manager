import { $api, $store, $app, $config } from '#';

@mixin(['param'])
export default class extends React.Component {
  render() {
    console.log('themes index loaded', this.params);
    return (
      <div>
        Themes Index View
      </div>
    );
  }
}
