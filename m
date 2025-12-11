Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565EAD41C02
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 08:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tp+xzlgYB5DRkmyHW/VuZG10lptnHgB70xDH+2/3gdY=; b=nVl7MqJkGc+RoAZKUlzCr/66IY
	M7ZJFLmLj1gaiO4ALkL/qMDtdpZut7p02nCTvv2vad1RdXa85PUKunYdcw28xmblesSKEIYNw7RBX
	OO2fKMUdrNVGjT6uxdR9qVOOv8PMh9/sXh5NCDoHDuESaX1A8PdCStIySvAWn0qvX5qgj4wqLQS7O
	QpLsTZDPqyb7VPhzSBIK1dj4yIqRJ5Dlzyer5HOvygZ3dIuETlrUypc+UScaPhzkhiNbUsPHVg/NG
	kabkzymmiYZcqj6ppu2o/91rZ3QiCR4FbO3ewzJ0QFg9LpFdYuRbtqho8kTFNye02ecKfTJgUiMGx
	CcQk8smA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTcK8-0000000GOfC-4Atm;
	Thu, 11 Dec 2025 08:46:56 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTcK6-0000000GOdF-3oAP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 08:46:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1765442813;
	bh=tp+xzlgYB5DRkmyHW/VuZG10lptnHgB70xDH+2/3gdY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=duP9PMvK5GwXWyss9okc3SXr+1TPANiqlHeKr1pIcDNebI76EnIRJoe1HinIal1sI
	 7qjvvNw/7Amqs0F2nXOEfHVXufshRdqFWffjz8KfKSGPPfYr6xjiLJnLxcOS/uRrWq
	 suwou0ffSYhYm+9pkLElVuzPCBcuIAmVaBO7j+vCKgTPmlBjMZYhDDHlV9GxgdK69c
	 LW+LfzvrgNnazyvAtd0vJBGxdouZj1sImF0bg0/LVRh2dlVt/wqheIZfPhwNWBD7SX
	 a3G1Z0IP1XspE4UlxZw6EBVtECvtAfCtFc5frTpqgeyZojhjYHKQjBDV+U/krni48E
	 kGJNsTsn5N3dw==
Received: from [127.0.1.1] (fs98a57d9c.tkyc007.ap.nuro.jp [152.165.125.156])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 018157D6B0;
	Thu, 11 Dec 2025 16:46:47 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Thu, 11 Dec 2025 17:45:47 +0900
Subject: [PATCH RFC 05/16] ARM: dts: aspeed: Remove unspecified LPC host
 controller node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-dev-dt-warnings-all-v1-5-21b18b9ada77@codeconstruct.com.au>
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
In-Reply-To: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Joel Stanley <joel@jms.id.au>, linux-hwmon@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-iio@vger.kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_004655_146586_F8BE8709 
X-CRM114-Status: UNSURE (   7.67  )
X-CRM114-Notice: Please train this message.
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

For the AST2500 the node was used for pinctrl purposes, and while the
hardware capability is also present in the AST2400 and AST2600, the
their pinctrl no relationship to it. Further, there's no corresponding
binding, remove the node for now to
eliminate the warnings.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 arch/arm/boot/dts/aspeed/aspeed-g4.dtsi | 5 -----
 arch/arm/boot/dts/aspeed/aspeed-g5.dtsi | 6 ------
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 5 -----
 3 files changed, 16 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi
index c3d4d916c69b..c0a4057fa53f 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi
@@ -376,11 +376,6 @@ lpc_snoop: lpc-snoop@90 {
 					status = "disabled";
 				};
 
-				lhc: lhc@a0 {
-					compatible = "aspeed,ast2400-lhc";
-					reg = <0xa0 0x24 0xc8 0x8>;
-				};
-
 				lpc_reset: reset-controller@98 {
 					compatible = "aspeed,ast2400-lpc-reset";
 					reg = <0x98 0x4>;
diff --git a/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
index 1456f04c2139..086c40fd12b8 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
@@ -504,12 +504,6 @@ uart_routing: uart-routing@9c {
 					status = "disabled";
 				};
 
-				lhc: lhc@a0 {
-					compatible = "aspeed,ast2500-lhc";
-					reg = <0xa0 0x24 0xc8 0x8>;
-				};
-
-
 				ibt: ibt@140 {
 					compatible = "aspeed,ast2500-ibt-bmc";
 					reg = <0x140 0x18>;
diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index f8662c8ac089..1ae816087f6b 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -624,11 +624,6 @@ lpc_snoop: lpc-snoop@80 {
 					status = "disabled";
 				};
 
-				lhc: lhc@a0 {
-					compatible = "aspeed,ast2600-lhc";
-					reg = <0xa0 0x24 0xc8 0x8>;
-				};
-
 				lpc_reset: reset-controller@98 {
 					compatible = "aspeed,ast2600-lpc-reset";
 					reg = <0x98 0x4>;

-- 
2.47.3


