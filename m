Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E2ECC282D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 19:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o4B1Z00ZavQJc5UwVhgaZ7OmV0xfCvDr+2I49CbC7ow=; b=ZfdG8v0Yme/dapYIJ7/CaakZO0
	YormRiSjiJyVr+1w1g9GOwuuh3GU2gqgWoaFjzSN2AoDrfcp6p3PA4eCS2Cu5NcvBQGSPxPDy325F
	0jh+WzsK341a37wGdx7+ZObxPI+c9qlW86ZbInB1QRjPMnVosUy27Pc3Y3eakM7vC20Cy1i66oMaB
	xUIeQqsXC4xxgq6+UU9pyA/sOA1TAQMzrdvCq72rTCsul8v9N8964IDw8svN4yiE9tbuEcFq4JTwu
	At/XQ6jDCUkRgNBSsadQMUohTXZn1vgFiXy0Q9LuGjqDeN0tjBv+W5xQR9eUQfvlKUZHJHyeU9+xh
	PBTFkmDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to6Ms-0000000CQE2-1ON5;
	Fri, 28 Feb 2025 19:49:54 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to6EW-0000000COKp-3Dzh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 19:41:17 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 7F25C25B0A;
	Fri, 28 Feb 2025 20:41:15 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WW11N-AUo2ZJ; Fri, 28 Feb 2025 20:41:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740771659; bh=0gZvk08A4uXW8YubS0cw+KR0q7k/aUDRmlE/RE8l5TU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=PYDpPl9wawqHtedO7/Mkent6nhRsqa3gJtOF+cgAs9SN+yZrYAJa9WbcvjGYkFG0e
	 WS2uQShN7uwLlVKS8JP6wNpcqqmEgSea1jWLiM30IM/U9JQcIYGi0MuUq8pk0y2NnI
	 phrOcqf4OMEGM0SnSGdFAJsa5tZV3dLe7FB3k856IcpecLVFtO0mHZ+d0+VwCDRAB8
	 H7HYehsFMM/2Dv3ssSUTHM+5CeympYW/Vq6VnNE/Y7cxwRSB0h2cqAUv8Buux/kQeW
	 1kNaq+dPKTbwe2XemEn9Udh1W6/wiRP4zfXeT50iSnt9JrDNxIJjCLfTgibivOIWqt
	 Ae2o4bYcpt+JA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sat, 01 Mar 2025 01:10:33 +0530
Subject: [PATCH v3 1/2] dt-bindings: usb: samsung,exynos-dwc3: add
 exynos7870 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250301-exynos7870-usb-v3-1-f01697165d19@disroot.org>
References: <20250301-exynos7870-usb-v3-0-f01697165d19@disroot.org>
In-Reply-To: <20250301-exynos7870-usb-v3-0-f01697165d19@disroot.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740771646; l=2708;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=0gZvk08A4uXW8YubS0cw+KR0q7k/aUDRmlE/RE8l5TU=;
 b=vWh1dTGJB0Dk6aLitTsvCuVoYsLglWrIpKD72GbNL9Ju8t3FBxDcTEFT7mtMpH5e7OF1TO8S2
 zOqxS4fAy9OAi6k/UBNpcRR0Lk5x1uLwHQrRSDnoQZJ5TZvZ3kjZ3Sj
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_114116_946776_1E6A8522 
X-CRM114-Status: GOOD (  10.45  )
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
"ref", and "ctrl".

Unlike other variants, Exynos7870's USB controller requires a single
3.0V regulator. Assert that the other 1.0V regulator requirement is
enforced on variants individually other than Exynos7870's.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../bindings/usb/samsung,exynos-dwc3.yaml          | 28 +++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
index f11e767a8abe1d2fb7faa6d6b5be09970c5c9b37..256bee2a03ca189f360e2b677f101dce25a0f368 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
@@ -17,6 +17,7 @@ properties:
           - samsung,exynos5250-dwusb3
           - samsung,exynos5433-dwusb3
           - samsung,exynos7-dwusb3
+          - samsung,exynos7870-dwusb3
           - samsung,exynos850-dwusb3
       - items:
           - const: samsung,exynos990-dwusb3
@@ -56,7 +57,6 @@ required:
   - clock-names
   - ranges
   - '#size-cells'
-  - vdd10-supply
   - vdd33-supply
 
 allOf:
@@ -76,6 +76,8 @@ allOf:
             - const: susp_clk
             - const: link_aclk
             - const: link_pclk
+      required:
+        - vdd10-supply
 
   - if:
       properties:
@@ -90,6 +92,8 @@ allOf:
         clock-names:
           items:
             - const: usbdrd30
+      required:
+        - vdd10-supply
 
   - if:
       properties:
@@ -107,6 +111,8 @@ allOf:
             - const: susp_clk
             - const: phyclk
             - const: pipe_pclk
+      required:
+        - vdd10-supply
 
   - if:
       properties:
@@ -123,6 +129,24 @@ allOf:
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
+            - const: ref
+            - const: ctrl
 
   - if:
       properties:
@@ -138,6 +162,8 @@ allOf:
           items:
             - const: bus_early
             - const: ref
+      required:
+        - vdd10-supply
 
 additionalProperties: false
 

-- 
2.48.1


