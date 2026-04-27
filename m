Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE010FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 21:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kH7S8MX+hh3ZiR6jfBLRCMLBXRl/5taz8Ayrt3e6zF8=; b=MZOuCWm6zj09Ce+8c38eLTnioA
	n5bzV6xgBbUsGvd+qiDvEeIsN5hp1GVsDU1LXIe30xNMid7JXYbKpbWcdzEhBXQxRLk3vLhdoGFrU
	hmJ/dcIKo6NmC0vHUtsMVDrmVIsz4jDdksoDZK7HSFoFeoTTnXvT5JUXFdSOZcFgeCBoUagQ5mwZ2
	0hI641/BdSzpYMn0URmoW7AScbWUfuFUQVCPaLXa37rmw9D46EDnkHFCnSCb0KIzhY7rxFA6JzngV
	MJVXrdGp3PESUx1x5OrtjxGIIeXU1sQIlFgzBq7cotcRVRvVQoqZNKwMqXknTYY2uook6sgtsCg8+
	L4HAB8iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHTxl-00000000DQs-3oW9;
	Mon, 27 Apr 2026 21:57:58 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHTxd-00000000DFN-0L0C;
	Mon, 27 Apr 2026 21:57:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777327066;
	bh=MC0bUHVv5ZVZVx7EZ1v5fdSvuZ1LqvmNHWG9rWQC43s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pO+vN6kb/NxkW8aNnADk67rDd+GjSA51BUlR97Dz3oqVwGr+aw08Zfyl1I6SS+HBp
	 kOER/13HDgvJPnqDEoy8OqaNAWcv5mboKupHD4P6N/XQDsxtRCXYwdtcxQVGQwsxT8
	 vjZ1UlQa9dJXB6xqDJ+m8ITvPtnrpS9zcw3qAEg6b68SijI+3B3feavaGrnsNysqei
	 xg50FAWlBE9zW1AQgQWPt/XnmyL+K60jH4nmJsCBV4oOLmnEeXShTMHV/9GJZlD9Oo
	 cq+8h04rLZ375bYXFjCxYXqjMWyq6sfg4FM7er7kmBtkFDdOHT2oL5MlEh1xJtXvmg
	 LkigC8Lrod+xg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E81E417E151B;
	Mon, 27 Apr 2026 23:57:45 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 28 Apr 2026 00:57:22 +0300
Subject: [PATCH v2 04/13] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3588 boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-dts-rk-frl-enable-gpios-v2-4-924df9db884a@collabora.com>
References: <20260428-dts-rk-frl-enable-gpios-v2-0-924df9db884a@collabora.com>
In-Reply-To: <20260428-dts-rk-frl-enable-gpios-v2-0-924df9db884a@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_145749_520984_4CF57C4E 
X-CRM114-Status: GOOD (  11.01  )
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

The following RK3588 boards expose one or two GPIO pins to control the
voltage bias on the HDMI0 and/or HDMI1 data lines:

- rk3588-armsom-sige7
- rk3588-armsom-w3
- rk3588-coolpi-cm5-evb
- rk3588-coolpi-cm5-genbook
- rk3588-evb1-v10
- rk3588-evb2-v10
- rk3588-firefly-itx-3588j
- rk3588-friendlyelec-cm3588-nas
- rk3588-h96-max-v58
- rk3588-jaguar
- rk3588-mnt-reform2
- rk3588-nanopc-t6
- rk3588-orangepi-5-max
- rk3588-orangepi-5-plus
- rk3588-orangepi-5-ultra
- rk3588-roc-rt
- rk3588-rock-5-itx
- rk3588-rock-5b-5bp-5t
- rk3588-tiger

The pins must be asserted when operating in HDMI 2.1 FRL mode and
deasserted for HDMI 1.4/2.0 TMDS mode.

Wire up the hdmi0 and/or hdmi1 nodes to their dedicated GPIO pin(s) via
frl-enable-gpios to allow adjusting the bias when transitioning between
TMDS and FRL modes.

While at it, also ensure that pinctrl-names is present and ordered
alphabetically within the hdmi nodes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts   | 10 ++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dts      | 18 ++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts | 18 +++++++++++++++++-
 .../boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dts    | 11 ++++++++++-
 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts       | 18 ++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dts       | 10 ++++++++++
 .../boot/dts/rockchip/rk3588-firefly-itx-3588j.dts     | 10 ++++++++++
 .../dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts    | 18 ++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts    | 10 ++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts         | 10 +++++++++-
 arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dts    | 10 ++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi     | 18 ++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts | 18 ++++++++++++++++--
 .../arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts | 18 ++++++++++++++++++
 .../boot/dts/rockchip/rk3588-orangepi-5-ultra.dts      | 11 +++++++++--
 arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dts         | 18 ++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts     | 10 +++++++++-
 .../arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi | 18 +++++++++++++++++-
 arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts   |  3 ++-
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi         | 11 +++++++++--
 20 files changed, 256 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts b/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts
index 39197ee19837..c4854c0f22e2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts
@@ -177,6 +177,10 @@ &gpu {
 };
 
 &hdmi0 {
+	frl-enable-gpios = <&gpio4 RK_PB1 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
+		     &hdmim0_tx0_scl &hdmim0_tx0_sda &hdmi0_tx_on_h>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -347,6 +351,12 @@ &pd_gpu {
 };
 
 &pinctrl {
+	hdmi {
+		hdmi0_tx_on_h: hdmi0-tx-on-h {
+			rockchip,pins = <4 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hym8563 {
 		hym8563_int: hym8563-int {
 			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dts b/arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dts
index 6ad2759ddcca..3bbafdd89ede 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dts
@@ -162,6 +162,10 @@ &combphy2_psu {
 };
 
 &hdmi0 {
+	frl-enable-gpios = <&gpio4 RK_PB1 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
+		     &hdmim0_tx0_scl &hdmim0_tx0_sda &hdmi0_tx_on_h>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -182,6 +186,10 @@ &hdmi0_sound {
 };
 
 &hdmi1 {
+	frl-enable-gpios = <&gpio4 RK_PA1 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmim2_tx1_cec &hdmim0_tx1_hpd
+		     &hdmim1_tx1_scl &hdmim1_tx1_sda &hdmi1_tx_on_h>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -330,6 +338,16 @@ &pcie3x4 {
 };
 
 &pinctrl {
+	hdmi {
+		hdmi0_tx_on_h: hdmi0-tx-on-h {
+			rockchip,pins = <4 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		hdmi1_tx_on_h: hdmi1-tx-on-h {
+			rockchip,pins = <4 RK_PA1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hym8563 {
 		hym8563_int: hym8563-int {
 			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts
index 3d5c8b753208..66e3c20d7b4f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts
@@ -125,6 +125,10 @@ vcc5v0_usb30_otg: regulator-vcc5v0-usb30-otg {
 };
 
 &hdmi0 {
+	frl-enable-gpios = <&gpio4 RK_PB0 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
+		     &hdmim0_tx0_scl &hdmim0_tx0_sda &hdmi0_tx_on_h>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -145,8 +149,10 @@ hdmi0_out_con: endpoint {
 };
 
 &hdmi1 {
+	frl-enable-gpios = <&gpio4 RK_PB2 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmim2_tx1_cec &hdmim0_tx1_hpd &hdmim1_tx1_scl &hdmim1_tx1_sda
+		     &hdmi1_tx_on_h>;
 	pinctrl-names = "default";
-	pinctrl-0 = <&hdmim2_tx1_cec &hdmim0_tx1_hpd &hdmim1_tx1_scl &hdmim1_tx1_sda>;
 	status = "okay";
 };
 
@@ -211,6 +217,16 @@ &pcie3x4 {
 };
 
 &pinctrl {
+	hdmi {
+		hdmi0_tx_on_h: hdmi0-tx-on-h {
+			rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		hdmi1_tx_on_h: hdmi1-tx-on-h {
+			rockchip,pins = <4 RK_PB2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	lcd {
 		lcdpwr_en: lcdpwr-en {
 			rockchip,pins = <1 RK_PC4 RK_FUNC_GPIO &pcfg_pull_down>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dts b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dts
index 738637ecaf55..e05e6b2d5136 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dts
@@ -184,7 +184,10 @@ edp_out_panel: endpoint {
 
 /* HDMI CEC is not used */
 &hdmi0 {
-	pinctrl-0 = <&hdmim0_tx0_hpd &hdmim0_tx0_scl &hdmim0_tx0_sda>;
+	frl-enable-gpios = <&gpio4 RK_PB0 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmim0_tx0_hpd &hdmim0_tx0_scl &hdmim0_tx0_sda
+		     &hdmi0_tx_on_h>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -277,6 +280,12 @@ &pcie3x4 {
 };
 
 &pinctrl {
+	hdmi {
+		hdmi0_tx_on_h: hdmi0-tx-on-h {
+			rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	lcd {
 		lcdpwr_en: lcdpwr-en {
 			rockchip,pins = <0 RK_PC4 RK_FUNC_GPIO &pcfg_pull_down>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
index 09bc7b68dcc0..977849bfd509 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
@@ -360,6 +360,10 @@ &gpu {
 };
 
 &hdmi0 {
+	frl-enable-gpios = <&gpio4 RK_PB1 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
+		     &hdmim0_tx0_scl &hdmim0_tx0_sda &hdmi0_tx_on_h>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -376,6 +380,10 @@ hdmi0_out_con: endpoint {
 };
 
 &hdmi1 {
+	frl-enable-gpios = <&gpio4 RK_PB2 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmim2_tx1_cec &hdmim0_tx1_hpd
+		     &hdmim1_tx1_scl &hdmim1_tx1_sda &hdmi1_tx_on_h>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -612,6 +620,16 @@ rtl8211f_rst: rtl8211f-rst {
 
 	};
 
+	hdmi {
+		hdmi0_tx_on_h: hdmi0-tx-on-h {
+			rockchip,pins = <4 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		hdmi1_tx_on_h: hdmi1-tx-on-h {
+			rockchip,pins = <4 RK_PB2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hdmirx {
 		hdmirx_hpd: hdmirx-5v-detection {
 			rockchip,pins = <2 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dts
index 60ba6ac55b23..b7d2cb456148 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dts
@@ -143,6 +143,10 @@ &gpu {
 };
 
 &hdmi0 {
+	frl-enable-gpios = <&gpio3 RK_PC5 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
+		     &hdmim0_tx0_scl &hdmim0_tx0_sda &hdmi0_tx_on_h>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -183,6 +187,12 @@ &pd_gpu {
 };
 
 &pinctrl {
+	hdmi {
+		hdmi0_tx_on_h: hdmi0-tx-on-h {
+			rockchip,pins = <3 RK_PC5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hym8563 {
 		hym8563_int: hym8563-int {
 			rockchip,pins = <0 RK_PD4 RK_FUNC_GPIO &pcfg_pull_up>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dts b/arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dts
index e086114c7634..e43afb0c53fb 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dts
@@ -322,6 +322,10 @@ &gpu {
 };
 
 &hdmi0 {
+	frl-enable-gpios = <&gpio4 RK_PA0 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
+		     &hdmim0_tx0_scl &hdmim0_tx0_sda &hdmi0_tx_on_h>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -487,6 +491,12 @@ dp1_hpd: dp1-hpd {
 		};
 	};
 
+	hdmi {
+		hdmi0_tx_on_h: hdmi0-tx-on-h {
+			rockchip,pins = <4 RK_PA0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hym8563 {
 		hym8563_int: hym8563-int {
 			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_up>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts b/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts
index 10a7d3691a26..0dce96ca8c28 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts
@@ -331,6 +331,10 @@ &gpio4 {
 };
 
 &hdmi0 {
+	frl-enable-gpios = <&gpio4 RK_PB1 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
+		     &hdmim0_tx0_scl &hdmim0_tx0_sda &hdmi0_tx_on_h>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -347,6 +351,10 @@ hdmi0_out_con: endpoint {
 };
 
 &hdmi1 {
+	frl-enable-gpios = <&gpio4 RK_PB2 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmim2_tx1_cec &hdmim0_tx1_hpd
+		     &hdmim1_tx1_scl &hdmim1_tx1_sda &hdmi1_tx_on_h>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -520,6 +528,16 @@ key1_pin: key1-pin {
 		};
 	};
 
+	hdmi {
+		hdmi0_tx_on_h: hdmi0-tx-on-h {
+			rockchip,pins = <4 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		hdmi1_tx_on_h: hdmi1-tx-on-h {
+			rockchip,pins = <4 RK_PB2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hdmirx {
 		hdmirx_hpd: hdmirx-5v-detection {
 			rockchip,pins = <3 RK_PD4 RK_FUNC_GPIO &pcfg_pull_up>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts b/arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts
index 73d8ce4fde2b..7c2a1e6bcff9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts
@@ -210,6 +210,10 @@ &gpu {
 };
 
 &hdmi0 {
+	frl-enable-gpios = <&gpio4 RK_PB1 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
+		     &hdmim0_tx0_scl &hdmim0_tx0_sda &hdmi0_tx_on_h>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -339,6 +343,12 @@ &pd_gpu {
 };
 
 &pinctrl {
+	hdmi {
+		hdmi0_tx_on_h: hdmi0-tx-on-h {
+			rockchip,pins = <4 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hym8563 {
 		hym8563_int: hym8563-int {
 			rockchip,pins = <0 RK_PD3 RK_FUNC_GPIO &pcfg_pull_none>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
index 5f5d89a33a4a..05b524f682cf 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
@@ -278,8 +278,10 @@ &gpu {
 
 &hdmi0 {
 	/* No CEC on Jaguar */
+	frl-enable-gpios = <&gpio0 RK_PD3 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmim0_tx0_hpd &hdmim0_tx0_scl &hdmim0_tx0_sda
+		     &hdmi0_tx_on_h>;
 	pinctrl-names = "default";
-	pinctrl-0 = <&hdmim0_tx0_hpd &hdmim0_tx0_scl &hdmim0_tx0_sda>;
 	status = "okay";
 };
 
@@ -571,6 +573,12 @@ eth_reset: eth-reset {
 		};
 	};
 
+	hdmi {
+		hdmi0_tx_on_h: hdmi0-tx-on-h {
+			rockchip,pins = <0 RK_PD3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	leds {
 		led1_pin: led1-pin {
 			rockchip,pins = <1 RK_PD4 RK_FUNC_GPIO &pcfg_pull_none>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dts b/arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dts
index 78a4e896f665..36a5977d0795 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dts
@@ -148,6 +148,10 @@ &gpu {
 };
 
 &hdmi0 {
+	frl-enable-gpios = <&gpio4 RK_PA0 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
+		     &hdmim0_tx0_scl &hdmim0_tx0_sda &hdmi0_tx_on_h>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -205,6 +209,12 @@ dp1_hpd: dp1-hpd {
 		};
 	};
 
+	hdmi {
+		hdmi0_tx_on_h: hdmi0-tx-on-h {
+			rockchip,pins = <4 RK_PA0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	pcie2 {
 		pcie2_0_rst: pcie2-0-rst {
 			rockchip,pins = <3 RK_PD1 RK_FUNC_GPIO &pcfg_pull_none>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
index 84b6b53f016a..3b0903d0e3e2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
@@ -361,6 +361,10 @@ &gpu {
 };
 
 &hdmi0 {
+	frl-enable-gpios = <&gpio4 RK_PB1 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
+		     &hdmim0_tx0_scl &hdmim0_tx0_sda &hdmi0_tx_on_h>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -381,6 +385,10 @@ &hdmi0_sound {
 };
 
 &hdmi1 {
+	frl-enable-gpios = <&gpio4 RK_PB2 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmim2_tx1_cec &hdmim0_tx1_hpd
+		     &hdmim1_tx1_scl &hdmim1_tx1_sda &hdmi1_tx_on_h>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -682,6 +690,16 @@ usr_led_pin: usr-led-pin {
 		};
 	};
 
+	hdmi {
+		hdmi0_tx_on_h: hdmi0-tx-on-h {
+			rockchip,pins = <4 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		hdmi1_tx_on_h: hdmi1-tx-on-h {
+			rockchip,pins = <4 RK_PB2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hdmirx {
 		hdmirx_hpd: hdmirx-5v-detection {
 			rockchip,pins = <1 RK_PD5 RK_FUNC_GPIO &pcfg_pull_none>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts
index 8b1d35760c3b..762f9fd966a4 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts
@@ -35,6 +35,10 @@ hdmi1_con_in: endpoint {
 };
 
 &hdmi0 {
+	frl-enable-gpios = <&gpio4 RK_PB1 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
+		     &hdmim0_tx0_scl &hdmim0_tx0_sda &hdmi0_tx_on_h>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -55,9 +59,10 @@ &hdmi0_sound {
 };
 
 &hdmi1 {
-	pinctrl-names = "default";
+	frl-enable-gpios = <&gpio4 RK_PB2 GPIO_ACTIVE_LOW>;
 	pinctrl-0 = <&hdmim0_tx1_cec &hdmim0_tx1_hpd
-			     &hdmim1_tx1_scl &hdmim1_tx1_sda>;
+			     &hdmim1_tx1_scl &hdmim1_tx1_sda &hdmi1_tx_on_h>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -102,6 +107,15 @@ &led_green_pwm {
 };
 
 &pinctrl {
+	hdmi {
+		hdmi0_tx_on_h: hdmi0-tx-on-h {
+			rockchip,pins = <4 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		hdmi1_tx_on_h: hdmi1-tx-on-h {
+			rockchip,pins = <4 RK_PB2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
 
 	usb {
 		usb_otg_pwren: usb-otg-pwren {
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
index 9950d1147e12..7142938d2971 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
@@ -121,6 +121,10 @@ &fan {
 };
 
 &hdmi0 {
+	frl-enable-gpios = <&gpio4 RK_PB1 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
+		     &hdmim0_tx0_scl &hdmim0_tx0_sda &hdmi0_tx_on_h>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -141,6 +145,10 @@ hdmi0_out_con: endpoint {
 };
 
 &hdmi1 {
+	frl-enable-gpios = <&gpio4 RK_PB2 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmim2_tx1_cec &hdmim0_tx1_hpd
+		     &hdmim1_tx1_scl &hdmim1_tx1_sda &hdmi1_tx_on_h>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -278,6 +286,16 @@ &pcie2x1l2 {
 };
 
 &pinctrl {
+	hdmi {
+		hdmi0_tx_on_h: hdmi0-tx-on-h {
+			rockchip,pins = <4 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		hdmi1_tx_on_h: hdmi1-tx-on-h {
+			rockchip,pins = <4 RK_PB2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hym8563 {
 		hym8563_int: hym8563-int {
 			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts
index f8c6c080e418..2b693dfb434c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts
@@ -25,9 +25,10 @@ hdmi1_con_in: endpoint {
 };
 
 &hdmi1 {
-	pinctrl-names = "default";
+	frl-enable-gpios = <&gpio4 RK_PB2 GPIO_ACTIVE_LOW>;
 	pinctrl-0 = <&hdmim0_tx1_cec &hdmim0_tx1_hpd
-			     &hdmim1_tx1_scl &hdmim1_tx1_sda>;
+			     &hdmim1_tx1_scl &hdmim1_tx1_sda &hdmi1_tx_on_h>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -64,6 +65,12 @@ &led_green_pwm {
 };
 
 &pinctrl {
+	hdmi {
+		hdmi1_tx_on_h: hdmi1-tx-on-h {
+			rockchip,pins = <4 RK_PB2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	usb {
 		usb_otg_pwren: usb-otg-pwren {
 			rockchip,pins = <4 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dts b/arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dts
index 2d6fed2a84a3..c50217a7b559 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dts
@@ -325,6 +325,10 @@ &gpu {
 };
 
 &hdmi0 {
+	frl-enable-gpios = <&gpio4 RK_PB0 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
+		     &hdmim0_tx0_scl &hdmim0_tx0_sda &hdmi0_tx_on_h>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -345,6 +349,10 @@ &hdmi0_sound {
 };
 
 &hdmi1 {
+	frl-enable-gpios = <&gpio4 RK_PB1 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmim2_tx1_cec &hdmim0_tx1_hpd
+		     &hdmim1_tx1_scl &hdmim1_tx1_sda &hdmi1_tx_on_h>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -583,6 +591,16 @@ led_pins: led-pins {
 		};
 	};
 
+	hdmi {
+		hdmi0_tx_on_h: hdmi0-tx-on-h {
+			rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		hdmi1_tx_on_h: hdmi1-tx-on-h {
+			rockchip,pins = <4 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hym8563 {
 		hym8563_int: hym8563-int {
 			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_up>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
index f7dd01d6fa0a..d5c0b01987fc 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
@@ -346,8 +346,10 @@ &gpu {
 };
 
 &hdmi1 {
+	frl-enable-gpios = <&gpio4 RK_PB1 GPIO_ACTIVE_LOW>;
 	pinctrl-0 = <&hdmim0_tx1_cec &hdmim0_tx1_hpd
-		     &hdmim1_tx1_scl &hdmim1_tx1_sda>;
+		     &hdmim1_tx1_scl &hdmim1_tx1_sda &hdmi1_tx_on_h>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -696,6 +698,12 @@ &pd_gpu {
 };
 
 &pinctrl {
+	hdmi {
+		hdmi1_tx_on_h: hdmi1-tx-on-h {
+			rockchip,pins = <4 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hym8563 {
 		rtc_int: rtc-int {
 			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
index bf4a1d2e55ca..b2ca041b8e8b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
@@ -183,6 +183,10 @@ &gpu {
 };
 
 &hdmi0 {
+	frl-enable-gpios = <&gpio4 RK_PB1 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
+		     &hdmim0_tx0_scl &hdmim0_tx0_sda &hdmi0_tx_on_h>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -203,8 +207,10 @@ &hdmi0_sound {
 };
 
 &hdmi1 {
+	frl-enable-gpios = <&gpio4 RK_PA1 GPIO_ACTIVE_LOW>;
 	pinctrl-0 = <&hdmim0_tx1_cec &hdmim0_tx1_hpd
-		     &hdmim1_tx1_scl &hdmim1_tx1_sda>;
+		     &hdmim1_tx1_scl &hdmim1_tx1_sda &hdmi1_tx_on_h>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -505,6 +511,16 @@ &pd_npu {
 };
 
 &pinctrl {
+	hdmi {
+		hdmi0_tx_on_h: hdmi0-tx-on-h {
+			rockchip,pins = <4 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		hdmi1_tx_on_h: hdmi1-tx-on-h {
+			rockchip,pins = <4 RK_PA1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hym8563 {
 		hym8563_int: hym8563-int {
 			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts b/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts
index caa43d1abf17..08b7d477d8db 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts
@@ -172,8 +172,9 @@ &hdmi0 {
 	 * While HDMI-CEC is present on the Q7 connector, it is not
 	 * connected on Haikou itself.
 	 */
+	pinctrl-0 = <&hdmim0_tx0_hpd &hdmim1_tx0_scl &hdmim1_tx0_sda
+		     &hdmi0_tx_on_h>;
 	pinctrl-names = "default";
-	pinctrl-0 = <&hdmim0_tx0_hpd &hdmim1_tx0_scl &hdmim1_tx0_sda>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
index a0e97481afb7..ea5c264d1537 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
@@ -148,9 +148,10 @@ &gpu {
 };
 
 &hdmi0 {
-	pinctrl-names = "default";
+	frl-enable-gpios = <&gpio0 RK_PD3 GPIO_ACTIVE_LOW>;
 	pinctrl-0 = <&hdmim1_tx0_cec &hdmim0_tx0_hpd &hdmim1_tx0_scl
-		     &hdmim1_tx0_sda>;
+		     &hdmim1_tx0_sda &hdmi0_tx_on_h>;
+	pinctrl-names = "default";
 };
 
 &i2c1 {
@@ -349,6 +350,12 @@ eth_reset: eth-reset {
 		};
 	};
 
+	hdmi {
+		hdmi0_tx_on_h: hdmi0-tx-on-h {
+			rockchip,pins = <0 RK_PD3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	leds {
 		module_led_pin: module-led-pin {
 			rockchip,pins = <1 RK_PD3 RK_FUNC_GPIO &pcfg_pull_none>;

-- 
2.53.0


