Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87FEC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 22:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y2NGcQHepQEbDwK1/helvLsNzofswCWPbS6vNwKd9Ak=; b=xB+gOyG3ZxX92IDuEuaSQpxBbH
	Le4BDM4dOIZBrGT6mfci8xecImY4tiew9VwpwIlI8D8WOmbzqxWUhJVJx3RM4RYu/FTba2iXTdPOY
	xlnzPop4dum3xD3A33Wum08RYM8DGsme268I6kfl3NfYP5bWxp4IIh3A6Hr/1b2rfweUg4E0vshyA
	hSwy+M0zAYnsCn2Or+DWksChfa2EPBwboW+XqHH6ZX/l6akGfx8njd/wbseSud/vEVhdZJfvKKaTE
	6HT8kNiyAuxPPsvM5obaHS5lLtkTxhoB6Ai/Eu80YJAuR+SeBfwMjuENTJPOQtylt+TRNgVYaAz1U
	qoDlf9iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhbYY-00000004XZP-34oo;
	Thu, 31 Jul 2025 22:15:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhbVx-00000004XAR-3YEV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 22:12:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2A44D6112C;
	Thu, 31 Jul 2025 22:12:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA040C4CEEF;
	Thu, 31 Jul 2025 22:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753999960;
	bh=cfyyeN6Mb/ojJhksgCO4DWogxFkAIMP5MsCuIL3s2YA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=r8+yQ7J97MSgjECdZIEpPz29v94q0XLnMmAmK2wKV/FeSbIh3sAdiodOLVBHToGsa
	 JyE7pZIcE2Ub9FFFAZTd6zo7jKpRSLN+0dJVSoeeR9IA8uiclLH99KXbDgwCOa+L9c
	 zR8d2LIhi089je4vkNYTVcG39wWMQSQT0atXVG09MCB8IBLeX2+dlc2dU4kCiyMeAM
	 MDZiTuwsPs9csc/aiQTANOSooPHM1VbPYrvNKdJadQ5Ds+UWUMEnCU1gogLjfl4QsL
	 KuC59InQMObYKalpvPNkwqKwDqLffkwDooCVXzA9uIxkmhMW6vDZfugLL+Lwos32Hu
	 QvYjfh2eNYuaA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 31 Jul 2025 17:12:18 -0500
Subject: [PATCH 1/6] ARM: dts: aspeed: Drop "no-gpio-delays"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250731-dt-fsi-cleanups-v1-1-e7b695a29fc3@kernel.org>
References: <20250731-dt-fsi-cleanups-v1-0-e7b695a29fc3@kernel.org>
In-Reply-To: <20250731-dt-fsi-cleanups-v1-0-e7b695a29fc3@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Eddie James <eajames@linux.ibm.com>, Ninad Palsule <ninad@linux.ibm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-fsi@lists.ozlabs.org
X-Mailer: b4 0.15-dev
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

The "no-gpios-delays" property only applies to the "fsi-master-gpio"
binding and not the "aspeed,ast2[45]00-cf-fsi-master" binding. It
doesn't really make sense either as the timing is controlled by the
offloaded firmware.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dts | 1 -
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dts      | 1 -
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dts     | 1 -
 3 files changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dts
index 78a5656ef75d..f42254ba6aeb 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dts
@@ -57,7 +57,6 @@ fsi: gpio-fsi {
 		compatible = "aspeed,ast2500-cf-fsi-master", "fsi-master";
 		#address-cells = <2>;
 		#size-cells = <0>;
-		no-gpio-delays;
 
 		memory-region = <&coldfire_memory>;
 		aspeed,sram = <&sram>;
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dts
index b1d0ff85d397..e5b8d07e7622 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dts
@@ -80,7 +80,6 @@ fsi: gpio-fsi {
 		compatible = "aspeed,ast2500-cf-fsi-master", "fsi-master";
 		#address-cells = <2>;
 		#size-cells = <0>;
-		no-gpio-delays;
 
 		memory-region = <&coldfire_memory>;
 		aspeed,sram = <&sram>;
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dts
index 24df24ad9c80..2180fa9b6f24 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dts
@@ -71,7 +71,6 @@ fsi: gpio-fsi {
 		compatible = "aspeed,ast2500-cf-fsi-master", "fsi-master";
 		#address-cells = <2>;
 		#size-cells = <0>;
-		no-gpio-delays;
 
 		memory-region = <&coldfire_memory>;
 		aspeed,sram = <&sram>;

-- 
2.47.2


