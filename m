Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61378C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 21:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hsMwfec8Obr/sqCHT8w3iOR+BPYt/PORuo1pyIzRCLE=; b=Kwadq3ITw60/wnqORSlEw+Ufwe
	14pfy5yeeGK6dwbte7FtZDb9bZF710novIYlxhtwXY1v88xaJSz1CRz9lHamb6q+E8viESMAPChLr
	Rptgg7kFq+h6XrvEIBqfU9VCaHEyxvAo3wQSMXu+afonxfRGfwxr8sAD3LSqLkctbwn+d9aOJtc4y
	ZC+CMXE3LIK3Un9BrqJ19usgGcc2N4NxnJL9Dwc4ocH44Rgm2iV4nT1xz72Kxr/XXVQtern8SWx6Y
	ljRc/lgsdk38xl1+HURLROaINP3MGwdRUR7/TY4cbaaLGB4/iSdC2qGx3LFtrLOGyf9f+30wo5YH9
	cTYOi0Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uO14i-000000027kJ-3Wq5;
	Sat, 07 Jun 2025 21:27:36 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uO12W-0000000279S-0AFV;
	Sat, 07 Jun 2025 21:25:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B620BA411A3;
	Sat,  7 Jun 2025 21:25:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4583EC4CEE4;
	Sat,  7 Jun 2025 21:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749331518;
	bh=hcpRc03uTwCBnX4GqkQF3VToaCPvgvdHxKanP27miCY=;
	h=From:To:Cc:Subject:Date:From;
	b=Rez3EuCuw74/jBZ4/e14ICh7TUO7ddULW25b6v3uFyWohcdFSS00Wid9IlId/jmLO
	 wi+BDg7PueAUDFIvgGY7ytIughYtjXCXrsFxqQciPfRNpfOemfp0wqMZokubb32jYX
	 qdd5qhQfCtTa2tWVHrAyfAbcDD5pcvJRtNqjy/lpEobKps7QsZuHzq1Bt2qzQq7NKm
	 LkgmKI47zqM26ASBs1wWhrzdw/e7Mg2/90qz2qIcxser8Wj7c2nMQYqtU3hyGlzuX7
	 H7GoJArUvym4w6CZaRYrRYy18xOZEivvT8Sb+MFyx5aC1cvctJCOK4vBMHAoMlRxNq
	 W4/WlQAFgnrjQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Srinath Mannam <srinath.mannam@broadcom.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: phy: Convert brcm,sr-usb-combo-phy to DT schema
Date: Sat,  7 Jun 2025 16:25:13 -0500
Message-ID: <20250607212515.741397-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_142520_218041_1CE8CE92 
X-CRM114-Status: GOOD (  12.30  )
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

Convert the Broadcom Stingray USB PHY binding to DT schema format. It's
a straight forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/phy/brcm,sr-usb-combo-phy.yaml   | 64 +++++++++++++++++++
 .../bindings/phy/brcm,stingray-usb-phy.txt    | 32 ----------
 2 files changed, 64 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/brcm,sr-usb-combo-phy.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/brcm,stingray-usb-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/brcm,sr-usb-combo-phy.yaml b/Documentation/devicetree/bindings/phy/brcm,sr-usb-combo-phy.yaml
new file mode 100644
index 000000000000..b9aeaab02ef3
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/brcm,sr-usb-combo-phy.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/brcm,sr-usb-combo-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom Stingray USB PHY
+
+maintainers:
+  - Srinath Mannam <srinath.mannam@broadcom.com>
+
+properties:
+  compatible:
+    enum:
+      - brcm,sr-usb-combo-phy
+      - brcm,sr-usb-hs-phy
+
+  reg:
+    maxItems: 1
+
+  '#phy-cells':
+    description: PHY cell count indicating PHY type
+    enum: [ 0, 1 ]
+
+required:
+  - compatible
+  - reg
+  - '#phy-cells'
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,sr-usb-combo-phy
+    then:
+      properties:
+        '#phy-cells':
+          const: 1
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,sr-usb-hs-phy
+    then:
+      properties:
+        '#phy-cells':
+          const: 0
+
+additionalProperties: false
+
+examples:
+  - |
+    usb-phy@0 {
+        compatible = "brcm,sr-usb-combo-phy";
+        reg = <0x00000000 0x100>;
+        #phy-cells = <1>;
+    };
+  - |
+    usb-phy@20000 {
+        compatible = "brcm,sr-usb-hs-phy";
+        reg = <0x00020000 0x100>;
+        #phy-cells = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/phy/brcm,stingray-usb-phy.txt b/Documentation/devicetree/bindings/phy/brcm,stingray-usb-phy.txt
deleted file mode 100644
index 4ba298966af9..000000000000
--- a/Documentation/devicetree/bindings/phy/brcm,stingray-usb-phy.txt
+++ /dev/null
@@ -1,32 +0,0 @@
-Broadcom Stingray USB PHY
-
-Required properties:
- - compatible : should be one of the listed compatibles
-	- "brcm,sr-usb-combo-phy" is combo PHY has two PHYs, one SS and one HS.
-	- "brcm,sr-usb-hs-phy" is a single HS PHY.
- - reg: offset and length of the PHY blocks registers
- - #phy-cells:
-   - Must be 1 for brcm,sr-usb-combo-phy as it expects one argument to indicate
-     the PHY number of two PHYs. 0 for HS PHY and 1 for SS PHY.
-   - Must be 0 for brcm,sr-usb-hs-phy.
-
-Refer to phy/phy-bindings.txt for the generic PHY binding properties
-
-Example:
-	usbphy0: usb-phy@0 {
-		compatible = "brcm,sr-usb-combo-phy";
-		reg = <0x00000000 0x100>;
-		#phy-cells = <1>;
-	};
-
-	usbphy1: usb-phy@10000 {
-		compatible = "brcm,sr-usb-combo-phy";
-		reg = <0x00010000 0x100>,
-		#phy-cells = <1>;
-	};
-
-	usbphy2: usb-phy@20000 {
-		compatible = "brcm,sr-usb-hs-phy";
-		reg = <0x00020000 0x100>,
-		#phy-cells = <0>;
-	};
-- 
2.47.2


