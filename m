Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21339C44513
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 09:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PE8/8YtuOPgj9pMNH9XGnTLtmBUjbOoTXE4EDoXN8o8=; b=4DNsFpQaey6fA+azfhoKXgCumX
	xwGomIZ+1BOk5BrYdQisrSEmRSn8nS00DIDfkPxENPv5Nj1LXYK2+mt4LXlcx9zmfz07F4S/ogw35
	9WhA5X09Fu2zYTtyWz7hpV9Uuy8s9+6ZZP+0xw+Geds+U/R7mFS678CRqPPmJF3TwHSZq1vH7hfga
	QtT8LAtd64jPAEstrc7KubNcboEft2qBlmI90ewxLiwlWBNR82jhHei1m22+auzgqFEeGoMOQBOMi
	/LkIceJidB5bd/2lYaWwlqeKgu+xc2REvFP6+WlYnoZ8n4LtotQCXMXRDbL7FHM85JO5zTO4CJxPY
	/9rjiORQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjDRA-00000008nmK-46RR;
	Mon, 13 Jul 2026 09:58:56 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjDR2-00000008ne1-3Ffm;
	Mon, 13 Jul 2026 09:58:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783936726;
	bh=xUmbeuNXP/vmDishEba9WwlN8rEC1bG4DX5W2fr1jPI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MC1sbQ6SSTPjGiZQ2lqHm+GGPQA+35rRh0X1GQyNILe5VWyGJ6qypAOvsr4Rff9Og
	 Itf8KRLfcJHWPN9XwbtRPcaZX+oeQpycfZvjrTVgP16cyZfhaudSI3E8AB3eOOUWzz
	 47EgEW+XkN6486SsT1ykgHYpwM/CLRzSSZVTUZ/sBCCwVP4sIdlBRJHda6bIwJyOJr
	 0qra65lCvWSiBBvzYOLSKRN1GjE0oOwSmgy9YAlfYKQVtK7W/9f6reEJpDQ/oFvc3M
	 Oylup+hbU1acaU1d55SkPsjuWHAOIEqHjUeg2OrkpyGxmh4A+IBox/FAOBtfk3Op/R
	 q9RwNwrcxlI1g==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E56F517E0DE6;
	Mon, 13 Jul 2026 11:58:45 +0200 (CEST)
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
Subject: [PATCH v2 03/10] dt-bindings: display: mediatek: dsi: Document MT8189 and MT8196
Date: Mon, 13 Jul 2026 11:58:30 +0200
Message-ID: <20260713095837.16590-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260713095837.16590-1-angelogioacchino.delregno@collabora.com>
References: <20260713095837.16590-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_025849_036100_A0C1CDBD 
X-CRM114-Status: UNSURE (   8.03  )
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


