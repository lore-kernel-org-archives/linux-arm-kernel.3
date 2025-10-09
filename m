Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A3BCCD18A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 22:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mz4zW/8ybo2FVuF3EvnWzYzX2g9pikplV9oTmQ+OqzI=; b=JVwLWYsFYaXX3IOQ6ec4SYtgsQ
	iDHyOFHV4HE8qB/X61Ql2L2deJF6kBheARMBBLToXrjNFP34y/JCxTljklyzAabL6jyQLSiS51tXi
	S7VHVfzhacMmnbVMBNXzMtZCFuZyp9AHdrTbJJQTxwrDU0JKS8WXL5FxQaxmwnXKsts8cvIpMse0J
	m5fVeImnbIQ3ELJd26iQLPBLkGCcpuFPLuo6bHmsv74GxfvaIDQn2ZqyvJ+tp6h9DHvJ3Po9YnVGc
	fhFZNboyd/TuvPq1sUMUI0JCs3XK24uBAsL0950NmN/MJhO01POA2/dYdAp7puIpHjLiKojS8WOuV
	cuK68CzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6zTc-00000007GpN-2cG1;
	Thu, 09 Oct 2025 22:51:12 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6zTV-00000007Gnt-46MF;
	Thu, 09 Oct 2025 22:51:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=Mz4zW/8ybo2FVuF3EvnWzYzX2g9pikplV9oTmQ+OqzI=; b=wbVu8QlhXoKKI/AWKJVvhQ5bRf
	yd7Bb9B0qyEUjyBj4N4QNkgUAkbsZeeaaV+rD45tbd9pDvehoGUuPMpQSBAJLuQ/O7tNIhzfOjpwj
	iojH1TcJwBlHsG2Ecae5PIwyBAc4QbuLRAd0PVoFkjC+2NV2zPl+gJLUobjZE9t8Yh/WvuN0wBkNe
	SMJtAI06HQglZsJn3r3gXjJnTVQ5St0FJAk1eyDUZksHC0WAxRlEGPAnxAt+fudhkEg/Nc8dzQ0xD
	9t+mStmY/FejRRzslAoiKR9srTohjg6NGxV399a1LhYc8fbuEfZeVAOM0HV2aY7VpFY2XmdPwhfdi
	iTVkQmGw==;
Received: from i53875bdd.versanet.de ([83.135.91.221] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1v6zTT-0007iZ-54; Fri, 10 Oct 2025 00:51:03 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quentin.schulz@cherry.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	damon.ding@rock-chips.com,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH v4 2/2] arm64: dts: rockchip: add RK3588 DP carrier from Theobroma Systems
Date: Fri, 10 Oct 2025 00:50:50 +0200
Message-ID: <20251009225050.88192-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251009225050.88192-1-heiko@sntech.de>
References: <20251009225050.88192-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_155106_038952_71D1D31A 
X-CRM114-Status: GOOD (  18.11  )
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

The DisplayPort carrier is a very simple baseboard only providing serial,
ethernet and a displayport output.

But its main functionality is that it routes the Analogix eDP controller
to this DisplayPort output, which allows to test that controller simply
by hooking it up to a suitable monitor.

The Analogix-DP controller supports eDP 1.3 and DP 1.2, so can drive
both eDP displays as well as full DP monitors. It does not support DP+
so passive DP-to-HDMI adapters won't work.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
Link: https://lore.kernel.org/r/20250723190904.37792-3-heiko@sntech.de
---
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../rk3588-tiger-displayport-carrier.dts      | 119 ++++++++++++++++++
 2 files changed, 120 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-tiger-displayport-carrier.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index ad684e3831bc..3a1739b8f167 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -188,6 +188,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-ep.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-srns.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-plus.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5t.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-tiger-displayport-carrier.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-tiger-haikou.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-tiger-haikou-video-demo.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-toybrick-x0.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-tiger-displayport-carrier.dts b/arch/arm64/boot/dts/rockchip/rk3588-tiger-displayport-carrier.dts
new file mode 100644
index 000000000000..c14718bc4fda
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588-tiger-displayport-carrier.dts
@@ -0,0 +1,119 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2024 Cherry Embedded Solutions GmbH
+ */
+
+/dts-v1/;
+#include <dt-bindings/soc/rockchip,vop2.h>
+#include "rk3588-tiger.dtsi"
+
+/ {
+	model = "Theobroma Systems RK3588-Q7 SoM on Tiger Displayport Carrier v1";
+	compatible = "tsd,rk3588-tiger-displayport-carrier", "tsd,rk3588-tiger", "rockchip,rk3588";
+
+	aliases {
+		ethernet0 = &gmac0;
+	};
+
+	chosen {
+		stdout-path = "serial2:115200n8";
+	};
+
+	dp-connector {
+		compatible = "dp-connector";
+		dp-pwr-supply = <&vcc3v3_baseboard>;
+		label = "dp0";
+		type = "full-size";
+
+		port {
+			dp_con_in: endpoint {
+				remote-endpoint = <&edp0_out_con>;
+			};
+		};
+	};
+
+	vcc3v3_baseboard: regulator-vcc3v3-baseboard {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3_baseboard";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc5v0_baseboard>;
+	};
+
+	vcc5v0_baseboard: regulator-vcc5v0-baseboard {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_baseboard";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+};
+
+&edp0 {
+	/*
+	 * Q7_DP_HPD# but Q7_HDMI_HPD# could be used too
+	 *
+	 * HPD handling in the Analogix-DP not in dp-connector, because
+	 * "Detecting the monitor for DisplayPort targets is more
+	 *  complicated than just reading the HPD pin level" so the
+	 * "actual DP driver (should) perform detection".
+	 * For reference see commit cb640b2ca546 ("drm/bridge:
+	 * display-connector: don't set OP_DETECT for DisplayPorts")
+	 * in the Linux-kernel.
+	 */
+	hpd-gpios = <&gpio4 RK_PB5 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&edp0_hpd_l>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&edp0_in {
+	edp0_in_vp2: endpoint {
+		remote-endpoint = <&vp2_out_edp0>;
+	};
+};
+
+&edp0_out {
+	edp0_out_con: endpoint {
+		remote-endpoint = <&dp_con_in>;
+	};
+};
+
+&gmac0 {
+	status = "okay";
+};
+
+&hdptxphy0 {
+	status = "okay";
+};
+
+&pinctrl {
+	edp0 {
+		edp0_hpd_l: edp0-hpd-l-pin {
+			rockchip,pins = <4 RK_PB5 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+};
+
+&uart2 {
+	pinctrl-0 = <&uart2m2_xfer>;
+	status = "okay";
+};
+
+&vop {
+	status = "okay";
+};
+
+&vop_mmu {
+	status = "okay";
+};
+
+&vp2 {
+	vp2_out_edp0: endpoint@ROCKCHIP_VOP2_EP_EDP0 {
+		reg = <ROCKCHIP_VOP2_EP_EDP0>;
+		remote-endpoint = <&edp0_in_vp2>;
+	};
+};
-- 
2.47.2


