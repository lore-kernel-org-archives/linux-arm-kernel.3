Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BFB4F3D605
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 13:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6YOdWbiqWGWWp5Zb3gG/KQDFMTohBXYulxn0AEwG9F4=; b=t4F7o6RgYOFc17m4qzKRVdnrkN
	TuHaaIPN2HE94rNneb4aNQcoVkUnJicEQnYDKsoxddLuU6FMM/t0+PM+awaJ+M9K3hIFojr1Lyv9u
	XUCtgkkTPG7pE78m6/ZVh4SXTxcI5Otfo/Hj2FVxMGLZt8YqqYAiCoCodVpl7DHTi2hGM3NSGBMhm
	cdZOQjfcHhKQnhOvW4u+zgPNXhRG1RdmSbw/wM4Dv4/k8ty0a/R8EMD8KdnlQLwRjaAr0wGfbAky7
	iMe8foi/2/QartGG0i5Ov2l2ZOFKlMFPMC3/K8Usk1kK/zbmky496fOuhAIdAQAXOaJh5fD9l6Qz1
	f9b6RZTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6psO-00000009wlb-2Fkd;
	Sun, 29 Mar 2026 13:08:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6psJ-00000009wjV-0Gnb;
	Sun, 29 Mar 2026 13:08:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4964B43821;
	Sun, 29 Mar 2026 13:08:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC384C116C6;
	Sun, 29 Mar 2026 13:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774789698;
	bh=hTgXXikirJFP7xdfg6chbsZ4wYHoHGkSlNNMzVO0mHw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=khVKoKKMJs8VRYC9o5ByOS4f8JPyun+XFfwhXCqlMaMMphjyMk6fwLOChtIRUo28g
	 c/x+aziHjsbDEoPjDEIDfngZ92dOzEQsLbIZf7pzzhW+NVWYrUhtRMMoKJ9q+I9q5L
	 Fi/DH1VLLcWplGDSsXV6SYiSIXO1X6D7EdLfLxwD6ugc8HxgCQQQFIsiyPUuHjLQYc
	 Cn7mbl/cduRc0wpDNbxhFQ5zfhmOtcXFLP2zN51nirO56wSrKZRJhwplHp40UY3qew
	 aPffdq6YHvIF3l4oxi0kKSqaocmxT/tnYm4Vm6ygw2yj3HZFCR3OKJkJG3axSfN5Ym
	 Wq+0cCH7tu8Jg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 29 Mar 2026 15:07:51 +0200
Subject: [PATCH net-next 01/10] dt-bindings: net: airoha: Add EN7581
 ethernet-ports properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-airoha-eth-multi-serdes-v1-1-00f52dc360ca@kernel.org>
References: <20260329-airoha-eth-multi-serdes-v1-0-00f52dc360ca@kernel.org>
In-Reply-To: <20260329-airoha-eth-multi-serdes-v1-0-00f52dc360ca@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_060819_194039_604B2856 
X-CRM114-Status: GOOD (  11.57  )
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

EN7581 and AN7583 SoCs support connecting multiple external SerDes to GDM3
or GDM4 ports via a hw multiplexer that manages the traffic in a TDM
manner. As a result multiple net_devices can connect to the same GDM{3,4}
port and there is a theoretical "1:n" relation between GDM ports and
net_devices.
Introduce the ethernet-port property in order to model a given net_device
that is connected via the external multiplexer to the GDM{3,4} port (that
is represented by the ethernet property. Please note GDM1 or GDM2 does not
support the connection with the external multiplexer and are represented
by ethernet property.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../devicetree/bindings/net/airoha,en7581-eth.yaml | 44 +++++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
index fbe2ddcdd909cb3d853a4ab9e9fec4af1d096c52..ebbd433e9c9fbfaefd8d07c3678cabc91574d125 100644
--- a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
+++ b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
@@ -130,6 +130,30 @@ patternProperties:
         maximum: 4
         description: GMAC port identifier
 
+      '#address-cells':
+        const: 1
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      "^ethernet-port@[0-5]$":
+        type: object
+        unevaluatedProperties: false
+        $ref: ethernet-controller.yaml#
+        description: External ethernet port ID available on the GDM port
+
+        properties:
+          compatible:
+            const: airoha,eth-port
+
+          reg:
+            maxItems: 1
+            description: External ethernet port identifier
+
+        required:
+          - compatible
+          - reg
+
     required:
       - reg
       - compatible
@@ -191,9 +215,27 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
 
-        mac: ethernet@1 {
+        mac1: ethernet@1 {
           compatible = "airoha,eth-mac";
           reg = <1>;
         };
+
+        mac4: ethernet@4 {
+          compatible = "airoha,eth-mac";
+          reg = <4>;
+
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          ethernet-port@0 {
+            compatible = "airoha,eth-port";
+            reg = <0>;
+          };
+
+          ethernet-port@1 {
+            compatible = "airoha,eth-port";
+            reg = <1>;
+          };
+        };
       };
     };

-- 
2.53.0


