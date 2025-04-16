Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB27C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 12:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tAhF096QhQyXPc2VDLUencD+PgT7jBWhBCayQnPM8is=; b=MoSq0NnGiBYNxLRxJcCxwYgReO
	KiqRRmF0ZYwEONumPGDzSnQO5icD8ZoOQvs1eiAc8pdABMsYnZeMavXjJ+xb4XIv0rEKkSN1G7iQS
	jy7OzZgHqQP69SNncYeq2p16NeftvkMYU3048mUWr8tUO/sFaNH1Sy4nMgFuokpoLFY1CdJoZAWVJ
	6qoahIK/qwb0lhJCSkqQOl4o7alpCUrYNDkXj7Sz/O4LQ5vdygtexW4vadeXzLDCtN7B+QXaHCcLz
	icpGo5PxLVUulzzfVwvzu1he0Wx9LfmSYU3d7aYOJutoIJMSJRmfVpP3wgX+jLvjGLrsu07EBpjMk
	N5NeLcGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u51cZ-00000009SrC-3z10;
	Wed, 16 Apr 2025 12:12:03 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u51TU-00000009QS1-2AJP;
	Wed, 16 Apr 2025 12:02:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744804959;
	bh=8Txu466c/6xQlElQq0otpMS6pP2mfPlFbhrON1pbh9Y=;
	h=From:To:Cc:Subject:Date:From;
	b=IlNHCSkohp9fm4csX2yQMa/YT6wSK7G/Hi+7IYLr3nYmt4lfyRGgOvTVbhqJfJpHA
	 X1TUQOZ29gEP/7R6xW3rx/7s7GvAEs1TwBkTnuGOCsmTVH2tMLBj0nF8TkcckklEZy
	 aqxC4KTuDOukEYluEIEMtfiuQqIH6fq/43ZUZ/EDHQ+V/D3cZ/zHiZOSEPS76Iu76V
	 1f4D1TvfiT6STv3EVRM0d/asyfhpoEJIHjc6QTg2p1WfxWjMZHjjZZM9S2JmxkunmD
	 1KYsxaOlPe85y0fNkD3p3alNLZmbSHH5tp5bqa26u1JkjrfpewjUCyBzET4uTZ74zq
	 O6xvGafV+Pc8A==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5376817E35EB;
	Wed, 16 Apr 2025 14:02:38 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	zhiyong.tao@mediatek.com,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH] dt-bindings: iio: adc: Add compatible for Dimensity 1200 MT6893
Date: Wed, 16 Apr 2025 14:02:35 +0200
Message-ID: <20250416120235.147889-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_050240_701572_CEC89EFC 
X-CRM114-Status: UNSURE (   8.11  )
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

Add a compatible for the Dimensity 1200 (MT6893) SoC; The AUXADC
IP in this chip is fully compatible with the one found in MT8173.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
index 6168b44ea72c..b489c984c1bb 100644
--- a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
@@ -34,6 +34,7 @@ properties:
           - const: mediatek,mt2701-auxadc
       - items:
           - enum:
+              - mediatek,mt6893-auxadc
               - mediatek,mt8183-auxadc
               - mediatek,mt8186-auxadc
               - mediatek,mt8188-auxadc
-- 
2.49.0


