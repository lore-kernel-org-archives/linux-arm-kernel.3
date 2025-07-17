Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0069CC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 07:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gIOrWGXMRNL667biqy07Fg/ivWHA4Pq+HGgkii053wo=; b=TeJZDA9ipJNIEzU8jfZsdWqFhQ
	lCf6p+8lxpS/mDW4Zg8ReRXFq1tlTIPFyZB7Pi6iSgH44sovZYqPOlhW16drYYtWqj5Hgjmh03PZM
	fFnsK8OcdhUZOdr0PNbIy32BFpzE14rDDWtr7UbkoHmGwmv8IvHJh8Enq7F/dIjv383ExE2vF1X3b
	DeGyhLqOqqpbQimLdrWknabR37KwwX/8Bxh2Ww2uM8sdUrKap0IqUPsAE/cE1rMJ9S7Hst3b4TNXD
	GF2zFuR+rarpI1CNqsB+NMgxC5nqyU9n+Vf78oVNLAnaUPR/e3dMAkQGH9bPLn9R9cNuejB/1vL0+
	BeI31ykA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIfV-00000009N9a-2OkJ;
	Thu, 17 Jul 2025 07:04:37 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIZL-00000009LaC-0sbZ;
	Thu, 17 Jul 2025 06:58:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5BEECA5772C;
	Thu, 17 Jul 2025 06:58:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE345C4CEF8;
	Thu, 17 Jul 2025 06:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752735494;
	bh=+GGAMF7MuMhiA/+l9JWL1k4u4nOfRTZzdne1gu79CMg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ll3g5XMvsZzxTXYytdaeojvyyNxhJIscnsvxiHqj8Kg0sYkZVdbthJovKsgobpan0
	 SkPkLMy3+D4mMMywf3AReIqq2O+ha9a3/tZrRU2KjpPMYzqQ+xtSR3t/iAkvtNrHPn
	 TFHTrNqYxfENd5KiH8gu++71FFY5Mz+IRcZerOkK9iYnxTyJGlzAd0lufJVrKnHVO3
	 eT1BOqmUjQWNJOKOFYAAkwW/Ofjx60Vzouqu5Gpc1TTY2zlNrcuvXT7pggDg5tegGo
	 Jtx6fLUE4yJoLO29pkEio7uc2f0xtEBZuk4xHmRr20TPILeh+NriFxa+DynTEM9nud
	 0N3yN15PR4G9g==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 17 Jul 2025 08:57:42 +0200
Subject: [PATCH net-next v4 1/7] dt-bindings: net: airoha: npu: Add memory
 regions used for wlan offload
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-airoha-en7581-wlan-offlaod-v4-1-6db178391ed2@kernel.org>
References: <20250717-airoha-en7581-wlan-offlaod-v4-0-6db178391ed2@kernel.org>
In-Reply-To: <20250717-airoha-en7581-wlan-offlaod-v4-0-6db178391ed2@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Simon Horman <horms@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_235815_320507_D0B636FC 
X-CRM114-Status: UNSURE (   8.11  )
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

Document memory regions used by Airoha EN7581 NPU for wlan traffic
offloading. The brand new added memory regions do not introduce any
backward compatibility issues since they will be used just to offload
traffic to/from the MT76 wireless NIC and the MT76 probing will not fail
if these memory regions are not provide, it will just disable offloading
via the NPU module.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../devicetree/bindings/net/airoha,en7581-npu.yaml    | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
index 76dd97c3fb4004674dc30a54c039c1cc19afedb3..f99d60f75bb03931a1c4f35066c72c709e337fd2 100644
--- a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
+++ b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
@@ -41,9 +41,18 @@ properties:
       - description: wlan irq line5
 
   memory-region:
-    maxItems: 1
-    description:
-      Memory used to store NPU firmware binary.
+    items:
+      - description: NPU firmware binary region
+      - description: NPU wlan offload RX buffers region
+      - description: NPU wlan offload TX buffers region
+      - description: NPU wlan offload TX packet identifiers region
+
+  memory-region-names:
+    items:
+      - const: firmware
+      - const: pkt
+      - const: tx-pkt
+      - const: tx-bufid
 
 required:
   - compatible
@@ -79,6 +88,8 @@ examples:
                      <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
                      <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
                      <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
-        memory-region = <&npu_binary>;
+        memory-region = <&npu_firmware>, <&npu_pkt>, <&npu_txpkt>,
+                        <&npu_txbufid>;
+        memory-region-names = "firmware", "pkt", "tx-pkt", "tx-bufid";
       };
     };

-- 
2.50.1


