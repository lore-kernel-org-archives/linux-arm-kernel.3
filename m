Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CC3C44502
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 10:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M+S91k9FvN+Q1z+KwnvmtonUBdwa1+ZfBnBC0GNchH8=; b=3QjBN/EOsTbai5OTw0sV3lOyfk
	WO+vS3sIPvAaWhecEuIi59go117CxNcBwJ0h4Bou5bKudpapI3dF/LvbIunZ8J8c92qVJ1MPCf+2o
	+GZB7199BoAgNu0Kco3eeKtEFRfFIyjTheTYTtosuKvfMKNa2lYa5+P/xmyFCS56gQ8EXE51Ec14v
	/4eUPCdJCrqReERo89f01cmE+CPRoX6Nnhywb9DAw6NOqAhrNmomReP12rbUgislYzmzF62JoQqdx
	pQGwylQ9Op8LSrb3Sc+AsuCx+EGbzz0XAxaYz02X46OnyrnzzXzvPLzSYh55KtZR/wt/rCxfvc7IC
	uNEW6KSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viVMS-00000005H54-2Nob;
	Wed, 21 Jan 2026 10:22:52 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viVMQ-00000005H49-1aHJ;
	Wed, 21 Jan 2026 10:22:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=M+S91k9FvN+Q1z+KwnvmtonUBdwa1+ZfBnBC0GNchH8=; b=l+gOzbccaGtAI89KYpjIi8YMkD
	mT6L3IrJSaEGMhm6/fuiIhAJ+RjEOe5TI/Cbh2/5y7rZ+UO/x8y0g7MKuo771qnsrf8Uti5rXi3IK
	v0vYfd6TsdTiXh+ImJcsL24EKwEnasvwsbekwuiibylVZHp+3gZMwPtiTTzcUk7pwnbIiYjxAFrz4
	OZZiQEuoCvURVyk47agKV76CaqZeV81Qk6TbH5bGmkqVK9yduZuRySKqmZgcrxosT8EYq8tmiIpgw
	ZDjs6gltBunfdBTSoYb4njUw/YnXvHY37cKoiuo/TPyf/Ts5sLfGPWqF5LrRJwFr/JQMHDKmScMa1
	93ogGfjQ==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Wed, 21 Jan 2026 11:22:37 +0100
Subject: [PATCH] arm64: dts: rockchip: Add TPS65185 for PineNote
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-rk-tps-v1-1-bc867e1dd200@kemnade.info>
X-B4-Tracking: v=1; b=H4sIAOyocGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyND3aJs3ZKCYl1D4zRLM/PkxMTk1GQloOKCotS0zAqwQdGxtbUA7lg
 bUlgAAAA=
X-Change-ID: 20260121-rk-tps-13f967caacec
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Diederik de Haas <didi.debian@cknow.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.15-dev-a6db3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2572; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=cCVsmWD5x2Wp9Uyksc6R5cDwZAzUv2EH8wUugsqaG70=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDJkFKz5pxyVy+dUFzN1zyLO5aVXGdOa6o3ZqyVYtuTe/P
 K5+cN2xo4SFQYyLQVZMkeWXtYLbJ5VnucFTI+xh5rAygQxh4OIUgIkUdzF8L7m4worHwSC1tvbS
 ygmB2x2dTSd5rRHZbeV49N+1z/vcGf7Kbdb59mh5Wvy55R0fSlkrDW9e2Osa5lirdmjuOqUNTX6
 cAA==
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_022250_433326_823AE052 
X-CRM114-Status: UNSURE (   9.95  )
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

As the TPS65185 driver is now upsteram, add it to the PineNote devietrees.
This is based on https://ayakael.net/forge/linux-pinenote but modified to
the binding requirements.
Without any other out-of-tree materials applied, this enables the
hwmon temperature reporting and the interrupt counter increments
by one per reading.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi | 49 +++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi
index 5c6f8cc401c9..7d490926dbc9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi
@@ -499,6 +499,40 @@ typec_hs_usb2phy0: endpoint {
 			};
 		};
 	};
+
+	ebc_pmic: pmic@68 {
+		compatible = "ti,tps65185";
+		reg = <0x68>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <RK_PA6 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&ebc_pmic_pins>;
+		pinctrl-names = "default";
+		enable-gpios = <&gpio3 RK_PB0 GPIO_ACTIVE_HIGH>;
+		pwr-good-gpios = <&gpio3 RK_PA7 GPIO_ACTIVE_HIGH>;
+		vcom-ctrl-gpios = <&gpio4 RK_PB2 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&vcc_bat>;
+		wakeup-gpios = <&gpio3 RK_PA5 GPIO_ACTIVE_HIGH>;
+
+		regulators {
+			v3p3: v3p3 {
+				regulator-name = "v3p3";
+				/* Keep it always on because IRQ is pulled up against this line */
+				regulator-always-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+			};
+
+			vcom: vcom {
+				regulator-name = "vcom";
+			};
+
+			vposneg: vposneg {
+				regulator-name = "vposneg";
+				regulator-min-microvolt = <15000000>;
+				regulator-max-microvolt = <15000000>;
+			};
+		};
+	};
 };
 
 &i2c5 {
@@ -563,6 +597,21 @@ bt_wake_h: bt-wake-h {
 		};
 	};
 
+	ebc-pmic {
+		ebc_pmic_pins: ebc-pmic-pins {
+			rockchip,pins = /* wakeup */
+					<3 RK_PA5 RK_FUNC_GPIO &pcfg_pull_none>,
+					/* int */
+					<3 RK_PA6 RK_FUNC_GPIO &pcfg_pull_up>,
+					/* pwr_good */
+					<3 RK_PA7 RK_FUNC_GPIO &pcfg_pull_none>,
+					/* pwrup */
+					<3 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>,
+					/* vcom_ctrl */
+					<4 RK_PB2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	led {
 		led_pin: led-pin {
 			rockchip,pins = <3 RK_PC5 RK_FUNC_GPIO &pcfg_pull_none>;

---
base-commit: 053966c344dbd346e71305f530e91ea77916189f
change-id: 20260121-rk-tps-13f967caacec

Best regards,
--  
Andreas Kemnade <andreas@kemnade.info>


