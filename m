Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8405DC5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 10:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TXFSBU1xWiPxMVGUsDxH0Yvws9+xQ3ZgpzZeeM1bKsA=; b=GofbesaikI/ZSkjqwBJaNzKqa4
	QqXlyJadrejeVcU0X3AcKMKHJ6DJdGchleeLfT5/ZKYboSTuAtTMO86qZXZk2oEnLWusrdugnbhRe
	ppug4h2SeOUSv9fKBMv+3B9z9tqrQK3ULr8kWOd0p+1KUaZu/eOarWhyxbIrqqwXs9thp7/UJtJFp
	bCfMRXEPwqn/gzoTU4xvmoI+N7ldEaXMp2UTyC9yFU2S/ZT3FtwMgpQqZKQOCm+LCeBnwhS6HwXRk
	h+N7geUCqObEQfk7ZNUakjSwE6U/OKHP4SoQ2aFJn8lmC1ObCN1XvTP4Hoh/gkz9NcpqypxrPjzsE
	0IgXZlYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvBpu-00000003kkT-3XQP;
	Sat, 15 Aug 2026 10:41:58 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvBpr-00000003kjV-13Bg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 10:41:57 +0000
Received: by chaosmail.tech (Postfix) id 4CFB81C97BC;
	Sat, 15 Aug 2026 10:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1786790512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TXFSBU1xWiPxMVGUsDxH0Yvws9+xQ3ZgpzZeeM1bKsA=;
	b=amDkR6repcCT4HKF6lu3zYT1X9Bape1iEaFj5XxC1ycdy9RrDOnQWmpV164J3fX019o0l3
	zY6259AZdv1ImwZibZ6fPNa9j+2+dra98BjB5Jg7ZPCI7iqx5e5HQbOicQgnFMaurB3bi1
	0VQy/J3jjfCKGG5BajPlGSPkSET++2A=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Sat, 15 Aug 2026 12:41:38 +0200
Subject: [PATCH v4 1/2] dt-bindings: dma: apple,admac: Add M3 generation
 ADMACs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260815-t603x-admac-v4-1-1149e342dcb0@chaosmail.tech>
References: <20260815-t603x-admac-v4-0-1149e342dcb0@chaosmail.tech>
In-Reply-To: <20260815-t603x-admac-v4-0-1149e342dcb0@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>, 
 Joshua Peisach <jpeisach@ubuntu.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786790508; l=1733;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=3cJuwk+SwgAMtlNgWNyBZ4gRlYU1RemC2UGW6KC37gs=;
 b=wDaah3sX9iUx3rSyZKmJWoreEICi6/KxxCPFB4cUGmxRNQ7CyOl3aWM5dEVWiqWnOAr/Yy5i9
 mPU3d7IW4YADpZ6DpygdC0lT3AKLuNxkBd07pxrMumtkn8FM1s00sXp
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_034155_788154_2381F8F3 
X-CRM114-Status: UNSURE (   9.52  )
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
Reviewed-by: Janne Grunau <j@jannau.net>
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


