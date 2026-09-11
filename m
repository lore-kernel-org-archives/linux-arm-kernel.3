Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D7BC88E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 10:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FyeKc1CV9LhD/xu18Ygv5hMK3JnzrHX5kz1dG2iyurw=; b=taoRCydHrKX8gVD+w+XuKyplB8
	s4WBJHQiS3sp9a0kXgQAy+AUSEQEr8pvN4Od3B0SjBzcqJUdeJD5AnYvq3ml1visCCGxZ3EopdVmt
	AAkotSp1Lj9A4vx6ACeZySAwFPdileorsjnhHcRLQgoAqj39d6LzLgmfIdK6Po/874tLWoKdGv9p/
	yNpORQQI8DX6mRksAbzzId5NL3CHnEe4FuzCtF3TcSxjMZzYC/bD27mh0mex4T3Hq01A8stWbFCCy
	gW8K9QLeotMfxHo71mg87BRGf8GnReQYyh0u2zkJaiSvV09e9C8EqlyuprfeB4gtZ1S6XpHMp3eQs
	m6kVheWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4y69-0000000GJyi-2eNA;
	Fri, 11 Sep 2026 10:03:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4y60-0000000GJsh-03Ma;
	Fri, 11 Sep 2026 10:03:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4858760235;
	Fri, 11 Sep 2026 10:02:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D335FC2BCFC;
	Fri, 11 Sep 2026 10:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789120978;
	bh=2KNTYkdkwbMyC1miCU9A7MtRFj+4xeC0pWYwDxENZQo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uI73urZAxsQkHORAyZ69pU8W7sEBzfniRl56qEk2oaXJ61UzL9ZacIcg33/EDsC7H
	 7jCYcS6wzhCJ0yZPtf5zdv0AEMnORU5e1iZjDrcm4tV5A5YkypsPB7xlV0I/2iMblm
	 wbbUo3cbQ4BAckkP9Zu1xFzfqbanesZ3NQMIJPmmjUwBKIkbi1r+H0M2aJdS6FXAhE
	 tsD9A4I2u00MQJV3vBo5XP0QwSPpPOlHJ+g4KQYv/RGacZKWmPbQhBCrMfeC1XpUFM
	 Pxod0YRMEZ5EQdMG8sizLh5KSx4v8UrkU8zjPbsCtDveOenwWDrkHKuRYxWBuZJKNE
	 TGWxeEwoUJ2Vg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6938C88E54;
	Fri, 11 Sep 2026 10:02:58 +0000 (UTC)
From: =?utf-8?q?=E5=AE=89=E5=AE=B9_via_B4_Relay?= <devnull+HystericalDragons.proton.me@kernel.org>
Date: Fri, 11 Sep 2026 18:02:46 +0800
Subject: [PATCH v4 3/4] arm64: dts: rockchip: Add devicetree for the
 FriendlyElec NanoPi R28S
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260911-r28s-upstream-v4-3-fb6c85f226d4@proton.me>
References: <20260911-r28s-upstream-v4-0-fb6c85f226d4@proton.me>
In-Reply-To: <20260911-r28s-upstream-v4-0-fb6c85f226d4@proton.me>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chukun Pan <amadeus@jmu.edu.cn>, Jonas Karlman <jonas@kwiboo.se>, 
 jensen <jensenhuang@friendlyarm.com>, 
 Andrey Korshunov <razor1702@gmail.com>, 
 Diederik de Haas <diederik@cknow-tech.com>, 
 =?utf-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4990;
 i=HystericalDragons@proton.me; h=from:subject:message-id;
 bh=j++VVr66sof9dIz+MZMFxHmP6yNpmBPeXTV3BFcBNuk=;
 b=owGbwMvMwCUmepz3XUtTHjvjabUkhqzFFy9y9Mt7MoYdTxGTDdA6biobLdSzTeS44WWpr4EaB
 VWiN5Z0lLIwiHExyIopsshuqo4UWhU9s4hF6jjMHFYmkCEMXJwCMBGx44wMS7mcDS8tU339fVHa
 BZdZpqdi2r8XulbOleqVX/FmYWINN8P/JOG6B1HfNa6/3PCuluHLvVBbuUClqt5fX7TuvxLkKfz
 ABwA=
X-Developer-Key: i=HystericalDragons@proton.me; a=openpgp;
 fpr=1DB27B5912AA5B9972041AC715C70DEE84826E07
X-Endpoint-Received: by B4 Relay for HystericalDragons@proton.me/default
 with auth_id=1004
X-Original-From: =?utf-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
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
Reply-To: HystericalDragons@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: 安容 <HystericalDragons@proton.me>

The NanoPi R28S is a dual gigabit Ethernet router board based on the
Rockchip RK3528 SoC, designed and developed by FriendlyElec. It shares
most of its design with the NanoPi Zero2, so it builds on the common
rk3528-nanopi.dtsi.

Specification:
- Rockchip RK3528
- 1GB RAM
- eMMC socket (optional)
- MicroSD slot
- 1x 1000Base-T (GMAC1, Realtek RTL8211F)
- 1x 1000Base-T (PCIe, Realtek RTL8111H)
- AICSemi AIC8800D80 SDIO WiFi
- 3x LEDs (SYS, LAN, WAN)
- 1x USB 2.0 Type-C, peripheral only, shared with the 5V power input
- User and MaskROM buttons
- Haoyu HYM8563 RTC
- 1x USB Type-C debug UART (onboard WCH CH340E)

Assisted-by: LLM
Signed-off-by: 安容 <HystericalDragons@proton.me>
---
 arch/arm64/boot/dts/rockchip/Makefile              |   1 +
 .../arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts | 145 +++++++++++++++++++++
 2 files changed, 146 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index b677914cd3..51a9889088 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -94,6 +94,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-vicharak-vaaman.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399pro-rock-pi-n10.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-armsom-sige1.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-hinlink-h28k.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-nanopi-r28s.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-nanopi-zero2.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-radxa-e20c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-rock-2a.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts b/arch/arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts
new file mode 100644
index 0000000000..6ad45d91cb
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts
@@ -0,0 +1,145 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2022 Rockchip Electronics Co., Ltd.
+ * Copyright (c) 2026 FriendlyElec Computer Tech. Co., Ltd.
+ * Copyright (c) 2026 安容 <HystericalDragons@proton.me>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+#include "rk3528-nanopi.dtsi"
+
+/ {
+	model = "FriendlyElec NanoPi R28S";
+	compatible = "friendlyarm,nanopi-r28s", "rockchip,rk3528";
+
+	aliases {
+		mmc2 = &sdio0;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&usr_btn>;
+		pinctrl-names = "default";
+
+		button-user {
+			debounce-interval = <50>;
+			gpios = <&gpio4 RK_PB2 GPIO_ACTIVE_LOW>;
+			label = "USER";
+			linux,code = <KEY_RESTART>;
+			wakeup-source;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-0 = <&led1>, <&led2>, <&led_sys>;
+		pinctrl-names = "default";
+
+		led-lan {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			gpios = <&gpio4 RK_PB3 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "netdev";
+		};
+
+		led-sys {
+			color = <LED_COLOR_ID_RED>;
+			default-state = "on";
+			function = LED_FUNCTION_HEARTBEAT;
+			gpios = <&gpio4 RK_PB0 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+
+		led-wan {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_WAN;
+			gpios = <&gpio4 RK_PB1 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "netdev";
+		};
+	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		pinctrl-0 = <&pwr_wf>;
+		pinctrl-names = "default";
+		post-power-on-delay-ms = <100>;
+		reset-gpios = <&gpio1 RK_PC2 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&combphy {
+	status = "okay";
+};
+
+&pcie {
+	pinctrl-0 = <&pcie_eth_perstb>;
+	pinctrl-names = "default";
+	reset-gpios = <&gpio4 RK_PC0 GPIO_ACTIVE_HIGH>;
+	vpcie3v3-supply = <&vcc_3v3>;
+
+	status = "okay";
+};
+
+&pinctrl {
+	gpio-keys {
+		usr_btn: usr-btn {
+			rockchip,pins = <4 RK_PB2 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	leds {
+		led1: led1 {
+			rockchip,pins = <4 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		led2: led2 {
+			rockchip,pins = <4 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		led_sys: led-sys {
+			rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	pcie {
+		pcie_eth_perstb: pcie-eth-perstb {
+			rockchip,pins = <4 RK_PC0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	wifi {
+		pwr_wf: pwr-wf {
+			rockchip,pins = <1 RK_PC2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&sdio0 {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cap-sdio-irq;
+	keep-power-in-suspend;
+	mmc-pwrseq = <&sdio_pwrseq>;
+	non-removable;
+	sd-uhs-sdr104;
+	vqmmc-supply = <&vcc_1v8>;
+
+	status = "okay";
+};
+
+&uart2 {
+	pinctrl-0 = <&uart2m1_xfer>, <&uart2m1_ctsn>, <&uart2m1_rtsn>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+
+	status = "okay";
+};
+
+&usb_host0_xhci {
+	/* Type-C port, shared with the 5V power input */
+	dr_mode = "peripheral";
+};

-- 
2.55.0



