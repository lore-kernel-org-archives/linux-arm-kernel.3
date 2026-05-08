Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09E5CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 19:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vg3tMOKlftu2srN1puAx1X8UJLNLmmu/EytqTk/ebm4=; b=M/Cb1NbEtjjb3mCuTe1pfr8vV7
	t47i0qT9LKETlgsH5m/6XDebtr/kYyzeWvrOgXDSr7Nnv6UOCqBTVPUrFGoVan7+TifCWf6iDJ2fu
	h4hEmx6gztKml+WCAqCyCVeJbhzlXUhgMSNcXmvAbxmfawco+cEsD84VwAvmM3Ea3VRp3mgC7d+Qk
	gsfn23PfypQadJsJaQvWKrqjYQuFi8er/dHqAjEgaNgm6YfK7NLavTq9T/rtHN6x82a3r3AaNrF6f
	vD+U50TsesDn0tW69N+b3ZiAOTuWqvSxsTl0qAjuWT2MDVtJjYyhOwHzaa7JLdEmmJCgLShp3LjEm
	yWlZcHMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLQvj-00000007MKH-2tOM;
	Fri, 08 May 2026 19:32:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLQvc-00000007MAy-17rz;
	Fri, 08 May 2026 19:32:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3228843EE2;
	Fri,  8 May 2026 19:31:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC91CC4AF0F;
	Fri,  8 May 2026 19:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778268718;
	bh=GvfgvZED8ovEP/sr2vgQj8tDELp0fpA9+wyHVXzY/pY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SlEgM1MKTX9/Aoru0LTvQzcVSWHcYRdoJy+veEC57gumMxYKLhr4ksX63Ak4GyoC3
	 S5kUUe5sz3/AHROL1ds13SdJM8sgVxqVZNSyMoXK6r4fLeQXIWJIBTLEW4M6Sl51nu
	 rU4x6nq9v26cQIf/CtdJMAZegB2/+g+SGflvaabMvGme9sm1rdiEhVcJHHNBBd+Gt5
	 yB79FdQsH1lmy5u30AKMfz0UnQbwZph6uuhh4MZ2ohno49jTOHq293sci3sqSS9C2k
	 Kck6fMf8sgVNnRfSyPsHjJHdDXphhY4muECwuVjxaio8Efk5dCRwxdKozNVyDMZYqG
	 uoBXK+XCoyB4w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3305CD3445;
	Fri,  8 May 2026 19:31:58 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Fri, 08 May 2026 21:31:50 +0200
Subject: [PATCH v4 7/8] arm64: dts: rockchip: add radxa camera 4k on rock
 5b+ cam1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-rk3588-vicap-v4-7-6a6cd6f7c90b@collabora.com>
References: <20260508-rk3588-vicap-v4-0-6a6cd6f7c90b@collabora.com>
In-Reply-To: <20260508-rk3588-vicap-v4-0-6a6cd6f7c90b@collabora.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 =?utf-8?q?=D0=9A=D1=83=D0=B7=D0=BD=D0=B5=D1=86=D0=BE=D0=B2_=D0=9C=D0=B8=D1=85=D0=B0=D0=B8=D0=BB?= <mai.kuznetsov.misha@gmail.com>, 
 Charalampos Mitrodimas <charmitro@posteo.net>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778268716; l=4388;
 i=michael.riesch@collabora.com; s=20260428; h=from:subject:message-id;
 bh=RftYePeWXUUid7upV6ga5pVg+NAmwZ320HDRp8cMYOc=;
 b=LqOkFNrCoJdcRThCXR/xB4esf5SUk7ytNyot5nc084Lf6fh7Z/KbQMco0QdaBEMTzgtrOkRhk
 s2HmFlLwVAnDr8KSOJcaIg1mN30QX+J39A+Ntb1Qjcx1zhU6bfrlqIE
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=tAbmpPTE1MELYweXqqDU40fa18uCO6s32GJL/RzyW2Y=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20260428
 with auth_id=759
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_123204_396077_A5CD9366 
X-CRM114-Status: GOOD (  14.39  )
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
Reply-To: michael.riesch@collabora.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Michael Riesch <michael.riesch@collabora.com>

Add device tree overlay for the Radxa Camera 4K (featuring the Sony IMX415
image sensor) to applied on the Radxa ROCK 5B+ CAM1 port.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/boot/dts/rockchip/Makefile              |  4 +-
 .../rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso      | 99 ++++++++++++++++++++++
 2 files changed, 102 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index d4ff476fb9814b18c74c6d59d73cf5d8e6ee9ca7..761d82b4f4f2ac7f0f4ba5e1f94f495b2160a059 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -207,6 +207,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-ep.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-srns.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-plus.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-plus-radxa-cam4k-cam0.dtbo
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-plus-radxa-cam4k-cam1.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5t.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-tiger-haikou.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-tiger-haikou-video-demo.dtbo
@@ -324,7 +325,8 @@ rk3588-rock-5b-pcie-srns-dtbs := rk3588-rock-5b.dtb \
 
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-plus-radxa-4k-cam.dtb
 rk3588-rock-5b-plus-radxa-4k-cam-dtbs := rk3588-rock-5b-plus.dtb \
-	rk3588-rock-5b-plus-radxa-cam4k-cam0.dtbo
+	rk3588-rock-5b-plus-radxa-cam4k-cam0.dtbo \
+	rk3588-rock-5b-plus-radxa-cam4k-cam1.dtbo
 
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-tiger-haikou-haikou-video-demo.dtb
 rk3588-tiger-haikou-haikou-video-demo-dtbs := rk3588-tiger-haikou.dtb \
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..96b8df4ed3540df69e997aa9967168c4249dbf52
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Device tree overlay for the Radxa Camera 4K attached to the CAM1 port of
+ * the Radxa ROCK 5B+.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/rockchip,rk3588-cru.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+
+&{/} {
+	savdd_cam1: regulator-savdd-cam1 {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <2900000>;
+		regulator-max-microvolt = <2900000>;
+		regulator-name = "savdd_cam1";
+		vin-supply = <&vcc_3v3_s3>;
+	};
+
+	sdvdd_cam1: regulator-sdvdd-cam1 {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <1100000>;
+		regulator-max-microvolt = <1100000>;
+		regulator-name = "sdvdd_cam1";
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	siovdd_cam1: regulator-siovdd-cam1 {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-name = "siovdd_cam1";
+		vin-supply = <&vcc_3v3_s3>;
+	};
+};
+
+&i2c4 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	cam1_imx415: camera-sensor@1a {
+		compatible = "sony,imx415";
+		reg = <0x1a>;
+		assigned-clocks = <&cru CLK_MIPI_CAMARAOUT_M4>;
+		assigned-clock-rates = <37125000>;
+		avdd-supply = <&savdd_cam1>;
+		clocks = <&cru CLK_MIPI_CAMARAOUT_M4>;
+		dvdd-supply = <&sdvdd_cam1>;
+		orientation = <2>; /* External */
+		ovdd-supply = <&savdd_cam1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam1_rstn &mipim0_camera4_clk>;
+		reset-gpios = <&gpio2 RK_PB0 GPIO_ACTIVE_LOW>;
+
+		port {
+			cam1_imx415_output: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <445500000>;
+				remote-endpoint = <&csi4_input>;
+			};
+		};
+	};
+};
+
+&pinctrl {
+	cam1 {
+		cam1_rstn: cam1-rstn-pinctrl {
+			rockchip,pins = <2 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&csi4 {
+	status = "okay";
+};
+
+&csi4_in {
+	csi4_input: endpoint {
+		data-lanes = <1 2 3 4>;
+		link-frequencies = /bits/ 64 <445500000>;
+		remote-endpoint = <&cam1_imx415_output>;
+	};
+};
+
+&csi_dphy1 {
+	status = "okay";
+};
+
+&vicap {
+	status = "okay";
+};
+
+&vicap_mmu {
+	status = "okay";
+};

-- 
2.47.3



