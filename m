Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF02EC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 19:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8LtV/gRSdkP5dWaapo7+rahHUXjVKidYPiSZ0YBAqj8=; b=CUzvNSzSnlBrHbTWSHqn7tzDIW
	AFgHcgWmpqoy44mwOypNkw4zqH5eH4FQ8jFJnKHqEFmAEtX8SWPDuSdyMGhMInCwwq2+sO21kfBmT
	fuivhylC16EAlG0GFf/hNE8AKaKP2TlOPhCUu0pyezvc7H6iwW/UFVoVBxg+ZwHDSGJlNftEHVTiZ
	vWhol4ND44d2inPk8Cfq78Uj4xvvDiGLvSV/Iz7g9kT3whiy9qdFT5wzlS6uik/+ghwCiYSnmKJSZ
	xI+wexufRmy1DyLG8iM0qASzDS5C85OIYwLlGBXLFPiqxDl1dp2ygIADKxddR0uN5MYFgFlBw8t3b
	wkBVNONQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTIz-00000009aDX-2HHL;
	Tue, 18 Feb 2025 19:30:53 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSkc-00000009SCI-2foA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 18:55:23 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 7A68125A2E;
	Tue, 18 Feb 2025 19:55:21 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zQguXP7GJjuX; Tue, 18 Feb 2025 19:55:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1739904917; bh=WITcutnlYOmj5SGNO+C9ILJDBUpbYgAcvrKAmXZ6d/I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=YlzYKEkn4K8YIwO7FmntNmsd0swPw5Bo+eAK9WDKhtnSgv5ZN9nFTlA90XPkzFI4B
	 ZKZqi0PoqfAaYz/zi7oKCBQjZZTqDapFpESiHzR9No1Nr+kU5Kkb3dcuwbLbl2H1vE
	 zNq7nNxdOIWTZo2pF0dkxYJwWtd/BH/sSATTpokheFVlJkC4E2VCIvyvrRcsWwharY
	 dPBUZO98JqpYoeUy/8jNFMiFjLttZHhecZNyYVhconaknuXPMzzTIrf0AjTwDgPz/c
	 ftr8KKdMsFoR4Ce/iYQ9Z4zdg7CeGc/lXPMcQNjTz0MlGVxu6xGp2ILf6sjz9o29uS
	 9m+grkyZuPwNg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Wed, 19 Feb 2025 00:24:42 +0530
Subject: [PATCH v2 1/2] dt-bindings: usb: samsung,exynos-dwc3: add
 exynos7870 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-exynos7870-usb-v2-1-1de41a89c9d4@disroot.org>
References: <20250219-exynos7870-usb-v2-0-1de41a89c9d4@disroot.org>
In-Reply-To: <20250219-exynos7870-usb-v2-0-1de41a89c9d4@disroot.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739904902; l=2650;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=WITcutnlYOmj5SGNO+C9ILJDBUpbYgAcvrKAmXZ6d/I=;
 b=d8qUFE4iYY6uVdcqi5nmQrJiKVkMuvleIcai/6k9fuz6RDrcDyYSWTbQC2oXNfMf0EDNNHsFd
 hcBciT8NuJyDaAv9XZ87lY8T5ONpOo5cCG9QjuzMlF13iV3sFgDvk/u
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_105522_817416_CA012B02 
X-CRM114-Status: GOOD (  10.64  )
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

Document compatible string for Exynos7870 DWC3-compatible USB 2.0
driver. The devicetree node requires three clocks, named "bus_early",
"ctrl", and "ref".

Unlike other variants, Exynos7870's USB controller requires a single
3.0V regulator. Assert that the other 1.0V regulator requirement is
enforced on variants individually other than Exynos7870's.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../bindings/usb/samsung,exynos-dwc3.yaml          | 28 +++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
index 2b3430cebe99106f3b6201ab31d4d9e3fcc55627..b034b5f553491d2ea253c5f7bba18739219c6f61 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
@@ -16,6 +16,7 @@ properties:
       - samsung,exynos5250-dwusb3
       - samsung,exynos5433-dwusb3
       - samsung,exynos7-dwusb3
+      - samsung,exynos7870-dwusb3
       - samsung,exynos850-dwusb3
 
   '#address-cells':
@@ -52,7 +53,6 @@ required:
   - clock-names
   - ranges
   - '#size-cells'
-  - vdd10-supply
   - vdd33-supply
 
 allOf:
@@ -72,6 +72,8 @@ allOf:
             - const: susp_clk
             - const: link_aclk
             - const: link_pclk
+      required:
+        - vdd10-supply
 
   - if:
       properties:
@@ -86,6 +88,8 @@ allOf:
         clock-names:
           items:
             - const: usbdrd30
+      required:
+        - vdd10-supply
 
   - if:
       properties:
@@ -103,6 +107,8 @@ allOf:
             - const: susp_clk
             - const: phyclk
             - const: pipe_pclk
+      required:
+        - vdd10-supply
 
   - if:
       properties:
@@ -119,6 +125,24 @@ allOf:
             - const: usbdrd30
             - const: usbdrd30_susp_clk
             - const: usbdrd30_axius_clk
+      required:
+        - vdd10-supply
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos7870-dwusb3
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+        clock-names:
+          items:
+            - const: bus_early
+            - const: ctrl
+            - const: ref
 
   - if:
       properties:
@@ -134,6 +158,8 @@ allOf:
           items:
             - const: bus_early
             - const: ref
+      required:
+        - vdd10-supply
 
 additionalProperties: false
 

-- 
2.48.1


