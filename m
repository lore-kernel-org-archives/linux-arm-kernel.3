Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A2B6C44517
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 13:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PE8/8YtuOPgj9pMNH9XGnTLtmBUjbOoTXE4EDoXN8o8=; b=w0Yr46oAO5qEB/EeWsuYmUr6I1
	mmojiaE9L7shxd6fdNGMHiUO7OV0+iU/bQU/4yDuhlnfmc7jNRoWbSHRszchJ7yfjFVtxjBgqKv6e
	TEfqav01bcBwcc+PTG8WqgmOIajOKOPKSxM04Mxqn3v9O3+PSle1JbNCzYaSiIeO1P8qj68ibENci
	c6UGPiAxzkeRjiO/WqXHejxjfN+/RisouXpWWrpkFM5o3DRq5V3+iMGn2W/SnfgoEP6lIMK1z2F0F
	YYz9hBZHoTnMWwrrHhdTIl/ALA5jQoMnO7MO0vly8H0WfUSmRF2d9LHTkLyT1iQIg2yKV2QuFk580
	mcBRA/UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk06y-0000000F1Tk-2JX2;
	Wed, 15 Jul 2026 13:57:20 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk06r-0000000F1JD-37wp;
	Wed, 15 Jul 2026 13:57:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784123830;
	bh=xUmbeuNXP/vmDishEba9WwlN8rEC1bG4DX5W2fr1jPI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LJWH9mZu3kWNHz2+QFo8/yqku09LMK/QMYUiDkq/mh9qONdpfko0lC+03HrJCcl7v
	 haFs/7BNrB+A7Pzo7NZA3qt1MeLuOWf4jRwdtgC2SjL17ptQd8vEBClKFvSIiWHF0t
	 hwuBxSlbVOi055ccpHHyakRdwJRUotL/AGCVFZxHwgeSc8MPAMgireMvhNwZ0VY5oM
	 PVChOMjdGjQfvLvC1ybtG/Y4QLXyRrCbIq5PTBZ4Iu1epItLi5hEucfdyaEo5RPmDe
	 Ipx96EfSUQbvGdXP6hoC0sxhbMRKrUO45X5zFqcpVii89quvKZEhBDtxB6towk/D9e
	 p9N9f7ElGh17w==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BB1F517E0DFB;
	Wed, 15 Jul 2026 15:57:09 +0200 (CEST)
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
	jason-jh.lin@mediatek.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 03/11] dt-bindings: display: mediatek: dsi: Document MT8189 and MT8196
Date: Wed, 15 Jul 2026 15:56:55 +0200
Message-ID: <20260715135703.46540-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715135703.46540-1-angelogioacchino.delregno@collabora.com>
References: <20260715135703.46540-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_065713_946044_0EA29F7A 
X-CRM114-Status: UNSURE (   8.64  )
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

Add compatible strings for MT8189 and MT8196 SoCs.
These are compatible with the DSI IPs found in the MT8188/95 and
others, but with differences making them not fully compatible.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dsi.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
index 27ffbccc2a08..b5cdfe0eaca4 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
@@ -30,6 +30,8 @@ properties:
           - mediatek,mt8183-dsi
           - mediatek,mt8186-dsi
           - mediatek,mt8188-dsi
+          - mediatek,mt8189-dsi
+          - mediatek,mt8196-dsi
       - items:
           - enum:
               - mediatek,mt6795-dsi
-- 
2.54.0


