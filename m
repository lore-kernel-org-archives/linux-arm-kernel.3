Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF593606CFB2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 09:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gDw5yZ38;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OMKEBNUr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=A4/6vwXIUif3dD3pS/Qgzp/66VECYeTyTVvRPkRIT1Q=; b=gDw5yZ3800tsYf
	VKNo8WMsZJFn0rjQGtFbW3JZd3S8OXz2RQb8nYdRZtDXUl1ipK63Hy+1awwtj7rWODU0l06Ypznm7
	GzsXITf0n+WVljUt+U1tf3Z846AZnu4JvDSLWhlGwAZEL5Wey/UB4K69xjnlQUj9mbWp/vmaTGGmN
	foAnWF4i1BlPUtQd2wVqMtcgocPf8i8hiBdN/mEbF/agCQQyseA5IgMvEC5uuxtFsAApNMcqUcZMd
	0GeDA3rKMvN4p19Flc1RiG68A35wT1+29cGVgZ+Yp8Ir0HqvGD/7a4UImbo5DcMGmEc7yirrt2wCo
	5TmeygMSlBOxsfeJ+YSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHSb-000000029Px-2IFM;
	Mon, 26 Oct 2026 09:57:45 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHSU-000000029GI-17eZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 09:57:39 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so2392770f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 02:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008656; x=1793613456; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=A4/6vwXIUif3dD3pS/Qgzp/66VECYeTyTVvRPkRIT1Q=;
        b=OMKEBNUr+6zQ5TiFP0YK77drrMxIzu8rjUfeEMZmHyR+pr1qrTGF6yyIyWfMFRu16U
         4KtjBWOxVcUiU1fRUDvO5d8ppng171VZ/qtD4CpkDzZlzZKbUoCTi2jNpX9eVPfgxtq3
         ul4gTyon+hEBPKcaQw3lYhtuF7w9lHZFSRz00uiDFC75BNRqzrulUqo/qRbSopWO6TMu
         aj8PMyUvB2ND+9IGtSVCAV6tia0W4RK2OGDf+piyXz7nA3koBQfvr0lPiceXi50wQC+1
         jvE/kBDO/ZCIJPoipvZrbEUDWaEamhMnyy0HVkKB6DckyoHrqpMSzLYy6i4XMNQzK5h8
         puLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008656; x=1793613456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=A4/6vwXIUif3dD3pS/Qgzp/66VECYeTyTVvRPkRIT1Q=;
        b=onvdGCOATmmYZpFePsG2GhhObd9IOPttChAJS6S1nkpUwCIUfmc9RwuRtx7xrtYtut
         9Lpyq+6kr2F5lPKL78M6GJGnsLBF/L3telsGRnlVz1Dee2tpdtCDS1g4sbwXBz+4uuIq
         lNTUisocZSmnyy8j6SI529XRkvuwPRqByT19N+HdxmYuIBzo4XJW0f1XRDWDZn00ocMf
         1Qj2ZTPqtJ8EvGAyVM8XIcRYmZ6+YmNpNVkvk5Gywna1vfw5xHnnu/wH0KwVF67qOSqY
         FcteM+st3B7y3iOEyG4TzAPqQs8P7OzUkPAU3id57ZpHZvQZJGaC74zU+ujuU2fwA3Xa
         Zcng==
X-Forwarded-Encrypted: i=1; AKwUvBxqg0KNWbcbg2/vbfbwN37rA/JDE9Hq/4vyC8CPsXVRBZSP2wo/eG3Ke8qqbTZHBSt//jkgym3feS9Z12N8lfQj@lists.infradead.org
X-Gm-Message-State: AFq9FYJHmLeqBi8w7iKjhS2kbRi3wVn+b7Td40jgwev1zzDEKpTjBGvU
	m3JJqf20+0I7SOt6cplbph87wdG/W63ABq1ERsRGCJVK8a9KBnGO6U2L
X-Gm-Gg: AYBFou0W0+/nfVfAwe4eQEx/tzgunMy0PYEiMjlUXUlOv1IICp/dk+p9YGdQvj7rDel
	v6rOHEImRwNjKZwK+mtxnDy6wr/rgJKxha9Xoj7OBDA25cka89e3WfX+jd7JZk9KpPC7qF2eQL9
	C2uV5XEHAyvU4Du+WjzKEwHSdQhzo9J9UQLNt2W7oJIdbZNJTRlcDq1uy+MWOO6dDxhOoJTLM6X
	Evjs7TpxHLhHvf1DxxeorJsnqjsyd4Lr1kTXLEy58JgTH/4CvcSFduU+9U416PVeT0P4TlIlv/W
	Pk8gFkXYu59BDmkhJ0/W3hELSfVEEx/UPjY+v1gYjMjRjH4Rithb0Gn/zXwsAp77+nXA8OQki0H
	to1KW+5X0+s3gkkyTpVsMmaT/n9ShcRJ6ggmWzdihV5wTZxmc9tR8JBwi2UaeGPWOzAyybgieWa
	9/6iQHcVz0dEZYwarQ4GdGFLzbOvQiY0G4LgTlhNWeXxUwseA6KUyq1GO3dZSwMCoB18KtnRLBv
	yX8vFJ4mUZnaWovv8/FGUII6PjZuMw4d6EqY/p9fLQUbkBXTCi1EWW6g/c1rDSv/JvguJP2+8nd
	zkSrNEbV58a0nk9AMMA6i3ZpLZnaIqw2MQ1vmJdsY2mH1qfNFDBxOeOomKWq
X-Received: by 2002:a05:600c:1987:b0:4a1:db17:c7e6 with SMTP id 5b1f17b1804b1-4a35ac3a7b1mr104695045e9.2.1793008656237;
        Mon, 26 Oct 2026 02:57:36 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a35a0cc374sm190382825e9.9.2026.10.26.02.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:57:35 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/9] arm64: dts: airoha: en7581: reorder nodes following incremental regs
Date: Mon, 26 Oct 2026 10:57:07 +0100
Message-ID: <20261026095727.31708-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026095727.31708-1-ansuelsmth@gmail.com>
References: <20261026095727.31708-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_025738_346210_A5AC74FB 
X-CRM114-Status: GOOD (  11.53  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Reorder nods position following incremental register. This is to tidy
things up and no additional code is added.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/arm64/boot/dts/airoha/en7581.dtsi | 246 ++++++++++++-------------
 1 file changed, 123 insertions(+), 123 deletions(-)

diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index ff6908a76e8e..83b30a340950 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -173,18 +173,6 @@ spi_nand: nand@0 {
 			};
 		};
 
-		scuclk: clock-controller@1fb00000 {
-			compatible = "airoha,en7581-scu";
-			reg = <0x0 0x1fb00000 0x0 0x970>;
-			#clock-cells = <1>;
-			#reset-cells = <1>;
-		};
-
-		pbus_csr: syscon@1fbe3400 {
-			compatible = "airoha,en7581-pbus-csr", "syscon";
-			reg = <0x0 0x1fbe3400 0x0 0xff>;
-		};
-
 		pciephy: phy@1fa5a000 {
 			compatible = "airoha,en7581-pcie-phy";
 			reg = <0x0 0x1fa5a000 0x0 0xfff>,
@@ -199,6 +187,129 @@ pciephy: phy@1fa5a000 {
 			#phy-cells = <0>;
 		};
 
+		rng@1faa1000 {
+			compatible = "airoha,en7581-trng";
+			reg = <0x0 0x1faa1000 0x0 0xc04>;
+			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		scuclk: clock-controller@1fb00000 {
+			compatible = "airoha,en7581-scu";
+			reg = <0x0 0x1fb00000 0x0 0x970>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		eth: ethernet@1fb50000 {
+			compatible = "airoha,en7581-eth";
+			reg = <0 0x1fb50000 0 0x2600>,
+			      <0 0x1fb54000 0 0x2000>,
+			      <0 0x1fb56000 0 0x2000>;
+			reg-names = "fe", "qdma0", "qdma1";
+
+			resets = <&scuclk EN7581_FE_RST>,
+				 <&scuclk EN7581_FE_PDMA_RST>,
+				 <&scuclk EN7581_FE_QDMA_RST>,
+				 <&scuclk EN7581_XSI_MAC_RST>,
+				 <&scuclk EN7581_DUAL_HSI0_MAC_RST>,
+				 <&scuclk EN7581_DUAL_HSI1_MAC_RST>,
+				 <&scuclk EN7581_HSI_MAC_RST>,
+				 <&scuclk EN7581_XFP_MAC_RST>;
+			reset-names = "fe", "pdma", "qdma",
+				      "xsi-mac", "hsi0-mac", "hsi1-mac",
+				      "hsi-mac", "xfp-mac";
+
+			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+
+			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			gdm1: ethernet@1 {
+				compatible = "airoha,eth-mac";
+				reg = <1>;
+				phy-mode = "internal";
+				status = "disabled";
+
+				fixed-link {
+					speed = <10000>;
+					full-duplex;
+					pause;
+				};
+			};
+		};
+
+		pbus_csr: syscon@1fbe3400 {
+			compatible = "airoha,en7581-pbus-csr", "syscon";
+			reg = <0x0 0x1fbe3400 0x0 0xff>;
+		};
+
+		uart1: serial@1fbf0000 {
+			compatible = "ns16550";
+			reg = <0x0 0x1fbf0000 0x0 0x30>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <1843200>;
+		};
+
+		system-controller@1fbf0200 {
+			compatible = "airoha,en7581-gpio-sysctl", "syscon",
+				     "simple-mfd";
+			reg = <0x0 0x1fbf0200 0x0 0xc0>;
+
+			en7581_pinctrl: pinctrl {
+				compatible = "airoha,en7581-pinctrl";
+
+				interrupt-parent = <&gic>;
+				interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+
+				gpio-controller;
+				#gpio-cells = <2>;
+
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+		};
+
+		i2c0: i2c@1fbf8000 {
+			compatible = "mediatek,mt7621-i2c";
+			reg = <0x0 0x1fbf8000 0x0 0x100>;
+
+			resets = <&scuclk EN7581_I2C2_RST>;
+
+			clocks = <&clk20m>;
+			clock-frequency = <100000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
+		i2c1: i2c@1fbf8100 {
+			compatible = "mediatek,mt7621-i2c";
+			reg = <0x0 0x1fbf8100 0x0 0x100>;
+
+			resets = <&scuclk EN7581_I2C_MASTER_RST>;
+
+			clocks = <&clk20m>;
+			clock-frequency = <100000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
 		pcie0: pcie@1fc00000 {
 			compatible = "airoha,en7581-pcie";
 			device_type = "pci";
@@ -284,116 +395,5 @@ pcie_intc1: interrupt-controller {
 				#interrupt-cells = <1>;
 			};
 		};
-
-		uart1: serial@1fbf0000 {
-			compatible = "ns16550";
-			reg = <0x0 0x1fbf0000 0x0 0x30>;
-			reg-io-width = <4>;
-			reg-shift = <2>;
-			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
-			clock-frequency = <1843200>;
-		};
-
-		rng@1faa1000 {
-			compatible = "airoha,en7581-trng";
-			reg = <0x0 0x1faa1000 0x0 0xc04>;
-			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
-		};
-
-		system-controller@1fbf0200 {
-			compatible = "airoha,en7581-gpio-sysctl", "syscon",
-				     "simple-mfd";
-			reg = <0x0 0x1fbf0200 0x0 0xc0>;
-
-			en7581_pinctrl: pinctrl {
-				compatible = "airoha,en7581-pinctrl";
-
-				interrupt-parent = <&gic>;
-				interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
-
-				gpio-controller;
-				#gpio-cells = <2>;
-
-				interrupt-controller;
-				#interrupt-cells = <2>;
-			};
-		};
-
-		i2c0: i2c@1fbf8000 {
-			compatible = "mediatek,mt7621-i2c";
-			reg = <0x0 0x1fbf8000 0x0 0x100>;
-
-			resets = <&scuclk EN7581_I2C2_RST>;
-
-			clocks = <&clk20m>;
-			clock-frequency = <100000>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			status = "disabled";
-		};
-
-		i2c1: i2c@1fbf8100 {
-			compatible = "mediatek,mt7621-i2c";
-			reg = <0x0 0x1fbf8100 0x0 0x100>;
-
-			resets = <&scuclk EN7581_I2C_MASTER_RST>;
-
-			clocks = <&clk20m>;
-			clock-frequency = <100000>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			status = "disabled";
-		};
-
-		eth: ethernet@1fb50000 {
-			compatible = "airoha,en7581-eth";
-			reg = <0 0x1fb50000 0 0x2600>,
-			      <0 0x1fb54000 0 0x2000>,
-			      <0 0x1fb56000 0 0x2000>;
-			reg-names = "fe", "qdma0", "qdma1";
-
-			resets = <&scuclk EN7581_FE_RST>,
-				 <&scuclk EN7581_FE_PDMA_RST>,
-				 <&scuclk EN7581_FE_QDMA_RST>,
-				 <&scuclk EN7581_XSI_MAC_RST>,
-				 <&scuclk EN7581_DUAL_HSI0_MAC_RST>,
-				 <&scuclk EN7581_DUAL_HSI1_MAC_RST>,
-				 <&scuclk EN7581_HSI_MAC_RST>,
-				 <&scuclk EN7581_XFP_MAC_RST>;
-			reset-names = "fe", "pdma", "qdma",
-				      "xsi-mac", "hsi0-mac", "hsi1-mac",
-				      "hsi-mac", "xfp-mac";
-
-			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
-
-			status = "disabled";
-
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			gdm1: ethernet@1 {
-				compatible = "airoha,eth-mac";
-				reg = <1>;
-				phy-mode = "internal";
-				status = "disabled";
-
-				fixed-link {
-					speed = <10000>;
-					full-duplex;
-					pause;
-				};
-			};
-		};
 	};
 };
-- 
2.55.0


