Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49402CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 12:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7zTVrSZ7ka1NbJa03WB5w8dNmqOB7b3+UY9hP2Kz2EQ=; b=q5ly2mt5M6FKVukkzvEMMaWemL
	B6XjlfoOZN8KsAvxwRTfBlLZXm9VrcGiSahuxkVEri27UAEOyPbod2ficDoaX7sRIRcXaPNP9/D1f
	0cFuDXQgB/2v7lXyVghED0Tl4wrnqZuy45LY5ncAcZvJgyePuLPP23gD44wZ6VkLsWbNx2QH07oAu
	2HumKFRnsy8GiAVDx91W4MAwY18fxx+dECpgjwn+/WxdGFdFPFlYLnACYiGq8E88Fdfr671ZCAHw5
	MqhHJg4ySX8udFh+w4Ajyyj8RaqtuderLDNpb/ase9A7GH0Yao/Zm4Q5tQzzx7gnpEavM+VCctqZ2
	apsJ4faA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCHHv-00000009Rx2-011P;
	Fri, 24 Oct 2025 12:52:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCHGh-00000009QL5-3CDc;
	Fri, 24 Oct 2025 12:51:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6AD1B4B518;
	Fri, 24 Oct 2025 12:51:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C46DC116D0;
	Fri, 24 Oct 2025 12:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761310297;
	bh=D9NOQFttLM44MLx09Zex9E0ZU1bSnzyvmGIvjIHg3PU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NzVtNQfdU4U5WsCNPN5cRDnQX5SqAvT6oe3v9i2qF0cTmJaW18BphDvxD3nKBYlHW
	 61qNxslkIIMyKV8YveixWl4zP4fAe+t93KZFBlgQJQm7clBdtWnWP2OurrmZJru36y
	 yBiKKCG5PXZ6hwK8/Ho6Ph++wdkaLuvEFVzFozfrOsz/B9PGFlMh2kyIa9w5WQiWi3
	 1+M4+7C6E+5p+hb3DKoD4zl7TyuIKED4d1hz85ZKruBEgN7yhK/lonDPQ97DsLIoUc
	 AckVBMk6zhI0adAD40I+aNAvvD9WClXrRLBfI9+pB+cPmUV5YDdo4rLugZpnbSwiMj
	 FXn7UU/oZHK9w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 302DFCCF9E0;
	Fri, 24 Oct 2025 12:51:37 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Fri, 24 Oct 2025 14:51:47 +0200
Subject: [PATCH v14 18/18] arm64: dts: rockchip: add radxa camera 8m on
 rock 3a csi port
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v14-18-b38b6da0fc80@collabora.com>
References: <20240220-rk3568-vicap-v14-0-b38b6da0fc80@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v14-0-b38b6da0fc80@collabora.com>
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
 Michael Riesch <michael.riesch@collabora.com>, Chen-Yu Tsai <wens@csie.org>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761310293; l=4423;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=8+gsoG6dBtp0EaQEhGBr2hG0N8BoIt7Rya8dykcaVJk=;
 b=QkRDoMhQXlaFfrn9H71B3EP+aJ/ZFPGMPArrb0cZaFufBhfhco4GYIEBu49GXqLJFY4wL0S/t
 PDmNnpkWsOTAw30EHsw4FTe/oYnr3pBtVS8aiMB9hBhAcr/1fSkeQwf
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_055143_868088_289390C9 
X-CRM114-Status: GOOD (  14.21  )
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

Add a device tree overlay for the Radxa Camera 8M (featuring the
Sony IMX219 image sensor) to be connected to the Radxa ROCK 3A CSI
port.

The image sensor is connected to the RK3568 VICAP MIPI CSI-2
port, since as at the time of writing this there is no mainline
support for the RK3568 ISP.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/boot/dts/rockchip/Makefile              |   5 +
 .../dts/rockchip/rk3568-rock-3a-radxa-cam8m.dtso   | 103 +++++++++++++++++++++
 2 files changed, 108 insertions(+)

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
index 000000000000..3aa1ffdc22d8
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3a-radxa-cam8m.dtso
@@ -0,0 +1,103 @@
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
+	clk_camera: clock-camera {
+		compatible = "fixed-clock";
+		clock-frequency = <24000000>;
+		clock-output-names = "clk_camera";
+		#clock-cells = <0>;
+	};
+
+	vana_camera: regulator-vana-camera {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		regulator-name = "vana_camera";
+		vin-supply = <&vcc_cam>;
+	};
+
+	vddl_camera: regulator-vddl-camera {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-name = "vddl_camera";
+		vin-supply = <&vcc_cam>;
+	};
+
+	vdig_camera: regulator-vdig-camera {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-name = "vdig_camera";
+		vin-supply = <&vcc_cam>;
+	};
+};
+
+&i2c5 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	imx219: camera-sensor@10 {
+		compatible = "sony,imx219";
+		reg = <0x10>;
+		clocks = <&clk_camera>;
+		clock-names = "xclk";
+		pinctrl-names = "default";
+		pinctrl-0 = <&camera_reset>;
+		reset-gpios = <&gpio4 RK_PD2 GPIO_ACTIVE_HIGH>;
+		VANA-supply = <&vana_camera>;
+		VDDL-supply = <&vddl_camera>;
+		VDIG-supply = <&vdig_camera>;
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
+		camera_reset: camera-reset-pinctrl {
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



