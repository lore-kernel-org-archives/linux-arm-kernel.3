Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D666C43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 12:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q4Wp0dHCtsoG1frr/XIQdfLbL8oT+wFc4AqOM4AVNOY=; b=t9SLGf9Vtmfm8QM77zTeqL6xkq
	OXtUQSZZ+G/FBEHs+83hxwr2TII/126LX8lYWaduTZLjWvGyo1487lNakERS8v/IwtnpBXEyONq9F
	UiLZJnV5bSF3jLl6CVBIVUBBB5Ln17YVpQBrcIq0+VDdj5+ZfAqMZGDL2jKrsHUVfxMuN388rGSEb
	nrrVcYsDnuzoSWhJyT/hnLWwh3q5JcZ5277btTZ6JKC815BWqrpD8dH0h4/ZiFgcs4ClbxqfGi0ev
	7kDq9B4pAXB2jMKBVA3xGrihmHELDWPKPQGcxFNAZM+VIHQluIOUc1HReUUxZJnWeUlZDgCfgjfZn
	DCldwgwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetv6-00000001qHt-0cql;
	Wed, 01 Jul 2026 12:20:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetv5-00000001qCz-1KSn;
	Wed, 01 Jul 2026 12:19:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=q4Wp0dHCtsoG1frr/XIQdfLbL8oT+wFc4AqOM4AVNOY=; b=lr+++H3k4+GEmqo8fH9riEbaus
	LRmFB/f7uqzTvDa8jP9fDHwCqzPJp3ICiS7cAr+PIKiT/CQ+bkZfNl5DZScMctiOdge4CjqIcimo3
	98MiVRY0thibZM1YQUzJFpEeZdVhpfn+B79uQtdAS0ySOUgu9qcUxyhmRVBv4UNUhUWFJDI0E3jHx
	6IRPthHpxX6N9MgrrFpH2Oe4VSWzmgRtEya7Gardc2y0/ERVoeYJT4CGbiKuSie2pDeFMZqCKY1fm
	Cnc/MwM6e/V/7Y4AGl7qxGtei5CTxLN8TtaZ95wtZp1iziy4tUxMpKwtd3Qke1d1XQdNRcvzvWHZs
	S8Vs6O7g==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wetv0-00000002j0Y-3wTq;
	Wed, 01 Jul 2026 12:19:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908393;
	bh=1Xktl+tViKcSMcXwqlJWLud9f63zaG5zSnYbWqZ1CJY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dSy+ldQ+EXnqS5mp18wZ7I7kwDNBDfOKP2wrwZsIiwjFfih8IoDAARrSloZjX13TW
	 wenuw6saMxvap6p3+L5r5PlpD7kbaCxS+zCSb2ty5YZl4ODQBS2X0Ku/w7Q2dfSyTr
	 FCyCsXCHpfqkjMUhZ1+V4uSQTArlMknJ8yri4tL1lpjB0Novnv4GhOD23F2ZNwwPmo
	 NjLb0cWQLgfo19cgK7AgZXbqOE79dhyIRjG1f5ZjoB5Jf4b27rZ7N4tRCOJ42tEiFZ
	 v/u2TPqvlvLFqc49G7LsIjY22IGA7RauFTe3DmqkysnpcZQJw+86lK2IDNHzPVtX+M
	 V8vrL9TokLlyQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9EAA217E0CA2;
	Wed,  1 Jul 2026 14:19:52 +0200 (CEST)
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
Subject: [PATCH 01/10] dt-bindings: display: mediatek: dsc: Add MT8196 compatible
Date: Wed,  1 Jul 2026 14:19:41 +0200
Message-ID: <20260701121950.19454-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701121950.19454-1-angelogioacchino.delregno@collabora.com>
References: <20260701121950.19454-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_131955_189031_40C9AF65 
X-CRM114-Status: GOOD (  10.04  )
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

Add compatible for the Display Stream Compression (DSC) IP found
in the display controller of the MT8196 SoC.

This IP is compatible with the one found in MT8195.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dsc.yaml    | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
index a5b88eb97e3b..c8b3e86943e4 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
@@ -23,7 +23,9 @@ properties:
       - enum:
           - mediatek,mt8195-disp-dsc
       - items:
-          - const: mediatek,mt8188-disp-dsc
+          - enum:
+              - mediatek,mt8188-disp-dsc
+              - mediatek,mt8196-disp-dsc
           - const: mediatek,mt8195-disp-dsc
 
   reg:
-- 
2.54.0


