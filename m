Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B44606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 23:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eavvrq+1;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zYbMjxPp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LYtNSjgV58xGbyTo5mnS9fU4iYF6Ei0AnGKD6L+FOdI=; b=eavvrq+1MuKtK5
	OQZbZjHyxkNIdhGc68dNtCaS2Hjvw1NUO7PoB3vAm8lkW6PIBgFEM1NVrvJc/aXYoc++Pbc9wqet5
	PmwjENEgW9RvEXo6Y8TUTMXxY4pJfySyGDYBjc6bFpAd4TmAf9V/7sTYSDwMbiUi+ZHZ3ZC47KQ5f
	mE6PggeYdcbPJW7iGBfim2W5ZjkDnM9vn3MI2IJYt9CVCs9PdI6kZ116yuDcMLKocauYfH13LxXua
	kCfEPlyMB02HIHC0sUkNpxJ41P9u0fMMpw6IGQAQTBCLcuOb3+0i6bMKZp8hqwim65OtWhKUFHLn4
	YQzlQcPVF5Oa42aKA8rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMZK3-0000000AWri-3Y6L;
	Thu, 29 Oct 2026 23:14:15 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMZK0-0000000AWq8-0w6t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 23:14:14 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-36661f953e4so268699eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 16:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793315651; x=1793920451; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LYtNSjgV58xGbyTo5mnS9fU4iYF6Ei0AnGKD6L+FOdI=;
        b=zYbMjxPp7K0iPtwyci7c0W03G2tZJ1Atf3fGJbA9XanqBWqVUXMa/lY6gJuPZWppBc
         NQuSQRBE+tpFPyCKzxrNt3+Ml0fb0TXbNOp8B87NJzLNCugepNHfxU8CfG1R1vRha+r4
         k7VFVN86ES7TbpFOIQMQ2visYf8bwtrB1wHunUJcXccybs+l1jTgW/Smmv4LnnENHXEj
         k34bu3aRkBiMM/9XKqVBt1ReZG2ApC0IRnVOTyPM+ri7yIa2XGGf7JMeUVWV8qZatXGq
         dGZCnhOiOO5/2kGPiPKtN5QHW3UPg/G734siqPIxNea1oDiZva2yD4CC3IkRzhjEMEbP
         8o2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793315651; x=1793920451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LYtNSjgV58xGbyTo5mnS9fU4iYF6Ei0AnGKD6L+FOdI=;
        b=BK8Y2X5b3/wOYn9WNnQET7cq+72kQFPgqeXqO/4F+K+8JmY9XBM01PQX/JCCDj9288
         mPWEeslkutEpMZJ0g6l/UElcLB8hyg+0/Zvy4a63pJ0bqcyFHJdzxKSUOavtEDUIYVEB
         KwdwvfFWWm5dwqzrmyWa/PJZYbcXoY+1AJYK+iVMOuAjeZqmMuAw/JqwAVfQCC4sTA0h
         fVJv+POXUF7+Po+liJaH5N3tYXCB+eJwKrm8lFc8J0kwt5jO5TOgzsxHJfof0THW/X3W
         rO1CcXzSjlcumteCbv15kgfHat5wHfgYJ/Wsvdeop8O/PEx1e3ihKDKx/vdeLImLieZR
         UE4A==
X-Forwarded-Encrypted: i=1; AKwUvByWoaRO/R5O9Smz5Vl1GnDdpjpDzt4MHehCMlJ5JMugN6MrN71vsRuzwINJ0x8QRpghCk5VfaAoW2iKefwcesOW@lists.infradead.org
X-Gm-Message-State: AFq9FYLoubRgJNxS7oKXGRSCn8fpl+VuWGW+sCQYTW9G4SLvlAs+57AR
	pDSXkJBc0LbTMApcUZcW/2Dg4HyWfEKm9H+AiiGb0K1fab+YtIttSC6o
X-Gm-Gg: AYBFou1kBwE7J6OX9HQa9UCED6WO92anDdbgbZXRjNawu2HgsfIYMkiM98MZSocNU48
	gzcJJIaKGU/fjRruCkcWEsaGa4sazGEN9cLos644sxdYdmFbxBP1p4vTJVT8/iB74fKJkx9w4CA
	LRfgi0q0fSX7ncbP25Z20X+UNrBciCXjw01kRI3DOdsSP23EKZsdy/D5cALDmBUsOXBnegFsriS
	W6F6mPybSEpZ+huyDwvmIUtSTfLT3awiAQI4hsPBeEB273HQekLEidcIGyim5FW0jrBEoD0h0Jv
	raS9ZQ3BT6nmugUJdE6Q7rptrAAPMZ4+POYWBRk7/szJ4wcBFQ9gdC8+KJS+V/J6WbSAFLhVmGA
	QJaq4wMIeGCM417VM+0PYkQNR9Z7Jmb0XAoKh4s7LZiwJQPadwiwQnFt5ZqETzLUKIsKbQhEZVb
	H9TrVLVHwvtLL1EfVlvb15hmrrs0ZoKv1q9sJOnh7KX25Ap7xfjWEyK4pnyHgm1uyXgXtXTiOJq
	/gvn8TfQyXHwbHdKevjYPKpuXN67NiC52AoSjNMmI5UYZfy7aDjqZAohFyMSli+2mREBEldZ2R5
	lU+kd0pksjBxFFOhPe6/at/q8OF3EZO6ouRqUymYVsYKEg==
X-Received: by 2002:a05:693c:41c8:10b0:367:185e:867a with SMTP id 5a478bee46e88-36a4242366fmr1174193eec.38.1793315650617;
        Thu, 29 Oct 2026 16:14:10 -0700 (PDT)
Received: from debian.prasanth ([103.177.82.12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1dfsm1662742eec.7.2026.10.29.16.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 16:14:10 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	tan.siewert@9elements.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	andrew@lunn.ch,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v10 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Date: Fri, 30 Oct 2026 04:43:39 +0530
Message-ID: <20261029231339.9497-3-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261029231339.9497-1-prasanth.padarthi10@gmail.com>
References: <20261029231339.9497-1-prasanth.padarthi10@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_161412_269734_A78AA26B 
X-CRM114-Status: GOOD (  16.40  )
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the device tree for the ASRock Rack B650D4U BMC, based on the
ASPEED AST2600 SoC.

Describe the BMC memory, SPI NOR flash layout, UART5 console, GPIO
line names, graphics memory, and the EEPROM on I2C7. Use the EEPROM
as the NVMEM provider for the MAC0 address and configure MAC0 with
an RTL8211F PHY in RGMII-ID mode.

Enable both ADC engines with 2.5 V internal references and expose
the sixteen channels through an IIO-to-hwmon bridge for board
voltage monitoring.

Retain the SoC's serial4 alias for UART5 and select it as stdout,
without adding a second serial alias for the same UART.

Reviewed-by: Andrew Lunn <andrew@lunn.ch> # MAC0 and MDIO nodes only
Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
Changes in v10:
- Use the inherited serial4/UART5 alias instead of duplicating it as serial0.
- Consolidate root nodes and fix peripheral/ADC property ordering.
- Keep ADC settings and MAC0/MDIO semantics unchanged.
Changes in v9: enable ADC0/ADC1 and add the ordered IIO-to-hwmon bridge.
Earlier history and testing limitations: see the cover letter.
Previous series:
https://lore.kernel.org/all/20261027034911.99482-1-prasanth.padarthi10@gmail.com/

 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  | 169 ++++++++++++++++++
 2 files changed, 170 insertions(+)
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
index 000000000..522c4d53e
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
@@ -0,0 +1,169 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+
+/ {
+	compatible = "asrock,b650d4u-bmc", "aspeed,ast2600";
+	model = "ASRock Rack B650D4U BMC";
+
+	chosen {
+		stdout-path = "serial4:115200n8";
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
+			      <&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
+			      <&adc1 0>, <&adc1 1>, <&adc1 2>, <&adc1 3>,
+			      <&adc1 4>, <&adc1 5>, <&adc1 6>, <&adc1 7>;
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
+&adc0 {
+	pinctrl-0 = <&pinctrl_adc0_default>,
+		    <&pinctrl_adc1_default>,
+		    <&pinctrl_adc2_default>,
+		    <&pinctrl_adc3_default>,
+		    <&pinctrl_adc4_default>,
+		    <&pinctrl_adc5_default>,
+		    <&pinctrl_adc6_default>,
+		    <&pinctrl_adc7_default>;
+	pinctrl-names = "default";
+	aspeed,int-vref-microvolt = <2500000>;
+
+	status = "okay";
+};
+
+&adc1 {
+	pinctrl-0 = <&pinctrl_adc8_default>,
+		    <&pinctrl_adc9_default>,
+		    <&pinctrl_adc10_default>,
+		    <&pinctrl_adc11_default>,
+		    <&pinctrl_adc12_default>,
+		    <&pinctrl_adc13_default>,
+		    <&pinctrl_adc14_default>,
+		    <&pinctrl_adc15_default>;
+	pinctrl-names = "default";
+	aspeed,int-vref-microvolt = <2500000>;
+
+	status = "okay";
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
+				"button-power-n", "control-power-n",
+				"button-nmi-n", "control-nmi-n",
+				"", "",
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
-- 
2.47.3


