Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70869CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 21:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/f/daljdiwLsgNrUd3388kjiOo+NhyBkONh4Yx2Sqg4=; b=wvX4akD5OwYJMkp8/ra7ff3w3j
	pEboMYtcDLYsAIiep3A8KwAhilnlmrQWhutPmsq4rdD9fcCUmOoPCd15skC+8fK3AHh+nz/S2PAww
	m2cLGSH6p47gbXflRnA6PshTeF1tc1fmPTKQJCX19/zCy+il25nHqa0ziyA8GzVE9ZAGYT0JhGgAv
	fO0HCBj8jBk/N2iRMIPjpKx61rcqPLSfPB7aq9nsstmrRtDwVbOk+LKETQwLOUj+Nm4kCs1STZUxX
	9dp+ln+06vGGvM0/LZcKyLkU3EmCvhYW/gAlgmOHERQim+ZP9xjZzH6i3ExatCIGfNowqMYEfRLH6
	7fawdB5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL6Ax-00000004uBf-3n46;
	Thu, 07 May 2026 21:22:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL6Au-00000004uAE-3EUw;
	Thu, 07 May 2026 21:22:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B32CA60181;
	Thu,  7 May 2026 21:22:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16169C2BCB2;
	Thu,  7 May 2026 21:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778188947;
	bh=P4++UjBg4l7FEQ69FE68v2vf9fDUEYzzRnc4E/RaMhw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=t37YOzFgI597+Pd5NGo+NR1AFaItYRHaaKSUluxmYhBYOoiFwJ6PVvdWv+vq5Y29j
	 LkVwpcM6uBB6EMtppmfT1OkWmY7nJ41dEfzra0uqkuWaY7VQHCmBiNfOZrvQ7MZN6p
	 P3TfR70wL+bFtUYcUW91ahmAm3e79Qci8ALvD4pi8gWnBqXPzo8Wmn1rWesc0cNcqd
	 B2rbp4oxD619w5ClA/dZFw8MjJBejaqNnQdZdsxmnTFKWpt0+MTO5LcjxPsZlW2ZHe
	 /0DXQVRH8z5HTuG0XBBMUSqfc2AgnU7j6CAj4lJv6lW71ze6hc4f27eZmvt2ei4DIK
	 QBKLFXDLHUJ1Q==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 07 May 2026 23:21:44 +0200
Subject: [PATCH net-next v4 01/10] dt-bindings: net: airoha: Add EN7581
 ethernet-ports properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-airoha-eth-multi-serdes-v4-1-af613b61ae02@kernel.org>
References: <20260507-airoha-eth-multi-serdes-v4-0-af613b61ae02@kernel.org>
In-Reply-To: <20260507-airoha-eth-multi-serdes-v4-0-af613b61ae02@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, 
 Benjamin Larsson <benjamin.larsson@genexis.eu>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
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
or GDM4 ports via a hw arbiter that manages the traffic in a TDM manner.
As a result multiple net_devices can connect to the same GDM{3,4} port
and there is a theoretical "1:n" relation between GDM ports and
net_devices.
Introduce the ethernet-port property in order to model a given net_device
that is connected via the external arbiter to the GDM{3,4} port (that
is represented by the ethernet property. Please note GDM1 or GDM2 does not
support the connection with the external arbiter and are represented
by ethernet property.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../devicetree/bindings/net/airoha,en7581-eth.yaml | 52 +++++++++++++++++++++-
 1 file changed, 51 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
index fbe2ddcdd909..73ba37872247 100644
--- a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
+++ b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
@@ -130,6 +130,38 @@ patternProperties:
         maximum: 4
         description: GMAC port identifier
 
+      '#address-cells':
+        const: 1
+      '#size-cells':
+        const: 0
+
+    allOf:
+      - if:
+          properties:
+            reg:
+              items:
+                - enum:
+                    - 3
+                    - 4
+        then:
+          patternProperties:
+            "^ethernet-port@[0-5]$":
+              type: object
+              unevaluatedProperties: false
+              description: External ethernet port ID available on the GDM port
+
+              properties:
+                compatible:
+                  const: airoha,eth-port
+
+                reg:
+                  maxItems: 1
+                  description: External ethernet port identifier
+
+              required:
+                - compatible
+                - reg
+
     required:
       - reg
       - compatible
@@ -191,9 +223,27 @@ examples:
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
2.54.0


