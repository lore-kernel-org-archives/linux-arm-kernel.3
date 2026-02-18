Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B1DE9A047
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 10:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RzBCBT+BBch20+9ZdWz9ApEm8yAExPHjA+GZ3/8W7E0=; b=BC32CkujkOIjLmX16u+pAiezm8
	PM+urjnshNmowLvyp4Nij0KIxsFZl+8QRTEFQ7U+G2Zc4/RULzlIsWuv5jL6wF2d9KwtoaF/4rg/d
	BLH8W+LsMwOy2vaGpM2YK80ImCI5nyMcSxeK+Zk2O+6urxZz3vx/9PJ8tizJTzfepY21KIPg9uxAI
	koFTPvcVOqG//WG+FcLmmt26NyGQDef4b8QTTweiNAKU/FUp0OAh+EXi8g0nKVidMvhplSAGs02Bx
	BVFd+G9cChjZ+sZVmmtnVEeQ+k1hEAVAQo7gzU6Cqu85WlpPPZMNvFUVtqgV8IZ5IvDZDOUG3lrW5
	12a8Y/CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsegs-00000009deu-0lgd;
	Wed, 18 Feb 2026 10:21:54 +0000
Received: from pouet.aliel.fr ([65.21.61.41] helo=courrier.aliel.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsegp-00000009dct-2P4R;
	Wed, 18 Feb 2026 10:21:52 +0000
Received: from localhost.localdomain (2a02-842b-8136-0001-b865-661D-5641-e7C6.rev.sfr.net [IPv6:2a02:842b:8136:1:b865:661d:5641:e7c6])
	by courrier.aliel.fr (Postfix) with ESMTPSA id CC8B24CB4C;
	Wed, 18 Feb 2026 10:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1771410108;
	bh=SN9ME6m2+GqvYXiK6+XH80iCtYwqSTRmIwev20M6/PE=;
	h=From:To:Cc:Subject:Date;
	b=IQQus37S4zLniFCNUT2mE/4TTWQ7NC5uMt3gnh34DunJki8S6XB1YNXta90q8KvWS
	 VFm5TjfVi6lbhWaojPDHaKt9VKR8ecgMw0dYJLe6Nw2E9DvZdH+cj7sX1LbSdXyHbv
	 1we0do6+0F0awkOJUwNq/Z3XP/JNfhD/42yOexZU=
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
To: linux-amlogic@lists.infradead.org
Cc: Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] arm64: dts: amlogic: Add EMMC for T7 khadas VIM4
Date: Wed, 18 Feb 2026 11:21:22 +0100
Message-ID: <20260218102124.35669-1-linux-kernel-dev@aliel.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_022151_764238_780BD50A 
X-CRM114-Status: UNSURE (   8.30  )
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

Add EMMC support for Amlogic T7 Khadas VIM4 device dts.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index fffdab96b12e..fbc43a307015 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -15,6 +15,10 @@ aliases {
 		serial0 = &uart_a;
 	};
 
+	chosen {
+		stdout-path = "serial0:921600n8";
+	};
+
 	memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x0 0x2 0x0>; /* 8 GB */
@@ -45,6 +49,42 @@ xtal: xtal-clk {
 		#clock-cells = <0>;
 	};
 
+	dc_in: regulator-dc-in {
+		compatible = "regulator-fixed";
+		regulator-name = "DC_IN";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	vsys_3v3: regulator-vsys-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VSYS_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&dc_in>;
+		regulator-always-on;
+	};
+
+	vcc_3v3: regulator-vcc-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vsys_3v3>;
+		regulator-always-on;
+		/* FIXME: actually controlled by VDDCPU_B_EN */
+	};
+
+	emmc_1v8: regulator-emmc-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "EMMC_AO1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc_3v3>;
+		regulator-always-on;
+	};
+
 };
 
 &uart_a {
@@ -52,3 +92,25 @@ &uart_a {
 	clocks = <&xtal>, <&xtal>, <&xtal>;
 	clock-names = "xtal", "pclk", "baud";
 };
+
+/* eMMC */
+&sd_emmc_c {
+	status = "okay";
+	pinctrl-0 = <&emmc_ctrl_pins>, <&emmc_data_8b_pins>, <&emmc_ds_pins>;
+	pinctrl-1 = <&emmc_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
+
+	bus-width = <8>;
+	cap-mmc-highspeed;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	max-frequency = <200000000>;
+	disable-wp;
+	non-removable;
+
+	power-domains = <&pwrc PWRC_T7_EMMC_ID>;
+
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&emmc_1v8>;
+};
-- 
2.49.0


