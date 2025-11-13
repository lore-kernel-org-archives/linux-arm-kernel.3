Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E55CD6E41
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 12:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mkb6jpQ1k79c2dDTp04v2qaimuM4wU2FM00XWDlPYOY=; b=OJdOcOYI8dw+/jr2warzO8rGIx
	xlqSNcVmj8wsLscnHfUl51dXyf2QDve7viJR99qKK3TqMOLlP+LiGxA1DSk9bZOflFuFIPIT3TXCV
	DOOxBs8j7TUYC4FpzOHVommce9lbFzldJ8yGIzHCPJQCpVQuUiI8C7dTsLZaZkJYRGJhQd5i/a8WN
	xdn3xCLy0Wt7o1WPvb3DBuv6HgYDgoRJ10AdEf3+0yB4uGyaoZH10r1ltKKkS1KOGmM4lW/HQtclw
	/tjuGeZenTBcpTEjLyPmpEvaNDahBiL89kUTBr9X0UznaAzHNu9yDx0QleZKHLzEDguj9FPuPYUzF
	lxoPKJCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJWLe-0000000ARbr-2FYn;
	Thu, 13 Nov 2025 12:22:46 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJWLb-0000000ARZJ-1Q8u;
	Thu, 13 Nov 2025 12:22:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763036559;
	bh=RKcFAn+VDGMwlQVrFJj0LTHiZhkHmlIFPaKbYwlojYU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=azDRmI+R8f1SgJoLsdNywzkpwwGJ9Kbr+CrWk/huSIyHtmTjB002cpp6E6u9bIJ8d
	 onGTt6VqOtb5n4XiYSY0AFXh2Qktduo48lG2++VHjoDE3FKyyOfbNPqhvH4JYUrCDG
	 r4hw5C34VIKlOk8Lk/jgUeeyiknXA2jzsyHTXUXRKyIGo61mAdhR3WhVqAzx7Qj1Ax
	 hPfa8UGk7E1rnrF2l1Z/LFXhGDWPNTqA2g4yQ1EvhmLVNQ++75IY+5TnJDPb1NAjju
	 DUj/hSLpkiYnacOxkbkm2TZC7EI6eJI4dz5uqcKpXovvka9hJNDU/RHEuFCOAng3PO
	 mU0LjEH93CstQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4B1F917E1340;
	Thu, 13 Nov 2025 13:22:39 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: dmaengine@vger.kernel.org
Cc: sean.wang@mediatek.com,
	vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	long.cheng@mediatek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 2/8] dt-bindings: dma: mediatek,uart-dma: Deprecate mediatek,dma-33bits
Date: Thu, 13 Nov 2025 13:22:23 +0100
Message-ID: <20251113122229.23998-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251113122229.23998-1-angelogioacchino.delregno@collabora.com>
References: <20251113122229.23998-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_042243_534907_360AE861 
X-CRM114-Status: UNSURE (   9.07  )
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

While this property wants to express a capability of the hardware,
this is only used by the driver itself to vary the DMA bits during
probe.

Different hardware shall instead have different compatible strings.

Following the driver cleanup and the introduction of a specific
compatible string for the APDMA IP version found in MT6795, set
the "mediatek,dma-33bits" vendor property as deprecated.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml b/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
index 10fc92b60de5..4d927726df93 100644
--- a/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
@@ -59,6 +59,7 @@ properties:
 
   mediatek,dma-33bits:
     type: boolean
+    deprecated: true
     description: Enable 33-bits UART APDMA support
 
 required:
-- 
2.51.1


