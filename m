Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B2FC71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 08:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t0zl5UgUMJioINXEhfKw/OPFCjl4142IWY9RjIGoGFw=; b=ohajDBXsZo5QhXBwitF58sOxlH
	qEmqSwXrR1OERlq8Zt1hj6sq2LVgeDMHZsk6ConXsyuMzetgY1fwPRcQT6SNXyRDS+exMRDopA0Av
	+9RvgJPpsqJkkLQs9kMdm3NZ+x197Lk8bb4A3yNH/AGHrfs1Fp3gwOTPgR0q40PG8cUlp8x05iYn7
	bzTI790R9PPaSOMWhl9XyN+oloO2PQsyfZQYL/bgjRLnSPQM/n29fxhCB4kzUBoPw4xDb1ImK5AyO
	/CZyug4fdE8rnIdiqgxKY/qSLQzCav2qTykWpRLytvaMe9S4rfzP5qdUOIYoEN02jvLKHONPMHSWn
	oi3dYhoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRo9-00000006cSK-2zAP;
	Tue, 17 Jun 2025 08:36:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRYY-00000006a27-2uvA
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Jun 2025 08:20:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=t0zl5UgUMJioINXEhfKw/OPFCjl4142IWY9RjIGoGFw=; b=XkDewQTmsqjTw5BuGY54HZ+/d0
	adzW/SUAdBlcnTR36/OkWMDuViWowxmxxzaK5Oa5D/PcUVgZpovjvzyxUh5Qju4aUCcBnOoveSeAA
	Ho74H7nUKvkYzTxW4PLIoBy745X5VoaJru7l6HGPPvQOdMd4P1+2DtOYqVfkv2a+jDHfeax0j7x7y
	IWwDBiKEr9LLtFQFHowSZ+AJ0NiTQ14IAAqqdXRnKTsJYFJGyd2obVTKZ/fmPsPxbWMoAM3HBHDVl
	M3yC+gFxBc9+iIm1JJZtm1dexHTZlzHTNKeHuAVNNjRbn5DzG9QXL6ZgYLVWJovyffvW544ESnJsF
	QGgi8gVQ==;
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRYQ-00000003k7l-261M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 08:20:33 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-234b9dfb842so48934425ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 01:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750148423; x=1750753223; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t0zl5UgUMJioINXEhfKw/OPFCjl4142IWY9RjIGoGFw=;
        b=D0WtNTYNymMEZWEqlSB7+oYodqih58b/UnwjsUde5maqN3Pq4At2nuP3Hvoen4XwE2
         zWvSAnHsbBK04i/I/XdVc6XBNBJK+ff16L33GIsk+k7NkGAvTuJWD10rO4Jw/VdH92x2
         ye4uW6Avp0ceMut/uTlBvfehN2O9jGwK63nzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750148423; x=1750753223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t0zl5UgUMJioINXEhfKw/OPFCjl4142IWY9RjIGoGFw=;
        b=URw4BxzMyzFFcnXzzxQND87OJmBqYI9k09+q21FJJjSF+t9m1iX5VYlcGr0Os6+sfN
         KVb6fbqCBd3E1uwIG90KEFxiE5l+o1dgy6TXTRRhj5p7tMMuSo7cDU2xQL9pLP3oftIr
         ggfXcHlGN5ahp6lnyDGUOXRsy+9xnmiQigOU4F7SlGsf+dt+Wq/vXK7OyeDmya9ak1o4
         cnymAJzP3T3fLhBfgtJO+aPpJvVQ5Clij40K4GATUi1TGCJG3JiAo++snJyI7QVOcjHN
         eDeOgolKouq5aUIohWO2s3WgaVWTZUN/dj5WJ/xYdolVzWhHy7agHKZ3cF9Cpn1NY0+u
         uQAg==
X-Forwarded-Encrypted: i=1; AJvYcCW7S74PzJQQFiLUPK9N4sUJU+oB4OZo3ojmKpY1FJ9zcsF7lMTlFkjqLUHomd5sWG6/pJSUTiG3k00CGMe8DXAO@lists.infradead.org
X-Gm-Message-State: AOJu0YyfBAHrNXmbbIkiLUikuniUycpYjwHGwc1HjHJInzNuSmYF0lmF
	f515Gbc8OTByDb/Z7CL1ojppyF7gzmdFSuC1jgp183mw47AA9I7PNh3wd5r2o3gtAQ==
X-Gm-Gg: ASbGncu/zPMboy0hWOji93egPyXF9iEBY6OvRw+gewNw6tIhvoz6vyPo0h8F36zd18Q
	QXjTAQOIlyyRnXnOlYEcbHENUkDLCISNcvPzpzXXuCJfxq+H50DMDN9NxusvH2y5RQQkTFZwnTY
	Jg+xE2W18sVi4RqIZsmdVmAi2V1n8Ic42FnU7ER3jcwQ5gHJ3r65iySC2MEWv/s/1HMR5A7RCpc
	ZChqqF4x/MyEj5I9y2cknTpi5fshtfPlPEuf1XX0FGP3KIn8hYPQUcAgB6PpQnB571IbjNGfPAa
	fk4ctuLF8w8pQKLQF1WtN9LeXHDlSMXa+7l/3vsxpbsOH0AFeOXMilaZwTB54t66sU4tyy0g7ZD
	UDBux
X-Google-Smtp-Source: AGHT+IF4kxUCNX955eBUeMtmUp09tZHq5eVY7way6VVQf06qYS7+0eKNuGC1EFb0EH+rMHbB8Kt5lw==
X-Received: by 2002:a17:903:440f:b0:235:60e:3704 with SMTP id d9443c01a7336-2366b32ccafmr198804545ad.12.1750148423221;
        Tue, 17 Jun 2025 01:20:23 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:24a1:2596:1651:13d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de781f7sm74598885ad.110.2025.06.17.01.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 01:20:22 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: [PATCH v3 6/6] arm64: dts: mediatek: mt8186: Add Squirtle Chromebooks
Date: Tue, 17 Jun 2025 16:20:03 +0800
Message-ID: <20250617082004.1653492-7-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc2.692.g299adb8693-goog
In-Reply-To: <20250617082004.1653492-1-wenst@chromium.org>
References: <20250617082004.1653492-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_092027_011655_2DB4018C 
X-CRM114-Status: GOOD (  17.02  )
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

Add a device tree for the MT8186 based Squirtle Chromebooks, also known
as the Acer Chromebook Spin 311 (R724T). The device is a 2-in-1
convertible.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 .../dts/mediatek/mt8186-corsola-squirtle.dts  | 107 ++++++++++++++++++
 .../dts/mediatek/mt8186-corsola-steelix.dtsi  |   2 +-
 3 files changed, 109 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index a8b8796276aa..a4df4c21399e 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -68,6 +68,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-magneton-sku393218.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-ponyta-sku0.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-ponyta-sku1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-rusty-sku196608.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-squirtle.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-starmie-sku0.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-starmie-sku1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-steelix-sku131072.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dts
new file mode 100644
index 000000000000..f721ad4e5c97
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dts
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2024 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8186-corsola-voltorb.dtsi"
+
+/ {
+	model = "Google squirtle board";
+	compatible = "google,squirtle", "mediatek,mt8186";
+	chassis-type = "convertible";
+};
+
+&i2c1 {
+	touchscreen@10 {
+		compatible = "elan,ekth6915";
+		reg = <0x10>;
+		interrupts-extended = <&pio 12 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&touchscreen_pins>;
+		reset-gpios = <&pio 60 GPIO_ACTIVE_LOW>;
+		vcc33-supply = <&pp3300_s3>;
+		status = "fail-needs-probe";
+	};
+
+	touchscreen@16 {
+		compatible = "elan,ekth8d18", "elan,ekth6a12nay";
+		reg = <0x16>;
+		interrupts-extended = <&pio 12 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&touchscreen_pins>;
+		reset-gpios = <&pio 60 GPIO_ACTIVE_LOW>;
+		vcc33-supply = <&pp3300_s3>;
+		status = "fail-needs-probe";
+	};
+};
+
+&i2c2 {
+	trackpad@68 {
+		compatible = "hid-over-i2c";
+		reg = <0x68>;
+		hid-descr-addr = <0x20>;
+		interrupts-extended = <&pio 11 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&trackpad_pin>;
+		vdd-supply = <&pp3300_s3>;
+		wakeup-source;
+		status = "fail-needs-probe";
+	};
+};
+
+&i2c5 {
+	clock-frequency = <400000>;
+
+	/delete-node/ codec@1a;
+
+	rt5650: codec@1a {
+		compatible = "realtek,rt5650";
+		reg = <0x1a>;
+		interrupts-extended = <&pio 17 IRQ_TYPE_EDGE_BOTH>;
+		avdd-supply = <&mt6366_vio18_reg>;
+		cpvdd-supply = <&mt6366_vio18_reg>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&speaker_codec_pins_default>;
+		cbj-sleeve-gpios = <&pio 150 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		realtek,dmic1-data-pin = <2>;
+		realtek,jd-mode = <2>;
+	};
+};
+
+&sound {
+	compatible = "mediatek,mt8186-mt6366-rt5650-sound";
+	model = "mt8186_rt5650";
+
+	audio-routing =
+		"Headphone", "HPOL",
+		"Headphone", "HPOR",
+		"HDMI1", "TX";
+
+	hs-playback-dai-link {
+		codec {
+			sound-dai = <&rt5650>;
+		};
+	};
+
+	hs-capture-dai-link {
+		codec {
+			sound-dai = <&rt5650>;
+		};
+	};
+
+	spk-hdmi-playback-dai-link {
+		codec {
+			sound-dai = <&it6505dptx>;
+		};
+	};
+};
+
+&speaker_codec {
+	status = "disabled";
+};
+
+&trackpad_steelix {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi
index 822a177e7c19..8a196dc9a96b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi
@@ -118,7 +118,7 @@ &i2c2 {
 	i2c-scl-internal-delay-ns = <22000>;
 
 	/* second source component */
-	trackpad@2c {
+	trackpad_steelix: trackpad@2c {
 		compatible = "hid-over-i2c";
 		reg = <0x2c>;
 		hid-descr-addr = <0x20>;
-- 
2.50.0.rc2.692.g299adb8693-goog


