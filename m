Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE554C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 22:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cIuHZJr3d0IkRmCu/kJiMSIaqasjuHpmTpf21AWXoDo=; b=wgssFnZIZs6xz6Y1TjsW4hRFZK
	j+yU+0bl5PEESoHaWzNj/9InVliX9vZxikeQtMNsAW4NXtRq9LN4VKzWvUGyrNE5KoO0RvQtpcghK
	xiCL2o1/EpsDx/Vqpg5DUcFrNI4FSjNDn3ywbQVfrWwjr5A3R0orXvb5na/koKRPJwgaQWJS13SQp
	RS80XrzMpn65zArjoNCsJk02N8dP/XB1QP0hsXAD/v9T67q5OMT+AfwHCbOKmyEQ4XJrCIFS/09LH
	jVNRes3fdM9gopvuAR2Afk+BbUwR5mZMCMGu8ERNL5ApVamz3j3K3RcYC00CLzRwo9y1LoN6GKpMU
	pN7b5fpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhbnp-00000004YZG-49zw;
	Thu, 31 Jul 2025 22:31:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhbW1-00000004XBl-23Pk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 22:12:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 353494353A;
	Thu, 31 Jul 2025 22:12:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F38E7C4CEEF;
	Thu, 31 Jul 2025 22:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753999965;
	bh=ynT/7P19nBEbnk4v3wUHrwMTXAlpxpXmfSbDLW7QBow=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WiPdH8bJVZiPwaVYPbRRr523yZEzOPQ+ie6pu6R67AsJQNNDlJEGT7ay45wD7eDkq
	 LWt9adqI1IaCuV8oC5dgyWEPfcpu0QWaFm81n00/ylYgb66xnFkzMEFgIWG0FbBJYp
	 dvh8q5g065Hf5jP+cXZ/eg+BAU2Td+fwPUhef4xpkbzfSeI9FKX7sA1ba+y8me/2hc
	 pN0WY4/A4lK+hUzEbMPDIDPoHZR9R8cdk48SP3pV7KbsIJVTOSEsyyO2ucOLBciLMB
	 iyTpyCCDMz7xlXpajr2lRYL/VBzx0bxlOT3SDiWhTKYXg4flf5djaa4SSIWFt0u6xI
	 ZCFD5xkDIvBkg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 31 Jul 2025 17:12:23 -0500
Subject: [PATCH 6/6] dt-bindings: fsi: Convert aspeed,ast2400-cf-fsi-master
 to DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250731-dt-fsi-cleanups-v1-6-e7b695a29fc3@kernel.org>
References: <20250731-dt-fsi-cleanups-v1-0-e7b695a29fc3@kernel.org>
In-Reply-To: <20250731-dt-fsi-cleanups-v1-0-e7b695a29fc3@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Eddie James <eajames@linux.ibm.com>, Ninad Palsule <ninad@linux.ibm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-fsi@lists.ozlabs.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_151245_576604_8E4D4EFA 
X-CRM114-Status: GOOD (  14.27  )
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

Convert the ASpeed Coldfire offloaded GPIO FSI master.

Drop the "fsi-master" compatible as it has not be used consistently and
doesn't represent anything.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/fsi/aspeed,ast2400-cf-fsi-master.yaml | 81 ++++++++++++++++++++++
 .../devicetree/bindings/fsi/fsi-master-ast-cf.txt  | 36 ----------
 2 files changed, 81 insertions(+), 36 deletions(-)

diff --git a/Documentation/devicetree/bindings/fsi/aspeed,ast2400-cf-fsi-master.yaml b/Documentation/devicetree/bindings/fsi/aspeed,ast2400-cf-fsi-master.yaml
new file mode 100644
index 000000000000..690b6c936f18
--- /dev/null
+++ b/Documentation/devicetree/bindings/fsi/aspeed,ast2400-cf-fsi-master.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/fsi/aspeed,ast2400-cf-fsi-master.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASpeed ColdFire offloaded GPIO-based FSI master
+
+maintainers:
+  - Eddie James <eajames@linux.ibm.com>
+
+allOf:
+  - $ref: /schemas/fsi/fsi-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - aspeed,ast2400-cf-fsi-master
+      - aspeed,ast2500-cf-fsi-master
+
+  clock-gpios:
+    maxItems: 1
+    description: GPIO for FSI clock
+
+  data-gpios:
+    maxItems: 1
+    description: GPIO for FSI data signal
+
+  enable-gpios:
+    maxItems: 1
+    description: GPIO for enable signal
+
+  trans-gpios:
+    maxItems: 1
+    description: GPIO for voltage translator enable
+
+  mux-gpios:
+    maxItems: 1
+    description:
+      GPIO for pin multiplexing with other functions (eg, external FSI masters)
+
+  memory-region:
+    maxItems: 1
+    description:
+      Reference to the reserved memory for the ColdFire. Must be 2M aligned on
+      AST2400 and 1M aligned on AST2500.
+
+  aspeed,cvic:
+    description: Reference to the CVIC node.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  aspeed,sram:
+    description: Reference to the SRAM node.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+required:
+  - compatible
+  - clock-gpios
+  - data-gpios
+  - enable-gpios
+  - trans-gpios
+  - mux-gpios
+  - memory-region
+  - aspeed,cvic
+  - aspeed,sram
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    fsi-master {
+      compatible = "aspeed,ast2500-cf-fsi-master";
+      clock-gpios = <&gpio 0>;
+      data-gpios = <&gpio 1>;
+      enable-gpios = <&gpio 2>;
+      trans-gpios = <&gpio 3>;
+      mux-gpios = <&gpio 4>;
+      memory-region = <&coldfire_memory>;
+      aspeed,cvic = <&cvic>;
+      aspeed,sram = <&sram>;
+    };
diff --git a/Documentation/devicetree/bindings/fsi/fsi-master-ast-cf.txt b/Documentation/devicetree/bindings/fsi/fsi-master-ast-cf.txt
deleted file mode 100644
index 3dc752db748b..000000000000
--- a/Documentation/devicetree/bindings/fsi/fsi-master-ast-cf.txt
+++ /dev/null
@@ -1,36 +0,0 @@
-Device-tree bindings for ColdFire offloaded gpio-based FSI master driver
-------------------------------------------------------------------------
-
-Required properties:
- - compatible =
-	"aspeed,ast2400-cf-fsi-master" for an AST2400 based system
-   or
-	"aspeed,ast2500-cf-fsi-master" for an AST2500 based system
-
- - clock-gpios = <gpio-descriptor>;	: GPIO for FSI clock
- - data-gpios = <gpio-descriptor>;	: GPIO for FSI data signal
- - enable-gpios = <gpio-descriptor>;	: GPIO for enable signal
- - trans-gpios = <gpio-descriptor>;	: GPIO for voltage translator enable
- - mux-gpios = <gpio-descriptor>;	: GPIO for pin multiplexing with other
-                                          functions (eg, external FSI masters)
- - memory-region = <phandle>;		: Reference to the reserved memory for
-                                          the ColdFire. Must be 2M aligned on
-					  AST2400 and 1M aligned on AST2500
- - aspeed,sram = <phandle>;		: Reference to the SRAM node.
- - aspeed,cvic = <phandle>;		: Reference to the CVIC node.
-
-Examples:
-
-    fsi-master {
-        compatible = "aspeed,ast2500-cf-fsi-master", "fsi-master";
-
-	clock-gpios = <&gpio 0>;
-        data-gpios = <&gpio 1>;
-        enable-gpios = <&gpio 2>;
-        trans-gpios = <&gpio 3>;
-        mux-gpios = <&gpio 4>;
-
-	memory-region = <&coldfire_memory>;
-	aspeed,sram = <&sram>;
-	aspeed,cvic = <&cvic>;
-    }

-- 
2.47.2


