Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3280CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CpNW+UpYRuDgoqyyFwuwIoZVC63FH8kw8PohDDp4+kg=; b=pfVQBK/HMLr1oX8fKWM0bsvXsm
	4UvcajRllk8BwSF6GGCcrfxO/NUiJb1qbHLvQjNOc+P8EdnSqVUXDNLXtvRde81+aXWbAUiro3q56
	4qF09TAE8JKnduOVZVbrU+8mSQ0ZfP4PxdYE0O58QLdO8pQH4q7EG3aVgZG/rJA/dudjXd5OkTsKh
	XERS72etDdzkwXqocLL8/KFoDv9bQNBzemwpDD2MCbp1SdyJpqzPg5TPe8eUcuwwz4T97ulLPEkca
	t5zOGsw8FtWCBIAR/CK0pvGtGgnun8fJqW0tZMtHiafvx1oOC/ENTZrFT38r+90CPiEh02Lkp69G9
	xnqyMi7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9oM-00000007CJo-3lFT;
	Sat, 30 Aug 2025 00:51:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us6PX-00000006sng-0Gjy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 21:13:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7F3EE60142;
	Fri, 29 Aug 2025 21:13:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DADEDC4CEF0;
	Fri, 29 Aug 2025 21:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756502006;
	bh=JZ0CWieAD+hPk8tcHz5WX7FBAOxPPfeaj0F6aTNx4zg=;
	h=From:To:Cc:Subject:Date:From;
	b=aqXMinr0mzFFf3X/Qxc61FXYoalDlBqS+T9E1Unr43Jv3nAytC2tYjUPS8H7H6aVJ
	 GOOcOMlX0CXlYaFGiD27NXRr6HQ+SPdQtw0AWMhcAsTraMdIqeXvwt7wyAbxCUvIN0
	 Yfl4/n2cRQ25OMuhUDPlqNL5ICChxRmnh6CY5k70wMMb6ZrK42UyVCUsEJjV2NnoEo
	 YNJ9OFyNjVmn0mEL4PF5QprtjxR9P2jDbL/y0UA/oQ65w6ScBRIiajsb0shF1ITVaO
	 SjJ1Ix36+X83Zpk5cDCNdUhLYB4cGUQf30kfNc0U2n9TO3FefHDBroMbaItRVUnR3V
	 zrlPT9+9a6G9g==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: aspeed: Drop "sdhci" compatibles
Date: Fri, 29 Aug 2025 16:13:17 -0500
Message-ID: <20250829211318.1335862-1-robh@kernel.org>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The "sdhci" compatible is not documented nor very useful on its own given
the various features and quirks of SDHCI implementations.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index acdb6ae74b27..61983feb2a4e 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -662,7 +662,7 @@ sdc: sdc@1e740000 {
 				status = "disabled";
 
 				sdhci0: sdhci@1e740100 {
-					compatible = "aspeed,ast2600-sdhci", "sdhci";
+					compatible = "aspeed,ast2600-sdhci";
 					reg = <0x100 0x100>;
 					interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
 					sdhci,auto-cmd12;
@@ -671,7 +671,7 @@ sdhci0: sdhci@1e740100 {
 				};
 
 				sdhci1: sdhci@1e740200 {
-					compatible = "aspeed,ast2600-sdhci", "sdhci";
+					compatible = "aspeed,ast2600-sdhci";
 					reg = <0x200 0x100>;
 					interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
 					sdhci,auto-cmd12;
-- 
2.50.1


