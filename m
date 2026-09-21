Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE816C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 23:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QrsjZJ1TM+xQCAvXHKD26PYxlrRKofHOjYGm45CcmYw=; b=4NTCeeu8i49lsHKfiIom4Dbf3q
	1ef1jH8cBSyxN06+9VM5fdGXb19U0kSUwzNa3l9dp8QyCpIHwYU080hmwuPj/it/e1n6VD5zTKK2t
	4WiFwE/wFDqtlVDjqdX43NfWJy+leW4vxtH2FMCB6raHkoAp+POopcl6BjZ4uqOc0ZdtxDqfJObS7
	fK8/CONuzkDdk09BAzS7TbCtEsA6j5dX1UZ2PtFkmcGOQsFVa8jzQr0/qGAPkySg/k6UQVzuHiwt2
	WB2h/dmd7BjECMAb3nAB4alme3f4a+s2Bxn3YzDq/bzwtJE3MzV49Fj2Y/p8aIP/rx5fVZzK2lpq9
	gD9n/zrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8nQv-00000003fru-2bWz;
	Mon, 21 Sep 2026 23:28:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8nQt-00000003frT-3O4z;
	Mon, 21 Sep 2026 23:28:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 40C3843425;
	Mon, 21 Sep 2026 23:28:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E26FD1F000FF;
	Mon, 21 Sep 2026 23:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790033303;
	bh=QrsjZJ1TM+xQCAvXHKD26PYxlrRKofHOjYGm45CcmYw=;
	h=From:To:Cc:Subject:Date;
	b=lbZIen5tt1hGAOqFoQ8gbT3A3tDJFe8wY/s5i+YLS9qwhb2nd9Fo2QaQmPZWPSq2F
	 XCP+xCOvDdO4BZQz7Iz45Qhci3dq/DOnj5FoI6SPMwgIdDaDbrwtusq3+IXWe7bp8g
	 hzqWYiGO56z1/KoWKZrdY8Hwy4oAUM5kONe8TpldMfHW+S6iorAXJdqlIgg3jERwqS
	 459KtU5mAdbq8yifyGb+7gFlUTXd9nlB6K2x/dEHQXPOnWnZ83mUHFCBEiH0w4aU/K
	 /x1rbqO+RAQefJTbSX2zdh+vF8zJhp/CtSnzVy2DItscFHcLCGGZyH8zxojyxjOV/l
	 83OKRIrtHiUVQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Eugen Hristev <ehristev@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: arm: mediatek: Fix MT6779 audsys compatible
Date: Mon, 21 Sep 2026 18:28:18 -0500
Message-ID: <20260921232819.3137721-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The correct name for the MediaTek MT6779 audsys compatible is
"mediatek,mt6779-audio", not "mediatek,mt6779-audsys". The original .txt
binding was correct.

Fixes: e97c618234d9 ("dt-bindings: arm: mediatek: convert audsys and mt2701-afe-pcm to yaml")
Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/arm/mediatek/mediatek,audsys.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
index 9aa39b002361..5ede7d277488 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
@@ -19,7 +19,7 @@ properties:
           - enum:
               - mediatek,mt2701-audsys
               - mediatek,mt6765-audsys
-              - mediatek,mt6779-audsys
+              - mediatek,mt6779-audio
               - mediatek,mt7622-audsys
               - mediatek,mt8167-audsys
               - mediatek,mt8173-audsys
-- 
2.53.0


