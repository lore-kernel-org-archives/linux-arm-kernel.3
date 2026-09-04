Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6344C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 03:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3JdeOwSlxB2bDEfY8MtDSF7Q0CSjNVIMGqVjvLf4tzA=; b=bzJ1hh/qxoaa5YDqtBhrqJfiRN
	H2vvmPzQFcNL3dmD9tw/vZZH/WBAEaXr9wCr/d8Cz4i87DFSYv6geOS4rhkZiZ/D0DHfl4vmtuE71
	8iiSlKbZxcNG4EjwC0Z26ezEvbQ77ynpJTe3aKIuEAdVGc0Ykts0hFW9RolZGikhHP6wJrhgTgUkS
	c/hu2XtQV0UgEv4wO00znzxGY/NreGyIKsdrXmapXL/HgmmLQSuNYPTVXFiSPpL3bjFTVS/N4DYAa
	375UGJXyoUADKRSkfvsunagCQKsovnY6yD9zx+8BVqem4IzDXa/eir8KUpDmiHPlhpeD3M5LTfwOi
	Bi9+IFug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2KNF-00000000uVL-0RlM;
	Fri, 04 Sep 2026 03:13:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2KND-00000000uUh-25PA;
	Fri, 04 Sep 2026 03:13:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3JdeOwSlxB2bDEfY8MtDSF7Q0CSjNVIMGqVjvLf4tzA=; b=BhtKZ7hSUYTYKS38QKeiVFQGq5
	UfMJWA1FCDzy5Qb7T0qDOyC1YXEW582hyAnSlBQH5Az1emAeqWx7FCmsmBKeCF5Qyxw2OmKATweRc
	sm56wIYViSJ3lfDFT46zuadyDRZ4EIe2gieM9BuNrHRzXxq57sevNlt4xkSvz2xx/SZWmsm3ReSEe
	5gjad0cBIpovftIeedTsuNTgYCqyAVi8qvUIrMXnVbvWSquPpuCdpjm4t4dm+nJZajfvxFqNOFw55
	zRrXBq2y4Cc69RSDZE/grm1WcIxWvOOOynKBOkIgS94PTGvhuPsretAfcusaQFljEr2G5w8vWVuBA
	e0fLanjA==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x2KN9-0000000Desj-1bWg;
	Fri, 04 Sep 2026 03:13:50 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6843Cr6W24114209, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1788491573; bh=3JdeOwSlxB2bDEfY8MtDSF7Q0CSjNVIMGqVjvLf4tzA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=JAHbXGQkN+G/s/EL3/r+v6SfI1SKOkasM9HatZ6XQhhT9Y2aQJ08+MnwuHwuB6POU
	 xXmL785O72wE48nuDPcCeo+NS7CMFLN1ABzx9HE2qpoBX5DRoYfn+vVRUVZGwTLFUB
	 Z09ycmxxfQprm2Ma59WrrtFXOu3ePQVRd905o5P2YjDkU6p8JspWnrHiMG1s8Xd/GA
	 9lhWA6Utm6G0A+iCUxbGUpCIi80ke7Egb9N7/olCim/Y2WdT6vcmAGgbfhVjd6/SPO
	 IcIbh2x+YxnSY0Qb6px/vvFmbqb0U1HwOfb3A/VSz+EZzcZ4urnloKw9N6wL4+0PZt
	 k0BpLQKZi7G3Q==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6843Cr6W24114209
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 4 Sep 2026 11:12:53 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 4 Sep 2026 11:12:53 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 4 Sep 2026 11:12:53 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.43 via Frontend
 Transport; Fri, 4 Sep 2026 11:12:53 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <afaerber@suse.com>
CC: <bartosz.golaszewski@oss.qualcomm.com>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>, <jyanchou@realtek.com>,
	<linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>
Subject: [PATCH 3/3] arm64: dts: realtek: Add SPI NOR flash node for RTD1625
Date: Fri, 4 Sep 2026 11:12:52 +0800
Message-ID: <20260904031252.244280-4-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260904031252.244280-1-eleanor.lin@realtek.com>
References: <20260904031252.244280-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_041348_451940_87FDA870 
X-CRM114-Status: GOOD (  14.73  )
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

Add the SPI NOR flash node for the Realtek RTD1625 SoC.

Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 arch/arm64/boot/dts/realtek/kent-pinctrl.dtsi | 16 ++++++++++++
 arch/arm64/boot/dts/realtek/kent.dtsi         | 26 +++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 arch/arm64/boot/dts/realtek/kent-pinctrl.dtsi

diff --git a/arch/arm64/boot/dts/realtek/kent-pinctrl.dtsi b/arch/arm64/boot/dts/realtek/kent-pinctrl.dtsi
new file mode 100644
index 000000000000..01df3aa9254a
--- /dev/null
+++ b/arch/arm64/boot/dts/realtek/kent-pinctrl.dtsi
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Realtek Semiconductor Corp.
+ */
+
+&main2_pinctrl {
+	spi_pins: spi-pins {
+		pins = "gpio_64",
+		       "gpio_65",
+		       "gpio_66",
+		       "gpio_67";
+		function = "spi";
+		realtek,drive-strength-p = <3>;
+		realtek,drive-strength-n = <2>;
+	};
+};
diff --git a/arch/arm64/boot/dts/realtek/kent.dtsi b/arch/arm64/boot/dts/realtek/kent.dtsi
index 409d46a73c91..e266d62b6527 100644
--- a/arch/arm64/boot/dts/realtek/kent.dtsi
+++ b/arch/arm64/boot/dts/realtek/kent.dtsi
@@ -5,6 +5,8 @@
  * Copyright (c) 2024 Realtek Semiconductor Corp.
  */
 
+#include <dt-bindings/clock/realtek,rtd1625-clk.h>
+#include <dt-bindings/reset/realtek,rtd1625.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
@@ -137,6 +139,7 @@ psci: psci {
 	soc@0 {
 		compatible = "simple-bus";
 		ranges = <0x0 0x0 0x0 0x40000>, /* boot code */
+			 <0x88100000 0x0 0x88100000 0x02000000>, /* NOR flash aperture */
 			 <0x98000000 0x0 0x98000000 0xef0000>, /* rbus */
 			 <0xa0000000 0x0 0xa0000000 0x10000000>, /* PCIE */
 			 <0xff000000 0x0 0xff000000 0x200000>; /* GIC */
@@ -146,6 +149,7 @@ soc@0 {
 		rbus: bus@98000000 {
 			compatible = "simple-bus";
 			ranges = <0x0 0x98000000 0xef0000>,
+				 <0x88100000 0x88100000 0x02000000>, /* NOR flash aperture */
 				 <0xa0000000 0xa0000000 0x10000000>; /* PCIE */
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -199,6 +203,26 @@ iso_s_cc: clock-controller@146310 {
 				#reset-cells = <1>;
 			};
 
+			nor_flash: spi@14b000 {
+				compatible = "realtek,rtd1625-nor";
+				reg = <0x14b000 0x50>, <0x14bf00 0x30>, <0x88100000 0x2000000>;
+				reg-names = "ctrl", "dma", "dirmap";
+				clocks = <&cc RTD1625_CRT_CLK_EN_MD>;
+				resets = <&cc RTD1625_CRT_RSTN_MD>;
+				pinctrl-0 = <&spi_pins>;
+				pinctrl-names = "default";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				flash@0 {
+					compatible = "jedec,spi-nor";
+					reg = <0>;
+					spi-rx-bus-width = <2>;
+					spi-tx-bus-width = <2>;
+					spi-max-frequency = <64000000>;
+				};
+			};
+
 			ve4_pinctrl: pinctrl@14e000 {
 				compatible = "realtek,rtd1625-ve4-pinctrl";
 				reg = <0x14e000 0x84>;
@@ -217,3 +241,5 @@ gic: interrupt-controller@ff100000 {
 		};
 	};
 };
+
+#include "kent-pinctrl.dtsi"
-- 
2.43.0


