Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9758C982C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 08:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eSAGX47Hy8b0egmNyWcSXVJm5ulCSGW/EmuhPogSmCo=; b=gKGTYcRiQk+S4zEvg6WtlSlyai
	+iJtbIUpOVnY6Gtug4PeJop+BxbAuwFHqu1yFq6NICNmY+KAH9OwGodPvVmdAbR2dPmb6SUUaI54J
	Pl/+HGHVTHprK8X4s8yrIW/xqK6tjEOZ5yOCJsg5tuJPlnvUjhayXSdL2bbYcxU6Dp09Vs3jlc++W
	I/qM+klBHKuIVzmKfT7hqV1Z542hq4HaLZ2VPJEjPBvNlugATfgRQihqgd3hoaR/tLFqIWO8xFYkd
	hsI6pPjpEMDKUwdIvpdNkxZruQPLlLSQKmuzKkfHsBD5Dcp7OR/WxniFywWme0Vtsoq/TMa5z7Ci+
	7n3l63cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ojw-00000005eAk-2O4N;
	Tue, 15 Sep 2026 08:42:08 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ojp-00000005e6w-3W1j;
	Tue, 15 Sep 2026 08:42:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789461719;
	bh=mvbGJKU7g8urQTzwwQuSXtCvZqjpvJmauyF4amfDJEo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HoZaf1qwQrMpmVncFwrCnPtV5S3mIecl+tpw051P6gbMK9m6rLVgtGQSo6KeSMeae
	 KmgrjF2x2dfxCfRVw4o8ioa1nw+cjXbiDkxcHbLUKDFG9uCaX7jFwWeFYy/d7pHNEB
	 O5HHvRVVyLAvDJnRkSdCjQIdpCfs+it6vhIEnb/l6x2r1L0YY1tXhjm4XmRQLs1H7T
	 5rIFGazTWDEjgoCwd9V/T5EOIHJ3457qB+MfpTRmCvg6rKpOjJy3yQlKoUNhCoSImw
	 Ggrm+wYrKrY1uUGBLzLCwJ0ZlcDqtKm5HXNWx/DVAfoCFvuM2xWtAhzWG6C2xVgQMq
	 90JOYvjiH5WQA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A11B417E0CFC;
	Tue, 15 Sep 2026 10:41:57 +0200 (CEST)
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
	CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v8 01/13] dt-bindings: display: mediatek: dsc: Add MT8196 compatible
Date: Tue, 15 Sep 2026 10:41:36 +0200
Message-ID: <20260915084148.11385-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915084148.11385-1-angelogioacchino.delregno@collabora.com>
References: <20260915084148.11385-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_014202_024690_58690567 
X-CRM114-Status: GOOD (  10.08  )
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

Add compatible for the Display Stream Compression (DSC) IP found
in the display controller of the MT8196 SoC.

This IP is compatible with the one found in MT8195.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dsc.yaml    | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
index a5b88eb97e3b..c8b3e86943e4 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
@@ -23,7 +23,9 @@ properties:
       - enum:
           - mediatek,mt8195-disp-dsc
       - items:
-          - const: mediatek,mt8188-disp-dsc
+          - enum:
+              - mediatek,mt8188-disp-dsc
+              - mediatek,mt8196-disp-dsc
           - const: mediatek,mt8195-disp-dsc
 
   reg:
-- 
2.55.0


