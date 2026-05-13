Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69FFFCD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 19:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fQQpJCMDr9w7xXFTuDjwlk5xl8lSePc+dwCEUbYFMS8=; b=JIjMawXKa1vbH+YxBFp9dnTmMx
	GEmjLYkwj4djG7tLmLQV+jEhnDvMLJD3HwfA4b0Ye65bSdfHaykPWocXUMQIAtxcyLW72+hxNxtky
	Mx/pdRUpk4PibvoQMuRZYi7nd3yl4wBDU3Xomw4RDQbG8NRNg33vn/tiJXH22M9MitNKPH7W+rSsL
	SBy4aUWi+fDMwIRkt6wp6VDnLAqx0RuqEaEhn1+VKQhgQ/z1AFNs5AfpZ01arJV7Z+SlSoV6XSECF
	MIFmLM88Kw7Jq94liT3EjQweCOKTUvLSoUEUZ8Dir93ksHJEmZ3vnYKnv4f2/J9+PEp6O1+9GORG1
	epcogiCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNF9h-00000003ZA4-37AF;
	Wed, 13 May 2026 19:22:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNF9c-00000003Z7U-3ESj;
	Wed, 13 May 2026 19:22:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0D59A60121;
	Wed, 13 May 2026 19:22:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 445CCC19425;
	Wed, 13 May 2026 19:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778700119;
	bh=fYXILq2sHTH4l65dF+0EzDOgcKBS45FOY4SjxnUwUWc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HIIjP/rrrBE+Q6nETwhm5F+AMOyqe5aa6o/U1yHi8GXZl/0+mV438+YoT3abq0G7w
	 5wCNkgvNZrhsA0GESu8oQyC3stWFHyuZNCzRcDmZymAd/A1ckWwYBubTNINNDUnvlg
	 FJyDpY/ALlcbRX97fjn4bmC14l+wDdTcoUxNTJIj/AEQWAybRTbmzUpWzgxNDhh3KC
	 B1Ri4s/4ef6Rj76KBAdpUyh4Bb5iPjRrduxnvzOXsz58wxWsF5QZZsjtqkgHaFdFDJ
	 r+ubCGRkpquCkvoeAjcNNTUHd1FjWHc3G5g2BYVb+XOKifQYKVZv3X/Dpwz1LMvNMf
	 5eL8D+jagcIMw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 13 May 2026 21:21:36 +0200
Subject: [PATCH v2 1/2] dt-bindings: arm64: dts: airoha: Add an7583 entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-airoha-7583-v2-1-ee0d82b37ce7@kernel.org>
References: <20260513-airoha-7583-v2-0-ee0d82b37ce7@kernel.org>
In-Reply-To: <20260513-airoha-7583-v2-0-ee0d82b37ce7@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Christian Marangi <ansuelsmth@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.3
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

Introduce Airoha AN7583 entry in Airoha dts binding.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 Documentation/devicetree/bindings/arm/airoha.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/airoha.yaml b/Documentation/devicetree/bindings/arm/airoha.yaml
index 7c38c08dbf3f..6506c64af4f3 100644
--- a/Documentation/devicetree/bindings/arm/airoha.yaml
+++ b/Documentation/devicetree/bindings/arm/airoha.yaml
@@ -26,6 +26,10 @@ properties:
           - enum:
               - airoha,en7581-evb
           - const: airoha,en7581
+      - items:
+          - enum:
+              - airoha,an7583-evb
+          - const: airoha,an7583
 
 additionalProperties: true
 

-- 
2.54.0


