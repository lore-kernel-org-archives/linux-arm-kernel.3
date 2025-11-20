Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FD3CF8847
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 12:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V1NlNx8DeZze/7TuMRm4xnhFquplajBanvIyp4oM2pg=; b=eMgr6JdV+cIz7dBo19prMUf+M5
	z8NoTPAXMoWHT/bYjb7cfCHbOyaLtIswfaT2nY0FFQiyShCYL6Vyq/A8HHQVvdT++Bd2+2c8Vlke9
	ZED8Xu+LrL5zhiVSNcpgeF+RNOrGFK1MsE+JFLs2CgKfmL/E8FZaPuD68N19kIlXcm+dMd8k4czRY
	uee3oT0TgPPFo/pWrt8NgyqR8ibV/7v0YVDBhHnTQ7YURMgTlrRULPCb4skpRZ65gFRh7+0kemhFu
	kzGl8oMCWv2SjQup0u+idT6s7aom5/BEsfPsU1lrJLVi8o8Gt3zxRYvKpGpOfRvAHesH/CMUGTL1P
	fMl9pv7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM3Le-00000006ccL-3RFO;
	Thu, 20 Nov 2025 12:01:14 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM3LY-00000006cZx-46wJ;
	Thu, 20 Nov 2025 12:01:10 +0000
Received: from localhost.localdomain (unknown [116.25.94.95])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2a4b7715d;
	Thu, 20 Nov 2025 20:01:06 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Chukun Pan <amadeus@jmu.edu.cn>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 3/5] arm64: dts: rockchip: enable button for 100ASK DshanPi A1
Date: Thu, 20 Nov 2025 20:00:09 +0800
Message-Id: <20251120120011.279104-4-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251120120011.279104-1-amadeus@jmu.edu.cn>
References: <20251120120011.279104-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9aa123c12403a2kunm2d0ac75b4ac49
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZGh5PVh1JH0xLSEtDSB1CGVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk9VQk5ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE5VSktLVUpCS0
	tZBg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_040109_206037_FEA484F4 
X-CRM114-Status: UNSURE (   8.04  )
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

The 100ASK DshanPi A1 board has three ADC buttons and one
GPIO button. Enable them.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 .../dts/rockchip/rk3576-100ask-dshanpi-a1.dts | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts b/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts
index 815f75e7cd70..9ef41f0c6920 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/soc/rockchip,vop2.h>
@@ -66,6 +67,61 @@ hdmi_con_in: endpoint {
 		};
 	};
 
+	keys-0 {
+		compatible = "adc-keys";
+		io-channels = <&saradc 0>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1800000>;
+		poll-interval = <100>;
+
+		button-maskrom {
+			label = "MASKROM";
+			linux,code = <KEY_SETUP>;
+			press-threshold-microvolt = <0>;
+		};
+	};
+
+	keys-1 {
+		compatible = "adc-keys";
+		io-channels = <&saradc 1>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1800000>;
+		poll-interval = <100>;
+
+		button-recovery {
+			label = "RECOVERY";
+			linux,code = <KEY_VENDOR>;
+			press-threshold-microvolt = <0>;
+		};
+	};
+
+	keys-2 {
+		compatible = "adc-keys";
+		io-channels = <&saradc 4>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1800000>;
+		poll-interval = <100>;
+
+		button-user2 {
+			label = "USER2";
+			linux,code = <BTN_2>;
+			press-threshold-microvolt = <0>;
+		};
+	};
+
+	keys-3 {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio0_a0_d>;
+
+		button-user1 {
+			gpios = <&gpio0 RK_PA0 GPIO_ACTIVE_LOW>;
+			label = "USER1";
+			linux,code = <BTN_1>;
+			wakeup-source;
+		};
+	};
+
 	vcc_in: regulator-vcc-12v0-dcin {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_in";
@@ -661,6 +717,12 @@ gmac1_rst: gmac1-rst {
 		};
 	};
 
+	gpio-keys {
+		gpio0_a0_d: gpio0-a0-d {
+			rockchip,pins = <0 RK_PA0 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
 	headphone {
 		hp_det: hp-det {
 			rockchip,pins = <0 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
@@ -688,6 +750,11 @@ &sai6 {
 	status = "okay";
 };
 
+&saradc {
+	vref-supply = <&vcca1v8_pldo2_s0>;
+	status = "okay";
+};
+
 &sdhci {
 	bus-width = <8>;
 	full-pwr-cycle-in-suspend;
-- 
2.25.1


