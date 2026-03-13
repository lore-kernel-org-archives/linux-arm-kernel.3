Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29B9105F78F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 10:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ph5gDdkCZ+xgn/xu1To049+phmQgTK5P4O8QXh/ouZk=; b=4IYtRy1kbjaAJaNfydn396TVAe
	zTMLKJWin2XhRvfgnFY+zb1MY/AGi9/n/qIA6YpunKiTIAXXmAeTK3NBNMoM4XzmzHp2OLvjleE7y
	Dy4VNOYV/kore7OEh6NoKn4v8RSHpa3QtzewPV0q18mF5VAy3v6mUay3nLKt24uWHcvwBMSDWYYv1
	+6NVpkwJj9XU3xGjrxUbkU9Yxd2pC8oKN0lVPWMoo9PwlEio111ec4dN4IjGpuUQk9yubT7cxz81+
	YX72z53dW4LR8BQOcydYAvpM17w8t1Xq2jNMAS/oCjHsKxDcbTB2Zg36vuzsTSpkr8R8dtJd9b/Pr
	UVzNZYKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zRZ-0000000HTkl-3uQm;
	Fri, 13 Mar 2026 10:08:33 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zRU-0000000HTbv-1dGa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 10:08:29 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 13 Mar
 2026 18:08:12 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 13 Mar 2026 18:08:12 +0800
From: aspeedyh <yh_chung@aspeedtech.com>
Date: Fri, 13 Mar 2026 18:07:42 +0800
Subject: [PATCH 7/7] arm: dts: aspeed: Add eSPI node for AST2600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260313-upstream_espi-v1-7-9504428e1f43@aspeedtech.com>
References: <20260313-upstream_espi-v1-0-9504428e1f43@aspeedtech.com>
In-Reply-To: <20260313-upstream_espi-v1-0-9504428e1f43@aspeedtech.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, <maciej.lawniczak@intel.com>, aspeedyh
	<yh_chung@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773396491; l=1060;
 i=yh_chung@aspeedtech.com; s=20260313; h=from:subject:message-id;
 bh=X4P9bqw/tIokZle3LT7wc0YRJfPr51Mfgbm0e+Wf97I=;
 b=kK0C0gMsRBFk9Iv1JxhBwvqxNK7ufbtGNrD4kw1oHLHc35n/Xyibin/aLRLMjakvBubMHuRUp
 n8kx0NtlapOC4TQXotHHwzP3cvScPvveTms/jil7qyQOqdBRtdJO8C3
X-Developer-Key: i=yh_chung@aspeedtech.com; a=ed25519;
 pk=o71dz0J8lpN+v0f3Mk4gT9PfVngADPC1Pex4aK6VigM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_030828_432951_3286E8AA 
X-CRM114-Status: UNSURE (   7.35  )
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

Add the AST2600 eSPI controller node with the register region,
interrupt, clock, reset and pinctrl properties.

Signed-off-by: aspeedyh <yh_chung@aspeedtech.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 189bc3bbb47c..84aec45f39e7 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -408,6 +408,17 @@ adc1: adc@1e6e9100 {
 				status = "disabled";
 			};
 
+			espi: espi@1e6ee000 {
+				compatible = "aspeed,ast2600-espi";
+				reg = <0x1e6ee000 0x1000>;
+				interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&syscon ASPEED_CLK_GATE_ESPICLK>;
+				resets = <&syscon 57>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_espi_default>;
+				status = "disabled";
+			};
+
 			sbc: secure-boot-controller@1e6f2000 {
 				compatible = "aspeed,ast2600-sbc";
 				reg = <0x1e6f2000 0x1000>;

-- 
2.34.1


