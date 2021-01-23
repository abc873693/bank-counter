# Bank Counter

使用 Flutter 建置的模擬抽號碼牌 App

[Demo Site](https://abc873693.github.io/bank-counter/#/)

## 支援平台
 - [x] Android
 - [x] iOS
 - [x] Web
 - [x] Windows
 - [x] Linux
 - [x] MacOS
## 環境設定
- Flutter 設定
    - Version `1.26.0-12.0.pre`
    - Dev Channel(為了可運行桌面及網頁平台)
## 如何開始
### 1. 至官網安裝 [Flutter](https://flutter.dev/docs/get-started/install) 以及對應平台所需的工具

選項：設定桌面版可 [參考](https://flutter.dev/desktop)

最簡單為Web平台設定，只需要安裝好 `Flutter SDK` 及 `Chrome`

### 2. 切換至Dev Channel

``` bash
$ flutter channel dev
```
### 3. 確認可使用的裝置

```bash
$ flutter devices                                                           
4 connected devices:

Pixel 5 (mobile) • {debice-id} • android-arm64  • Android 11 (API 30)
iPad (mobile) • {debice-id} • ios            • iOS 14.3
macOS (desktop)  • macos          • darwin-x64     • macOS 11.1 20C69 darwin-x64
Chrome (web)     • chrome         • web-javascript • Google Chrome 88.0.4324.96
```
### 4. 執行對應平台

Android

```bash
$ flutter run -d {debice-id}
```

iOS

```bash
$ flutter run -d {debice-id}
```

Web

```bash
$ flutter run -d chrome
```
MacOS

```bash
$ flutter run -d macos
```
Windows

```bash
$ flutter run -d windows
```
Linux

```bash
$ flutter run -d linux
```

## 如何修改行員成員設定

### 1. 至 `lib/pages/home_page.dart` 行數 `18` 此設定在 `HomePage` 對應的 `State` 的區域變數

```
18  final bankCounters = [
19    BankCounter(name: 'Amy'),
20    BankCounter(name: 'Bob'),
21    BankCounter(name: 'Cory'),
22    BankCounter(name: 'Dora'),
23  ];
```
### 2. 直接修改 `bankCounters` 的成員
```
18  final bankCounters = [
19    BankCounter(name: 'Amy'),
20    BankCounter(name: 'Bob'),
21    BankCounter(name: 'Cory'),
22    BankCounter(name: 'Dora'),
23    BankCounter(name: 'Elsa'),
24  ];
```