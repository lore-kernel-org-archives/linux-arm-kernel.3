Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A45BC2A072
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 09:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jdr6hzYdB6yV4A5dMP40GqEQPv+MIBJRoxnrozc+EiU=; b=vFDPt+f+CKPRH2l3CdAFiUh3yU
	ujRuSRxsKHT8BICegApTmthTdXROAQRd+zrpkp8dEIaQm+DmcJ+g1RcQRbIcFOlR01reVYdFVyCaF
	UoMqahA5y6VfPbHYj523SNw75eKIESQxyJLrIJNgrnGb4YL4FfSTwQP/klw2KByZGvIhw4zlutCMU
	AYFQHWRRq2rb7wWBJSGauXKVeNmN8Dqj3dH0Uhj06xRpHOAlNwLK8wPJv7RbK/PEL+hhCYucD1s6M
	OwbQxdNVsx2bKs4au4XSXDSCvG98zUutv5JIn1r8yqn/CCASYlCiA7gMCIkwHiKhalCEHqpZiH+nJ
	MfMDPVpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcgUh-0000000B26f-0zFq;
	Mon, 05 Jan 2026 09:03:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcgUf-0000000B26E-2gcC;
	Mon, 05 Jan 2026 09:03:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ACF4D6001D;
	Mon,  5 Jan 2026 09:03:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3451C2BCB6;
	Mon,  5 Jan 2026 09:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767603796;
	bh=8vXTewXSrHJNcvfU5XxxfBAvi/sv6EPaP/XXsW+cvCM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VQrsMO31f35whw1OvqyzyD/ru/6ixeJrxJqPSihrTCg+MHcXEHSusMQXN/hY4PGjo
	 7KdK1HTSSTcUXldEfr4r85VXwKlKItXgxOrS90enPT9z5nLTl4qRCH9GUPl7CydNsV
	 +tndekfEl2Y/rhVnsJQid2JcGtCFnaqcRXuxQq2RhsljeKVt+t1NbH7ggrgOb/TxYD
	 qN81C9cFNow3uGVreDH+5EF0zCBS57S49qXkXmPt0QgW9RHGZKRhE0DWbsE/ZRrak7
	 78U3qCwPUG6LjsYdvW5TaMjEzN0YMgLFTggPba1Yok42Pz0Ux0tVBLBx2l1ehzF9CL
	 wt/NJnGkuNnGg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 05 Jan 2026 10:02:56 +0100
Subject: [PATCH net-next 1/2] dt-bindings: net: airoha: npu: Add BA memory
 region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-airoha-ba-memory-region-v1-1-5b07a737c7a7@kernel.org>
References: <20260105-airoha-ba-memory-region-v1-0-5b07a737c7a7@kernel.org>
In-Reply-To: <20260105-airoha-ba-memory-region-v1-0-5b07a737c7a7@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.2
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

Introduce Block Ack memory region used by NPU MT7996 (Eagle) offloading.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
index 59c57f58116b568092446e6cfb7b6bd3f4f47b82..b3a2b36f6a121f90acf88a07b0f1733fa6da08a8 100644
--- a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
+++ b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
@@ -50,6 +50,12 @@ properties:
           - description: NPU wlan offload RX buffers region
           - description: NPU wlan offload TX buffers region
           - description: NPU wlan offload TX packet identifiers region
+      - items:
+          - description: NPU firmware binary region
+          - description: NPU wlan offload RX buffers region
+          - description: NPU wlan offload TX buffers region
+          - description: NPU wlan offload TX packet identifiers region
+          - description: NPU wlan Block Ack buffers region
 
   memory-region-names:
     items:
@@ -57,6 +63,7 @@ properties:
       - const: pkt
       - const: tx-pkt
       - const: tx-bufid
+      - const: ba
 
 required:
   - compatible
@@ -93,7 +100,7 @@ examples:
                      <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
                      <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
         memory-region = <&npu_firmware>, <&npu_pkt>, <&npu_txpkt>,
-                        <&npu_txbufid>;
-        memory-region-names = "firmware", "pkt", "tx-pkt", "tx-bufid";
+                        <&npu_txbufid>, <&npu_ba>;
+        memory-region-names = "firmware", "pkt", "tx-pkt", "tx-bufid", "ba";
       };
     };

-- 
2.52.0


