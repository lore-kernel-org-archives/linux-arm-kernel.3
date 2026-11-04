Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34770606A333
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 15:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r8U8/oF2;
	dkim=pass (2048-bit key, unprotected) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.8680eb header.b=F1ZTjfF0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ux6OxlGrhrdw3ZXA1Gnjmo5HO2HQkPqq4M1z1Nbcc0M=; b=r8U8/oF2nrbWtw
	z9H0Z2WgXQAQAUENQ2niPbcRTpcoDG/afcdoIeCm1dWHNw1ZmLVExbuR+whkXG7NiqiO4dHLCAhBs
	qH4Wp8aSFk8rIEWtZWMWUS8lmxeE/+M/uV+Ji0HW6emKHBoWTsGfliC1RQuGwN9a2lfYAfxs2dySE
	0vvFfRKiQp1Je8j/P5QdUEXF/kQCzyBhGTpqjmtkjhGE5w2bSclc8wAEYfcswcOHd2wEyvFa1ky9T
	M0lJ59JuSavx31kFe2lcYob0s8mEnOLq7U2ZTymJsnnRySD7hZJnkKj6ZHz9mrP8TSJPOHr26zwmA
	yX+OFeNxK1hvSTu2pbVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOctj-00000005mVU-3Pnc;
	Wed, 04 Nov 2026 15:27:35 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOcta-00000005mOi-3L7u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 15:27:28 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 2F893240106
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 16:27:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1793806045;
	bh=Ux6OxlGrhrdw3ZXA1Gnjmo5HO2HQkPqq4M1z1Nbcc0M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=F1ZTjfF0Qv23wFDY+WzM++6mKq+twJgK7DGdhWY91iOsL8kzEt7usdI6NNHy9TEEg
	 OKcFSMFHRZ60wLbsrMxMct4gSHWJNnsOoxS3vcYbLC48jqy5EV54dLtwvkQQqH5dpe
	 gzqPf6K3u2SsYQlwJyyX9XNkh+jaWv8FY7Q73ldj+b+R1mU/c/vM1cMgINww6e4QD0
	 cxtekUtm8UNUKAnB8zH74HATlGeBOTZ/yYZyzmREXSmFAPRlvIuRLHyKd1sbiHfbky
	 RhiM8sQWrlI/IMcJBED2l7C0GvKel6K2QHR+yAr2b0+hEDdfSIYk5up+fLHpr5HrAo
	 HozVgvi6ORmvA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4jKTp30yDcz9rxM;
	Wed,  4 Nov 2026 16:27:23 +0100 (CET)
From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
To: Ulf Hansson <ulfh@kernel.org>,
	linux-mmc@vger.kernel.org
Cc: Mateusz Nowicki <mateusz.nowicki@posteo.net>,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linusw@kernel.org>,
	Yann Gautier <yann.gautier@foss.st.com>,
	Christophe Kerello <christophe.kerello@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] arm64: dts: st: remove sdmmc2 pins_b from stm32mp25
Date: Wed, 04 Nov 2026 15:27:24 +0000
Message-ID: <20261104152657.14909-6-mateusz.nowicki@posteo.net>
In-Reply-To: <20261104152657.14909-1-mateusz.nowicki@posteo.net>
References: <20261104152657.14909-1-mateusz.nowicki@posteo.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_072727_128974_4490C544 
X-CRM114-Status: UNSURE (   9.24  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The sdmmc2 pins_b groups were only added for the eMMC of the
STM32MP257F-DK, which uses pins_a again. Nothing else references them,
remove them.

Suggested-by: Christophe Kerello <christophe.kerello@foss.st.com>
Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
---
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 58 -------------------
 1 file changed, 58 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 56c2c99a05d4..75d08fe33ec5 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -757,51 +757,6 @@ pins3 {
 		};
 	};
 
-	/omit-if-no-ref/
-	sdmmc2_b4_pins_b: sdmmc2-b4-1 {
-		pins1 {
-			pinmux = <STM32_PINMUX('E', 13, AF12)>, /* SDMMC2_D0 */
-				 <STM32_PINMUX('E', 11, AF12)>, /* SDMMC2_D1 */
-				 <STM32_PINMUX('E', 8, AF12)>, /* SDMMC2_D2 */
-				 <STM32_PINMUX('E', 12, AF12)>, /* SDMMC2_D3 */
-				 <STM32_PINMUX('E', 15, AF12)>; /* SDMMC2_CMD */
-			slew-rate = <2>;
-			drive-push-pull;
-			bias-pull-up;
-		};
-		pins2 {
-			pinmux = <STM32_PINMUX('E', 14, AF12)>; /* SDMMC2_CK */
-			slew-rate = <3>;
-			drive-push-pull;
-			bias-disable;
-		};
-	};
-
-	/omit-if-no-ref/
-	sdmmc2_b4_od_pins_b: sdmmc2-b4-od-1 {
-		pins1 {
-			pinmux = <STM32_PINMUX('E', 13, AF12)>, /* SDMMC2_D0 */
-				 <STM32_PINMUX('E', 11, AF12)>, /* SDMMC2_D1 */
-				 <STM32_PINMUX('E', 8, AF12)>, /* SDMMC2_D2 */
-				 <STM32_PINMUX('E', 12, AF12)>; /* SDMMC2_D3 */
-			slew-rate = <2>;
-			drive-push-pull;
-			bias-pull-up;
-		};
-		pins2 {
-			pinmux = <STM32_PINMUX('E', 14, AF12)>; /* SDMMC2_CK */
-			slew-rate = <3>;
-			drive-push-pull;
-			bias-disable;
-		};
-		pins3 {
-			pinmux = <STM32_PINMUX('E', 15, AF12)>; /* SDMMC2_CMD */
-			slew-rate = <2>;
-			drive-open-drain;
-			bias-pull-up;
-		};
-	};
-
 	/omit-if-no-ref/
 	sdmmc2_d47_pins_a: sdmmc2-d47-0 {
 		pins {
@@ -914,19 +869,6 @@ pins {
 		};
 	};
 
-	/omit-if-no-ref/
-	sdmmc2_d47_pins_b: sdmmc2-d47-1 {
-		pins {
-			pinmux = <STM32_PINMUX('E', 10, AF12)>, /* SDMMC2_D4 */
-				 <STM32_PINMUX('E', 9, AF12)>, /* SDMMC2_D5 */
-				 <STM32_PINMUX('E', 6, AF12)>, /* SDMMC2_D6 */
-				 <STM32_PINMUX('E', 7, AF12)>; /* SDMMC2_D7 */
-			slew-rate = <2>;
-			drive-push-pull;
-			bias-pull-up;
-		};
-	};
-
 	/omit-if-no-ref/
 	spi1_pins_a: spi1-0 {
 		pins1 {
-- 
2.56.0


