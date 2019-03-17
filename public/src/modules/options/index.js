import { $api, $store, $app, $config } from '#';

@mixin(['param'])
export default class extends React.Component {
  componentDidMount() {
    console.log('did');
  }

  render() {
    console.log('orders index loaded', this.params);
    return (
      <div>
        Orders Index View
      </div>
    );
  }
}
