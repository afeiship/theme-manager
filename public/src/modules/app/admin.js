import OptionsIndex from '@/modules/options/index';
import ThemesIndex from '@/modules/themes/index';
import { Menu, Layout, Row, Col, Spin } from 'antd';
import { Route, Link } from 'react-router-dom';

const { Content, Sider } = Layout;

export default class extends React.Component {
  constructor(props) {
    super(props);
    const { location } = props;
    this.state = {
      collapsed: false,
      activeRoute: location.pathname
    };
  }

  _onMenuClick = (e) => {
    const { history } = this.props;
    this.setState({ activeRoute: e.key }, () => {
      history.push(e.key);
    });
  };

  render() {
    return (
      <Layout className="main-view">
        <Sider>
          <div className="p10 logo mb10">
            <h1 className="c-f">ThemeManager</h1>
            <h3 className="c-e">后台管理</h3>
          </div>
          <Menu theme="dark" onClick={this._onMenuClick}>
            <Menu.Item key="/modules/options/index">
              <span className="nav-text">系统设置</span>
            </Menu.Item>
            <Menu.Item key="/modules/themes/index">
              <span className="nav-text">主题管理</span>
            </Menu.Item>
          </Menu>
        </Sider>
        <Content>
          <header className="tr bg-f">
            <span className="mr10">Hello Admin</span>
            <a href="#">Logout</a>
          </header>
          <div style={{ margin: '24px 16px 0' }}>
            <Route path={`/modules/options/index`} component={OptionsIndex} />
            <Route path={`/modules/themes/index`} component={ThemesIndex} />
          </div>
          <footer style={{ textAlign: 'center' }}>Admin @Power by Fei.</footer>
        </Content>
      </Layout>
    );
  }
}
