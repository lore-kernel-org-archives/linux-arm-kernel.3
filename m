Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D233EF4ECF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 10:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nQGak1CXMx/DzbsknoygdrrDMQjxjOTVI15tBZstJuI=; b=RxqHclrnFFblzbC8MBVj2Mjxk9
	+zl1UBV7hEEhHUiL2v5PR2d8lGm2MlYwBiizgQ8LZdaK+rt67Wvt/m3MWCurT6zOTzfKanvpz9cPy
	/eLaFxMLD+7H1mxCDBqEJNklGKphwJBC6xlw29Ve/LJHn12elT4Occ6XZ1IAkC3WQPdoKpZ5LjqYB
	Tz8RyABkcITqnEdfqvX6Yr/HQiQda8qWYvNM/aAU0WOG3SIr+NLHf0cWKcKXmIZl/TFSOctwJOXif
	ukZn1YvZhc2RJSVV8kgrwVzKXBx6rqkfF3823IS53708HdTRlFH3muezEYCvG6/rhVu8mU5uEdIHA
	SpoNdPDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9hIG-0000000513v-12GF;
	Mon, 06 Apr 2026 10:34:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9hIF-0000000513S-0Ce1;
	Mon, 06 Apr 2026 10:34:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 672CE600AD;
	Mon,  6 Apr 2026 10:34:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE0CEC4CEF7;
	Mon,  6 Apr 2026 10:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775471694;
	bh=SJu4TSkAng63cVn9f4OWRRElUiEoJ4XxnXUX+Dp4f6Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=j4KDasB9YkEao7lgVk2Ai4KvySb6oMOL0k6KZN4iZGk7fFc6bRgTnvZzcqMOD4opG
	 GozfINliiJj8T7oCYNddhf3kmO13N3BTR/Ku+DwVLlajUej8Z8L92BNmrcge8gXSJk
	 PPEXpSBQT1NKmnch6r4QKm0f382odbIqceeW+vFwGxHtHQmU6d9KzpLpGjWmkVLC7F
	 YWwSizuIPDAukVW8YqfNdHIq8jBQVC+wYooq0Yjxp4zZrx5B+Gdf8DhXrJCTJL+CUY
	 6+Wkdy08ufpKrCBnvkNV+5hRjP0Nbugzz9u1XEWH/nZBn95L5pnsqJVDfgNTWQ7uGn
	 qvUWIeEEmlDnw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 06 Apr 2026 12:34:06 +0200
Subject: [PATCH net-next v3 01/12] dt-bindings: net: airoha: Add EN7581
 ethernet-ports properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260406-airoha-eth-multi-serdes-v3-1-ab6ea49d59ff@kernel.org>
References: <20260406-airoha-eth-multi-serdes-v3-0-ab6ea49d59ff@kernel.org>
In-Reply-To: <20260406-airoha-eth-multi-serdes-v3-0-ab6ea49d59ff@kernel.org>
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
 .../devicetree/bindings/net/airoha,en7581-eth.yaml | 44 +++++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
index fbe2ddcdd909..ebbd433e9c9f 100644
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


