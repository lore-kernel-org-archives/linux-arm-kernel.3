Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E19BECA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 14:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jtT9UWrM+yzyc/wCcpNgJunKEQmcu8yCIT/FmPQ0xO0=; b=lkbaHpuXSE5v5Lzp18Eh2x6dHF
	hfAfhqmnBxi/ph1ySU/kL2z8ytKXgq603/ij8juSIaOlnxH1Pf8yGz+a393haOAJucvA4iRkpWjI4
	8yZxoK8IkSDxaChqnDpmnNrI+EZ4rXB9JxWF+TJjWdRIhY7nzbrS1pU5CkRfX7yx/uGAxAM/aEgK9
	UDIOX3HDuc9AT3x4S+a6zmrPrDOnPjQyC0w5CTfKDwO10HVd8Lvg+LjGqw/rHw2GKSyytMdegONDb
	5SqoHp4cvRsl0T4QPq5AXkWD6KCGtz9lrNp2CpQOuAmOoqSyvMYtnujZGSj/AzcawnKSdgLAfQYMB
	u61RbQag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD0ie-0000000Dbkt-1Blb;
	Sat, 03 Oct 2026 14:28:08 +0000
Received: from mail.nozomi.space ([139.162.184.125])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD0iW-0000000Dbbn-2knv;
	Sat, 03 Oct 2026 14:28:02 +0000
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nozomi.space;
	s=mail; t=1791037676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jtT9UWrM+yzyc/wCcpNgJunKEQmcu8yCIT/FmPQ0xO0=;
	b=m9pBkOVNb34HfnL3RQ67J815rccqUFsMReJYIN85IsB9Z6HTS+OZdA1+Z/kRTfEVwOhMwq
	PabpwG48/3i7cHI392G6yZUZWDgiy5iZPrd/UKwj+YoXCIpo9HdVrWB7TtJFCaEMCfthAA
	Z5pYcVfaZWAY4yrartGPKl5NHJyK7cao3vvfUuQY4wW0VsYefFojWA3DPR7beBeN+ssYlX
	tJQIJ9KngXKythIN/PfKpa90hHPCMeTZyaWhuD7W2Hf8OwR38faoojssJ15QPijfGc2A9q
	fBQfWZy2kPbwSAhSKqbhSygQJLNEWhVII+0yL0QzDaenZ0ol6VImTzeZBj+Vjw==
To: linux-input@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Allen Lin <allencl_lin@hotmail.com>,
	Tylor Yang <tylor_yang@himax.corp-partner.google.com>,
	Felix Kaechele <felix@kaechele.ca>,
	Douglas Anderson <dianders@chromium.org>,
	=?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
Subject: [PATCH v5 6/6] arm64: dts: mediatek: mt8188-geralt-ciri: Add the touchscreen
Date: Sat,  3 Oct 2026 16:27:41 +0200
Message-ID: <20261003142741.48634-7-michal@nozomi.space>
In-Reply-To: <20261003142741.48634-1-michal@nozomi.space>
References: <20261003142741.48634-1-michal@nozomi.space>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_072800_998011_859C0FDF 
X-CRM114-Status: GOOD (  10.87  )
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

Ciri uses the touch function of its Himax HX83102J TDDI controller,
connected over SPI1. It shares the analog supplies and the reset with
the panel, so describe those and follow the panel for power sequencing.

The controller has no flash; the firmware is loaded from a file that
depends on the panel: himax_i2chid_1002.bin for the BOE panel and
himax_i2chid_1003.bin for the IVO panel, as on ChromeOS.

Signed-off-by: Michał Kopeć <michal@nozomi.space>
---
 .../dts/mediatek/mt8188-geralt-ciri-sku1.dts  |  4 +++
 .../dts/mediatek/mt8188-geralt-ciri-sku3.dts  |  4 +++
 .../dts/mediatek/mt8188-geralt-ciri-sku5.dts  |  4 +++
 .../dts/mediatek/mt8188-geralt-ciri-sku7.dts  |  4 +++
 .../boot/dts/mediatek/mt8188-geralt-ciri.dtsi | 33 +++++++++++++++++++
 5 files changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dts b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dts
index ef5ea9d12b1de..6377354440d68 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dts
@@ -57,3 +57,7 @@ codec {
 		};
 	};
 };
+
+&touchscreen {
+	firmware-name = "himax_i2chid_1003.bin";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dts b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dts
index 524f7f0064c1a..2a51c610758f7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dts
@@ -30,3 +30,7 @@ &sound {
 		"Left Spk", "Front Left BE_OUT",
 		"Right Spk", "Front Right BE_OUT";
 };
+
+&touchscreen {
+	firmware-name = "himax_i2chid_1003.bin";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dts b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dts
index bf87201ccf273..8fb0036aa14d0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dts
@@ -70,3 +70,7 @@ codec {
 		};
 	};
 };
+
+&touchscreen {
+	firmware-name = "himax_i2chid_1003.bin";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dts b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dts
index 825015b452d59..2bd178116423b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dts
@@ -46,3 +46,7 @@ codec {
 		};
 	};
 };
+
+&touchscreen {
+	firmware-name = "himax_i2chid_1003.bin";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri.dtsi
index 6815c435a57e1..e611fb73ddb01 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri.dtsi
@@ -121,6 +121,27 @@ codec {
 	};
 };
 
+&spi1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen: touchscreen@0 {
+		compatible = "himax,hx83102j";
+		reg = <0>;
+		spi-max-frequency = <12500000>;
+		interrupts-extended = <&pio 143 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&touchscreen_pins>;
+		reset-gpios = <&pio 5 GPIO_ACTIVE_LOW>;
+		display-reset-gpios = <&pio 25 GPIO_ACTIVE_LOW>;
+		vccd-supply = <&mt6359_vm18_ldo_reg>;
+		vsp-supply = <&ppvar_mipi_disp_avdd>;
+		vsn-supply = <&ppvar_mipi_disp_avee>;
+		panel = <&dsi_panel>;
+		firmware-name = "himax_i2chid_1002.bin";
+	};
+};
+
 &pio {
 	gpio-line-names =
 		"GSC_AP_INT_ODL",
@@ -313,4 +334,16 @@ pins-en-spkr {
 			pinmux = <PINMUX_GPIO111__FUNC_B_GPIO111>;
 		};
 	};
+
+	touchscreen_pins: touchscreen-pins {
+		pins-int-odl {
+			pinmux = <PINMUX_GPIO143__FUNC_B_GPIO143>;
+			input-enable;
+		};
+
+		pins-rst-l {
+			pinmux = <PINMUX_GPIO5__FUNC_B_GPIO5>;
+			output-high;
+		};
+	};
 };
-- 
2.55.0


