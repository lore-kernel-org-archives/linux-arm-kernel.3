Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D20D1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 17:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yypRmBCUWIxl+HGMvLm537bNGK8OjqXD29gbJvwfD6w=; b=3G7E6+ldl7R0tGJf7vtalbHIBj
	vEYsL07LL/KNew/E3z8+vfMFSaFcweJDZeNKK94YG959tmBtM5gQSUeLplBov3vlsP2YebEwaBraj
	pG2KEDLqdnaKQmt8Ij/9AgFkiMZBPymlrMKQsrT/f5G7itRPJQiQq8j2bp7RHN4wNdH6Lr+SnyK2L
	eUcWX8jD6flQHeTClokQtGNOKWVTjQFA0VNLI2S+xkMfKFIBiVhs3NsZdXxnaOdSRQ9OlTkUtrP3e
	pZOttn3J6m9LBpwAjBafwrFW4BDMmYHPVzXc7Dj8VuN7zAVZbBmBW7RIU72IBg6nfc+RFN+rKsvxZ
	xxnfkG7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetvn-00000001sJA-192j;
	Wed, 01 Jul 2026 12:20:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetvc-00000001rkY-37BI;
	Wed, 01 Jul 2026 12:20:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=yypRmBCUWIxl+HGMvLm537bNGK8OjqXD29gbJvwfD6w=; b=gCCb5PpNZNLm2RE5/ybtaPchEg
	NOahi5OPbhWPEZy5gh8URdmpU6ot6gfxH1hjbxc5nUMpLYZzAT6v7NT7CNM3lhXYPquZ7f59XvKao
	iJE7IVIRZbmzdCV1//0C6hnn0V8EEGCXGdNkx0eqe2aV07mhHt/eM6NN44rzpmaNzm836HS3co8CC
	y1ZtCJRsaWUehjwEJub0doIG2nI+BxAKmLrWVkWSCheLMhjhijDQfxTmdNi49/l5ol+AWsuZGmraw
	oZpoi4xd/5KNyJw1jKd1YRXDacOyR154Uz1V88pQSL8JO6iWiA1cnOsr90tTAiV4saYCTJ+nvZlvt
	TjKv17KA==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wetva-00000002jIw-08o5;
	Wed, 01 Jul 2026 12:20:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908428;
	bh=o0Yw5UvJ7mIldIg8Qe+QDn/C3b8GslyK/JoVs7xCZ6Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VxBnyC2HEyx+nHWBRJscwbqLoyygFubY/jhQ5hqDRVaIp3SDMyN2UR7PIUp6bGC71
	 FfUwkJigzaTHZgJLm7fKRwRAfWQ+pXuCrqZpU+ZsryUbAAmn0ki7U5/P5jt+CvndLd
	 BB+P3M7Lb1q0ixrx4rZv/ur7iwozXSNUbm3BcsqmkJGM/3XGXo50v8yuan+kMdF5RZ
	 pM0pGVr9hY6gZYYJSVT8HeDu1I+VKdCOZkWl3Oz2LJWhMPVzFBLSUa5KQ+Bjgt3csf
	 EMLU/RosiQNj+Ox7+8/fTOeepKyqKGlE5Xe/mFffYJNQ7tIhM6kVPMEQ6aJmC02NTU
	 s2fBg1aGTM8Wg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 75E0917E116D;
	Wed,  1 Jul 2026 14:20:27 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jitao.shi@mediatek.com,
	granquet@baylibre.com,
	rex-bc.chen@mediatek.com,
	dmitry.osipenko@collabora.com,
	ck.hu@mediatek.com,
	amergnat@baylibre.com,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 01/11] dt-bindings: display: mediatek: dp: Deprecate nvmem efuse data
Date: Wed,  1 Jul 2026 14:20:14 +0200
Message-ID: <20260701122024.19557-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701122024.19557-1-angelogioacchino.delregno@collabora.com>
References: <20260701122024.19557-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_132030_180222_125E5968 
X-CRM114-Status: UNSURE (   9.42  )
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

Deprecate nvmem-cells and nvmem-cell-names and clarify their
purpose, as those are for PHY calibration data, not for the DP
IP itself, and that data shall go in the PHY binding instead.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dp.yaml     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
index 8f4bd9fb560b..980f76667ada 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
@@ -30,10 +30,12 @@ properties:
     maxItems: 1
 
   nvmem-cells:
+    deprecated: true
     maxItems: 1
-    description: efuse data for display port calibration
+    description: efuse data for display port phy calibration
 
   nvmem-cell-names:
+    deprecated: true
     const: dp_calibration_data
 
   power-domains:
-- 
2.54.0


