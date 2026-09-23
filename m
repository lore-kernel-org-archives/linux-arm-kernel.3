Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D899C982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 11:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ll3bdjdwyApVAippyrGuNHUcJWXRQNFwtW3g+Z+tm0s=; b=DCDQ84izvWkinLBXIQqgBqm95p
	wBkWcAz7WcKkSUk5JdoiNDW6EQhs91cpEzg3P3szg5jjPxfqDbed4kvvR9JpwIJ1Tk0bflcYsXKox
	HZOQsr1ji/E+SHEFo0igRaTcaPqlNuKQLbY1drryRF1QocCeyqVpmhQH5MMm6btLZCSoOqkqEL4vG
	Sp3k1BD+t5w20C5ViZAn2yfYbBQ09FReZYQI2xpUn5QL5tt3M77eJH4A0kC7LzEIJ11OCrlxL4j3x
	KurgBZYCESvaYcocJowsN/CAe6HGEpiEhXpFN4kl4dJoiJtobp5JzK/J4GZgr1OYerEyTfPndMqoQ
	AlVLfmUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9LS5-000000087cA-1XQe;
	Wed, 23 Sep 2026 11:47:53 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9LRw-000000087ZD-48g1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 11:47:47 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 8B865240028
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 13:47:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1790164059;
	bh=Ll3bdjdwyApVAippyrGuNHUcJWXRQNFwtW3g+Z+tm0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=PgU5xVYmUKjaObEFzn+jcgMtbSANWdXrhY3cHkR+l0EiC9bn27GlRSxwV696Om0l1
	 ZYRPVBJBgrTkpMIG/A82cUOD+R/qf7knVhi0zk2KIyiStFr6wDlZ7HA70ETD2Zv08q
	 5Ts+M/DZdW65fe46Fgz+RQHozBKCgtYfs5LdcgUFwd5WauW4Hg/8DzMSRPwjLKHqkw
	 7oSN9bF2El5h6SN0lCem1SODwwF+HomEMs0gDZfTZj8s0HISS8x85XoxKJSD6yb7HZ
	 JS7lXNuyIm/dMPWK0GzbCkw4ZjKXTDMjYxP/jei7xZm2Guxt4YFyeX4ynG4VV3N3QF
	 W7iu0waW3HHnw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hqZvs6DWsz9rxK;
	Wed, 23 Sep 2026 13:47:37 +0200 (CEST)
From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mateusz Nowicki <mateusz.nowicki@posteo.net>
Subject: [PATCH v2 1/2] arm64: dts: st: add sdmmc2 pins_b for stm32mp25
Date: Wed, 23 Sep 2026 11:47:39 +0000
Message-ID: <20260923114714.140842-2-mateusz.nowicki@posteo.net>
In-Reply-To: <20260923114714.140842-1-mateusz.nowicki@posteo.net>
References: <20260923114714.140842-1-mateusz.nowicki@posteo.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_044745_320648_47B5B6F4 
X-CRM114-Status: GOOD (  10.05  )
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

Add a second variant of the SDMMC2 default and open-drain pin groups,
with the same pins and bias as the _a variant but faster output speeds:
very high on CK, high on CMD and D0-D7. These are the OSPEEDR values
given in the STM32MP25 datasheet for 120 MHz and 166 MHz operation.

On the STM32MP257F-DK, the eMMC returns corrupted data in HS200 mode
at 100 MHz with the _a groups, and no CRC error is reported. With the
_b groups, four consecutive 1 GiB reads return the same data as a read
at 50 MHz.

The sleep groups are shared with the _a variant.

Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
---
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 68cc89cbe754..d9fd1ae632c9 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -681,6 +681,51 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	sdmmc2_b4_pins_b: sdmmc2-b4-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('E', 13, AF12)>, /* SDMMC2_D0 */
+				 <STM32_PINMUX('E', 11, AF12)>, /* SDMMC2_D1 */
+				 <STM32_PINMUX('E', 8, AF12)>, /* SDMMC2_D2 */
+				 <STM32_PINMUX('E', 12, AF12)>, /* SDMMC2_D3 */
+				 <STM32_PINMUX('E', 15, AF12)>; /* SDMMC2_CMD */
+			slew-rate = <2>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 14, AF12)>; /* SDMMC2_CK */
+			slew-rate = <3>;
+			drive-push-pull;
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	sdmmc2_b4_od_pins_b: sdmmc2-b4-od-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('E', 13, AF12)>, /* SDMMC2_D0 */
+				 <STM32_PINMUX('E', 11, AF12)>, /* SDMMC2_D1 */
+				 <STM32_PINMUX('E', 8, AF12)>, /* SDMMC2_D2 */
+				 <STM32_PINMUX('E', 12, AF12)>; /* SDMMC2_D3 */
+			slew-rate = <2>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 14, AF12)>; /* SDMMC2_CK */
+			slew-rate = <3>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins3 {
+			pinmux = <STM32_PINMUX('E', 15, AF12)>; /* SDMMC2_CMD */
+			slew-rate = <2>;
+			drive-open-drain;
+			bias-pull-up;
+		};
+	};
+
 	/omit-if-no-ref/
 	sdmmc2_d47_pins_a: sdmmc2-d47-0 {
 		pins {
@@ -704,6 +749,19 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	sdmmc2_d47_pins_b: sdmmc2-d47-1 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 10, AF12)>, /* SDMMC2_D4 */
+				 <STM32_PINMUX('E', 9, AF12)>, /* SDMMC2_D5 */
+				 <STM32_PINMUX('E', 6, AF12)>, /* SDMMC2_D6 */
+				 <STM32_PINMUX('E', 7, AF12)>; /* SDMMC2_D7 */
+			slew-rate = <2>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+	};
+
 	/omit-if-no-ref/
 	spi1_pins_a: spi1-0 {
 		pins1 {
-- 
2.55.0


