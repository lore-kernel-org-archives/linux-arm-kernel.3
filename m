Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6042EC88E73
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 08:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2kyQ9q9H+Q12n4br//wADN3LcoKZmJu+3jowxzVWT8U=; b=xLnMhx3PwZxesWTgWTKBINOrRh
	jpQX0pcqmJEOFwCDr/DrmZibcvPdE0FZoOD71xZKIsQLIs0R+DhZQKNXnj+DAdt0uqkOxAdTIhbk/
	88kTfsmMuw6kZk1bo5G+rd5ALWZ4nriQiHlvFlJqzHIyp0aWA+tlTpfRD4hvld8vJ/4xKqUWJKVAr
	ZfWCr5Ne6Hzr1IfUHqVMcgXsO4fMOwQV8NRzKXZQt7ZoaXkhC8rhJ3LAA2N8R6u+dffTawRmgu7Uq
	u4G6Z5KyO+KoUeVSyPEqoi6furpsiqePYi378s4FAfVxLp4slS4/NugytV9quVh4+p5614hGi1idF
	9PCgv8mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Okj-00000005f5V-0fNt;
	Tue, 15 Sep 2026 08:42:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6OkB-00000005eTu-1s31;
	Tue, 15 Sep 2026 08:42:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=2kyQ9q9H+Q12n4br//wADN3LcoKZmJu+3jowxzVWT8U=; b=jrgwngfkntzNsf+WBuc1VO6VLl
	xDNmUijLKpxGFUHuzwt27r1N74BVoyRujcWcnXUGxsOzp6YxUDLwSMp98yI1UONFkienxM8Uso/m8
	rzgI8k+G2P5qen8cmavShND4zy8xeKY8Xe0A9//j4s9w7ztUvkPfDnL611qMnT386fviyt8zE/MVq
	dbxhFe4zQ61tPEtN2B85nguxwbUAAyI6OjnvA4iQsE4FilOiZbeJMvXI5Ebz60MRkm144lUlQB4UE
	cTI0TLs8KJPmeOHUsUKJgGTcTNxAlsrwQs2jYeKF39attbFE01y7GZ5F/N4vsEe/wntNXU17do0DW
	k1W4uzTg==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6Ok8-00000006RfN-2doc;
	Tue, 15 Sep 2026 08:42:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789461739;
	bh=43A1BM9waMG6ewhWBGIC1XAm5wq/Dw6qxwtteFBu24Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YkFJ/15bRhHTE3uiJHWxNrWwH3ueQHRC4QHhskffYYEybssCoqomdjV5mDQnwrxlk
	 Gi3gRRKLV6YGf/pJQZy1V7Yg14TxIQzmr86rU02ZUm8aVtkIBvoW3Q4s/vATZ9hFNL
	 CnnXbbx2OZTD197SKs3IigtpTDgOb6B5gASHTW6cdqLhfaKuCnWSjEn4j/9BZpZ58V
	 ZgQbjBG6ER94HtVUCXAlzr7jTN+p2iNiZETvkWhCIgKeeu+58/OpooN7Jy9v82pf1D
	 AeXKC6T4+at+oZYf2kYtMFNewUiB9Ri8MSZqksp3W9bpZpLMM+0cZkstx77CcNmmMG
	 6F5ui1YCfzhBw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C45A917E1054;
	Tue, 15 Sep 2026 10:42:17 +0200 (CEST)
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
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v8 12/13] dt-bindings: display: mediatek: wdma: Add compatibles for more SoCs
Date: Tue, 15 Sep 2026 10:41:47 +0200
Message-ID: <20260915084148.11385-13-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915084148.11385-1-angelogioacchino.delregno@collabora.com>
References: <20260915084148.11385-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_094220_806011_DE1970DC 
X-CRM114-Status: UNSURE (   9.38  )
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

Note that MT6893 is not compatible with MT8173 as it introduces
support for destination addresses larger than 32 bits by adding
one additional register for the upper 32 bits of the address.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
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
2.55.0


