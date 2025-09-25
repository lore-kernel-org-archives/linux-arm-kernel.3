Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED56CAC5B7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 09:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pJh0xYZn4Fs8ezjT/CyryQ1lBic3vITlPb+szGNSqx0=; b=eVeahJDcBYhqMq7FurJ1b0Nnqc
	o7LRL4cCNR7TNgnUTEeVEwn5XoEAEH86CA2hYsh4U+4/lEzHCy/Qw8TVRcjc1E/yJTSyHFwZwLaHK
	ZCfdcGQOLD3tWbJ5lqC5QjieXlRdCM0Amoyn29GsG/Niy1jHr6XF5vIxuTI8kUK5w2DSjZQYCki2H
	ibRWpg8GkHUJOjEyfdf0u6mHx1culePaUgPLwc7iOYs71RiMlx02eBMHoguUsMKkWrTQQC6m6T6Fa
	yD7r9xU4Tso5YAIC7tLV8GB/6tNnc8YGKT25dvcFEkleSoMwYTbJl4MPS0cmlZwN4mhdmI6ryjJkU
	vuKwkXNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1iJg-00000007dgk-0m5l;
	Thu, 25 Sep 2025 09:31:08 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1iJN-00000007dIx-2w8S;
	Thu, 25 Sep 2025 09:30:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=pJh0xYZn4Fs8ezjT/CyryQ1lBic3vITlPb+szGNSqx0=; b=nPvMcsWYWsJUGpkTQscv/3+uyS
	KufzznPaeuEo7X4b5pigg9fUYnHFUSpbhUDscCGngqEgHjaM+RMaCOjgnMKtLOqfifl8aVnSh901T
	+Y41MD/qnZI8r+SiWn2MRCJbNrfgpJ0bwVDQrq18fzkkIvyvynNpYwTgk0cwMZ4uNv3KazUBs3Gb/
	KQykKEN+7wxZit2z0LIGSH50JVE7IIlqHQGPQR2iq+c7eCJY4Tpgmat/L9HMmEUHGZlK5b70Wqx7T
	LqjQnWuNVWDlC5eAwYgzSDtX/1eevs0uIWn/XW4b6hvDYadUclwRFxg/dLknFUGve2JUFm006f0kF
	VgfYMGkg==;
Received: from i53875a54.versanet.de ([83.135.90.84] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1v1iJH-0001Nz-Ok; Thu, 25 Sep 2025 11:30:43 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ukleinek@debian.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 6/6] arm64: dts: rockchip: add QNAP TS233 devicetree
Date: Thu, 25 Sep 2025 11:29:23 +0200
Message-ID: <20250925092923.2184187-7-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250925092923.2184187-1-heiko@sntech.de>
References: <20250925092923.2184187-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_023049_744667_C67E2152 
X-CRM114-Status: GOOD (  17.60  )
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

The TS233 is a 2 bay NAS similar to the TS433. Architecture-wise it really
seems to be the same minus the additional PCIe connected components the
TS433 has.

So it just uses two of the SoCs SATA ports and the SoC's gigabit ethernet.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3568-qnap-ts233.dts   | 133 ++++++++++++++++++
 2 files changed, 134 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-qnap-ts233.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 099520962ffb..f1b7917ae22b 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -136,6 +136,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-nanopi-r5c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-nanopi-r5s.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-odroid-m1.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-photonicat.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-qnap-ts233.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-qnap-ts433.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-radxa-e25.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-roc-pc.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts233.dts b/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts233.dts
new file mode 100644
index 000000000000..29181de1bd26
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts233.dts
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2021 Rockchip Electronics Co., Ltd.
+ * Copyright (c) 2024 Heiko Stuebner <heiko@sntech.de>
+ */
+
+/dts-v1/;
+
+#include "rk3568-qnap-tsx33.dtsi"
+
+/ {
+	model = "Qnap TS-233-2G NAS System 2-Bay";
+	compatible = "qnap,ts233", "rockchip,rk3568";
+
+	aliases {
+		ethernet0 = &gmac0;
+	};
+};
+
+/* connected to sata2 */
+&combphy2 {
+	status = "okay";
+};
+
+&gmac0 {
+	assigned-clocks = <&cru SCLK_GMAC0_RX_TX>, <&cru SCLK_GMAC0>;
+	assigned-clock-parents = <&cru SCLK_GMAC0_RGMII_SPEED>, <&cru CLK_MAC0_2TOP>;
+	assigned-clock-rates = <0>, <125000000>;
+	clock_in_out = "output";
+	phy-handle = <&rgmii_phy0>;
+	phy-mode = "rgmii-id";
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac0_miim
+		     &gmac0_tx_bus2
+		     &gmac0_rx_bus2
+		     &gmac0_rgmii_clk
+		     &gmac0_rgmii_bus>;
+	rx_delay = <0x15>;
+	tx_delay = <0x21>;
+	status = "okay";
+};
+
+&i2c1 {
+	/* eeprom for vital-product-data on the backplane */
+	eeprom@56 {
+		compatible = "giantec,gt24c04a", "atmel,24c04";
+		reg = <0x56>;
+		label = "VPD_BP";
+		num-addresses = <2>;
+		pagesize = <16>;
+		read-only;
+	};
+};
+
+&leds {
+	led-1 {
+		color = <LED_COLOR_ID_GREEN>;
+		function = LED_FUNCTION_DISK;
+		gpios = <&gpio1 RK_PD6 GPIO_ACTIVE_LOW>;
+		label = "hdd2:green:disk";
+		linux,default-trigger = "disk-activity";
+		pinctrl-names = "default";
+		pinctrl-0 = <&hdd2_led_pin>;
+	};
+};
+
+&mcu {
+	compatible = "qnap,ts233-mcu";
+};
+
+&mdio0 {
+	rgmii_phy0: ethernet-phy@3 {
+		/* Motorcomm YT8521 phy */
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0x3>;
+		pinctrl-0 = <&eth_phy0_reset_pin>;
+		pinctrl-names = "default";
+		reset-assert-us = <10000>;
+		reset-gpios = <&gpio0 RK_PC6 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&pinctrl {
+	gmac0 {
+		eth_phy0_reset_pin: eth-phy0-reset-pin {
+			rockchip,pins = <0 RK_PC6 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	leds {
+		hdd2_led_pin: hdd2-led-pin {
+			rockchip,pins = <1 RK_PD6 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+};
+
+&sata2 {
+	status = "okay";
+};
+
+&usb2phy1 {
+	status = "okay";
+};
+
+/* connected to usb_host1_ehci/ohci */
+&usb2phy1_host {
+	phy-supply = <&vcc5v0_host>;
+	status = "okay";
+};
+
+/* connected to usb_host0_ehci/ohci */
+&usb2phy1_otg {
+	phy-supply = <&vcc5v0_host>;
+	status = "okay";
+};
+
+/* right port backside */
+&usb_host0_ehci {
+	status = "okay";
+};
+
+&usb_host0_ohci {
+	status = "okay";
+};
+
+/* left port backside */
+&usb_host1_ehci {
+	status = "okay";
+};
+
+&usb_host1_ohci {
+	status = "okay";
+};
-- 
2.47.2


