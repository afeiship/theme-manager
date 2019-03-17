import { $api, $store, $app, $config } from '#';

@mixin(['param'])
export default class extends React.Component {
  render() {
    console.log('options index loaded', this.params);
    return (
      <div>
        Options Index View
      </div>
    );
  }
}
