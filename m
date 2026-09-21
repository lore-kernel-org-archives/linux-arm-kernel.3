Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3850C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 23:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vMyFKvxUmCZhsqO9EBuGwBlR+qTh9JpZNPfVYrU1ubY=; b=JLa5y5yoP2mpE+zjokO7/COxR6
	zCn/BVlXKBYM236lH+3GcpVIUhak1/M/3kN7D9jbGMq3JgUfTfa1SayLDEYRwFLvRTJagD8pJcU29
	RC8qjCYLHmcB9nT+ty1hyjmD7dyNG/bNRdavzkx0YPwbOCQXtyv5ZE+JoCtagoge/G1mT6F+l9hft
	RA8f55zqdEmPeddKwYtJqbwFI4Y+FMETb6R3R67lOymYSW+/Uy38E1i1705b1o2w8XsVctKTArw0g
	dihg3UHxqMZmzsxQbnaGrluO3z4NR3NXGsq9DXcIhlZBSHMWvU8Ro5cxA9nFKvmUPq1mqGhhRMBgp
	uitGaR2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8nPD-00000003fEU-1F8w;
	Mon, 21 Sep 2026 23:26:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8nPB-00000003fEC-1xYq;
	Mon, 21 Sep 2026 23:26:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E32E860210;
	Mon, 21 Sep 2026 23:26:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 528391F00893;
	Mon, 21 Sep 2026 23:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790033196;
	bh=vMyFKvxUmCZhsqO9EBuGwBlR+qTh9JpZNPfVYrU1ubY=;
	h=From:To:Cc:Subject:Date;
	b=V+qUp1zs/3DdbzgoKB7EkNsvZBWbqcBJfrvjLaCqxolEnhj310krtqaZHDiwQYsrW
	 UXuo3E2PZUkzal8G2DQJtXDDubbkN4jJIWcTNEu6fePjz3jEVcynxgrdWRygpWLQJn
	 6VWbSd6AjK2pQ0pSglGGaLIKO8v+52SH83QIp0MPlxtwOO7x5GBAVq3SKuF0k5FFXI
	 cIEKEI5KV0CXOVyOj1FDduJQnFFDg9ItbKRHdwQlso5amVnwHADOL1ogLPQfbaNUA+
	 6sITdMPiwv2EjorkWM34UR7GVH3h0v6hCv5VsBY9zgXIHErrDZ8Vz0pEzrqQgT5kun
	 H475wsbzTY2GQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Flora Fu <flora.fu@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Cc: mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: mfd: mediatek: Allow MT6357 ADC
Date: Mon, 21 Sep 2026 18:26:31 -0500
Message-ID: <20260921232632.3131680-1-robh@kernel.org>
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

MT6357 PMIC nodes can contain an adc child using the MT6359 AUXADC
binding. Add the child node reference so the ADC subnode is evaluated
instead of rejected.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
index b67fbe0e7a63..dbb48e380e77 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
@@ -62,6 +62,13 @@ properties:
     description:
       List of MT6357 BUCKs and LDOs regulators.
 
+  adc:
+    type: object
+    $ref: /schemas/iio/adc/mediatek,mt6359-auxadc.yaml#
+    unevaluatedProperties: false
+    description:
+      MT6357 auxiliary ADC.
+
   rtc:
     type: object
     $ref: /schemas/rtc/rtc.yaml#
-- 
2.53.0


