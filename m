Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0543ACD3447
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 17:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fQQpJCMDr9w7xXFTuDjwlk5xl8lSePc+dwCEUbYFMS8=; b=pbcVcR64fjJ8y8/w/psr6jOPPl
	w7CujTjkI4l8Jtl0GKqPKYFoUsnUGhUOrtaY0B+AzkBVnTzk5LPuEKoPbr+LiW4OlE4c4vfWL+lBt
	zqLSlgRt5JT4ErSuV49b38f/G3ll2D0uwUbE8C2RSL2OCOMn/8Jzn0Ta8i4o0sqg4S6CgM+LyC/Px
	yOdpgGWzw0QGrdGeeApHypiG0kBTruVs3UCAnzrYhKMRleUUKoXACFLTfYHmWBGRhCtpur1SbmEtl
	GMAR+myQVHNRNdYQPZ20co7oKqsN3+t+CItq7R5p6jw9zSsakxnAJoqz3/tGZaTfvMzKpyCznaRyI
	S5CIDA2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLldz-00000009MJu-0mT1;
	Sat, 09 May 2026 17:39:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLldw-00000009MIV-362e;
	Sat, 09 May 2026 17:39:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2EE2D4170E;
	Sat,  9 May 2026 17:39:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B20DEC2BCB2;
	Sat,  9 May 2026 17:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778348352;
	bh=fYXILq2sHTH4l65dF+0EzDOgcKBS45FOY4SjxnUwUWc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Jd7cmZ8bFnCR4HitL36qY0WFHy4m5djgWocQqGSR9MsXIsg3PqA6ERpgsj6LTuPYp
	 odu/7qqgMQ+Z0fLWrQCZqaYml2tTb8bbazhE+VvN4bqGYNgE9x5GUXJFzcR8k8+VGX
	 VlrazGhSsNr8IrEWYJtI3JP3vER34ypCDSQbbY/Vi0cTMBn/nSRJFO+POfEWGdv5J0
	 OGuFN83PcjqSgJN/2Y418tuMF6y91Eexd9nws9USk+C0pBmGn48JzI2TpPo3xaHfLe
	 0HaU+BkxIbivktGJMAHIaDQ4qnmFJObKO3IiPH+ZSpvxrlYdK4GUcImoQRIRiJylvR
	 7AX4qFBxPEBHA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 09 May 2026 19:38:46 +0200
Subject: [PATCH 1/2] dt-bindings: arm64: dts: airoha: Add an7583 entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260509-airoha-7583-v1-1-e5ad085b258e@kernel.org>
References: <20260509-airoha-7583-v1-0-e5ad085b258e@kernel.org>
In-Reply-To: <20260509-airoha-7583-v1-0-e5ad085b258e@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_103912_799763_780C6818 
X-CRM114-Status: UNSURE (   8.14  )
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


