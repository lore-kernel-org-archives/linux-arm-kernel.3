Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C84C44509
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 15:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jrrfogBkoUTUQtPpOPPb0EfuLBqOI+De983Yj09gBhs=; b=ekQ544yBTi4fKcvTHX9LWnoNys
	U7H+3L/fBZ3sQHK8N0VFFA9p8c0t1A/fmI2XEAtgvkuW99H1PgPyGXhZe7pQz/OUupwsIBHbCKZVO
	Vdz+d+rFxqE2N/8Fnlry+vddWf5+uGy/6IVMg6Lp9YNhMx8t9/TZ7i5II95tUG3h133Z8jIpoyhCn
	3P2/rUVSkSCFJWVS6/Zw5wOERuSU10XK1furBdCb94QdEzr6gYLejZ7F+u29UrlvCyMQzwEQLlY36
	2u6zc5JUseKGhkYfofyh3HRmILHiJ80NSnkp1tNHCYK920f3h5DIrseSlt+t4PIT8ltuiFL66yUfR
	mApTpMeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh82Y-0000000FNoE-1IQy;
	Tue, 07 Jul 2026 15:48:54 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh82Q-0000000FNiQ-0iG9;
	Tue, 07 Jul 2026 15:48:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783439324;
	bh=Mar/IjyYNl2k5CmvryGot5Czt1iXajxPeDD0/orHm60=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HrmAgmSjnsXID9yOGAFl/PwNk65/CGCPxWHNqqOMyBJLLiJQpEmmTJsT4us9bOiQZ
	 R1s1evjNb2YBqKVeXPith7A6Y8fL17N+a6nmHQ1HiFl9Bor7oRA+UckGMgK0gXb4fc
	 SKdcnw5Hb3RPZCrIQHNUzWB2O28jQ46xVhN+Nwm+Z8ISipwSoiF7ndluEKmWbgBAw1
	 tlvTnRigUVCYm6ztqIS+bnR/MdiSxI21JByhT2Rex5bm8ZAxISiQMMAy2wPDTuNWPR
	 Kja1Vfxzoc4RwQm22AGg36sjOXsdYBRJOF7RuWPWimp4equHJCC6ZhlbFDyw7apOGD
	 1nfFprUo8/d5Q==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E8FE217E00F6;
	Tue, 07 Jul 2026 17:48:43 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	justin.yeh@mediatek.com
Subject: [PATCH v2 1/7] arm64: dts: mediatek: mt6795: Remove deprecated UART DMA property
Date: Tue,  7 Jul 2026 17:48:35 +0200
Message-ID: <20260707154841.198870-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707154841.198870-1-angelogioacchino.delregno@collabora.com>
References: <20260707154841.198870-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_084847_478089_B4565AC6 
X-CRM114-Status: GOOD (  11.44  )
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

Remove the mediatek,dma-33bits property as it is now deprecated
and, while at it, also remove the fallback compatible as it was
not entirely right to use anyway, because this IP is not fully
compatible with the one found in MT6577 and would create more
issues than the ones it could resolve (as in - it's better to
not probe the controller than to probe it and manage it in some
incorrect way).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index 134cfa77e3b1..6dd706b27830 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -547,8 +547,7 @@ uart1: serial@11003000 {
 		};
 
 		apdma: dma-controller@11000380 {
-			compatible = "mediatek,mt6795-uart-dma",
-				     "mediatek,mt6577-uart-dma";
+			compatible = "mediatek,mt6795-uart-dma";
 			reg = <0 0x11000380 0 0x60>,
 			      <0 0x11000400 0 0x60>,
 			      <0 0x11000480 0 0x60>,
@@ -568,7 +567,6 @@ apdma: dma-controller@11000380 {
 			dma-requests = <8>;
 			clocks = <&pericfg CLK_PERI_AP_DMA>;
 			clock-names = "apdma";
-			mediatek,dma-33bits;
 			#dma-cells = <1>;
 		};
 
-- 
2.54.0


