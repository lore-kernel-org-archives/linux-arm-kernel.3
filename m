Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08191CA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 02:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rX0psZTCLYcRU3NsyJXoO3RjAamgGmbRFm7a0aLzLzE=; b=3qsWAIGLxqOmwsW9vzTbk5+ewW
	GEHSOWssWwRZoCYVoL5BreGAQzqTJB+Gg/Pu1eTpwMRm1qBOX4+MHaMLJrNKa8K0UeIFC2tpdts8Y
	2BfaAJtRNMfDWU7XMk8D+tKjRir3UNGM5lI2iaMKvuR/gyGsmtN9vzrknYTY2htWLzNwITyBCRSFb
	1o9b58zxy425bktNjPtVHdeieoQzSYsfgNUyN3tn0z9jRsVlT6GPRQTgAmo8ip3MexSehghFdZFd6
	+8yARk8L+4saK65V37Js8aUwyHshswm/PNEN11g35+xFjwj+oDJqPGlPNBAKaBjKkPxr2n/2mkMzo
	1a4Q+XSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBkQX-00000004wAS-2bxQ;
	Wed, 30 Sep 2026 02:52:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBkQX-00000004wAG-0JiN;
	Wed, 30 Sep 2026 02:52:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 853E340925;
	Wed, 30 Sep 2026 02:52:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5E3C2C2BCF6;
	Wed, 30 Sep 2026 02:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790736732;
	bh=TI3eBdcLTSlpQRvsnz37lTuaeLP8kjd46bVtYcvMOIo=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=snrB02n2XKdkykmQGcW8gozBHstnK7QbWT+XCenJUFPfuCGSk136myE/ptj9Ky4PF
	 O4F6qkTwAWF0dTmw2u+tDSROB0W7J0E4NJzoRX+oiktehXhQk5R6s1715OaNZF118F
	 feTfx7Ga3DXwFK2OFW629BUvwFc2AzJ5Abu5biSjz8RwLYdiIfGAR265LQlfVZjOlF
	 /q/ZIyP/GZaQxqAMflqAnRcYthZ0DLi6L8g5rgySZHZXv4YQI5clOf40waB/roXNH3
	 g7v6te12F2zXIIRGItTXT/BvH5jdEWxAq+AtIFSZSVZzGSVnHb2PGVsCzVKoN/zavk
	 JSMC2itGYgTbw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C8BCA5FB3;
	Wed, 30 Sep 2026 02:52:12 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Wed, 30 Sep 2026 05:52:03 +0300
Subject: [PATCH] arm64: dts: rockchip: Add buttons to Kobol Helios64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-helios64-buttons-v1-1-d76249064003@iav.lv>
X-B4-Tracking: v=1; b=H4sIAFJ5vGoC/x3MOwqAMBBF0a3I1AZilKBuRSz8PHVAEsmoCJK9G
 yxPce9LgsAQarOXAm4W9i6hyDOatsGtUDwnk9HG6qbUasPOXmylxus8vRM1NuUwV6gBA0rZEbD
 w8y+7PsYPxs+eEWIAAAA=
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3412; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=K7Z4uztvoCt3fl82OcCvlTFdzYYGS+LBErAXzdnqa6g=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFl7KsMuz/ewuZ0Yu7B3puHGxQ/E+UNnhuSwGwg/8ne4l
 8m06UF+RykLgxgXg6yYIsuEQxq3MpZc/evvYf4AZg4rE8gQBi5OAZhI5gpGhithfo9X/fWQ+ns2
 bdUcpim6t3eVnV55ean3xjKFtLvBl1gZ/qclt8+Nnqu4u8eFwUtlWm4E47NaycktLf9bN5z+8lz
 FiAEA
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
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
Reply-To: iav@iav.lv
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Igor Velkov <iav@iav.lv>

The Helios64 front panel has Power and Recovery buttons. Power is
wired to GPIO0_A5 and Recovery to SARADC channel 1. The board also
routes a User1 button signal to GPIO0_A3 on front panel header P3.

Describe Power and User1 as gpio-keys and Recovery as adc-keys.
The SARADC reference is the 1V8_S3 rail from RK808 LDO_REG3, so add
that regulator.

Assisted-by: LLM
Signed-off-by: Igor Velkov <iav@iav.lv>
---
Tested on 7.3-rc5 with evtest: Power reports KEY_POWER, Recovery
reports BTN_1. Power wakes the board from s2idle. User1 has no button
on the enclosure and is untested.
---
 .../boot/dts/rockchip/rk3399-kobol-helios64.dts    | 64 ++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
index b2de018a7d36..d146e5075b4f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
@@ -11,6 +11,7 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/input/input.h>
 #include "rk3399.dtsi"
 
 / {
@@ -23,6 +24,20 @@ aliases {
 		mmc1 = &sdhci;
 	};
 
+	adc-keys {
+		compatible = "adc-keys";
+		io-channels = <&saradc 1>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1800000>;
+		poll-interval = <100>;
+
+		button-recovery {
+			label = "Recovery";
+			linux,code = <BTN_1>;
+			press-threshold-microvolt = <100000>;
+		};
+	};
+
 	avdd_0v9_s0: regulator-avdd-0v9-s0 {
 		compatible = "regulator-fixed";
 		regulator-name = "avdd_0v9_s0";
@@ -68,6 +83,27 @@ fan2 {
 		cooling-levels = <0 80 170 255>;
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pwr_btn &user1_btn>;
+
+		button-power {
+			debounce-interval = <100>;
+			gpios = <&gpio0 RK_PA5 GPIO_ACTIVE_LOW>;
+			label = "Power";
+			linux,code = <KEY_POWER>;
+			wakeup-source;
+		};
+
+		button-user1 {
+			debounce-interval = <100>;
+			gpios = <&gpio0 RK_PA3 GPIO_ACTIVE_LOW>;
+			label = "User Button 1";
+			linux,code = <BTN_0>;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
@@ -352,6 +388,19 @@ regulator-state-mem {
 				};
 			};
 
+			vcc1v8_s3: LDO_REG3 {
+				regulator-name = "vcc1v8_s3";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+
 			vcc_sdio_s0: LDO_REG4 {
 				regulator-name = "vcc_sdio_s0";
 				regulator-always-on;
@@ -434,6 +483,16 @@ &pcie0 {
 };
 
 &pinctrl {
+	buttons {
+		pwr_btn: pwr-btn {
+			rockchip,pins = <0 RK_PA5 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		user1_btn: user1-btn {
+			rockchip,pins = <0 RK_PA3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	gmac {
 		gphy_reset: gphy-reset {
 			rockchip,pins = <3 RK_PB7 RK_FUNC_GPIO &pcfg_output_low>;
@@ -503,6 +562,11 @@ &pwm1 {
 	status = "okay";
 };
 
+&saradc {
+	vref-supply = <&vcc1v8_s3>;
+	status = "okay";
+};
+
 &sdhci {
 	bus-width = <8>;
 	mmc-hs200-1_8v;

---
base-commit: 23d8f49fcae5d72b77744c7f349c12462c3bb748
change-id: 20260930-helios64-buttons-b93ad4e8ee2e

Best regards,
-- 
Igor Velkov <iav@iav.lv>



