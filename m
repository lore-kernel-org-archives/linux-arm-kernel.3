Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A8BD41C02
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 08:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8PfQPChFD52EYAoiUYy2MTDPMEeHwuPds4q02w/3Uek=; b=CLXa7MH/cpm0WhXFNOzSWPAhx9
	xP28Ms8GwGJbI6C1C5w4YzcfnpXGXF4Rg4uv/NbkL2l1Y7fXzGP29tqXleoDfZ+0dGPwZRYJ5AboV
	G+fheUu+kRkTMdQoVw0XaM9dv9uYQBpnk8s+/+o9FipNVDcbMsxmCn8Z52P8KNg+vmSqRerSpD/ai
	aNH/Ke4NMGInPaK4+RQhTg01FAOUJl2X7Tvc9N4Zf/FXKwxCIP9MJzAR29e9forObt/bjWXelnGS+
	lZqeCURBVnf01lOZmaaAhLW+Tgcht+/JBFdHc5D5WdrSJ7V3KiVLQcrS/+G+ezRihp/Rw4iM5bhx1
	xJs3N6WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTcKm-0000000GPC0-1sOm;
	Thu, 11 Dec 2025 08:47:36 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTcKk-0000000GP8P-0259
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 08:47:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1765442852;
	bh=8PfQPChFD52EYAoiUYy2MTDPMEeHwuPds4q02w/3Uek=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=CkaARP7q2FmBiS7MCWrjA+CSe0QJl56qQarhnVOQmEXNG5vcqit2PYUaIBPtvFfR6
	 ITOJR4pCktJRSIlEmgryphRbHnb2xYBJTxcTNsLb9j5fuI5deRF1y6sfSO7LGuewoq
	 L6196eAJAaLbsmoF0t7LGKbmUtfT/h7j3eS6pR0oDP61d7l4NBgKZoAfwZq/4XSrg3
	 F34Sj+1lOGUEyduANOL8lIOucie7DQJLjzjIGhGyAkdqIf12Wz+jDJQ0JFl0TVQ5fo
	 Xm5env2vkbKE0/3XTSrzBj9GckURcubpBEHdejk/F7aN6RAHt5GNJ0opZwB4ycjrzW
	 u1n1ylv7thhkA==
Received: from [127.0.1.1] (fs98a57d9c.tkyc007.ap.nuro.jp [152.165.125.156])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1AA457D6BB;
	Thu, 11 Dec 2025 16:47:26 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Thu, 11 Dec 2025 17:45:54 +0900
Subject: [PATCH RFC 12/16] ARM: dts: aspeed: g6: Drop unspecified
 aspeed,ast2600-udma node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-dev-dt-warnings-all-v1-12-21b18b9ada77@codeconstruct.com.au>
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
X-CRM114-CacheID: sfid-20251211_004734_251219_DEC3B421 
X-CRM114-Status: UNSURE (   8.73  )
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

There's neither a binding defined nor a driver that matches on the
compatible, so drop it from the devicetree until someone is motivated to
solve the problems.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts | 4 ----
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi                   | 9 ---------
 2 files changed, 13 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
index ea1bf6f402bd..2aff21442f11 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
@@ -1293,10 +1293,6 @@ &mac3 {
 	use-ncsi;
 };
 
-&udma {
-	status = "okay";
-};
-
 &uart1 {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 86b30e38fa25..4583c68748c2 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -861,15 +861,6 @@ fsim1: fsi@1e79b100 {
 				interrupt-controller;
 				status = "disabled";
 			};
-
-			udma: dma-controller@1e79e000 {
-				compatible = "aspeed,ast2600-udma";
-				reg = <0x1e79e000 0x1000>;
-				interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
-				dma-channels = <28>;
-				#dma-cells = <1>;
-				status = "disabled";
-			};
 		};
 	};
 };

-- 
2.47.3


