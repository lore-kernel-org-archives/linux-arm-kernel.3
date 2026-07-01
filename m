Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98842C43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 18:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i8K/NUn179obrwiLM1qsC0wfSvzmywr8gUv0tSarxIU=; b=MxaGpIBH+j6rS838G5ZCYbTI2F
	MQEMXgu9PUwATexfzplPoM4beb6JRfZPmcdR1h+/UNr0XGLh/EdOE3GZsfNDBILSb91jVecNU0aEa
	fUJYTDLi+Rcnc/2bUnHNqDkQAzGIhPwFjYZzmTAdUM8mBOGabjdNIxKmDr/v0FK+j2pNjEQpY2GZx
	0tl4UzEC5zaQapTkQc/Z6N9f4N0c22JfIRNkRt/g0kT98IdYuj+Qg+zdi9D6CAxbpew22Nq1s+ygm
	fTZenyU5zyHwA6mv2cVtx9Z/ivO1BvqS/XRJYyrWPdSeefQ8gZErz4MTProIwRKuZu9u7ayy96hxb
	otTUCdGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetvI-00000001qpb-2X4U;
	Wed, 01 Jul 2026 12:20:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetvE-00000001qdm-0VUK;
	Wed, 01 Jul 2026 12:20:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=i8K/NUn179obrwiLM1qsC0wfSvzmywr8gUv0tSarxIU=; b=BvZHoSk79V8zjJxQb8Z/klKGwk
	6uw5NcIQV79ah2kqy5zpEpCw4EYmBTWH33rkQPzu11D79LegRSAwjHilbwrIRrL0wN3pBe6nFhxLU
	gJ3LJDaD7293yHC8vfkDyA9mtLNQQuPIZFMC3UpEjQy/y4MaCmIAHEmmzFdjWtYGfdQ11LAkGXWAj
	BBrSQN/RmJIboWtD9Et27khXi4iHyMLcyLHoZWFTiB20JLP8M+rU6LnvCEF9UDvFV+/1l4TAG/3jt
	gzz/tGngFrqaGiH3OU65F19lMkoAQiqLIje+744CPxcz/4u67tsGQz8yR+z2lQX8kQb6NZI1k9f/C
	LMKLl3NA==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wetvB-00000002j5U-0GhM;
	Wed, 01 Jul 2026 12:20:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908403;
	bh=0gPe20SEhbSKRx8YMF1loMW2r5BMkP9zKr6qfZ5JseA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JZ9kR++ycUB2t7OH5iCE0tSPapmmQzeR/2khfPzlVnpVGDOLcl+Pfi2G33hc6pJ1H
	 nJ2KVjmXNuQjfqkt77i+Ne6iaD669x4ngJEP/byQs0z4gQltjNlYGM4yyHRb1TyzvT
	 Le/cDnhJqWXw4wrmbtZxqiuFEE9gYpIRYSoBViBnwkPy4kAt0NyYdkVgq/oLcwgKJE
	 XH/sl4CJF3g798vj3ZeXPrWZi92S05rz6OepVgupCWzoeGnCw9L2tm0oZ4R9yRY9hM
	 Y3wn5+rbEgc6qrxTm9+fmicnVwNKscS3KNxlEGbOmLyadlk0RQ+brB24dvaERkCeub
	 9iE20jWQepTkA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E15CD17E0F44;
	Wed,  1 Jul 2026 14:20:02 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jitao.shi@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com
Subject: [PATCH 09/10] dt-bindings: display: mediatek: wdma: Add compatibles for more SoCs
Date: Wed,  1 Jul 2026 14:19:49 +0200
Message-ID: <20260701121950.19454-10-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701121950.19454-1-angelogioacchino.delregno@collabora.com>
References: <20260701121950.19454-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_132005_603465_62D5D724 
X-CRM114-Status: UNSURE (   8.47  )
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

Multiple MediaTek SoCs have the Write DMA hardware in their Display
Controller: add the missing compatibles for Dimensity 1200 (MT6893)
and for Kompanio 500/520/820/1200 (MT8183/MT8186/MT8192/MT8195).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,wdma.yaml  | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
index 97d052b0fb61..c3ed867d058d 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
@@ -22,11 +22,16 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - mediatek,mt6893-disp-wdma
           - mediatek,mt8173-disp-wdma
       - items:
           - enum:
               - mediatek,mt6795-disp-wdma
               - mediatek,mt8167-disp-wdma
+              - mediatek,mt8183-disp-wdma
+              - mediatek,mt8186-disp-wdma
+              - mediatek,mt8192-disp-wdma
+              - mediatek,mt8195-disp-wdma
           - const: mediatek,mt8173-disp-wdma
 
   reg:
-- 
2.54.0


