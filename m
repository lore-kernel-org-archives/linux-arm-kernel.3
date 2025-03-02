Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B510C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 15:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8Bh6bLjv98EA8P8H9SQlLoMe1/qkXz4wmKjkYzXqTxY=; b=s0lCMKPTcKI+NIW8Bwj5V8H974
	rD8lzir37SlfqV5Fg0aOM0VmYEc60kfUyK7Uu1vso6ybqvmTQYDJV69dof79BDvZFvb4ahEelBFXz
	+AEkLy3o33Ah7WYFinjApwO1MHoOZif/KLfNTFDw/M8F4yYgZR8WkWDcmxd7JwtzBeujNYbasQiQY
	S4woUV0gzG/UfbjMza1+yYV+zPP2hr8NwYt/30nvJ9p/ZVC/Bmh7o7eU4GKZRrQqFsrRiHa1WYg7z
	MmryXwY4s1/S2tv7TkZ+bCr5s4JZBU3DmDsuP3VUV8GAvdfGCD7IHGDxmvgvFeyB6V2YYLNnlvQJg
	+aHLw51g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tolEf-0000000GDuJ-1ty4;
	Sun, 02 Mar 2025 15:28:09 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tolD5-0000000GDqq-2vTi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Mar 2025 15:26:32 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E020610382D03;
	Sun,  2 Mar 2025 16:26:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740929186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8Bh6bLjv98EA8P8H9SQlLoMe1/qkXz4wmKjkYzXqTxY=;
	b=RDKwCd0anT/sAu/zkYm8sX7eP1ka+sonUhm6e1+GdVn6NGjZOqCZ7LeUhWAQUGAjxgye8v
	sacKqGGvueFEptvu+Iu3l45yJIeMMEy1JdCSRCBllNpl3X3hPudOMZiHWk204hQqZq65pq
	oQsDY3u57Kj1bStUlns2DQOVNAPF+/UV+KQP44lSbkwuOUawUqIK00Wyl8ewQxkCBEZWA3
	o/a4iiToy/JZtABdK8qD5Mg9CrfwF37IMaNOqozClg76H49ADFbtLxtWQbzj5l46KYmKbo
	nH25XteLnY5OaxnPbKebp0ac6x3jMqqTETmEds9gLGLAQVWH2hemAU/njZhNfw==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] ARM: dts: stm32: Add support for STM32MP13xx DHCOR SoM and DHSBC rev.200 board
Date: Sun,  2 Mar 2025 16:25:14 +0100
Message-ID: <20250302152605.54792-1-marex@denx.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_072631_890880_0A6E24D9 
X-CRM114-Status: GOOD (  11.30  )
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

LDO2 is expansion connector supply on STM32MP13xx DHCOR DHSBC rev.200.
LDO5 is carrier board supply on STM32MP13xx DHCOR DHSBC rev.200. Keep
both regulators always enabled to make sure both the carrier board and
the expansion connector is always powered on and supplied with correct
voltage.

Describe ST33TPHF2XSPI TPM 2.0 chip interrupt and reset lines.

Signed-off-by: Marek Vasut <marex@denx.de>
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
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 .../boot/dts/st/stm32mp135f-dhcor-dhsbc.dts   | 30 +++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts b/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
index 853dc21449d99..9902849ed0406 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
@@ -176,7 +176,7 @@ &gpioa {
 	gpio-line-names = "", "", "", "",
 			  "", "DHSBC_USB_PWR_CC1", "", "",
 			  "", "", "", "DHSBC_nETH1_RST",
-			  "", "DHCOR_HW-CODING_0", "", "";
+			  "", "DHCOR_HW-CODING_0", "", "DHSBC_HW-CODE_2";
 };
 
 &gpiob {
@@ -197,7 +197,7 @@ &gpiod {
 	gpio-line-names = "", "", "", "",
 			  "", "DHCOR_RAM-CODING_0", "", "",
 			  "", "DHCOR_RAM-CODING_1", "", "",
-			  "", "", "", "";
+			  "", "DHSBC_HW-CODE_1", "", "";
 };
 
 &gpioe {
@@ -221,6 +221,13 @@ &gpiog {
 			  "DHSBC_ETH1_INTB", "", "", "DHSBC_ETH2_INTB";
 };
 
+&gpioh {
+	gpio-line-names = "", "", "", "DHSBC_HW-CODE_0",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "";
+};
+
 &gpioi {
 	gpio-line-names = "DHCOR_RTC_nINT", "DHCOR_HW-CODING_1",
 			  "DHCOR_BT_REG_ON", "DHCOR_PMIC_nINT",
@@ -296,6 +303,9 @@ &spi2 {
 	st33htph: tpm@0 {
 		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
 		reg = <0>;
+		interrupt-parent = <&gpioe>;
+		interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&gpioe 12 GPIO_ACTIVE_LOW>;
 		spi-max-frequency = <24000000>;
 	};
 };
@@ -419,3 +429,19 @@ connector {
 		type = "micro";
 	};
 };
+
+/* LDO2 is expansion connector 3V3 supply on STM32MP13xx DHCOR DHSBC rev.200 */
+&vdd_ldo2 {
+	regulator-always-on;
+	regulator-boot-on;
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+};
+
+/* LDO5 is carrier board 3V3 supply on STM32MP13xx DHCOR DHSBC rev.200 */
+&vdd_sd {
+	regulator-always-on;
+	regulator-boot-on;
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+};
-- 
2.47.2


