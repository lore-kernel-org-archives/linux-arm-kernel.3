Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD48C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 15:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NRactH9G8VIg87UGgdIMTyvt5IVxZz9zv/IYqfJqpdw=; b=a/DRKDnFncoY4cv2CRdmGLjSBz
	PAT0wwRolXsS1TCXjY/FauT7TomK1OYgh9itQKSeLTmAqmn6qhS2QuXmsF646IvJX1KofeqelL5bq
	EVeIyraFL1+lF1FSlK01aH0blufmxJVSulV7OBdkmUwUT9KVvRdhuT5yEJACmqdDM5nTh/4+U+OkA
	pj6u5rXmFugM9x/yHQ2mPRcPTYgh188dXeEVcdlG6HsNQpO+WtYEvImkxS/VZx74LmrjdId4E/H2l
	fork2pueOLdD20c0mxyZhzH/L0vzf8BM5LOZ3z7XTKSNypmhRrmbNpmpoxrYa8mYL2ZlD0EvtHmbq
	9zbzTbXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexA8-00000002Qsa-3XuN;
	Wed, 01 Jul 2026 15:47:44 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexA6-00000002Qs4-3YSC;
	Wed, 01 Jul 2026 15:47:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782920859;
	bh=Ky9AIH6/lq3FHpbsWjW7cQtA0kjqF07M4MVwKxOHcRs=;
	h=From:Date:Subject:To:Cc:From;
	b=mHpvIqwNp84u6/vvEm9g+BG98EFMuN+XKb/mWOpwbdTBqqkoW4jbvWpoqticz77at
	 tJaBSxNVfU5jTcA1Dqy17ROjbdQR0XdHldSAIWOLdSoxLDm4BtTNZ2fl34Ak6Qy3hi
	 xtvYsRUi+bmjICiJCukTyrwjy5VzY/c1sXw1WGSmNlERYFCjlR7x1lp8bS8T/Hsjm7
	 w9w/eaUo/5beDO/ZqtzTUnURFVyvqegw3C4pWlLStn7+tvygo222Pep/zk2+ZPg5j1
	 H1imdLxDMYAlFoClXT+8W2O3OQPV78xgbfEwfMxEQshAM9ZNrhysQYvVnoNO7dnq4G
	 9tTShUonVWYPg==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 093D817E02CB;
	Wed,  1 Jul 2026 17:47:38 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 01 Jul 2026 17:47:20 +0200
Subject: [PATCH] dt-bindings: dma: mediatek,uart-dma: add support for
 MT8189 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-mt8189-dt-bindings-uart-dma-v1-1-c7106216a40d@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNQQ6DIBAAv0L23E3AppT6lcYDyGL3ALaAxsT49
 xI9zhxmdiiUmQr0YodMKxeeUwN1EzB+bJoI2TeGTnZaPqXCWI0yL/QVHSfPaSq42FzRR4vBBO/
 IPDSRgVb4Zgq8nfX3cHGm39Im9ZLgbCEc5xi59iLRVvEc6buE4Tj+p2kPCp4AAAA=
X-Change-ID: 20260701-mt8189-dt-bindings-uart-dma-f8fdbe856ee8
To: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Long Cheng <long.cheng@mediatek.com>
Cc: kernel@collabora.com, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782920858; l=1072;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=Ky9AIH6/lq3FHpbsWjW7cQtA0kjqF07M4MVwKxOHcRs=;
 b=ofMvNwFJxd2WVq31avixKD4TbRj35vFDFtRR0jcj91McrJ+rG7GfQZ47Vwn2QS6H9O8ZGXCOp
 xmk7QNrBj7BBEHNOkJQLU2Oeu5O4fFX1HVyVk6W14l0cMXrxUhzUck5
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_084743_039141_0422CD97 
X-CRM114-Status: UNSURE (   8.36  )
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

Add the compatible string for the APDMA IP found in MT8189 SoC,
that supports 35-bits addressing as MT6985 SoC.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml b/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
index 3708518fe7fc..bba20e88a6dc 100644
--- a/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
@@ -40,6 +40,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt6991-uart-dma
+              - mediatek,mt8189-uart-dma
               - mediatek,mt8196-uart-dma
           - const: mediatek,mt6985-uart-dma
       - enum:

---
base-commit: ba7c57499e5999aeae8dd4f954eb2600589d80aa
change-id: 20260701-mt8189-dt-bindings-uart-dma-f8fdbe856ee8

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


