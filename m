Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED78E6F086
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 20:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EcsX7uDCRbuiIl7dRX9wEcE1RLO3su8HcpACXdkFO24=; b=nhlF98v3wRMtTiHmwrHmpI/A+/
	V/dIh3k0jftNMM3fFsNIUIr4mQDmuD8hEnhaZJqrzA6SAYUTtavZ2lIwIcJ9f+rzjEC7M1cV2lQTh
	SlywyGxPtfJrPTzaKHdUWGY3WkyCHmZhIKOpqvw7Yoz62GkpLhucjB6vwAfffOSrkQTlX6Ph0r6WG
	MvNSbxt9B7nH7R1MBqgzLh55h9BLhJ8SNYSYtlgv7Q73yLIk8w9lrJ0sw2uGPn+E6RuAlfWELnodN
	rgmV6AR1vQElSraHo6cv4nRbX1Mb0AvUAo3kCOrunr7PTSf3CyzAkaeg3MefRfpF9hNhmtl0JCCyZ
	ugPCDYUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY9GL-0000000G4qd-0TkH;
	Tue, 23 Dec 2025 20:45:45 +0000
Received: from mail.andi.de1.cc ([178.238.236.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY9GI-0000000G4qF-0WgJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 20:45:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=EcsX7uDCRbuiIl7dRX9wEcE1RLO3su8HcpACXdkFO24=; b=aMi5+Q6zkrPr2C6QMte8X/foa+
	jnRGVZVtGnyNTnlY/inifpOS8k//RLQIMkzC/afsiWeqzGULo9mTp7q0PurVZci5VHXFxranOUfFX
	W2OAAclI1Yc4061BqFnh+oRAUzEY381eZZf4Rz+10wUHN6oDRKKOTUG/hNfyF/s7xIdT1/5/EVoxy
	/xnREGfJQSnGNR2kuukYTZouR8N/KynsBSvNvTgt8iSrLHzaVc7J4c0Wa/CC+0KQueQmwFtm9MKSh
	dRu7n4HHlATmQeX7ESnUDEsY2hLkvt3NduvwMoR+rXY2Z0LFxs48aj+7vCDQ2ku6JnEjRGk13r0r4
	y9HQ9MbQ==;
From: Andreas Kemnade <andreas@kemnade.info>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH] ARM: dts: imx: imx6sll: fix lcdif compatible
Date: Tue, 23 Dec 2025 21:43:02 +0100
Message-ID: <20251223204302.519468-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_124542_171196_AA1C8DDE 
X-CRM114-Status: UNSURE (   9.39  )
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

Fix lcdif compatible according to bindings doc.

dtbs_check tested only, a glance at the datasheet shows that it should be
the correct fallback compatible.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/boot/dts/nxp/imx/imx6sll.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
index 704870e8c10c..c96669605d1d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
@@ -657,7 +657,7 @@ pxp: pxp@20f0000 {
 			};
 
 			lcdif: lcd-controller@20f8000 {
-				compatible = "fsl,imx6sll-lcdif", "fsl,imx28-lcdif";
+				compatible = "fsl,imx6sll-lcdif", "fsl,imx6sx-lcdif";
 				reg = <0x020f8000 0x4000>;
 				interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SLL_CLK_LCDIF_PIX>,
-- 
2.47.3


