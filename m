Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACFDCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 18:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JIwIvGjkeW5UI1X9Mh3eI534oqrybNg6ZEJACUWItt8=; b=HRqA8J1P0pI998WsFminqLt0YZ
	+EOEcLpQhBbxjq/xG89r5ZauyussniTPEBs1TKbC5iAgaAja4Soq+t4i5ky+qTBlElzUf2qR0rw0Q
	BW03SAvkeAOyGpCvcwTtVINPnk3+fIovBg9iuVQKfk9YFZmjkgMPrUpFTyNPxjAIgKt5Wv49IGJHD
	I8hvqc5uqXQa+AgNNXdjy8RtVbOvXQMvMivlC5kIBdbaj6f9WCHtvbtZfDxgL3EKexPzVeXbDbUnR
	uSKGlI1vhhf1B94Hpa+AYAkmKPTdxe74c0bjLTzDvPeYrSHAOlk8SwU1tof2bLM3sorv/e0/GboVp
	elmon3Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2D30-00000003Y9B-1j5o;
	Fri, 26 Sep 2025 18:19:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2D2r-00000003Y4V-2dMa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 18:19:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A8B754598F;
	Fri, 26 Sep 2025 18:19:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 811F7C116B1;
	Fri, 26 Sep 2025 18:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758910788;
	bh=eSfv/94BXfVINtY1Gd87gaCX40bgQegXNivKn8K8/wA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=eA9dIvt3vE+KnL8TN/1khNLMa1tjc/IJFcYvdbzJcAEudbwke+l2TOCkLzpOdcUnY
	 bLvdCC5wl4xQ7rWtACHPYPhY6OIrnGPui6ilnqSP2uZXAFS5Kk4vG8ZcRFLl9mkVZs
	 DfuHN5TrZCAVMkwkclYsUELCYubvoIDF4EjT7Zrtshy5Q4nZW1+C57iBfHHhq0L+Bv
	 0VBV63qGZX+OLIoudcfS4xV8Mpr9p63m3wIdPkcDD2vGjtqAgydwis3IQOWFkWibhX
	 69YNUuQmygoR45+a152ZlZrDEd0yfZGcTyNYRV5iBmliBHMfmUGxABH5v3qXV8THFc
	 9oMD4TvFlt/5Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 580D9CAC5B8;
	Fri, 26 Sep 2025 18:19:48 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Date: Fri, 26 Sep 2025 14:19:40 -0400
Subject: [PATCH v4 1/4] dt-bindings: usb: add missed compatible string for
 arm64 layerscape
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-ls_dma_coherence-v4-1-21e9c6bdb5cb@nxp.com>
References: <20250926-ls_dma_coherence-v4-0-21e9c6bdb5cb@nxp.com>
In-Reply-To: <20250926-ls_dma_coherence-v4-0-21e9c6bdb5cb@nxp.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Shawn Guo <shawnguo@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 bjorn.andersson@oss.qualcomm.com, imx@lists.linux.dev, 
 Frank Li <Frank.Li@nxp.com>, Ze Huang <huang.ze@linux.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758910787; l=2369;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=xECP3rJgzFVmUgwO2Q0SoMn/hJcv7uPuVA3P1+7dxKA=;
 b=ihVrKU/QKLhhdbQULjuiZ91XkMApIntlRtjBuERXvfxnVIj5c3BFkIqber7bGljsF1GxkQ6KR
 Bfgt7U3yFMCAj6hKQNU9RXgqfXcXe4SEEVE92LcG8Lk7VFexIRsEZA+
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_111949_724963_832C88D3 
X-CRM114-Status: GOOD (  10.26  )
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
Reply-To: Frank.Li@nxp.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Frank Li <Frank.Li@nxp.com>

Add missed compatible string for arm64 layerscape platform. Allow these
fallback to fsl,ls1028a-dwc3.

Remove fallback snps,dwc3 because layerscape dwc3 is not full compatible
with common snps,dwc3 device, a special value gsburstcfg0 need be set when
dma coherence enabled.

Allow iommus property.

Change ref to snps,dwc3-common.yaml to use dwc3 flatten library.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2-v4
- none
---
 .../devicetree/bindings/usb/fsl,ls1028a.yaml       | 33 ++++++++++++----------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/fsl,ls1028a.yaml b/Documentation/devicetree/bindings/usb/fsl,ls1028a.yaml
index a44bdf391887f9c7d565c01d2c3aede99c4a9fc3..4784f057264ac7b18cbc8b41a405f9c9268605bb 100644
--- a/Documentation/devicetree/bindings/usb/fsl,ls1028a.yaml
+++ b/Documentation/devicetree/bindings/usb/fsl,ls1028a.yaml
@@ -9,21 +9,19 @@ title: Freescale layerscape SuperSpeed DWC3 USB SoC controller
 maintainers:
   - Frank Li <Frank.Li@nxp.com>
 
-select:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - fsl,ls1028a-dwc3
-  required:
-    - compatible
-
 properties:
   compatible:
-    items:
-      - enum:
-          - fsl,ls1028a-dwc3
-      - const: snps,dwc3
+    oneOf:
+      - items:
+          - enum:
+              - fsl,ls1012a-dwc3
+              - fsl,ls1043a-dwc3
+              - fsl,ls1046a-dwc3
+              - fsl,ls1088a-dwc3
+              - fsl,ls208xa-dwc3
+              - fsl,lx2160a-dwc3
+          - const: fsl,ls1028a-dwc3
+      - const: fsl,ls1028a-dwc3
 
   reg:
     maxItems: 1
@@ -31,6 +29,11 @@ properties:
   interrupts:
     maxItems: 1
 
+  iommus:
+    maxItems: 1
+
+  dma-coherent: true
+
 unevaluatedProperties: false
 
 required:
@@ -39,14 +42,14 @@ required:
   - interrupts
 
 allOf:
-  - $ref: snps,dwc3.yaml#
+  - $ref: snps,dwc3-common.yaml#
 
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     usb@fe800000 {
-        compatible = "fsl,ls1028a-dwc3", "snps,dwc3";
+        compatible = "fsl,ls1028a-dwc3";
         reg = <0xfe800000 0x100000>;
         interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
     };

-- 
2.34.1



