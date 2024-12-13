Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316A5E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 22:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZTTvubC9ezmn65kgU3YCWlLh+bLdIMOBAokRNNoYPpA=; b=favPlRh4k2CxJnQbD6LYvG6xPt
	wVtwSstDLA4XecLilG0dg8y7p+ZL1KYC5rmONh9HlFNJqovmO1veMIu90GYO3Ddyb3wfQBeuhtXOo
	ZBLFu25wmcOIdccO5pI5K4Jm+aX+dcHQ9L2fMv/WEdJTmBNdFXtrZdLcFhExyIOHXHHZ7DxXZoCpF
	P18jej+QK81ykWiQKSYV2OPaH+jbk5NubQBeIyUDXbS1OYirBt735VMd1177IksMQoXmCzi7WO8vJ
	TYGMc46Uliu6Dcm8bZfi2CXT5uXqd0ZdulLWuCRHM118YsIgsic+HUCO4rJHQ+FyuCpno43BoSf0h
	Lk/MXbiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMEIh-00000005Cwy-13kF;
	Fri, 13 Dec 2024 22:38:23 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMEHb-00000005Ch6-0jZO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 22:37:16 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E0AD110485891;
	Fri, 13 Dec 2024 23:37:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1734129432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZTTvubC9ezmn65kgU3YCWlLh+bLdIMOBAokRNNoYPpA=;
	b=Rb7f27+RBEpv00UPjXw0WVxPdixnIjWaCRPeutLicsMfP5pAMZY0XuYfpYsXnqsEXzkwAu
	5MS+0HtKRdWc2W01N/cNSFY4Mt0UlmZGYQMvoLM6/AAIMHdvjBDuHQmqzYUxWvJYF+I9iT
	UlsLj0sxp/ttfdKwueOuSyPE2FNWr/Tijjjmdy/QPGV0hZAKYl5E+lU1vBbx2b9mzgGYz2
	PWCh6MMsDlsu26tzVLs0Ta2hODRg0YJr4h2Vmn6wwf1ovgUn6FabfRyH3pZ7iT6/dNJjsQ
	e8cjSweahT7BefefgAdG+4IEcfmi5z7yW7pasrpbzeOpqQwm4bxgk6aQVQ+IiA==
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
Subject: [PATCH] ARM: dts: stm32: Swap USART3 and UART8 alias on STM32MP15xx DHCOM SoM
Date: Fri, 13 Dec 2024 23:36:25 +0100
Message-ID: <20241213223658.99802-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_143715_354514_FF5E6815 
X-CRM114-Status: GOOD (  10.60  )
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

Swap USART3 and UART8 aliases on STM32MP15xx DHCOM SoM,
make sure UART8 is listed first, USART3 second, because
the UART8 is labeled as UART2 on the SoM pinout, while
USART3 is labeled as UART3 on the SoM pinout.

Fixes: 34e0c7847dcf ("ARM: dts: stm32: Add DH Electronics DHCOM STM32MP1 SoM and PDK2 board")
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
 arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
index 086d3a60ccce2..142d4a8731f8d 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
@@ -15,8 +15,8 @@ aliases {
 		rtc0 = &hwrtc;
 		rtc1 = &rtc;
 		serial0 = &uart4;
-		serial1 = &usart3;
-		serial2 = &uart8;
+		serial1 = &uart8;
+		serial2 = &usart3;
 	};
 
 	chosen {
-- 
2.45.2


