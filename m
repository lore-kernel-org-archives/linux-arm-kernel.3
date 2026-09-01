Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1EFFC624D5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 12:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BNFGinQI2xxDQSHsVslGyftcgPlDSK5olqCUv4EtRWo=; b=dfY+pqOn0iILd/roY0gQRW+Nzo
	dQkQEnTK/rKCGtpclJaPFi5YwfcOfkuKNnFYotlzV3KBlAiqxMeyFktL2PTWOBq7cU1WTQ62FPXnW
	eHHdG+hA1ODyIO02RENotxJcMFCz0j2LlOxHJ3kPRIlzg/dHMPlxqPdpjjrJHJlT9aZJyHmoo5nYg
	pti35s9qLKv5uWz0yKeDFWrrPZ4cMcdAdsYUgZSH0KYwlV8TL91aZQp9cEdS1KYtx/bNjVneJyrxA
	eCaoKS/IXNmResxF10vmgHJU/x2/4ZNr+LtB4WtK8KC1Bw9J0A1yh7llhctS4smOKjv3LPkI2d2uM
	Jmh2Qobg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1NOy-0000000C4pE-3Wpl;
	Tue, 01 Sep 2026 12:15:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1NOx-0000000C4o0-3FE3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 12:15:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B76360A5B;
	Tue,  1 Sep 2026 12:15:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB69EC32782;
	Tue,  1 Sep 2026 12:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788264942;
	bh=nLtePXYENm7NHGSWbCsuDcLkBfW5HOLPz4P0eN7JISM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pooBuwYF+3uhA/orhnYs7yb4I/U3WwmcfYZXXbCj9/emrIHguFFRt+1DrFqXmilhf
	 omdqR7LoDDjj+ovDHlk+EDHihc7UvRXUv0WNRwP3MXDYhIsAWculTF9CJNlzj2ftHG
	 5lb0Qph0QIMSlUD6T022cdXCLkWQWGCWQOvEt5EB4tqRUGbM44FpoZCgXiOA7Hznj7
	 Woz3FhQz2nAAkqAx7pvsn2OpFFM80BBu7fA4t++octG7kHkuZCkbisbQJOQX2Ll0gf
	 MXncZ3nKRAWKK3i2Cd00FFD0uJiXIciBFr6fVDwQue/f0wKKkwsgxMJaRXRQmqppXN
	 4FCYm2dVE6AAg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6E2FC624D4;
	Tue,  1 Sep 2026 12:15:42 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Tue, 01 Sep 2026 20:15:19 +0800
Subject: [PATCH v7 04/11] ARM: dts: aspeed: anacapa: Add additional EEPROM
 node for SCM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-anacapa-devlop-phase-devicetree-v7-4-0bd71d2e0105@gmail.com>
References: <20260901-anacapa-devlop-phase-devicetree-v7-0-0bd71d2e0105@gmail.com>
In-Reply-To: <20260901-anacapa-devlop-phase-devicetree-v7-0-0bd71d2e0105@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788264931; l=1234;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=GjfjnpwE0tmhDKN4idVs7q9lvt+oOtXIm3xFGJyXtAY=;
 b=Xjyj/YLgnxmwvUG2EhkLAICBwMcmiu0PNukR8Dn+YySCsoeSBHer5ExcGt1nrjDMqJ4Kkndn2
 UATSXoO6RtdDHgZj+20c2BxO3mekWoae7CTzBwAXuf04gjN7lJrXQtT
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
 .../boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
index be7f17ad5f8e..77126418a702 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
@@ -3,6 +3,20 @@
 /dts-v1/;
 #include "aspeed-bmc-facebook-anacapa-evt1.dtsi"
 
+// SCM
+&i2c9 {
+	// SCM FRU
+	// | DC-SCM Rev        | Slave address of eeprom  |
+	// |-------------------|--------------------------|
+	// | Rev B             | 0x50                     |
+	// | Rev C/D/E/F/above | 0x51                     |
+
+	eeprom@51 {
+		compatible = "atmel,24c128";
+		reg = <0x51>;
+	};
+};
+
 &sgpiom0 {
 	gpio-line-names =
 	/*in - out */

-- 
2.34.1



