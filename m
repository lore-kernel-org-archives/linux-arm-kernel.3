Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50AB5C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 21:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RLdJugKNdBdBQksviPexx3p34ZSQOW3vc33myYf4+50=; b=s9ff9cFdeD+qubb4tz9WLQxwHZ
	SEGMwOL5hVpv2w0irEdb/Mgcp/wLS1OCiyoz/3XFUJ0Z2r7dYQxwloS7vP2MmXwgMxcTjXKV3yRm1
	Mp30xC9EadM31vUeVFaNy8SYMWEzFjLYfTJAZugULt0q82RYOOw72pVR4T1nm06u/nOKPt6u0TasR
	L2L++H352D9hCxiLppBooubn2rvBG2t/lBG41xf9+yynwyGHGarQbsmhfXXlzZdfIvPjf1hEnFwTT
	38KgNmZ9my2Cs/ttnzGa628DnHOmpQI3lxS0k2vcOraaoJ48OKL5qjXcVMWDB1MojvlsO1eIT6UDL
	QdRw76qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3cX-0000000GbnB-3sC5;
	Mon, 03 Feb 2025 21:04:41 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3Ea-0000000GYiL-4Byj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 20:39:58 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id D417E25B04;
	Mon,  3 Feb 2025 21:39:55 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3sNtwAQ2ojto; Mon,  3 Feb 2025 21:39:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738615195; bh=q+HiCqKVD1nvZCK3B05NW0vMMs//u6lpZZ8gRZDg+N4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UczjR/JSAbAKosvFnjHkwm/ig+LpIO7rMjh2jmYpemmPnVK4zG2PhXg8x1/YzcDwN
	 0jw0XRf5Qd2dM2W6akXyrUItJeY3nIHtV46vz6bNBbOxw4Tru0noQwgDTBPMB1z0xL
	 fZqs/Irw5/45C/D0JgJpcKLtnIh0jgWZr8zQbg6GwiiCtcLixFbEOpsa2IBYrNYqCB
	 5Sz7DynuIbxKB6315Sbpsd2DxjSNnu2vJnm9kbccHWKt8GSavda2mngIF7MaIt3gEz
	 f3rIsXUFDuIy+4CVBq6zX95Szp2aGgLf7zIzYmqlXOY99QHVeYKn9kvICcXlMsIr4b
	 vTmwVeVglfn6w==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 04 Feb 2025 02:09:29 +0530
Subject: [PATCH 1/2] dt-bindings: usb: samsung,exynos-dwc3: add exynos7870
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-exynos7870-usb-v1-1-a7753f8183a4@disroot.org>
References: <20250204-exynos7870-usb-v1-0-a7753f8183a4@disroot.org>
In-Reply-To: <20250204-exynos7870-usb-v1-0-a7753f8183a4@disroot.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738615179; l=2864;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=q+HiCqKVD1nvZCK3B05NW0vMMs//u6lpZZ8gRZDg+N4=;
 b=6DXC+F4+yblAYGka5t8oFMeSooAeeGTZ/kMBkJzNN9B43GxcDHq9V/l87Fhm7fpUWFO2fQKfj
 M0nn3dNTINxBQwch65FMXQuxuMyo/+0Tc7BHJ4RxqzthgSaBv4XeeO/
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_123957_175561_9E6966E3 
X-CRM114-Status: GOOD (  10.71  )
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
driver. The devicetree node requires three clocks, named "usbdrd20",
"usbdrd20_ctrl_clk", and "usbdrd20_ref_clk".

Unlike other variants, Exynos7870's USB node doesn't require extra
regulators. Assert that the regulator nodes are required for all variants
other than Exynos7870's on an individual basis, instead of asserting it
globally.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../bindings/usb/samsung,exynos-dwc3.yaml          | 34 ++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
index 2b3430cebe99106f3b6201ab31d4d9e3fcc55627..fb67d0538c60f03ec221cb7fe36852fa060ded06 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
@@ -16,6 +16,7 @@ properties:
       - samsung,exynos5250-dwusb3
       - samsung,exynos5433-dwusb3
       - samsung,exynos7-dwusb3
+      - samsung,exynos7870-dwusb2
       - samsung,exynos850-dwusb3
 
   '#address-cells':
@@ -52,8 +53,6 @@ required:
   - clock-names
   - ranges
   - '#size-cells'
-  - vdd10-supply
-  - vdd33-supply
 
 allOf:
   - if:
@@ -72,6 +71,9 @@ allOf:
             - const: susp_clk
             - const: link_aclk
             - const: link_pclk
+      required:
+        - vdd10-supply
+        - vdd33-supply
 
   - if:
       properties:
@@ -86,6 +88,9 @@ allOf:
         clock-names:
           items:
             - const: usbdrd30
+      required:
+        - vdd10-supply
+        - vdd33-supply
 
   - if:
       properties:
@@ -103,6 +108,9 @@ allOf:
             - const: susp_clk
             - const: phyclk
             - const: pipe_pclk
+      required:
+        - vdd10-supply
+        - vdd33-supply
 
   - if:
       properties:
@@ -119,6 +127,25 @@ allOf:
             - const: usbdrd30
             - const: usbdrd30_susp_clk
             - const: usbdrd30_axius_clk
+      required:
+        - vdd10-supply
+        - vdd33-supply
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos7870-dwusb2
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+        clock-names:
+          items:
+            - const: usbdrd20
+            - const: usbdrd20_ctrl_clk
+            - const: usbdrd20_ref_clk
 
   - if:
       properties:
@@ -134,6 +161,9 @@ allOf:
           items:
             - const: bus_early
             - const: ref
+      required:
+        - vdd10-supply
+        - vdd33-supply
 
 additionalProperties: false
 

-- 
2.48.1


