Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE23C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 07:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FbHdlLSCa9IS59wnF+VQKq17rJEfXZiAnpu7pRPs9eI=; b=mCEjeT2s7YCLVgUL+QCySf1ByS
	wJlhLSiiFdU37vIEQwYMPOG44q5qmsCfbnWoUW2tkrf1C15Rt0IgzpnqE7VWlyGhfX6xnsWxBm2am
	1NlpK87gBhYfz/+dIpZW9NN1Rhoy/MbcZcmEAJH72pNqzYr7+e/YjrNSpwPPPgCTLz7KKQrhL6Xyh
	tXPiPzEMwC8fXPkd7gBBPzdPHF9ZCy+bofhuUpv5MJQdd8EYA5zo2po9/1sDrd5wjHMUZ/yypzq1N
	WpGub8KgmARZgVVvfwxNpmhRnYx7PgHbi0Mfk4x9w7lQHo7R58c0PJopptmYUEL8aweQ0nM6hMMSh
	1Ahp0a7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHdsd-0000000F3hz-1xM3;
	Wed, 21 May 2025 07:28:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHdhC-0000000F2Zd-1gZS;
	Wed, 21 May 2025 07:16:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1EA634378C;
	Wed, 21 May 2025 07:16:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D61AC4CEED;
	Wed, 21 May 2025 07:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747811818;
	bh=1ZMsp0g7S2M+T7SYrXpIJJ6HweNwGxCIZp/f5LQgZuc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NXd7DP3kAmXhDfzZ0H3SbMK9IqTQoNX/AEQ0mXGiSGPSC5mH5w1IXIudLdnbcBcVS
	 UWIwk7dAiML6Rwv5xuGzNiEW4GFX0JwK1/II8Ynydq8ZqgIusyZnuo5UIQvpmgC1GY
	 cYWCNfSCykosDTo470HzgsjEGDqz/ZZL16lqV1t8OgxfD5y1MybAi+lU7fPj4AhLzb
	 KJywyCAbr74WewJT2bCYU7XtkOE4pMKmMAQFvWXcLLB5JlCFuppdKfeC3Y82pG47ML
	 Wej28yLcDIqYxYV95WG8SFksP0iqxZXVUVE2DUGgnb5B+JbiUGX8L4AWuaaBN/F5Ud
	 TAy/58w+jHX8g==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 21 May 2025 09:16:36 +0200
Subject: [PATCH net-next v3 1/4] dt-bindings: net: airoha: Add EN7581
 memory-region property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-airopha-desc-sram-v3-1-a6e9b085b4f0@kernel.org>
References: <20250521-airopha-desc-sram-v3-0-a6e9b085b4f0@kernel.org>
In-Reply-To: <20250521-airopha-desc-sram-v3-0-a6e9b085b4f0@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_001658_462356_A14EDF0A 
X-CRM114-Status: UNSURE (   8.86  )
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

Introduce memory-region and memory-region-names properties for the
ethernet node available on EN7581 SoC in order to reserve system memory
for hw forwarding buffers queue used by the QDMA modules.

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


