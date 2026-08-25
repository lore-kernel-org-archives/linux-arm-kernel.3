Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F40DAC61DCA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 10:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g4GD5tAd+3DQUnSfDKDsU0BWThEq3BCJxjpI8lKaAr0=; b=ebyR4gI9sHChmy45jsRVqlDXGw
	m1V19whySaqdMK74PlHnvi/J0m4PnNzURXUBKP65Rd4QlHQvT0IOpDSsDRfkI7qvW6nIyamvzL9fn
	VSdr4eJOnbZqXfDhJ/4xOzv+nZghdRSmN3R4Kz75XURwX6H2oz1oEtJ4Cpb78+g0/SiVuOZtEyQUl
	1ASgrd06tPglAWZlAC7nDuH7f3Vz8m68CIi95ilp6Umlcg+hGDxXeI9wPD3617Ph5/2hRyo6IDLG6
	LnfPqkEdkIxx7z53R9zIxlCXeS30UwnXJRb+Oe6hfmioAuY22G3cQAZXIHCb2L2Ed/xrZX0n1iIO8
	Gv5ZQB7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyohu-00000000dN0-1pMA;
	Tue, 25 Aug 2026 10:48:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyoht-00000000dLM-0JxS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 10:48:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 86F2244EBA;
	Tue, 25 Aug 2026 10:48:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 667DEC32781;
	Tue, 25 Aug 2026 10:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787654920;
	bh=hOPf1LjDT4s/OsOzZ2OJtL3XdwwW4MxYaI4DYi2V2sU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OSFvEz5oV8Y3l/1TyLawkleLuvr2nBr89ZNKh22mbjevlimUgbpVaJyT6pqqVsLJd
	 M01Q9d0g71TSoK8dSsPJM1jPbb0OAuajb3uGsRZeWTcvqGeYAnOH5TWMw7uvgmJDob
	 Vt3CuHgZhSZ8+YYhYiRBl1jOik/3OZFxe2XsVTfI4aRcrgSqC1TQl1YfHXYdeiw3Ly
	 cE9octPQldmxLD+Oi42p1gQGBVJsgYPZonl24wGEtTaAQhnKdD1hp4rp3Z5z1fP+mI
	 byYu3FV16JO1ObHhH0asIs71U9+sm/tX+zF9dKwasqFsztlAfA7ncLrnmMVRdhF40O
	 QV05thF2EWRtg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53F5BC61DB6;
	Tue, 25 Aug 2026 10:48:40 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Tue, 25 Aug 2026 18:47:47 +0800
Subject: [PATCH v6 06/12] ARM: dts: aspeed: anacapa: Add eeprom device node
 for NFC adaptor board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-anacapa-devlop-phase-devicetree-v6-6-9059a2a279ce@gmail.com>
References: <20260825-anacapa-devlop-phase-devicetree-v6-0-9059a2a279ce@gmail.com>
In-Reply-To: <20260825-anacapa-devlop-phase-devicetree-v6-0-9059a2a279ce@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>, 
 Carl Lee <carl.lee@amd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787654905; l=842;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=W3IShAyxygRLxWChQBNmztwL/6A+5D13GAPOb/9nyvI=;
 b=5x1Obe8eZXfIFVi/XcjUmqoHbfzWEKr0Q2Ht3cV/i6rI0oARG/5URdCp987sJGxoggp4J2waU
 Fy/L2QvVoLqCe/2IXYU1hvkPrEWLB4L3HvsOWWn5V0E56PpgZEwEYKk
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
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
Reply-To: u8813345@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Carl Lee <carl.lee@amd.com>

Add eeprom device node for NFC adaptor board FRU.

Signed-off-by: Carl Lee <carl.lee@amd.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts    | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
index d2b4855ff1ad..22f79a2c2639 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
@@ -22,6 +22,19 @@ eeprom@51 {
 	};
 };
 
+// MB
+&i2c13 {
+	i2c-mux@70 {
+		i2c@7 {
+			// NFC adaptor board FRU
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
+		};
+	};
+};
+
 &sgpiom0 {
 	bus-frequency = <2000000>;
 	gpio-line-names =

-- 
2.34.1



