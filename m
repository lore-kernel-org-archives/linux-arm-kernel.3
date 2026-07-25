Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE12C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 12:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tCHjQXxXMYrxr5yB3wpWbMUM9HzItrzwrkrPzz7GJqE=; b=1jXTUEbm5O1IOAdIYhKgZFMuLL
	ctkpLgw4UeIqcDWikZmA3EUXUbTYeLbDaezNq3U93xaivYUHkVHF93YqJTXy/jKQWnJUrwGMekGkn
	UwVJomU35e5Ki3J9qGEFHXHjyF32GrReDS98je7gJba1bkqM9lsfWKksUiQ6ZXUWxekn6LVOrDiiU
	WOnbbEQiBh9umY9KiSR1NXQmqE7mnYIZ93Xbi4X7GlfP7zCtnaI1RwnfH7Lj/5dDVVovXmgONHlCV
	PLNhVa5y5itqAWWtxBsjtdFZnug1EMzy0zBeMtTwstSlz3+HWQADu1Ab2NELwzPMbC/XTtWZzhSQ6
	EB5JbCQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnbSN-00000000L0X-2XKG;
	Sat, 25 Jul 2026 12:26:19 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnbSK-00000000KzG-0Lgu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 12:26:18 +0000
Received: by chaosmail.tech (Postfix) id D9A9F1C8684;
	Sat, 25 Jul 2026 12:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1784982370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tCHjQXxXMYrxr5yB3wpWbMUM9HzItrzwrkrPzz7GJqE=;
	b=AGMbYnxcL79jyfTd6yynlpuz9rhjODKMiut97/4hQ5mEEufN/0yrjUx+ZzNm1U/m/Qu5F+
	PT0mr5t9V7jYz2xdW8eZ5owAvsoNL0DuGrGBWBURbSDYX1zcz+DDG9N0pNjv20i9FBZ2t7
	0wyXloGOtCZXF0PLlIlpL4vnP3RH11A=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Sat, 25 Jul 2026 14:25:56 +0200
Subject: [PATCH 1/2] dt-bindings: dma: apple,admac: Add M3 generation
 ADMACs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260725-t603x-admac-v1-1-6a4dec023f02@chaosmail.tech>
References: <20260725-t603x-admac-v1-0-6a4dec023f02@chaosmail.tech>
In-Reply-To: <20260725-t603x-admac-v1-0-6a4dec023f02@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784982368; l=1593;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=3Aqoo/zey1l7RhP95jMxXWVd4w3Vomi3P3qjge8iKtQ=;
 b=nOhlp9i+owoRRsOF4wPMKpbcFTGWfQReW0Tu7W3nYDbfMTzc7mk++piG+EZtZ8vUlsDFooqd6
 O9Ee+wM+7AsAuONA2sTLkNQu2w9fyOYtVbecUw0Y7XkQe1966/JuxWj
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_052616_582281_B19BCB2A 
X-CRM114-Status: UNSURE (   9.70  )
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


