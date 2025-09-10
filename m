Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 361ECCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 15:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lbzwR2EEuBgRUNBu170UgNxFWarhQcchc6ZQ9FxTrRI=; b=JG/ToUNX7Pr6oGpEkd6Esus3Wq
	RzEdJH0cNKb/VfcuDxRxiotna522BvT55Deaj4cvXdXIE0o+sDplvFn+RbjyeBhj9+Sp0vPWzfb4n
	GZqvJako3HTwR2kGMLn27Xp7e56HDxqN6hAQL3ZV3R6I30g9esQ9IGzzO6CpfS10eB35+VD2wvn/p
	YylsuzhaVWD09OtDWNTM1DitiEndInycHj/d+1MZEo6bYbtlct1lhPycmLqA4b469nvN/u6vIYoBO
	JWO9rmmYSRMaMDV6iC8VC5b91fsPFheACKRpDsZ/WZo+HS+FH+WSRYjCdNrXimD5qVWaPvzu18KeC
	5/1aEq+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwN33-0000000FEJv-06pu;
	Wed, 10 Sep 2025 15:47:53 +0000
Received: from mail.nic.cz ([217.31.204.67])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwN31-0000000FEIX-0ZCo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 15:47:52 +0000
Received: from macholda.lan (unknown [IPv6:2001:1488:fffe:6220:172f:2c63:54a0:e850])
	by mail.nic.cz (Postfix) with ESMTPSA id 712FB1C1006;
	Wed, 10 Sep 2025 17:47:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nic.cz; s=default;
	t=1757519267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lbzwR2EEuBgRUNBu170UgNxFWarhQcchc6ZQ9FxTrRI=;
	b=MDFW1kWhxtO0kukRPXWoN9s6dFPRgNltzZ2UjRaQTFa9RE6bUMHOx6yxN0TxF9t7l1SX9V
	xgwUxAwy97YlMyMRxS0T5HhWNKI6qU5R4ytM/VbpVfcVLKnLNdcDj+wqj83kjreXZze5fz
	TxtRwch74da5QCaAW5JurXYMaZCQLyk=
Authentication-Results: mail.nic.cz;
	auth=pass smtp.auth=tomas.macholda@nic.cz smtp.mailfrom=tomas.macholda@nic.cz
From: =?UTF-8?q?Tom=C3=A1=C5=A1=20Macholda?= <tomas.macholda@nic.cz>
To: Gregory Clement <gregory.clement@bootlin.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	kabel@kernel.org,
	=?UTF-8?q?Tom=C3=A1=C5=A1=20Macholda?= <tomas.macholda@nic.cz>
Subject: [PATCH 2/2] arm64: dts: marvell: add dts for RIPE Atlas Probe
Date: Wed, 10 Sep 2025 17:47:34 +0200
Message-ID: <20250910154734.24686-3-tomas.macholda@nic.cz>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250910154734.24686-1-tomas.macholda@nic.cz>
References: <20250910154734.24686-1-tomas.macholda@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Pre-Result: action=no action;
	module=multimap;
	Matched map: WHITELISTED_IP
X-Rspamd-Queue-Id: 712FB1C1006
X-Spamd-Bar: /
X-Spamd-Result: default: False [0.57 / 16.00];
	R_MIXED_CHARSET(0.67)[subject];
	MIME_GOOD(-0.10)[text/plain];
	WHITELISTED_IP(0.00)[2001:1488:fffe:6220:172f:2c63:54a0:e850];
	DKIM_SIGNED(0.00)[nic.cz:s=default];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[dt];
	ASN(0.00)[asn:25192, ipnet:2001:1488::/32, country:CZ];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.1:email,0.0.0.0:email]
X-Rspamd-Server: mail
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_084751_375218_12B87CBD 
X-CRM114-Status: GOOD (  11.27  )
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

CZ.NIC's RIPE Atlas Probe v5, based on Turris MOX

Signed-off-by: Tomáš Macholda <tomas.macholda@nic.cz>
---
 .../dts/marvell/armada-3720-ripe-atlas.dts    | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)
 create mode 100644 arch/arm64/boot/dts/marvell/armada-3720-ripe-atlas.dts

diff --git a/arch/arm64/boot/dts/marvell/armada-3720-ripe-atlas.dts b/arch/arm64/boot/dts/marvell/armada-3720-ripe-atlas.dts
new file mode 100644
index 000000000000..2a0de7b085da
--- /dev/null
+++ b/arch/arm64/boot/dts/marvell/armada-3720-ripe-atlas.dts
@@ -0,0 +1,110 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Device Tree file for CZ.NIC Ripe Atlas Probe
+ * 2025 by Marek Behún <kabel@kernel.org>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/bus/moxtet.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+#include "armada-372x.dtsi"
+
+/ {
+	model = "CZ.NIC RIPE Atlas Probe";
+	compatible = "cznic,ripe-atlas", "marvell,armada3720",
+		     "marvell,armada3710";
+
+	aliases {
+		ethernet0 = &eth0;
+		mmc0 = &sdhci0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x00000000 0x00000000 0x00000000 0x20000000>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led {
+			gpios = <&gpiosb 21 GPIO_ACTIVE_LOW>;
+			function = LED_FUNCTION_ACTIVITY;
+			color = <LED_COLOR_ID_RED>;
+			linux,default-trigger = "default-on";
+		};
+	};
+
+	vsdc_reg: vsdc-reg {
+		compatible = "regulator-gpio";
+		regulator-name = "vsdc";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+
+		gpios = <&gpiosb 23 GPIO_ACTIVE_HIGH>;
+		gpios-states = <0>;
+		states = <1800000 0x1
+			  3300000 0x0>;
+		enable-active-high;
+	};
+
+	firmware {
+		armada-3700-rwtm {
+			compatible = "marvell,armada-3700-rwtm-firmware", "cznic,turris-mox-rwtm";
+		};
+	};
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pins>;
+	status = "okay";
+};
+
+&eth0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&rgmii_pins>;
+	phy-mode = "rgmii-id";
+	phy-handle = <&phy1>;
+	status = "okay";
+};
+
+&sdhci0 {
+	non-removable;
+	bus-width = <4>;
+	mmc-ddr-1_8v;
+	mmc-hs400-1_8v;
+	sd-uhs-sdr104;
+	marvell,xenon-emmc;
+	marvell,xenon-tun-count = <9>;
+	marvell,pad-type = "fixed-1-8v";
+	vqmmc-supply = <&vsdc_reg>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc_pins>;
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+	mmccard: mmccard@0 {
+		compatible = "mmc-card";
+		reg = <0>;
+	};
+};
+
+&mdio {
+	pinctrl-names = "default";
+	pinctrl-0 = <&smi_pins>;
+	status = "okay";
+
+	phy1: ethernet-phy@1 {
+		reg = <1>;
+	};
+};
-- 
2.47.3


