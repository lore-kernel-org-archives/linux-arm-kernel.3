Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED3DC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 14:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GCkLszOPb6Hb/w5Hz9VQzAO60/GLzuXIDg2ZoU++UGk=; b=W0WCqK57oEcLCm07h2Q166EHdF
	TY7jVdE/okkyKHXbhv4VwXvGxMUnhWuDKte1wUg9lhVly+zMnXsxBP6QXxhigL/w4DEfUcjVptLVx
	Rb8x+K8HjsOjheTgDnKflZCB5GJtn/q3K1IuQqQuJj0aWKtScaCL+yIRbIk2Gg3l4ozOnIM9cFnaM
	zOUv1RViiw+GPVW08bdqDr0MU6WWCVSZPjdTsBgk+PskBArUID5ljN1wSyGg3ntz6QB0rYMPlzWKv
	FcifYhxbEj1bmVLYC5xjRb1kwFD1uqip0Kmre6mz3GppIHEVIRQdp75S3jcPvKhestIMtP1qUPmaT
	qfYQIJ5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyrjb-00000000v2U-3Xa1;
	Tue, 25 Aug 2026 14:02:39 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyrjZ-00000000v1E-3EPV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 14:02:39 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-6a051b737d8so5974141a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 07:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1787666556; x=1788271356; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GCkLszOPb6Hb/w5Hz9VQzAO60/GLzuXIDg2ZoU++UGk=;
        b=PAbXWnzv+wwlJj7OLxIdo4K7Bxm+pYM9iaFfsUqujWMZM9gSkSBddoxtqoPTvYCQiO
         Rtybw7pxui8YvbeZ0ndjSPIzn6I1cf3bO4773Adxbvmn6EgeJR9rmykgGNEJvqfajctT
         LOLpjHtPiaFlsTdELtnC+SBwsu63njFGlg+Jc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787666556; x=1788271356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GCkLszOPb6Hb/w5Hz9VQzAO60/GLzuXIDg2ZoU++UGk=;
        b=K/dKkNK5s75k77XX4OW/Kk8YFsuASSIgG5dtn6lkUDWOv3gcSFCkq9/efEjE8mpi5G
         61W2mrsxPDlCt2BesdbDL/K8b48P+Aa090fmaUDnw7Gu8vFC7qDKeTZs20TfRmqc0mbY
         3vQwllG6CerokJehthcjOhp/b4AEsY2jykOKKlPD8TR+bHjEfGi2hn4vg7D6eokPJcws
         lLso7YYfSYYp4tMV3nVVN2vtjz01iQt/IEqQi+BtdH916QOwnsQO8HJFN4AkQStPw0rJ
         rupW9o7OIw2bTbFUbNEZBha0c+HYDzf7QLCz/uFVI6bAfNZf/FIYQQMWFiKD8u6pdr5S
         nEYA==
X-Forwarded-Encrypted: i=1; AHgh+RpVPNM0MUsoDW/w9BwKJa7m2Wn6Q2vZQoK2hZpHvhUBaa2+NTbULMnhfDLX+PYUcIwDhYmrYW6Ge/lXkZGZVf/f@lists.infradead.org
X-Gm-Message-State: AFuF++ngpUT09IgI/EfF6NZnataoX4k+AWi4fWFuByT2q3sGfVT3bIOi
	mbR6Q23k3NQJgl2GNYsjsjVc3lvF/QlENDLR4cSCm6Bb7+Y1zfp8eBv55A8LHNWsirDfG9//E1m
	LoVDB
X-Gm-Gg: AR+sD10kBnvWkIgtQaNip39iTeUjwb2jnDyX3O4uJX/JABFOEqoWbplZuhee77MlnX+
	gbUmw1Fnr1UmK3YaBxu9gMbYEXzFqY2DhIPh/n4wgLJnNgOeHc0T35t1HCVqyZL/JSBq4YqaRUa
	tRgyfQvG5LMg4MuEm6qO55ysnxlrR4xIO5b07CNu7FR9i9F/O3BF4/gtR0VkEpn150506dULHk/
	yHpqxa9gnXjYIBM81d3U4nK5wTomaqtyOgdAzgtWp/GQ60JSs5YrTXgFpgf7/dqcyGaKb6xlMvM
	cVo/p+jVKTd0svkPsc2XsmHpYtdBoaIONS1TZSFhPCT+3Nusy24xtu2vRGeZ+Grwdojxe4RqEjZ
	Mj12tOVgE6jmnjpLTr580n6EVn3vG1GtmRLOOE+MXrNpz5EzzkdlmCnAM4s0nBDLurFeVttgfyp
	vC00gsGYnmTwE87eXhdU6MzPmXBXNHSl2O9uQe4alaFc3GeK9tCu4uwhxux6yFXtGlLNiJ0PA7J
	Wh+IQ==
X-Received: by 2002:a05:6402:1f0d:b0:6a1:bff4:645d with SMTP id 4fb4d7f45d1cf-6a5c409f22cmr8077327a12.2.1787666555707;
        Tue, 25 Aug 2026 07:02:35 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e00129fsm17187878a12.1.2026.08.25.07.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 07:02:35 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v1 1/1] ARM: dts: draeger: Add devicetree files for M48 Intel/Altera SoCFPGA Cyclone
Date: Tue, 25 Aug 2026 17:02:22 +0300
Message-ID: <20260825140225.3968019-2-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260825140225.3968019-1-petko.manolov@konsulko.com>
References: <20260825140225.3968019-1-petko.manolov@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_070238_329604_9FF2FB01 
X-CRM114-Status: GOOD (  15.76  )
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

Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 arch/arm/boot/dts/intel/socfpga/Makefile      |   1 +
 .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 132 ++++++++++++++++++
 2 files changed, 133 insertions(+)
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts

diff --git a/arch/arm/boot/dts/intel/socfpga/Makefile b/arch/arm/boot/dts/intel/socfpga/Makefile
index 8df0976da01c..cdcea11abdfa 100644
--- a/arch/arm/boot/dts/intel/socfpga/Makefile
+++ b/arch/arm/boot/dts/intel/socfpga/Makefile
@@ -11,6 +11,7 @@ dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += \
 	socfpga_arria10_mercury_aa1_st1_emmc.dtb \
 	socfpga_arria10_mercury_aa1_st1_qspi.dtb \
 	socfpga_arria10_mercury_aa1_st1_sdmmc.dtb \
+	socfpga_cyclone5_draeger_m48.dtb \
 	socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb \
 	socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb \
 	socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb \
diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
new file mode 100644
index 000000000000..fd597f15c0d8
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ *  (C) Copyright 2020 Draeger and Licensors, info@draeger.com
+ */
+#include "socfpga_cyclone5.dtsi"
+
+/ {
+	model = "Draeger M48 Cyclone V SoC";
+	compatible = "draeger,M48/socfpga", "altr,socfpga-cyclone5", "altr,socfpga";
+
+	chosen {
+		bootargs = "earlyprintk";
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@0 {
+		name = "memory";
+		device_type = "memory";
+		reg = <0x0 0x40000000>;
+
+		/* 1GB */
+	};
+
+	aliases {
+	/* this allow the ethaddr uboot environmnet variable contents
+	 * to be added to the gmac1 device tree blob.
+	 */
+		ethernet0 = &gmac0;
+	};
+
+	soc {
+		gpio3: gpio@0xff202000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "snps,dw-apb-gpio";
+			reg = <0xff202000 0x20>;
+			status = "okay";
+
+			portd: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <2>;
+				reg = <0>;
+				bank-name = "SYNC_I";
+			};
+		};
+
+		gpio4: gpio@0xff202020 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "snps,dw-apb-gpio";
+			reg = <0xff202020 0x20>;
+			status = "okay";
+
+			porte: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <2>;
+				reg = <0>;
+				bank-name = "SYNC_O";
+			};
+		};
+	};
+};
+
+&gmac0 {
+	status = "okay";
+	phy-mode = "rgmii-id";
+	rxc-skew-ps = <1860>;
+	rxd0-skew-ps = <0>;
+	rxd1-skew-ps = <0>;
+	rxd2-skew-ps = <0>;
+	rxd3-skew-ps = <0>;
+	rxdv-skew-ps = <0>;
+	txc-skew-ps = <900>;
+	txd0-skew-ps = <0>;
+	txd1-skew-ps = <0>;
+	txd2-skew-ps = <0>;
+	txd3-skew-ps = <0>;
+	txen-skew-ps = <0>;
+};
+
+&gpio0 {
+	status = "okay";
+};
+
+&gpio1 {
+	status = "okay";
+};
+
+&gpio2 {
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+	clock-frequency = <100000>;
+
+	eeprom_mac: eeprom@50 {
+		compatible = "atmel,24c08";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+};
+
+&mmc0 {
+	status = "okay";
+};
+
+&qspi {
+	status = "okay";
+
+	flash0: n25q00@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "n25q00";
+		reg = <0>;
+
+		/* chip select */
+		spi-max-frequency = <100000000>;
+		m25p,fast-read;
+		cdns,page-size = <256>;
+		cdns,block-size = <16>;
+		cdns,read-delay = <4>;
+		cdns,tshsl-ns = <50>;
+		cdns,tsd2d-ns = <50>;
+		cdns,tchsh-ns = <4>;
+		cdns,tslch-ns = <4>;
+	};
+};
-- 
2.47.3


