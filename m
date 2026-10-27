Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE368606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 03:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zKNNW9xH;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D/zxpxEy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ayFq1I1PgE7HlCuF6H4wPpUQ+/WQM35PTFr519q3M/U=; b=zKNNW9xH2CQ7p5
	pBYx+i5LXeu2yZ1XeIhb0JZaQDviV569/thQAH6UlP799x+yCzXckUC7whTHDx5fYBc41jSQyOVJO
	ym3s+yYpi5mXerzNdfgCLP1WYtCALLUnv017wwFO4OUAYMwoaSZc+sT34VeIEGn1CjOL0GkUMJ6N8
	ZUH3aWXxkfqs28iTtf0y3tZCQxAHRF45Wm3ItfnfmSseS/lMYLL6oQGPh6K4pFDwIUHKwOihlwqxH
	oGtd0TxT0vAbAQgc8m5L2fdCwCIh3xAccvIk07V7VWOHa5zB5GnTPTe1IMlpYNLKdk89qQ7wVJlSk
	nmVIq8JtkmWe+1wubqYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLYBx-00000003iLx-0GRc;
	Tue, 27 Oct 2026 03:49:41 +0000
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLYBu-00000003iLG-1igX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 03:49:39 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-185fd3a4ca3so3166029c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 20:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793072978; x=1793677778; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ayFq1I1PgE7HlCuF6H4wPpUQ+/WQM35PTFr519q3M/U=;
        b=D/zxpxEyRlaV6yzvUVb+EtrJYFzOsU+qpKPGBV8oOTyvOngr1QJdKdIktLiP2pm/Ut
         4zFJvtETeHOwPBz+peD73syx82VHWbEYT9Ln7o/2PsXpugO6rR+yT6qUjr0VYd4+G/Ag
         FyIEwHnsRJgP8XswYgl5ePu3bNHczWROUhFbRj+XTaDIlrLSOZnAse3cI9rzOrBmFpvp
         +Uj3FJsgjS0ZrlP1URGtahki9DNdvEai+TG4L+o8Z3SYsK/0NiOxybML9dxwTKmMkefR
         V40jqa8ekjZs5GXeXrwyw9P2WBEsELKQKbVpJYnJHKzAPaOmF1xVLByI70C8L/2T/Et6
         8dYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793072978; x=1793677778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ayFq1I1PgE7HlCuF6H4wPpUQ+/WQM35PTFr519q3M/U=;
        b=0gooJ4rnEHEuG1t5jHbhMX+fatCqZ+3ZzBVifm4QOARPF0/TEaJckSG6viC5wEF0M5
         PbcTf+iNyea5m3Pk+Kcyn05BEKqSw7Y0zvGHTBiA5RyqNGDwsIeFhGxLRPkv2gdkUXRG
         WJpKsQ4fiEOoxG1MNu/Lx47ziIMmqowqVJj8L924Jz9GDd56QiLIliauY2opCGUja9q8
         Syo1Rln0MuP2eioSMM/P73VUhd6sw9RNCg2zZAX1tnPUHjHa7htdDWJbL7HGvIhhefxc
         ffwWR27qQKU4UkHKOdQuELdjAiepdSd06jNZA8qYy/Js1o3Zezjz/CrbggtReRbR5qSc
         hXag==
X-Forwarded-Encrypted: i=1; AKwUvBzlMWPmTJzBR3PrrlW3s7/Z1CvLoGJqtT+f/Ob6jpRySkq3KSQXWKPYRMs7/zu+le5wPxjnJxPC31yh0+ZgCedT@lists.infradead.org
X-Gm-Message-State: AFq9FYL98Bg/Hzq87PQ0QBctM4XDVvWSTZXaqPjpBlPQRf6SuJXNQ3+5
	DEj0rzCstmCfW2sTYw9FfYpFauwzh7KI2LX50nhFtvtFroIN2sXpgOVh
X-Gm-Gg: AYBFou17SsGr5ICrJ4Hxx5ER+YX/Qk8rHL+2tTeJ+4jWqUk+aadK7iD9ZTeOmV7jobe
	WaSc+SFtvFCsLSgPzdeQKph6iZklxUqObecSpzCJZHtxccgJgdqyZoKk7b9BJsXRgm44daiGZ/5
	kA3f5x2LsWuMm+WEOrFxFSX0rdtgqBdXp8baMrC9wYfrHMSudNGlzQnFST0J1rWkKgO378psCEp
	ucuXWJ4Y3r9nUlUkkZxtrzR6ZJljY5XFTwh4eNZ04ujPb1RdjC4R36Q5VKHTHWgg9dCIATdzGJr
	nQHypkt8hfCWuwSseB/8A6w404npGgfrGm/ap2SQD9tjeN8BKxNbDx7YMdiVDtTbuHsB0WdMu8X
	NsTHDicwpq1AQ6PAQy8GERPSv4K2snVW9Sfdywtu5wHLF+z14/UL3gh6Y7SlNjAimWA6vKYklE0
	yrIdoiLCpILXv8Yb9z7menp0UQM0gNEXcSB8NqT4xvk4HzQrK1sZSTRq2amnmVVgX+pF4ghVlmi
	SHgfjIdVcOGz66WUB0jhks7VAq80gvhw1bvfv/nNPKkupI3BxsitgqWEVEgt9ZSL+hBSxADSEdQ
	VlPxgPy9V18NB+Cc
X-Received: by 2002:a05:7022:1407:b0:1a2:1a28:9348 with SMTP id a92af1059eb24-1a21a289389mr4067703c88.37.1793072977517;
        Mon, 26 Oct 2026 20:49:37 -0700 (PDT)
Received: from debian.prasanth ([103.177.82.12])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2a5a515sm26430012c88.19.2026.10.26.20.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 20:49:37 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	andrew@lunn.ch,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v9 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Date: Tue, 27 Oct 2026 09:19:11 +0530
Message-ID: <20261027034911.99482-3-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027034911.99482-1-prasanth.padarthi10@gmail.com>
References: <20261027034911.99482-1-prasanth.padarthi10@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_204938_479487_98EDF17E 
X-CRM114-Status: GOOD (  16.39  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the device tree for the ASRock Rack B650D4U BMC, based on the
ASPEED AST2600 SoC.

Describe memory, SPI NOR partitions, the UART console, GPIO line
names, framebuffer memory, and the EEPROM on I2C7. Use the EEPROM
as the NVMEM provider for the MAC0 address and configure MAC0 with
an RTL8211F PHY in RGMII-ID mode.

Enable both ADC engines with 2.5 V internal references and their
pin groups. Expose the sixteen channels through an IIO-to-hwmon
bridge for board voltage monitoring.

The DTB compiles with aspeed_g5_defconfig. Binding validation with
dtschema 2026.9 completes without diagnostics. Board validation
reports unmatched schemas for inherited AST2600 LHC and I3C-global
nodes, with no board-specific errors in the reported output.

ADC readings and recovery after BMC restart were tested using the
same ADC configuration in a locally patched OpenBMC image. That
image uses a different flash layout and separate power-control
changes; this complete upstream DTS has not been boot-tested.

Reviewed-by: Andrew Lunn <andrew@lunn.ch> # MAC0 and MDIO nodes only
Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  | 173 ++++++++++++++++++
 2 files changed, 174 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts

diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index 6874b621d..fcb94e62c 100644
--- a/arch/arm/boot/dts/aspeed/Makefile
+++ b/arch/arm/boot/dts/aspeed/Makefile
@@ -10,6 +10,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-ampere-mtmitchell.dtb \
 	aspeed-bmc-arm-stardragon4800-rep2.dtb \
 	aspeed-bmc-asrock-altrad8.dtb \
+	aspeed-bmc-asrock-b650d4u.dtb \
 	aspeed-bmc-asrock-e3c246d4i.dtb \
 	aspeed-bmc-asrock-e3c256d4i.dtb \
 	aspeed-bmc-asrock-paul-ipmi-card.dtb \
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
new file mode 100644
index 000000000..630588dcb
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
@@ -0,0 +1,173 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+
+/ {
+	compatible = "asrock,b650d4u-bmc", "aspeed,ast2600";
+	model = "ASRock Rack B650D4U BMC";
+
+	aliases {
+		serial0 = &uart5;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		gfx_memory: framebuffer {
+			compatible = "shared-dma-pool";
+			alignment = <0x01000000>;
+			reusable;
+			size = <0x01000000>;
+		};
+	};
+};
+
+&fmc {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		label = "bmc";
+		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <4>;
+		m25p,fast-read;
+
+		status = "okay";
+
+#include "openbmc-flash-layout-64.dtsi"
+	};
+};
+
+&gfx {
+	memory-region = <&gfx_memory>;
+
+	status = "okay";
+};
+
+&gpio0 {
+	gpio-line-names =
+		/* A0-A7 */     "", "", "", "", "", "", "", "",
+		/* B0-B7 */     "", "", "", "", "", "", "", "",
+		/* C0-C7 */     "", "", "", "", "", "", "", "",
+		/* D0-D7 */     "", "", "", "", "", "", "", "",
+		/* E0-E7 */     "", "", "", "", "", "", "", "",
+		/* F0-F7 */     "", "", "", "", "", "", "", "",
+		/* G0-G7 */     "", "", "", "", "", "", "", "",
+		/* H0-H7 */     "", "", "", "", "", "", "", "",
+		/* I0-I7 */     "", "", "", "", "", "", "", "",
+		/* J0-J7 */     "", "", "", "", "", "", "", "",
+		/* K0-K7 */     "", "", "", "", "", "", "", "",
+		/* L0-L7 */     "", "", "", "", "", "", "", "",
+		/* M0-M7 */     "", "", "", "", "", "", "", "",
+		/* N0-N7 */     "", "", "", "", "", "", "", "",
+		/* O0-O7 */     "", "", "", "", "", "", "", "",
+		/* P0-P7 */     "button-reset-n", "control-reset-n",
+		"button-power-n", "control-power-n",
+		"button-nmi-n", "control-nmi-n",
+		"", "",
+		/* Q0-Q7 */     "", "", "", "", "", "", "", "",
+		/* R0-R7 */     "", "", "", "", "", "", "", "",
+		/* S0-S7 */     "", "", "", "", "", "", "", "",
+		/* T0-T7 */     "", "", "", "", "", "", "", "",
+		/* U0-U7 */     "", "", "", "", "", "", "", "",
+		/* V0-V7 */     "", "", "", "", "", "", "", "",
+		/* W0-W7 */     "", "", "", "", "", "", "", "",
+		/* X0-X7 */     "", "", "", "", "", "", "", "",
+		/* Y0-Y7 */     "", "", "", "", "", "", "", "",
+		/* Z0-Z7 */     "", "", "", "", "", "", "", "";
+};
+
+&i2c7 {
+	status = "okay";
+
+	eeprom@57 {
+		compatible = "atmel,24c128";
+		reg = <0x57>;
+		pagesize = <16>;
+
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			eth0_macaddress: macaddress@3f80 {
+				reg = <0x3f80 6>;
+			};
+		};
+	};
+};
+
+&mac0 {
+	nvmem-cells = <&eth0_macaddress>;
+	nvmem-cell-names = "mac-address";
+	phy-handle = <&ethphy0>;
+	phy-mode = "rgmii-id";
+	pinctrl-0 = <&pinctrl_rgmii1_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&mdio0 {
+	status = "okay";
+
+	ethphy0: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+	};
+};
+
+&uart5 {
+	status = "okay";
+};
+
+/ {
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
+			      <&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
+			      <&adc1 0>, <&adc1 1>, <&adc1 2>, <&adc1 3>,
+			      <&adc1 4>, <&adc1 5>, <&adc1 6>, <&adc1 7>;
+	};
+};
+
+&adc0 {
+	status = "okay";
+	aspeed,int-vref-microvolt = <2500000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc0_default>,
+		    <&pinctrl_adc1_default>,
+		    <&pinctrl_adc2_default>,
+		    <&pinctrl_adc3_default>,
+		    <&pinctrl_adc4_default>,
+		    <&pinctrl_adc5_default>,
+		    <&pinctrl_adc6_default>,
+		    <&pinctrl_adc7_default>;
+};
+
+&adc1 {
+	status = "okay";
+	aspeed,int-vref-microvolt = <2500000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc8_default>,
+		    <&pinctrl_adc9_default>,
+		    <&pinctrl_adc10_default>,
+		    <&pinctrl_adc11_default>,
+		    <&pinctrl_adc12_default>,
+		    <&pinctrl_adc13_default>,
+		    <&pinctrl_adc14_default>,
+		    <&pinctrl_adc15_default>;
+};
-- 
2.47.3


