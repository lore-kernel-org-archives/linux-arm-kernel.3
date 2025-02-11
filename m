Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F995C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 14:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ODYzFjv9fdS8HIWj25CMe5Q+sWihzJjTp37U8qA+ys=; b=J/c5EcmPSI23caImhm8vEtRjih
	alo9p0VcrbSkKVl8h1YwAM3FLgPUT6wai1L357zF1uXp47JXmLE3KXH7ZVLPuNDDJjJgo6cmNc1q1
	rnfrb8QhTHtbKZ5W/hRxw5jNQ7U4YBLziRLMUGWQgjThAqznfGs0f7R1q2bTnbVX8HIEw2pueh9sC
	DalXbPD8HWjvwiCuuFkyMXg2SwnFL0/81ung0enRLlqhH3vC0VaM5XRGCXQAkbwA4BjjbjlzFwskq
	9btRyU2xc61sqamRsZ4YPykJ1BRFa93V5wLWgxVE3L/03xLKwlMSEoiIk3q37rhKQ67PfIS9IBoir
	EnOh+1pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thr4h-000000045Vy-0pdR;
	Tue, 11 Feb 2025 14:17:19 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thr1t-000000044rY-1a55;
	Tue, 11 Feb 2025 14:14:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739283263;
	bh=fHNL+i5IN49689K3usVegBesx2Ci11QI7egIM6OnVk8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=C5REkrEZaeE/KtzzJi9v3a9UoIoDZCfT8+b9xZ3zqvADiUYXhSuec/KoqC+IA2u3m
	 fUq9Mhf/SCz6RQJhxBfI+H7Ow5aJWEuuDbbXkI9AkyQ8/dXdM7kyPa0xXx1BuqB9fu
	 VBKWZvheY/woGdRvBkICPwOXDEL1zTzTMrKzNlsShhWQvR6BQYTg9oYiiNCUAUgz3B
	 2BHn9qRAe5WLiPi5FiSghpSX/rcAvZH1RIVG09HBJScV8Ry/IQcaYajjDTMg11CYwV
	 I3inRn/FxgKMlbQ9xpOJz0crkloCfEGvBMWZGP3lp2RzynP9qwvhL32UTp88A/bzWq
	 V6FN3MhgIx/xw==
Received: from yukiji.home (lfbn-tou-1-1147-231.w90-76.abo.wanadoo.fr [90.76.208.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AFAC717E10B5;
	Tue, 11 Feb 2025 15:14:22 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 11 Feb 2025 15:13:08 +0100
Subject: [PATCH v4 1/3] dt-bindings: gpu: mali-bifrost: Add compatible for
 MT8370 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-mt8370-enable-gpu-v4-1-77deb7a75c23@collabora.com>
References: <20250211-mt8370-enable-gpu-v4-0-77deb7a75c23@collabora.com>
In-Reply-To: <20250211-mt8370-enable-gpu-v4-0-77deb7a75c23@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739283261; l=1546;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=fHNL+i5IN49689K3usVegBesx2Ci11QI7egIM6OnVk8=;
 b=Y5aeVFIo0/yC8zzUr7gx+tl3oSd4oJTOFIz6oj/dw7plgBuwQzrIMr/ZguTeio/M3RN1hg/lV
 v3ZLBWGYG7wAYXFpEfjwFn0JoXf/W742Eg4mbrOTo1oGrYHcvQqIs+8
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_061425_588906_ADDE44F7 
X-CRM114-Status: GOOD (  10.84  )
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

Add a compatible for the MediaTek MT8370 SoC, with an
integrated ARM Mali G57 MC2 GPU (Valhall-JM, dual core).
None of the already existing SoC specific compatibles is usable as
fallback, as those either do not match the number of cores (and number
of power domains), or are for a different GPU architecture.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 735c7f06c24e632ab738d062f15378f754c8adaf..6f6211950bb495fa6bfcdfe8d1e27e5ce7aeeae0 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -37,6 +37,7 @@ properties:
           - enum:
               - mediatek,mt8188-mali
               - mediatek,mt8192-mali
+              - mediatek,mt8370-mali
           - const: arm,mali-valhall-jm # Mali Valhall GPU model/revision is fully discoverable
 
   reg:
@@ -217,7 +218,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: mediatek,mt8186-mali
+            enum:
+              - mediatek,mt8186-mali
+              - mediatek,mt8370-mali
     then:
       properties:
         power-domains:

-- 
2.48.1


