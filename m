Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A33C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 12:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d0tywJCfbOhm61+aKB7StJw/Wnlb1AmUDCDWwg2YRD0=; b=ld45MNR28Zp3ixQCn6HMWNYE+l
	uWg5RNg+ZTzgOBGJx06qUg/oG8K0HQhKz8JcciWCeeQVKoGu+N1jj+W6S4ReujAyjDd3hRWPFz/gM
	e9tKula8w7cYqktZ8RNQG72+212eE45R0lCVDrmGxeZdGHVRa8JKNYf6QAe7Oevl/5SlxlmL2QrWK
	JznJuFq+Ia6/iUfcut1gNYRcxnCcUXQcmFR7BrnxCJduLqKZfl4jqf+OwHPNKr4oEaMPgeIUiBzf6
	9uJETHpNxluTWjrKsArM3zKWlCtCwZ0NnASUwIcW3HTVb0eXHZ0YwrFTzXL3ryC65gH0RNg8Oxz3m
	hMiZTywQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuU6O-00000000bCA-2bar;
	Thu, 13 Aug 2026 12:00:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuU6L-00000000b6o-2oY6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 12:00:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1BB59441F4;
	Thu, 13 Aug 2026 12:00:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 14EAAC4AF0B;
	Thu, 13 Aug 2026 12:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786622401;
	bh=LdloDJM8DI8AB4ZLQsP/+vZzjiWKgFCiLWLBMA7iRMU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PHD4+8iY4g64WfA6GeqgD2dm0vqsQA/8sYXhk/vVU82SO1QyronzXhDyAVV6Ky2eX
	 7RtPGAyT6dTkiarhtwQABKOQ0jt/GJmUcd3irB8VNtsom8tHpt8meyHe/vt+36EbL6
	 QI14lFHb9qk4i+XjtYuR2z6r8d7JPyI86PszjaesIaK2hwGTnBAeMd7xkvX74Cj+ry
	 SCqmD5ynZRDwH0KiBooGtlSsFAa/umAl0K0D5BKs/gG13DkogXDHkGoIJRfB0n6rYD
	 4QmiZQkD3YsEvNkWgfqXZn6YGPM51HPff8atlxqnBeHr5La3aOIx8wJtAwUwIVWNqr
	 4MIjavFY3mxZA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E50A5C5B572;
	Thu, 13 Aug 2026 11:59:59 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Thu, 13 Aug 2026 19:59:35 +0800
Subject: [PATCH v5 05/15] ARM: dts: aspeed: anacapa: Add additional EEPROM
 node for SCM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-anacapa-devlop-phase-devicetree-v5-5-c7058f63dc67@gmail.com>
References: <20260813-anacapa-devlop-phase-devicetree-v5-0-c7058f63dc67@gmail.com>
In-Reply-To: <20260813-anacapa-devlop-phase-devicetree-v5-0-c7058f63dc67@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786622378; l=1250;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=NAF+xcmhfBdWvCk+Ea9KmPCdarcFxDgMq2cQBYIvfaY=;
 b=GHwHvs4ys0MLQH953QcqjpV0BvokVUy7o0nAOQbdm3qoZx99LemxUR3/Xq4QtB8pqC9EY7EDN
 /RpFy7xbMRECJ40iZUiEavkTN83q8+x9aduHyCXZl7TNP1u1n0hKvEO
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

From: Colin Huang <u8813345@gmail.com>

The SCM FRU EEPROM I2C address differs between SCM revisions:
- Rev B uses address 0x50
- Rev C/D/E/F and later use address 0x51

Add an additional AT24C128 EEPROM node at 0x51 on i2c9 so the same
device tree can support multiple SCM revisions.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts   | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
index 4a6ae7c6cbf8..1901a325c72c 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
@@ -8,6 +8,20 @@ / {
 	compatible = "facebook,anacapa-bmc-evt2", "aspeed,ast2600";
 };
 
+// SCM
+&i2c9 {
+
+	// SCM FRU
+	// | DC-SCM Rev        | Slave address of eeprom  |
+	// |-------------------|--------------------------|
+	// | Rev B             | 0x50                     |
+	// | Rev C/D/E/F/above | 0x51                     |
+	eeprom@51 {
+		compatible = "atmel,24c128";
+		reg = <0x51>;
+	};
+};
+
 &sgpiom0 {
 	ngpios = <128>;
 	bus-frequency = <2000000>;

-- 
2.34.1



