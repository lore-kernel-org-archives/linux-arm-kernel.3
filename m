Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA0DE6FE51
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 22:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zesieDMS+8jPaC30brfolPDkkyIu1P+PmJ186yiohqE=; b=B5r65RR5i7j1S/bmyxgIvTEkQq
	wMDaxQ/W4Zz2DC7pD/UpxdySnaCvGO7A606qeBLcz5pn0tBTrOw2BkCB4vQygGCQhCj6XTj53tbJo
	JoAq2fuDOiTsULqe22ssD9Z25QOPWk8TLL3hvzLIuf5HwfORxrpS5K/DXFVfJLx4D6U8QWWVNIa5B
	J3e03DO2TLszDjxFoCubPOdqBBD9kvO6UNwsG4Yb8l/wyMyb8uU5Dj3NAStJWTb6yUb+wLxbKrqgd
	9rAbpX38VusZsFBNYPl8JCWnkthP7uNoe2UI0gJA22b1PfOuudObtzR+juLYimvPiHofF81KeED0U
	1cbh6V9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYAoR-0000000G8nP-36QD;
	Tue, 23 Dec 2025 22:25:03 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYAoO-0000000G8mn-0r89
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 22:25:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=zesieDMS+8jPaC30brfolPDkkyIu1P+PmJ186yiohqE=; b=uRU49PUnHSF4uxGmyh6FNrTZim
	VU0xUUxM3WKlb8nuTRR19m1I/zVhEPCtd/J0ulf/BZ2siXHrfx1YYMeQdi2WE6cqe6ZOAfY51EEpJ
	B7CgkXpdRfmCnuPhXEYrWZqPvYAURly5Dx5Chub6/jVH5Uq9pS3TYXd51HM/PD5jtEc2y+V+NSgR4
	Lm8ADAstRik6orcKiNjbAPT+yjoEq++ZQ9kEKd2Qdnh7sNKjzH+bfTP8l9LYqK2DSHpdjfGdpoYYL
	N7Qp9nUHM/tXHNOZ36QnZpPi4Tfrq6ECOTBWj51dl6rdoBsOigNNxGEy67RfEOnmkWgkHPsqv8Vi7
	Fzi7WUVg==;
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
Subject: [PATCH] ARM: dts: imx: imx6sl: fix lcdif compatible
Date: Tue, 23 Dec 2025 23:24:35 +0100
Message-ID: <20251223222435.538096-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_142500_255308_B110DB2E 
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
 arch/arm/boot/dts/nxp/imx/imx6sl.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
index 7381fb7f8912..13b0474aa42c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
@@ -776,7 +776,7 @@ epdc: epdc@20f4000 {
 			};
 
 			lcdif: lcdif@20f8000 {
-				compatible = "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";
+				compatible = "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif";
 				reg = <0x020f8000 0x4000>;
 				interrupts = <0 39 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SL_CLK_LCDIF_PIX>,
-- 
2.47.3


