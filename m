Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2981CC02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 15:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JD2i4igoLzZVnnPO9iaP1lM4MbA7keh5UdhxDL6eSeI=; b=WU2xQGpLmBsDKiRRfblwP1FVep
	uFAgTPg1+KT1IJah4/41YR8zJ+OHRBT0VXV1/ezQyIMQByrqZluRKeME41vTFTCQcLgBmQI8KdPoP
	eg/qofMSqt4Cqv9n22qI8r/QSUT7o2NTVgHaGli6OEYZ5wiQDkdLHMY8A7Txf8LbKnhDql5XwA+gC
	nN9JRexnK5FFGbn5b5TxqYD2glGkHzAK5X646Q5a+0xAulu4dzDCP4PAJq8MBXMTWg5Fe1DIPU2MN
	tIplnSQFr1668g2OYot9mydZ7HWDoVUTb8086E9E1vjVWC4rHBaEF/9fGZ1jvMH8gLeVVA+18Z/7o
	v4WOySkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgQAe-0000000A2jg-1wfF;
	Fri, 07 Feb 2025 15:21:32 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgQ7u-0000000A1tO-3P7m;
	Fri, 07 Feb 2025 15:18:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738941520;
	bh=Npp4DvyGGF//B2p9+Cu9AlWi5SsZHn4kTOYRctSBgsw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=e4l8WpXja1SD8o2Ch0eoTl1eugTuqA3PGYxfJ6eKTy/jPXfExLbEgxGKG4gmli9vX
	 vOOavsEHYihlVTQQkXqW/GKydfB5+4b1QsCFOXSpnQ789kKH57+Silj+7TIP5NcOrG
	 PPKWqhs9dm0aLEbwQmtefmM89GYLn5q2OtgxV3WZYmSWmBmCOqsH1kfu7aElfytzxP
	 K8A7MFYrw164pWK6C4QhEsDaO6rihPC7RCxxb38UUpG/Lf6YJzVgGzhIJCmsOMNrA3
	 zFVlP86lxRKZh9AfZQKrq7u4SjXYAqfDwGlT3gaWEXa2x3bp8PMK4trcci1p90xfBg
	 XdzqOfbJUQyDQ==
Received: from yukiji.home (lfbn-tou-1-1147-231.w90-76.abo.wanadoo.fr [90.76.208.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C8E7A17E1090;
	Fri,  7 Feb 2025 16:18:39 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 07 Feb 2025 16:18:30 +0100
Subject: [PATCH v3 1/3] dt-bindings: gpu: mali-bifrost: Add compatible for
 MT8370 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-mt8370-enable-gpu-v3-1-75e9b902f9c1@collabora.com>
References: <20250207-mt8370-enable-gpu-v3-0-75e9b902f9c1@collabora.com>
In-Reply-To: <20250207-mt8370-enable-gpu-v3-0-75e9b902f9c1@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738941518; l=1546;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=Npp4DvyGGF//B2p9+Cu9AlWi5SsZHn4kTOYRctSBgsw=;
 b=zHLbCLp0ZmDfhHObegEcvvfdQT2F/55gU1FUtfDLD4auzXJ5QfDWlJrgTWq0ucd5UGgDzj/mx
 8Mombz9W7qgDSotzNj5B3Bpw62O+BuCbD2bGqu3yJCfzKF4fAa8pozr
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_071843_008037_B0C9AD08 
X-CRM114-Status: GOOD (  11.40  )
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
This new compatible is needed for this SoC support, as the other
existing compatibles for the same GPU architecture (MT8188, MT8192) do
not match the required power domain number.
The other compatibles (especially MT8186) cannot be reused because of
GPU architecture difference.

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


