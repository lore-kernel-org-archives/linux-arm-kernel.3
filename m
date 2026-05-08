Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A723CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 18:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cPj84Tu8BF6qy4RKMMsF+Hr7TXtFHQOOzHnyh0mLOaY=; b=jA3VWSYoU4XqzHFWQ6xCf106TS
	7JqowoJhiy6rN4Caf52+cebPwu1ZQpypqyUg2zZP7s9KXHKSIm/Niuk1wNuOcV0dEk4jvyRTQUUK8
	jd7z3DylLMZK69yrM7WJNXWLvhdKfIxGorKsuY836Z3LCp3BrEqmsC2qcPTNn0CX6efywIMeR6tDb
	18KOyheOQ7rxKofeCHIFycOQ58WpfjOtvA/cPlTbVUmgBKpxN60y1UNmxLMOxEInlUMhgrM/VRnFr
	1NCQ2YZWYkSouA0a89wkM72bxGPpdZ0hPLgWkH7h3fs3NwDJ8YmiryYxJ8ajRBHn2dFZAHntUgWu8
	lPtE88pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLPsl-00000007Ftg-0XMU;
	Fri, 08 May 2026 18:25:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLPsi-00000007FsU-2p0x;
	Fri, 08 May 2026 18:25:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CB36543889;
	Fri,  8 May 2026 18:24:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70DADC2BCB0;
	Fri,  8 May 2026 18:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778264699;
	bh=+dDy4Sjqq5AY6pLl2Yy/ilVxUFJJMhwEepfe/mxYN+U=;
	h=From:To:Cc:Subject:Date:From;
	b=KZUOR7Ing3rdhsLuUrw4FcOylMyjfhSqv26DIBxKllJHtmrIAwFCX3cj2fQWSLciq
	 2bUwnYamwoBe/M+kOxA3MHbmITsntF+1a3eY8qMmPOiFv950xhGGoBb1/eiuroSLG8
	 q4YZTx2hxjIDZKYzfF9kvu3QVoVNITKVXkuxF41qCrB1Jy8QVlpWuDHbyzbWuYaugJ
	 0ql5k38YgybsJPeUftnOPqIuN6qbR1r+laFaU//A6Sv+FSHSGND2Dk6eLju5Uxp/91
	 CXfa1KdOWykUyMD0BTfHDpucFqUdfx8OjUuaOh50PCLK3JWYXyZ/Omk/n4SOoaTK4+
	 NJwFQgPTDpLOQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Koro Chen <koro.chen@mediatek.com>,
	Khushal Chitturi <khushalchitturi@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] ASoC; dt-bindings: mediatek,mt8173-rt5650-rt5514: Fix mediatek,audio-codec constraints
Date: Fri,  8 May 2026 13:24:37 -0500
Message-ID: <20260508182438.1757394-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_112500_739655_D3EB010A 
X-CRM114-Status: UNSURE (   8.93  )
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

A phandle-array is really a matrix and needs constraints on the number
of elements for both the inner and outer dimensions. Add the missing
inner constraints.

Fixes: 472d77bdc511 ("ASoC: dt-bindings: mediatek,mt8173-rt5650-rt5514: convert to DT schema")
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/sound/mediatek,mt8173-rt5650-rt5514.yaml           | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650-rt5514.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650-rt5514.yaml
index ed698c9ff42b..becc7a11f8dc 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650-rt5514.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650-rt5514.yaml
@@ -18,7 +18,9 @@ properties:
     description: Phandles of rt5650 and rt5514 codecs
     items:
       - description: phandle of rt5650 codec
+        maxItems: 1
       - description: phandle of rt5514 codec
+        maxItems: 1
 
   mediatek,platform:
     $ref: /schemas/types.yaml#/definitions/phandle
-- 
2.53.0


