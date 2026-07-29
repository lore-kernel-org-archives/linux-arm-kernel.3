Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57348C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 11:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LjWWugs5bJ2v1tG9OeuA8PVRNMAb2EGqaY6DxBYnZtg=; b=IstJkNr51xyx/OLhhPD+M9tJml
	75x8wryEcPQk/QOnPSE31KHLTt2/Zwo54JkSPR2gW4VvfERVBOh22sWSZxBA1O/V0N9XPfhHOolxf
	4AoFsT+byjLHZ+rms2WI3z6xKKLcCHlHAfJSeLPrL6CiLxIEuZPu7WOD4flccY/2YnT8/JkE1Y7YM
	MJDxs4uEwPYxHygbgBJB865c0d9jtyRe9nkZeNzqSkqVPCMbg50Hb+5PE8KpxAelUp7yzvw9vl3yX
	cQelRZEgrZ696qYrr3s0uuufFtDtU9ttyKX5pZaFGGbDAkword+lG2i9Nd1hA34KVxKSrS15a82bJ
	41YeCdnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp2ke-00000007mFy-08p8;
	Wed, 29 Jul 2026 11:47:08 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp2kN-00000007mAA-0c4z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 11:46:53 +0000
Received: by chaosmail.tech (Postfix) id F30821C8806;
	Wed, 29 Jul 2026 11:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1785325605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LjWWugs5bJ2v1tG9OeuA8PVRNMAb2EGqaY6DxBYnZtg=;
	b=X8wuNjIQ4JFCFZ6+3IXJ8dzaDB6ITTa9w3MY2F34y+X4Ra9LMxfKjxgiI5ewe0NqUxuBSp
	GntjHZJhyYP6F4rp1dqSvXykeixqYq7yPXNjRRfkplVpsBaXMqPlSS4Ve1kubILC0M5Yci
	q/0wJogsTRIBy+vtKkgy3Cr158e7b+8=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Wed, 29 Jul 2026 13:46:34 +0200
Subject: [PATCH v2 1/2] dt-bindings: dma: apple,admac: Add M3 generation
 ADMACs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-t603x-admac-v2-1-e4b2bb6ca45e@chaosmail.tech>
References: <20260729-t603x-admac-v2-0-e4b2bb6ca45e@chaosmail.tech>
In-Reply-To: <20260729-t603x-admac-v2-0-e4b2bb6ca45e@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>, 
 Joshua Peisach <jpeisach@ubuntu.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785325604; l=1691;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=v2dOZDaxp0DZkMeLavv70Zh+ElwareDDu7QcfDJGnaU=;
 b=/sTI5XpwcgmEEgK3zjJ9aUKOX4KzI2uNaUP0uwgeglpbtwQLzQ8QHU20w7xjpwl6+90KXFdtj
 lH2lBPHKm86DEwZdQDLMfKnOXQzxfkQg8bLFcLoOyEEtVaBBSRYdQpm
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_044651_654130_12039217 
X-CRM114-Status: UNSURE (   9.91  )
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

The admacs seen in M3-generation SoCs (t603x, t8122) need additional
configuration writes and so are getting a new compatible chain.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 Documentation/devicetree/bindings/dma/apple,admac.yaml | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/apple,admac.yaml b/Documentation/devicetree/bindings/dma/apple,admac.yaml
index 6a200cbd7d02..5b4fd8348f99 100644
--- a/Documentation/devicetree/bindings/dma/apple,admac.yaml
+++ b/Documentation/devicetree/bindings/dma/apple,admac.yaml
@@ -10,7 +10,7 @@ description: |
   Apple's Audio DMA Controller (ADMAC) is used to fetch and store audio samples
   on SoCs from the "Apple Silicon" family.
 
-  The controller has been seen with up to 24 channels. Even-numbered channels
+  The controller has been seen with up to 32 channels. Even-numbered channels
   are TX-only, odd-numbered are RX-only. Individual channels are coupled to
   fixed device endpoints.
 
@@ -33,6 +33,12 @@ properties:
               - apple,t8103-admac
               - apple,t8112-admac
           - const: apple,admac
+      - items:
+          - enum:
+              - apple,t6030-admac
+              - apple,t6031-admac
+          - const: apple,t8122-admac
+      - const: apple,t8122-admac
 
   reg:
     maxItems: 1
@@ -43,7 +49,7 @@ properties:
       Clients specify a single cell with channel number.
 
   dma-channels:
-    maximum: 24
+    maximum: 32
 
   interrupts:
     minItems: 4

-- 
2.55.0


