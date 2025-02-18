Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641DBC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 09:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mTG9ySL5bXbfM/ZILqB1ODcUmfTC/s+Or9ohha4u3oY=; b=uzVL/LarSFYcdQV437W1fgT8g3
	C8g6/Tqfk5r46/kbpBPaMqSfXtxpvXmCxwXqhTluubyK6ZpqN8n0iMROUzQU9MJSOFNCN68878h0K
	7VF75hXW96wjaRukBhdHvlIeRyM3UNKOm/enWoQc7P/ArV/ftgAl3MO1x9ruWXSZtbwbziTCVGXw9
	/cEmZbxE0pnjypwzrpkldHoUWs4j7dYCM9piOJAbtfuBOVT/RnVj2RWXCrB6wgTt+4SkpI+WjX+TM
	DKq2JDJXQOLIw7ZOB+wzz7h89q/20dp8VHfec06ed5HyX7mj0E6TtcAzVn21vBylKpyoX7oUfMfcm
	fwRq18DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJjt-00000007TGZ-2fwJ;
	Tue, 18 Feb 2025 09:18:01 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJWr-00000007Phh-0N2w;
	Tue, 18 Feb 2025 09:04:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739869471;
	bh=IoSrMv71ID9ekjkacGKInTn1Qnx2Ah1BUMPVIHvGazY=;
	h=From:To:Cc:Subject:Date:From;
	b=WijSGcACUlEnBBBHl8nT/4Mfk4xzfBSRXR9zDgaGaZAuN+hz5zIunMgnkpZxb6KzL
	 2hsGGvmV9bxvViftYTpmr1oaVMM2GEhSn+0Hd1BuK+Hn6KwmhjjICZMwp9qQbkq/Ez
	 4IaGG6UYhQcfcuxWOgL+fxElV6KG/pDFZEsVwlrpaTFfFdoliFJWGAdPuSxIPTo+xC
	 EiNpnrIdrdjKgbUoKTiCaEPuOc9RKl8+LR5mQCvh7gB2mG1zDydpBrdxhCGf100yVv
	 pp6clctCSE9HALXCRLZ7/H3cjLILN+m3VVgNMoSti06dTFSZ+CD0nRHPITe8/+AIuM
	 qc2Qkrlwgc1Zw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 90FDC17E154A;
	Tue, 18 Feb 2025 10:04:30 +0100 (CET)
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
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	pablo.sun@mediatek.com
Subject: [PATCH] dt-bindings: display: mediatek: dsc: Add MT8188 compatible
Date: Tue, 18 Feb 2025 10:04:27 +0100
Message-ID: <20250218090427.20318-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_010433_268107_F6F97642 
X-CRM114-Status: UNSURE (   7.40  )
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

Add compatible for Display Stream Compression (DSC) IP found in
the display controller of the MT8188 SoC.

This IP is fully compatible with the one found on MT8195.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dsc.yaml     | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
index 846de6c17d93..a5b88eb97e3b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
@@ -22,6 +22,9 @@ properties:
     oneOf:
       - enum:
           - mediatek,mt8195-disp-dsc
+      - items:
+          - const: mediatek,mt8188-disp-dsc
+          - const: mediatek,mt8195-disp-dsc
 
   reg:
     maxItems: 1
-- 
2.48.1


