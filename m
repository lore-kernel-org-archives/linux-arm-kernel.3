Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 800B9C61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 10:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BTBOy9XW2gZktm9n25oDf5QpxmvNxqSjG7PPGIT1nP0=; b=V0GFH81VkECwJVB0MoEBJKK34+
	SjyxAldX9MeTvLY6ctMTGBfB0PBPXsAhPIJt6vA8+yXOBuMEOUUyj01GlpnLN1ZRBJ0WpGczQEhzJ
	QqPsG7IE9P66RurpXecZpQ4gZwBtkWOfsRYntq+/ikndbE2+2NBo5sfjPh1x70vnNVVtspAN4IKAt
	AeyM4mcfJnHi4yWBI200W2B3cSfA8T8jaj1/5GvsvXK7+qXmrMmV5gVpE8bpEexfjmp92D9gPw/mR
	M1u7/6AyFDKVGkuYoZV6APRhTp6hDvW4LbjcvtKpHIu6N0Z7YNC688KjU9l71VO1PIRx5vCBY4tmY
	y4WlnwOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyohy-00000000dRc-3Et9;
	Tue, 25 Aug 2026 10:48:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyoht-00000000dLk-2DWL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 10:48:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3DEF944FDB;
	Tue, 25 Aug 2026 10:48:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 112B3C4AF12;
	Tue, 25 Aug 2026 10:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787654921;
	bh=16Ku8dX3mO/gcbNRdCYEkNsA7bUoTUoknNALDTnAIUM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Ir5hUKw896BzQ5HWKZv1sLJSBbsgEQPbUkb0A4gDm3R8WoxYOMbf1XrwiCgCW+e2/
	 DlztZnWWaa+W+NmOQz9CqHT4JO/ixxs8JOAqJTlbrsP9pMH2AKP1PI3NiA3pRbj104
	 t2y82J/hUhKFcp+ydhnsIUDBpWOelBugr/gimbCdhreR5Zh2hvDT+kg3tWe9HaBrHP
	 4mUO4OpL/Vc4r2p4fxx5cnBj5hSSLLd9abO2Apc9H6N7KsoL8c7BoZBQUMKcNL/i12
	 +9LFfzfTh8daApDKwET9oC+vTNoRwFlVJw9AJQop+GWisbmOk+nhQC5zpVQq7L9koo
	 SQMLgIR2fg7RA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFAA1C61DC2;
	Tue, 25 Aug 2026 10:48:40 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Tue, 25 Aug 2026 18:47:53 +0800
Subject: [PATCH v6 12/12] ARM: dts: aspeed: anacapa: Add SPI flash VCC
 supply
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-anacapa-devlop-phase-devicetree-v6-12-9059a2a279ce@gmail.com>
References: <20260825-anacapa-devlop-phase-devicetree-v6-0-9059a2a279ce@gmail.com>
In-Reply-To: <20260825-anacapa-devlop-phase-devicetree-v6-0-9059a2a279ce@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>, 
 Rex Fu <rex.fu.amd@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787654905; l=1370;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=LtEnhYtDTDdaFJ8Tq5vy4icjC937RP4+reqqmwZJfEY=;
 b=tPqM9x7iBx4Q7kaW/I2LUyeTaNwihkP+gBdmjQ9uMV+pvqC+B1zq5uUw2RQ4umZ7N8hhJCHjl
 rfrrsJmtiDxA1XkeI9iLyhclx/ysdHZhAwGTk2LJj6kxjjDlz53EkQH
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

From: Rex Fu <rex.fu.amd@gmail.com>

Specify the 3.3 V auxiliary rail as the SPI flash VCC supply to
avoid using the dummy regulator during device initialization.

Signed-off-by: Rex Fu <rex.fu.amd@gmail.com>
Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 .../aspeed/aspeed-bmc-facebook-anacapa-evt2.dts    | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
index c36519a601a9..ecb1c86f9e90 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
@@ -6,6 +6,14 @@
 / {
 	compatible = "facebook,anacapa-bmc-evt2", "aspeed,ast2600";
 	model = "Facebook Anacapa BMC";
+
+	p3v3_bmc_aux: regulator-p3v3-bmc-aux {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "p3v3_bmc_aux";
+	};
 };
 
 &{/aliases} {
@@ -27,6 +35,23 @@ / {
 	i2c51 = &i2c10mux0ch0;
 };
 
+&fmc {
+	flash@0 {
+		vcc-supply = <&p3v3_bmc_aux>;
+	};
+
+	flash@1 {
+		vcc-supply = <&p3v3_bmc_aux>;
+	};
+};
+
+// BIOS Flash
+&spi2 {
+	flash@0 {
+		vcc-supply = <&p3v3_bmc_aux>;
+	};
+};
+
 // MB - PDB
 &i2c8 {
 	i2c-mux@72 {

-- 
2.34.1



