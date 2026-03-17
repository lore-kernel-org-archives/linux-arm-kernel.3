Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F240F3382B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 09:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wgp/hmGMlNG35tc02fjAyd4r9bAmalYlad16P3Lmc7w=; b=R70FONFdz8JxaATGd3x4CR/FYX
	seC41qZkrvwtML2s2YlrZmlaoixhhsKgTX24fNDIdFaqrfuP1w+hamJ0KrIGU18kfq9SpLTk0hprj
	DY1xuq8acSAqfCd3SFqcgTfrCOdc3DiJG3YCtbNWbJ1Mc2L9C7Yc47IcZj/Wt139jQ1GxHpKmHiaV
	oGyh2ar29MAmqyWI7za/SJu/dbaYsBee65CTp6vRCfZteRCD4MWkALHUtKl1y/TdbhzEko8fIGjhx
	Rl0+a6ahEk5K8NXWyK9197n35Kw9aZqCmRJrzeuW7yh7Cle16M8UaeU85ruOHymF3fFLcClNIrl15
	C4w873LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QnC-00000005tAB-05Tn;
	Tue, 17 Mar 2026 09:32:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Qmw-00000005smv-0EP4;
	Tue, 17 Mar 2026 09:32:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=Wgp/hmGMlNG35tc02fjAyd4r9bAmalYlad16P3Lmc7w=; b=j5+nBzDDbhs3/2Ezq9Pqv5Ng90
	45KcguRaw451BxjO05PpBx1qVQzC41Z4PoPgveGs81AOC2kuZsXnQAD6L7uc8uyE0xkzygQ/iZUXU
	4Yx/OTbCXbHO1ifmzenXxNRgXIf/dWOL9YatmpxCKj/9MNFoH/1upTqsMt0URsnQr1qhDVaWvQqV1
	DFLNkcHvy0MJDAfz1xpPCNQwUGyxsKApG0HsCyOU+TDvnC6WV+lMX8LL5TAhCyAm/aScQmr9XbTl/
	n9fWXaqugxtq3jvF+mS4oMO2eyrOqQBz0Y8baK3t4noIrtCJQXahFqwxUY1KxpdXcvlNqmJ+9vyQq
	N0KrY6Dg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Qmq-00000008Y0p-0IIa;
	Tue, 17 Mar 2026 09:32:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8E8C9440DE;
	Tue, 17 Mar 2026 09:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 55AA6C2BCF6;
	Tue, 17 Mar 2026 09:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773739944;
	bh=CZsXkEHFXnoM92VhYBC6VubXyqiIeX3jIhqQt92988s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HwbF9lkQNTrD/N/Kd1qh7DRndhGfGT+RZLzOpFo0MqfJDWReHFcB615qi+7+RxQRv
	 1NQaqlr6+JCsFFVRygpK6a5EVxrAsQdw0abHvW92bORb+9K93WCw4dW2FLLk9PrJfV
	 grYwryqzXgoVGT4Qsp38UIX+pUgN7JmE4oYU/bWO9LLJ/vtv0fLFBGobJhuTXf9d2L
	 97P5L0XQ+LEL7bsrK4TS6Bu2epz8E14f3L+w0dsjq1ZZP4zineZmU3DK1HSJPUOYsi
	 60bd50I6l4pmNfEScb18ZX5VyNXCumdun3IcbXCborEZKSuw8T6WZ8oSXsRGO6E9nn
	 AyGG06moVRfnA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49737F33825;
	Tue, 17 Mar 2026 09:32:24 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Tue, 17 Mar 2026 10:32:25 +0100
Subject: [PATCH v2 7/9] arm64: dts: rockchip: add radxa camera 4k on rock
 5b+ cam0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-rk3588-vicap-v2-7-77de5ee9048e@collabora.com>
References: <20250430-rk3588-vicap-v2-0-77de5ee9048e@collabora.com>
In-Reply-To: <20250430-rk3588-vicap-v2-0-77de5ee9048e@collabora.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 =?utf-8?q?=D0=9A=D1=83=D0=B7=D0=BD=D0=B5=D1=86=D0=BE=D0=B2_=D0=9C=D0=B8=D1=85=D0=B0=D0=B8=D0=BB?= <mai.kuznetsov.misha@gmail.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773739942; l=3957;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=0IGxS8JbtLH7trkBy9V2Ur/nAvpqj7WKMLLd/LMBhQs=;
 b=bjZl9IwqOmybyyMWJZUOQLn6j/43QSGHZEYxDQkRk2vqof/aQ498l5lF1T9jzTcxJH+/d4Nyt
 UGZv3PZw0vbDOPVfoRLY7uuaE72p0/kd3/hrrF3lOfaed2vOSeUsVbj
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_093228_631280_D14BB116 
X-CRM114-Status: GOOD (  12.82  )
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
 .../rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso      | 89 ++++++++++++++++++++++
 2 files changed, 94 insertions(+)

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
index 000000000000..c107c74c2188
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso
@@ -0,0 +1,89 @@
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
+	vcc_cam0: regulator-vcc-cam0 {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio1 RK_PB0 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam0_power0_en>;
+		regulator-name = "vcc_cam0";
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
+		avdd-supply = <&vcc_cam0>;
+		clocks = <&cru CLK_MIPI_CAMARAOUT_M3>;
+		dvdd-supply = <&vcc_cam0>;
+		orientation = <2>; /* External */
+		ovdd-supply = <&vcc_cam0>;
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
+		cam0_power0_en: cam0-power0-en-pinctrl {
+			rockchip,pins = <1 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
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



