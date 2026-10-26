Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE26606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 12:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L/oTz8G2;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=AlgiRuq7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=XxBlJ450fGP5NE0P23Mw4mDA1i18VKdOWeLhUI4rES0=; b=L/oTz8G2rqtf4m5CQitTcZvJyq
	HWEYw44d+ON8wtAqWuq28L87/ZOtUDh4RpvEcRnUVNnitTyBYxLZODJuIW5dbxSUMU7QSzDGY5aD1
	yc4++JJehNr1xD8KVLgtAFu7OP2pmFNzuspXbYiSaH/ZgNMwMUhX6TlZIVuTYBZ6i1Ci5xQjsjvwP
	gF09QuAdnALoFYgtC9T63JuCNTkBQR1XMFZn5OSWIiQSmBNoXwwejejgN3r+6kikkY/1r/H5OmpNo
	GBIpEzl6hi2QXoOMOaKUNNOch0NcrOqnm86PZ7DbfXROquNteIFLhx7eRtogRVlkh1JIBL5rBgiqR
	jhH3mncQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLKC2-00000002Xcm-26dZ;
	Mon, 26 Oct 2026 12:52:50 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLKBz-00000002XbR-3wbq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 12:52:49 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7E4BF109A73;
	Mon, 26 Oct 2026 13:52:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1793019162; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=XxBlJ450fGP5NE0P23Mw4mDA1i18VKdOWeLhUI4rES0=;
	b=AlgiRuq7A2ePvip9fex8piaNBG59JakTzjeRi3XN14FOb14aKXQbYAlZNgZWP4V8YmwFGz
	DEmSqOncC0hKIa0e9C+UGVKzX+DfdFblTironaPUW0jwH6ChFP+YpvvqrNJvTiLYI/4HXd
	3i+jtVg/GKRaV2nYKZ6EjmcBSGnW+xI6v/0yLbCb0tqDC1r2YvEANKYaMWP/xml7jDt6Rn
	gjr/QV0bEcq7mKfOgieTWv+hhJaW2Bx3oLywjqPchLDZvTCLPAsmWFsehypOJCIpFBHxwA
	9MJHOQdJOlSb5/0ZHPu80WTVTgGyBteV/r7zfcE0428JAegbDMeKWNUVuZGfLA==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] arm64: dts: st: Update gpio-line-names on STM32MP23xx DHCOS SoM
Date: Mon, 26 Oct 2026 13:52:11 +0100
Message-ID: <20261026125240.76753-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_055248_277162_7A45FFD1 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Adjust gpio-line-names to match both STM32MP23xx and STM32MP25xx DHCOS
SoM pads respectively in their matching SoM DTs.

Fixes: 6642d6a47901 ("arm64: dts: st: Add support for DH electronics STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board and DHSBC")
Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 .../boot/dts/st/stm32mp23xx-dhcos-som.dtsi    | 54 +++++++++++++++++++
 .../boot/dts/st/stm32mp25xx-dhcos-som.dtsi    | 47 ++++++++++++++++
 .../boot/dts/st/stm32mp2xxx-dhcos-som.dtsi    | 45 ----------------
 3 files changed, 101 insertions(+), 45 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp23xx-dhcos-som.dtsi b/arch/arm64/boot/dts/st/stm32mp23xx-dhcos-som.dtsi
index 5d4624c3200ad..7a95f56bf857f 100644
--- a/arch/arm64/boot/dts/st/stm32mp23xx-dhcos-som.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp23xx-dhcos-som.dtsi
@@ -20,6 +20,60 @@ aliases {
 	};
 };
 
+&gpioa {
+	gpio-line-names = "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "DHCOS-C", "", "", "";
+};
+
+&gpiod {
+	gpio-line-names = "", "DHCOS-K", "DHCOS-J", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "";
+};
+
+&gpiof {
+	gpio-line-names = "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "DHCOS-E",
+			  "DHCOS-N", "", "", "DHCOS_RAM-CODE_2";
+};
+
+&gpiog {
+	gpio-line-names = "", "", "", "",
+			  "", "", "", "DHCOS-P",
+			  "DHCOS-O", "DHCOS_RAM-CODE_0", "DHCOS_RAM-CODE_1", "",
+			  "", "", "DHCOS-F", "DHCOS_HW-CODE_0";
+};
+
+&gpioh {
+	gpio-line-names = "", "", "DHCOS-I", "",
+			  "", "DHCOS-H", "DHCOS-L", "",
+			  "DHCOS-G", "", "", "",
+			  "", "", "", "";
+};
+
+&gpioi {
+	gpio-line-names = "DHCOS_HW-CODE_1", "DHCOS_HW-CODE_2", "", "",
+			  "", "DHCOS-M", "", "",
+			  "", "", "", "DHCOS-D",
+			  "", "", "", "";
+};
+
+&ioexp {
+	gpio-line-names =
+		"#ETH1_RST_P0_0", "#ETH0_RST_P0_1",
+		"BT_REG_ON_P0_2", "WL_REG_ON_P0_3",
+		"USB1_PWR_EN_P0_4", "USB1_PWR_STAT_P0_5",
+		"USB0_PWR_EN_P0_6", "USB0_PWR_STAT_P0_7",
+		"SDIO0_CD_P1_0", "USB0_SS_SEL_P1_1",
+		"#PCIe_RST_1_2", "#PCIe_Wake_P1_3",
+		"#QSPI_RST_P1_4", "#CSI0_PWDN_P1_5",
+		"#CSI0_RST_P1_6", "#PCIE_CLKREQ_GPIO_Q_P1_7";
+};
+
 &rv3032 {
 	interrupts-extended = <&gpiod 10 IRQ_TYPE_EDGE_FALLING>;
 };
diff --git a/arch/arm64/boot/dts/st/stm32mp25xx-dhcos-som.dtsi b/arch/arm64/boot/dts/st/stm32mp25xx-dhcos-som.dtsi
index 23c25ea086445..3f3bdef05ce4e 100644
--- a/arch/arm64/boot/dts/st/stm32mp25xx-dhcos-som.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25xx-dhcos-som.dtsi
@@ -20,6 +20,53 @@ aliases {
 	};
 };
 
+&gpioa {
+	gpio-line-names = "", "DHCOS-M", "DHCOS-K", "DHCOS-L",
+			  "DHCOS-E", "DHCOS-J", "", "",
+			  "DHCOS-D", "", "", "",
+			  "", "", "", "";
+};
+
+&gpiof {
+	gpio-line-names = "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "DHCOS_RAM-CODE_2";
+};
+
+&gpiog {
+	gpio-line-names = "", "", "", "",
+			  "", "", "", "",
+			  "", "DHCOS_RAM-CODE_0", "DHCOS_RAM-CODE_1", "",
+			  "", "", "DHCOS-F", "DHCOS_HW-CODE_0";
+};
+
+&gpioh {
+	gpio-line-names = "", "", "DHCOS-I", "DHCOS-N",
+			  "", "", "DHCOS-O", "DHCOS-H",
+			  "DHCOS-G", "", "", "",
+			  "", "", "", "";
+};
+
+&gpioi {
+	gpio-line-names = "DHCOS_HW-CODE_1", "DHCOS_HW-CODE_2", "", "",
+			  "", "", "", "",
+			  "", "DHCOS-C", "", "",
+			  "", "", "", "";
+};
+
+&ioexp {
+	gpio-line-names =
+		"#ETH1_RST_P0_0", "#ETH0_RST_P0_1",
+		"BT_REG_ON_P0_2", "WL_REG_ON_P0_3",
+		"USB1_PWR_EN_P0_4", "USB1_PWR_STAT_P0_5",
+		"USB0_PWR_EN_P0_6", "USB0_PWR_STAT_P0_7",
+		"SDIO0_CD_P1_0", "USB0_SS_SEL_P1_1",
+		"#PCIe_RST_1_2", "#PCIe_Wake_P1_3",
+		"#QSPI_RST_P1_4", "#CSI0_PWDN_P1_5",
+		"#CSI0_RST_P1_6", "#ETH3_RST_P1_7";
+};
+
 &rv3032 {
 	interrupts-extended = <&gpioi 10 IRQ_TYPE_EDGE_FALLING>;
 };
diff --git a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
index bcf63e2ea9898..6febdbfe83649 100644
--- a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
@@ -218,41 +218,6 @@ &arm_wdt {
 	status = "okay";
 };
 
-&gpioa {
-	gpio-line-names = "", "DHCOS-M", "DHCOS-K", "DHCOS-L",
-			  "DHCOS-E", "DHCOS-J", "", "",
-			  "DHCOS-D", "", "", "",
-			  "", "", "", "";
-};
-
-&gpiof {
-	gpio-line-names = "", "", "", "",
-			  "", "", "", "",
-			  "", "", "", "",
-			  "", "", "", "DHCOS_RAM-CODE_2";
-};
-
-&gpiog {
-	gpio-line-names = "", "", "", "",
-			  "", "", "", "",
-			  "", "DHCOS_RAM-CODE_0", "DHCOS_RAM-CODE_1", "",
-			  "", "", "DHCOS-F", "DHCOS_HW-CODE_0";
-};
-
-&gpioh {
-	gpio-line-names = "", "", "DHCOS-I", "DHCOS-N",
-			  "", "", "DHCOS-O", "DHCOS-H",
-			  "DHCOS-G", "", "", "",
-			  "", "", "", "";
-};
-
-&gpioi {
-	gpio-line-names = "DHCOS_HW-CODE_1", "DHCOS_HW-CODE_2", "", "",
-			  "", "", "", "",
-			  "", "DHCOS-C", "", "",
-			  "", "", "", "";
-};
-
 &gpioz {
 	gpio-line-names = "", "", "DHCOS-A", "DHCOS-B",
 			  "", "", "", "",
@@ -278,16 +243,6 @@ ioexp: gpio@20 {
 		interrupt-controller;
 		#interrupt-cells = <2>;
 		wakeup-source;
-
-		gpio-line-names =
-			"#ETH1_RST_P0_0", "#ETH0_RST_P0_1",
-			"BT_REG_ON_P0_2", "WL_REG_ON_P0_3",
-			"USB1_PWR_EN_P0_4", "USB1_PWR_STAT_P0_5",
-			"USB0_PWR_EN_P0_6", "USB0_PWR_STAT_P0_7",
-			"SDIO0_CD_P1_0", "USB0_SS_SEL_P1_1",
-			"#PCIe_RST_1_2", "#PCIe_Wake_P1_3",
-			"#QSPI_RST_P1_4", "#CSI0_PWDN_P1_5",
-			"#CSI0_RST_P1_6", "#ETH3_RST_P1_7";
 	};
 
 	eeprom0: eeprom@50 {
-- 
2.53.0


