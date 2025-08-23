Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C42CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 16:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oheih0KB4BjY5vu4lGoGLIjebwlHjIQ3SimEUxSBQPE=; b=TsejusIpfgi0LfHUjC+IY15c9s
	AMpqjcHd2ha6v7Cb9x8vzM3jKEoTJtZ593jYpHeBQ4mMRNrcrSAqD9BWFSjRqNTBRoYcd3pX8LWmx
	E/KaamaTKo5/9ZxBpf3lMf2vmdBuWvDwuoG9TMQoQpPZQu57YOZnF3+/lmSjnPpGgRcsykOj0G6gT
	amFa6jSYGDfmtqWIQzxLsUMvKhhaLVVH/FsirNgpXGznM8MAr5q+9Gt+qQoU9/McqI2HvjNGZPMHB
	Ms06Mpk5NWvCC8OMnUFfDWkVs4f6mtHYEcDk9QcHtEDZb0HKmol2FT7o5Pb41lbwhiF1wNQctpKeQ
	P5GX8ScQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upr00-000000051RO-1XLQ;
	Sat, 23 Aug 2025 16:21:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upqcu-00000004wz6-0IF6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 15:57:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8314860052;
	Sat, 23 Aug 2025 15:57:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B96E7C116C6;
	Sat, 23 Aug 2025 15:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755964675;
	bh=i5iq1Jzx4wxKCJVdwU1cFzHZFmOjbUhc2dS2K/G9ffs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fa5LXq6Sdvf5zLpWKdoPenQXRZfWjoFmAk5KBn9AFYPjeZ8xN+4EvQvQ7Bq8aZuPA
	 9EgVKXW4jqRvAnsJvjUU8RLR0aWNly1q+2BDXmv2aIjxy3S6YK/JA+t6Z2xKNvfUN+
	 ++dTrVp9duEkjstuQM3twS7uagEnaPmwZ3w1jJKUDP4EmcDtgZbNo79Xi5Uih+pyZ5
	 XrHHLdDKChDA3ItPzGQOsagxQfgfjmRuNd+9qBz8vRIPA72XwNhT/K0UUV3MIbACuB
	 NmHps0cH2QWqfHGK7fdEKteFX4hzTmQoyMm8LzNEuouYAx8y3I0BXkMpPs9agfErbo
	 xyAYaFaeGTTLg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/14] dt-bindings: dma: dma350: Document interrupt-names
Date: Sat, 23 Aug 2025 23:40:03 +0800
Message-ID: <20250823154009.25992-9-jszhang@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250823154009.25992-1-jszhang@kernel.org>
References: <20250823154009.25992-1-jszhang@kernel.org>
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

Currently, the dma350 driver assumes all channels are available to
linux, this may not be true on some platforms, so it's possible no
irq(s) for the unavailable channel(s). What's more, the available
channels may not be continuous. To handle this case, we'd better
get the irq of each channel by name.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 Documentation/devicetree/bindings/dma/arm,dma-350.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
index 429f682f15d8..94752516e51a 100644
--- a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
+++ b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
@@ -32,6 +32,10 @@ properties:
       - description: Channel 6 interrupt
       - description: Channel 7 interrupt
 
+  interrupt-names:
+    minItems: 1
+    maxItems: 8
+
   "#dma-cells":
     const: 1
     description: The cell is the trigger input number
@@ -40,5 +44,6 @@ required:
   - compatible
   - reg
   - interrupts
+  - interrupt-names
 
 unevaluatedProperties: false
-- 
2.50.0


