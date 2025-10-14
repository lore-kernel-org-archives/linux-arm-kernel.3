Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7824CCD192
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 13:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cRY5livy7pHNU5JsFg0t/QOyHzOWq96lXeQUD+AHdP0=; b=utcB2MA4hdWd+5XI1HD8pLsqyy
	fYdl0hOG08JJkGxFITksUFqSVZwCjec9AJp+sDB3uTF3pOblz8CpTzqGuY7Q6yZrOl7bnxoIxcuzB
	SFHeUQ6tPK3J2qmvTp33llkiwbNw4AXinirqQf0m8UjIp9W8ye4kPm+GoYJcu8cDD5Dd39xXakMwN
	UnQJwNnZ4Axg6nUmQ1rG+gvfmSXZX5rR/vQofwC02f+v2+/pUr55t4F9xpQ1D64lcZz7/jpK1K4X9
	dbVe1jyoD8o46B6UVBPtR8ZfSo7tCXsXSUsgEzDUxbzvvDhKIJuRTPk0spXfI8EDzzbqiQgJtYlnZ
	x2SRwjcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8egZ-0000000GMLd-3vIG;
	Tue, 14 Oct 2025 13:03:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8eg1-0000000GLSj-0dDG;
	Tue, 14 Oct 2025 13:02:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 25BE74A097;
	Tue, 14 Oct 2025 13:02:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F038EC113D0;
	Tue, 14 Oct 2025 13:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760446967;
	bh=kg7jF/g8mf1TOHkSmwqvBnJWrqB9/61uIJ1LyTZh5NM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QD59k0xxS1BfKzqU7DrEZmmXCwIMby9vjtbZu3YGvjCW3ORSkdiT2ILK6z58Bg7Eq
	 5t6/4XkPi6CApllRqGBx3WEl5gAwjmSScqHc+P67bLbt8uNdUuAw2+QimX39bFAEGU
	 hzrBgZD4+aWWaxRzZO2O252Zyw0KRRIBaWm6B/JfP0QWogwzlDNVLfjp82JSTDcMjQ
	 ML68GVpeva5mZU3m3gkjxdQqro8a1yh7EkE7OvmkHgG2FVbBQb1oXxiBAcN6c7oUyc
	 v7bx3oOJc+VQhD2v846XxI4ho22C0BXL3l9AsXJIYp/ElLus4GKjepAJ0Y7gPQsIVM
	 C6Ez7Z9+fR1UA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E475FCCD195;
	Tue, 14 Oct 2025 13:02:46 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Tue, 14 Oct 2025 15:02:04 +0200
Subject: [PATCH v12 18/18] arm64: dts: rockchip: add overlay for radxa
 camera 8m
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v12-18-c6dbece6bb98@collabora.com>
References: <20240220-rk3568-vicap-v12-0-c6dbece6bb98@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v12-0-c6dbece6bb98@collabora.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760446963; l=3860;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=s8ffrmhVqarbGXNmyNRzp/PbAgcLyEWIBK3xolazp2A=;
 b=fvfo9TJNZHxhbS4B5qJgnlYi59MIORohISYnTHbyYsDFCfdJU9cWmnaLvd2Cv0BqSzR7kUZyr
 ggyw6q/zBhcAUVfLTPPPB33SrjoXSQ2r6psno90Zq9tNIC5CFvf8ejy
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_060253_307131_2A17AD4F 
X-CRM114-Status: GOOD (  14.47  )
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

Add a device tree overlay for the Radxa Camera 8M featuring the Sony
IMX219 image sensor. The sensor is connected to the RK3568 VICAP MIPI
CSI-2 port, since as at the time of writing this there is no mainline
support for the RK3568 ISP.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/boot/dts/rockchip/Makefile              |  5 ++
 .../dts/rockchip/rk3568-rock-3a-radxa-cam8m.dtso   | 90 ++++++++++++++++++++++
 2 files changed, 95 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index ad684e3831bc..d6b969a0dab9 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -146,6 +146,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-qnap-ts433.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-radxa-e25.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-roc-pc.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-rock-3a.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-rock-3a-radxa-cam8m.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-rock-3b.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-display-vz.dtbo
@@ -243,6 +244,10 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-rockpro64-v2-screen.dtb
 rk3399-rockpro64-v2-screen-dtbs := rk3399-rockpro64-v2.dtb \
 	rk3399-rockpro64-screen.dtbo
 
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-rock-3a-radxa-8m-cam.dtb
+rk3568-rock-3a-radxa-8m-cam-dtbs := rk3568-rock-3a.dtb \
+	rk3568-rock-3a-radxa-cam8m.dtbo
+
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-vz-2-uhd.dtb
 rk3568-wolfvision-pf5-vz-2-uhd-dtbs := rk3568-wolfvision-pf5.dtb \
 	rk3568-wolfvision-pf5-display-vz.dtbo \
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3a-radxa-cam8m.dtso b/arch/arm64/boot/dts/rockchip/rk3568-rock-3a-radxa-cam8m.dtso
new file mode 100644
index 000000000000..4db177b1c701
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3a-radxa-cam8m.dtso
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Device tree overlay for the Radxa Camera 8M attached to the CSI port of
+ * the Radxa ROCK 3A.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+
+&{/} {
+	clk_cam: clock-cam {
+		compatible = "fixed-clock";
+		clock-frequency = <24000000>;
+		clock-output-names = "clk_cam";
+		#clock-cells = <0>;
+	};
+
+	vcc_camera: regulator-vcc-camera {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio4 RK_PD2 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&camera_power_en>;
+		regulator-always-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-name = "vcc_camera";
+		vin-supply = <&vcc_cam>;
+	};
+};
+
+&i2c5 {
+	#address-cells = <1>;
+	clock-frequency = <100000>;
+	#size-cells = <0>;
+	status = "okay";
+
+	imx219: camera-sensor@10 {
+		compatible = "sony,imx219";
+		reg = <0x10>;
+		clocks = <&clk_cam>;
+		clock-names = "xclk";
+		VANA-supply = <&vcc_camera>;
+		VDIG-supply = <&vcc_camera>;
+		VDDL-supply = <&vcc_camera>;
+
+		port {
+			imx219_output: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <456000000>;
+				remote-endpoint = <&csi_input>;
+			};
+		};
+	};
+};
+
+&pinctrl {
+	cam {
+		camera_power_en: camera-power-en-pinctrl {
+			rockchip,pins = <4 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&csi {
+	status = "okay";
+};
+
+&csi_dphy {
+	status = "okay";
+};
+
+&csi_in {
+	csi_input: endpoint {
+		data-lanes = <1 2>;
+		link-frequencies = /bits/ 64 <456000000>;
+		remote-endpoint = <&imx219_output>;
+	};
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
2.39.5



