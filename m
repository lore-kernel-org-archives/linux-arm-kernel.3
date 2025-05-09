Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F5DC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 20:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cl4vY9wWRhP9MQQ22uXEf+JbsC4WKOVLQ0Ge41ErRtY=; b=C/ucFk5VEbciuX3bgzitmpH25P
	34L0Y7VTxDsQtFZN0Hvh/m//bMfBWp9X/vjS2P6Lbr0UI6VV2K3JZ1feT8Oh1asLQE6WLPrh70Bgr
	i3bIxANPvMq3muqJad/8aviH6ffhdBpOE4JWTjzjyP4V10QV9Qv6R0Mh+c5C42mp9oKHT47Yaw4cA
	QE29ZoNNmm8XjdPdIveVWq88L93Sgij4iqr31v6xyh7rJDmriYAcEXCrVdQAKUdTZczE94XNHvxHX
	MDtNWU2iq3r6IeF3pcoE/7FMeO3sYTnzEe/LGUKwfkvoyQNXOsDBxAaAzd+UMEjlwvKVs+nsth+T/
	5alChb+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDU82-00000004jKi-0ViL;
	Fri, 09 May 2025 20:15:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDP4t-00000003zm0-0BdB;
	Fri, 09 May 2025 14:51:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2F71B6111F;
	Fri,  9 May 2025 14:51:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83500C4CEE4;
	Fri,  9 May 2025 14:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746802313;
	bh=uR0aozr2O/tJXppiXBBx5w2+BaypfkdKR5QW5BGZkGQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=P3g64sBXm9KrjwiFVFwe4CCEzhuGlCIjMpgxhqfsctDcUNr9Ie900BHmcDQfuaHD+
	 4YA3fkRScotnI7liBZ5swLSSTtPiHgNMf1kJcQmZJ5oRYP/41GNFtVWqtBVdeAnUlf
	 x3YEB5NvKcQYQKn+FmyOx1uGrIjz9DVblxgX02q+fjsPAv6Df8LlRDks0xvTEpmTmy
	 JCbytoKwRv5vApoB5Ar8LrGwNlSwF6IWzh8ZxoqOV/u6KT5w7G00CQ+jgrUu2BCadc
	 4qZqirTt/slR1KgLXVOyqljC3qdq6kQzcg/zXolXzDyK8+yKXaB64W2lawuNlEU/le
	 vLbfyAqrVCBJQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 09 May 2025 16:51:33 +0200
Subject: [PATCH net-next v2 1/2] dt-bindings: net: airoha: Add EN7581
 memory-region property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-airopha-desc-sram-v2-1-9dc3d8076dfb@kernel.org>
References: <20250509-airopha-desc-sram-v2-0-9dc3d8076dfb@kernel.org>
In-Reply-To: <20250509-airopha-desc-sram-v2-0-9dc3d8076dfb@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org
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

Introduce the memory-region and memory-region-names properties for the
ethernet node available on EN7581 SoC. In order to improve performances,
EN7581 SoC supports allocating buffers for hw forwarding queues in SRAM
instead of DRAM if available on the system.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../devicetree/bindings/net/airoha,en7581-eth.yaml          | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
index 0fdd1126541774acacc783d98e4c089b2d2b85e2..6d22131ac2f9e28390b9e785ce33e8d983eafd0f 100644
--- a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
+++ b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
@@ -57,6 +57,16 @@ properties:
       - const: hsi-mac
       - const: xfp-mac
 
+  memory-region:
+    items:
+      - description: QDMA0 buffer memory
+      - description: QDMA1 buffer memory
+
+  memory-region-names:
+    items:
+      - const: qdma0-buf
+      - const: qdma1-buf
+
   "#address-cells":
     const: 1
 
@@ -140,6 +150,9 @@ examples:
                      <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
                      <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
 
+        memory-region = <&qdma0_buf>, <&qdma1_buf>;
+        memory-region-names = "qdma0-buf", "qdma1-buf";
+
         airoha,npu = <&npu>;
 
         #address-cells = <1>;

-- 
2.49.0


