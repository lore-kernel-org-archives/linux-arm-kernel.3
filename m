Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E33A3C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 14:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HFFlRsHmkfCAfT1r8bHMoX+en4QQPLYm5hFUxXgPcTw=; b=2zG8s0FccGpVz4WM46SoYZ2jib
	fwDsjqNLQsH7OVJbNgkRDjK6MSkwPc92Uyge01QLawOKS5oTZk0jEMrWTHxrAIRobt28SABgeovik
	kmVwLBbAuC1E5eWKcsIGhPJgC45dHevJsN65L8vXKehFBvvrelToLHc6r541ZhO8ffEu8idG5Yo6Y
	jS0OG4awDgltF5NCZWhvFCdnybpcHPX3fo6zHbzgnvWIeKlQUKW2SHDkYQiXfuJ9GbUPxP0/3vAYA
	RlX7Z17gfhhQERfJQCBp6HgnXLRBGxpE8R5rmr7IdLElv4M6Hv/USxWb8O7WqJZaTVJz0alUiLUME
	7EAfXAmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2tFu-0000000AuTt-3M3h;
	Thu, 10 Apr 2025 14:51:50 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2t4Y-0000000AsMh-26d9;
	Thu, 10 Apr 2025 14:40:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744296005;
	bh=icgSlyT8oxnnPGuXt7Y2g4cMU2st21h/iIDOi7whekM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZR42CSNhj8cwmqQSIXezIYZEXc8W7USjy6K7mXEqiz05+UGfUGOh3/Cd5Gf28hS8R
	 ONKddh0ul61T+IL74Uq4vd2M9xb4fOiq4cOdvwLR0olEKC6Z0sodUi2a1n9/mRGq79
	 7he+6Sf7z3Vh+JXkiFaXlRVx2yTdoPIVVa/lNXedCtUx5gYQkEDOIM1o+cCdF5alMU
	 dz1AT3ZiKq7TMyXkODfnptTKhLtr2n2p3Od7or5eCl8aQVkctg9DGC43Z3tWnJ4MAw
	 UMbw/ftt0CBAt0REacBcvPdg8OQwa7T9b4+UKUMnPGxJxXgHtlGRrwAha8oQfLfDTQ
	 9jME0EOgPor3g==
Received: from IcarusMOD.eternityproject.eu (fi-19-199-243.service.infuturo.it [151.19.199.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0243617E1134;
	Thu, 10 Apr 2025 16:40:02 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: yong.wu@mediatek.com
Cc: krzk@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 1/2] dt-bindings: memory: mtk-smi: Add support for MT6893
Date: Thu, 10 Apr 2025 16:39:57 +0200
Message-ID: <20250410143958.475846-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410143958.475846-1-angelogioacchino.delregno@collabora.com>
References: <20250410143958.475846-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_074006_693248_E9815CA7 
X-CRM114-Status: UNSURE (   8.68  )
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

Add support for the Smart Multimedia Interface's Common and Local
Arbiter HW as found in the MediaTek Dimensity 1200 (MT6893) SoC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/memory-controllers/mediatek,smi-common.yaml         | 1 +
 .../bindings/memory-controllers/mediatek,smi-larb.yaml           | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
index 2f36ac23604c..0762e0ff66ef 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
@@ -33,6 +33,7 @@ properties:
           - mediatek,mt2712-smi-common
           - mediatek,mt6779-smi-common
           - mediatek,mt6795-smi-common
+          - mediatek,mt6893-smi-common
           - mediatek,mt8167-smi-common
           - mediatek,mt8173-smi-common
           - mediatek,mt8183-smi-common
diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
index 2381660b324c..2e7fac4b5094 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
@@ -21,6 +21,7 @@ properties:
           - mediatek,mt2712-smi-larb
           - mediatek,mt6779-smi-larb
           - mediatek,mt6795-smi-larb
+          - mediatek,mt6893-smi-larb
           - mediatek,mt8167-smi-larb
           - mediatek,mt8173-smi-larb
           - mediatek,mt8183-smi-larb
-- 
2.49.0


