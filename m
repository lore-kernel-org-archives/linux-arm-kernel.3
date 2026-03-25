Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060C6106B502
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 11:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d1+gakuIER7rLDpVP7LjzeUEQnGDRJM1SA5+gowhf4U=; b=PaaV6OXSMYrRr3jiN1bTqejP+s
	xyjViYj9hWk91cWD6nzqrsuqBnQxhvfV1ObYksZsyyqh4/qSEA4vRTSEZcirBS7TxWbN+UXnRyscM
	/xBWaypCoB4XLFlS44xObambBE2qqO229GyuxmIMLpuIjBWE/hzgvbYwtt2rMBQhyYv7svomGdaSj
	+bz72ULYRO/bzhWIIJcJO9Cob4ViNGyXAVHShb96bBK8JgRGs4PowqTIXDTjgKYGCybf/tMQ5aWYS
	M0mWdPr1JlyItOmOKmfLT0nCJSTD6rlhf+kFmBFjFxLAbnrMXphQZX6/gQ6MVjqR2LFDndwf1v1Az
	NkhxalwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Mlw-00000003JPd-1Gtn;
	Wed, 25 Mar 2026 11:51:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5MlT-00000003J3z-1fzG;
	Wed, 25 Mar 2026 11:51:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1321844596;
	Wed, 25 Mar 2026 11:51:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E47CFC2BCB0;
	Wed, 25 Mar 2026 11:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774439470;
	bh=vILnCrw2ksmIvwdEnXWi7lzwWsPzwbWFiRdg9Ti2oeE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uPYRLC8pXppgNIejI+e1ytfUqD/VNPG9fe2B9Gbox2B2exm6E+eHXHDUyvpyWfp0A
	 MaL8hqc9x8+enz8fW3sV/qCQEA1Kt/0nX+FojaEZOAcYp/tfu//N/r54uXDi7YB4sZ
	 wZTmQ17seiOdb+ICHqKb/70SZy1DKB/zUVuoM5++IhP1sJ6yLxvSskDPyMrHTkl/Xc
	 5SpXR3SqA3tUexFSQXfQnGlM8KKMJklEWWU3UYUjRCwDTN+rzuidyI83u2mnWS1JeG
	 CZ/Vyk+45dznkq7mXTBAXKv+eWvRDaYLzQS7fJSrj4LmiTIWIQvG8erwlyQUZ1wDwE
	 72t8845cIreZg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D531099B5F;
	Wed, 25 Mar 2026 11:51:09 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Wed, 25 Mar 2026 12:51:12 +0100
Subject: [PATCH v3 7/9] arm64: dts: rockchip: add radxa camera 4k on rock
 5b+ cam0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-rk3588-vicap-v3-7-e38e428868cc@collabora.com>
References: <20250430-rk3588-vicap-v3-0-e38e428868cc@collabora.com>
In-Reply-To: <20250430-rk3588-vicap-v3-0-e38e428868cc@collabora.com>
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
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774439467; l=4268;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=0nNnhdbQ217tvNoFygSbOgCx2i2xX88Dl6UgQ4VtEnw=;
 b=5ilQPTQWmZ99ebKVzffeyrebJN7Nw+7AN6tvp9QYvsAJ426ZbQNHokkzk9KmgXcWwxi1Fp7ga
 C8auWvlCIdLAWizQMsKmmeqEHBc3+COC7fZwWSlK9IAwRasW/ePnmdJ
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_045111_538464_AE5C1CF5 
X-CRM114-Status: GOOD (  13.38  )
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

Add device tree overlay for the Radxa Camera 4K (featuring the
Sony IMX415 image sensor) to applied on the Radxa ROCK 5B+
CAM0 port.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/boot/dts/rockchip/Makefile              |  5 ++
 .../rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso      | 99 ++++++++++++++++++++++
 2 files changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 4d384f153c13..77c587f43dda 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -199,6 +199,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-ep.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-srns.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-plus.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-plus-radxa-cam4k-cam0.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5t.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-tiger-haikou.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-tiger-haikou-video-demo.dtbo
@@ -298,6 +299,10 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-srns.dtb
 rk3588-rock-5b-pcie-srns-dtbs := rk3588-rock-5b.dtb \
 	rk3588-rock-5b-pcie-srns.dtbo
 
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-plus-radxa-4k-cam.dtb
+rk3588-rock-5b-plus-radxa-4k-cam-dtbs := rk3588-rock-5b-plus.dtb \
+	rk3588-rock-5b-plus-radxa-cam4k-cam0.dtbo
+
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-tiger-haikou-haikou-video-demo.dtb
 rk3588-tiger-haikou-haikou-video-demo-dtbs := rk3588-tiger-haikou.dtb \
 	rk3588-tiger-haikou-video-demo.dtbo
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso
new file mode 100644
index 000000000000..ee9ecf68a886
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Device tree overlay for the Radxa Camera 4K attached to the CAM0 port of
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
+	savdd_cam0: regulator-savdd-cam0 {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <2900000>;
+		regulator-max-microvolt = <2900000>;
+		regulator-name = "savdd_cam0";
+		vin-supply = <&vcc_3v3_s3>;
+	};
+
+	sdvdd_cam0: regulator-sdvdd-cam0 {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <1100000>;
+		regulator-max-microvolt = <1100000>;
+		regulator-name = "sdvdd_cam0";
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	siovdd_cam0: regulator-siovdd-cam0 {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-name = "siovdd_cam0";
+		vin-supply = <&vcc_3v3_s3>;
+	};
+};
+
+&i2c3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	imx415: camera-sensor@1a {
+		compatible = "sony,imx415";
+		reg = <0x1a>;
+		assigned-clocks = <&cru CLK_MIPI_CAMARAOUT_M3>;
+		assigned-clock-rates = <37125000>;
+		avdd-supply = <&savdd_cam0>;
+		clocks = <&cru CLK_MIPI_CAMARAOUT_M3>;
+		dvdd-supply = <&sdvdd_cam0>;
+		orientation = <2>; /* External */
+		ovdd-supply = <&siovdd_cam0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam0_rstn &mipim0_camera3_clk>;
+		reset-gpios = <&gpio4 RK_PA0 GPIO_ACTIVE_LOW>;
+
+		port {
+			imx415_output: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <445500000>;
+				remote-endpoint = <&csi2_input>;
+			};
+		};
+	};
+};
+
+&pinctrl {
+	cam0 {
+		cam0_rstn: cam0-rstn-pinctrl {
+			rockchip,pins = <4 RK_PA0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&csi2 {
+	status = "okay";
+};
+
+&csi2_in {
+	csi2_input: endpoint {
+		data-lanes = <1 2 3 4>;
+		link-frequencies = /bits/ 64 <445500000>;
+		remote-endpoint = <&imx415_output>;
+	};
+};
+
+&csi_dphy0 {
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
2.39.5



