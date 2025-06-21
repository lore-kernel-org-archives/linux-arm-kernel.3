Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49724C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Jun 2025 11:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ir11YpcbwxWD+w+nzz2s0FsuVrnNjiwPhxkmWuSazqw=; b=FXjp24u8r9TwK5Z1bEHF4JP9J2
	GNj+5qOPWZubrmLySoegWg6Qdq/UM8PUWm2swuGJ7TcAW/Zf191zu4syXpHeiNjYGgw44J6BGjqgH
	Ob8jF5iYRNn9yIj5dSUfZohI2bVeUvya1yTtxZIJ+07BQ3KVyvXgkaBbvLBwCCUBf6h72Um0LwIWJ
	AnGX+WNeoyH6kOdSzGYSsyobvG9wKl7EDC0YRM5winnP8EGf12UWAOejy2L/UWm6K5hdQ4qlKoZT/
	pZs0BK1IamUXNTTRjezCPsaIIsbv1aE//44sjkX+JUM/gyt5It0zNrYWcBs0D/nsXBKPBTgfksAyv
	QBXcKdFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSwbE-0000000HPFv-2Gmw;
	Sat, 21 Jun 2025 11:41:32 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSwYy-0000000HPAE-1OVL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Jun 2025 11:39:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-e1b5cab7be; t=1750505949;
 bh=ir11YpcbwxWD+w+nzz2s0FsuVrnNjiwPhxkmWuSazqw=;
 b=dSYTpBQmGRmwze8YHSaJlkEW3c6M1mKz7foeTNWjnKodkrE43+IuMlcJ6iB4LL7Ciu5kTzvWz
 ReU7xQKNsyPzBHhEzhKH+JIknt6CkT1TKfPE9cY7OcDP9gEWl1MNxjEfuuifshuavhgeG4WQRhx
 xJbU9IYMsLmi4NMJwx8ToZz+2OVKZX6aH/WB6SpDYhlJ8+oljINsU9yXrwjb4D/W7XaxU73I+ME
 +S153F9mPEwuUDvfAYa0ebHiIWk+9d2Kc/RTZ1cNx5xR/7m2JDJRxPOkS8s9nuIap3ONcGw9tnh
 TXwMA4XCgqmKW3ODH4+2UzoxKvc2+HwuhRi6dgOgqKDg==
X-Forward-Email-ID: 685699d9f0bccf4584158851
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.0.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: Fix pinctrl node names for RK3528
Date: Sat, 21 Jun 2025 11:38:57 +0000
Message-ID: <20250621113859.2146400-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250621_043912_704207_E2B776AF 
X-CRM114-Status: UNSURE (   8.12  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Following warnings can be observed with CHECK_DTBS=y for the RK3528:

  rk3528-pinctrl.dtsi:101.36-105.5: Warning (node_name_chars_strict):
    /pinctrl/fephy/fephym0-led_dpx: Character '_' not recommended in node name
  rk3528-pinctrl.dtsi:108.38-112.5: Warning (node_name_chars_strict):
    /pinctrl/fephy/fephym0-led_link: Character '_' not recommended in node name
  rk3528-pinctrl.dtsi:115.36-119.5: Warning (node_name_chars_strict):
    /pinctrl/fephy/fephym0-led_spd: Character '_' not recommended in node name
  rk3528-pinctrl.dtsi:122.36-126.5: Warning (node_name_chars_strict):
   /pinctrl/fephy/fephym1-led_dpx: Character '_' not recommended in node name
  rk3528-pinctrl.dtsi:129.38-133.5: Warning (node_name_chars_strict):
    /pinctrl/fephy/fephym1-led_link: Character '_' not recommended in node name
  rk3528-pinctrl.dtsi:136.36-140.5: Warning (node_name_chars_strict):
    /pinctrl/fephy/fephym1-led_spd: Character '_' not recommended in node name
  rk3528-pinctrl.dtsi:782.32-790.5: Warning (node_name_chars_strict):
    /pinctrl/rgmii/rgmii-rx_bus2: Character '_' not recommended in node name
  rk3528-pinctrl.dtsi:793.32-801.5: Warning (node_name_chars_strict):
    /pinctrl/rgmii/rgmii-tx_bus2: Character '_' not recommended in node name
  rk3528-pinctrl.dtsi:804.36-810.5: Warning (node_name_chars_strict):
    /pinctrl/rgmii/rgmii-rgmii_clk: Character '_' not recommended in node name
  rk3528-pinctrl.dtsi:813.36-823.5: Warning (node_name_chars_strict):
    /pinctrl/rgmii/rgmii-rgmii_bus: Character '_' not recommended in node name

Rename the affected nodes to fix these warnings.

Fixes: a31fad19ae39 ("arm64: dts: rockchip: Add pinctrl and gpio nodes for RK3528")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 .../boot/dts/rockchip/rk3528-pinctrl.dtsi     | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528-pinctrl.dtsi b/arch/arm64/boot/dts/rockchip/rk3528-pinctrl.dtsi
index ea051362fb26..59b75c91bbb7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528-pinctrl.dtsi
@@ -98,42 +98,42 @@ eth_pins: eth-pins {
 
 	fephy {
 		/omit-if-no-ref/
-		fephym0_led_dpx: fephym0-led_dpx {
+		fephym0_led_dpx: fephym0-led-dpx {
 			rockchip,pins =
 				/* fephy_led_dpx_m0 */
 				<4 RK_PB5 2 &pcfg_pull_none>;
 		};
 
 		/omit-if-no-ref/
-		fephym0_led_link: fephym0-led_link {
+		fephym0_led_link: fephym0-led-link {
 			rockchip,pins =
 				/* fephy_led_link_m0 */
 				<4 RK_PC0 2 &pcfg_pull_none>;
 		};
 
 		/omit-if-no-ref/
-		fephym0_led_spd: fephym0-led_spd {
+		fephym0_led_spd: fephym0-led-spd {
 			rockchip,pins =
 				/* fephy_led_spd_m0 */
 				<4 RK_PB7 2 &pcfg_pull_none>;
 		};
 
 		/omit-if-no-ref/
-		fephym1_led_dpx: fephym1-led_dpx {
+		fephym1_led_dpx: fephym1-led-dpx {
 			rockchip,pins =
 				/* fephy_led_dpx_m1 */
 				<2 RK_PA4 5 &pcfg_pull_none>;
 		};
 
 		/omit-if-no-ref/
-		fephym1_led_link: fephym1-led_link {
+		fephym1_led_link: fephym1-led-link {
 			rockchip,pins =
 				/* fephy_led_link_m1 */
 				<2 RK_PA6 5 &pcfg_pull_none>;
 		};
 
 		/omit-if-no-ref/
-		fephym1_led_spd: fephym1-led_spd {
+		fephym1_led_spd: fephym1-led-spd {
 			rockchip,pins =
 				/* fephy_led_spd_m1 */
 				<2 RK_PA5 5 &pcfg_pull_none>;
@@ -779,7 +779,7 @@ rgmii_miim: rgmii-miim {
 		};
 
 		/omit-if-no-ref/
-		rgmii_rx_bus2: rgmii-rx_bus2 {
+		rgmii_rx_bus2: rgmii-rx-bus2 {
 			rockchip,pins =
 				/* rgmii_rxd0 */
 				<3 RK_PA3 2 &pcfg_pull_none>,
@@ -790,7 +790,7 @@ rgmii_rx_bus2: rgmii-rx_bus2 {
 		};
 
 		/omit-if-no-ref/
-		rgmii_tx_bus2: rgmii-tx_bus2 {
+		rgmii_tx_bus2: rgmii-tx-bus2 {
 			rockchip,pins =
 				/* rgmii_txd0 */
 				<3 RK_PA1 2 &pcfg_pull_none_drv_level_2>,
@@ -801,7 +801,7 @@ rgmii_tx_bus2: rgmii-tx_bus2 {
 		};
 
 		/omit-if-no-ref/
-		rgmii_rgmii_clk: rgmii-rgmii_clk {
+		rgmii_rgmii_clk: rgmii-rgmii-clk {
 			rockchip,pins =
 				/* rgmii_rxclk */
 				<3 RK_PA5 2 &pcfg_pull_none>,
@@ -810,7 +810,7 @@ rgmii_rgmii_clk: rgmii-rgmii_clk {
 		};
 
 		/omit-if-no-ref/
-		rgmii_rgmii_bus: rgmii-rgmii_bus {
+		rgmii_rgmii_bus: rgmii-rgmii-bus {
 			rockchip,pins =
 				/* rgmii_rxd2 */
 				<3 RK_PA7 2 &pcfg_pull_none>,
-- 
2.49.0


