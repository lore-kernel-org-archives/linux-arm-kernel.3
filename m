Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2716C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 09:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uDtUGVsfXbv+Rqc9hEtFLCfNT5d7ME2GdE/BtbJPSXI=; b=xUNYrYMazlVThlwlGfHHLsijDy
	rJsOhjYYi4yzMdHXMl6/tkhFg9VNOlVUcej3OOnRHS2R0DITDC7SvOzLi13pqW6/LHodlCY4B8Djn
	d7dl67vtlkAUYmtp6sn+jS2CXTSbadBg24JpZqT1EBYc7PYdnlbsnzWBj8ZujNUpbcwUuL01b3C0y
	ifH6m0hpJql1OoNwgpz+Oo4dD4jVM5coJOQ4Z8axU9px47J1S0OxWibapSjipmS+HGS7sM24pWYQB
	/cvRChQtCU5i9Q6Anv2Uy5ZU+kIdtbH+Svwm8SgTMzqazY7zfK2tgikvglf5LoPGaHko4k3zwzSwc
	D5g9frMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRSTL-00000006ib0-1mPG;
	Tue, 17 Jun 2025 09:19:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRSI4-00000006gxy-362n;
	Tue, 17 Jun 2025 09:07:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=uDtUGVsfXbv+Rqc9hEtFLCfNT5d7ME2GdE/BtbJPSXI=; b=RKfG6+sl4NnkOLSX8vKejPwKjr
	Qc29FF+u2DDidZ+p5eLGq3bYYkr/nB084wEXkrgY/+XHwbD+BimVfjTsVpXbqlVgn52w/+nleX5pL
	VZ+G0rMUzFhqkEbUz1nbq9eWh2L5XjJ/bPA5lD8o11GyTbowYSjjPhVvujun/rjKdptaxEx0LnQlU
	5pougHeKyt6lInlhKA4qy0/g9RnQ4+2OKXmscXcDqJvSpubMRMSKdImKlc2tYcNLAjJw1SDZQz6K2
	j+Mlkm+33RVvIjPQg7IM8B1LeX5v4LROmsNDgzzmx2/FCaQHg2teTwiFzytTzUj7V54JtHsFPbct9
	wV3LYBrA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRSI0-00000003kjl-3zMi;
	Tue, 17 Jun 2025 09:07:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 672815C63F2;
	Tue, 17 Jun 2025 09:05:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6A278C4CEF4;
	Tue, 17 Jun 2025 09:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750151247;
	bh=LVht+9sV1xKC2IxkJr8nOMxbiinkz8Wotsr17dJSVnY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZiJ643pWiECMkR4MlVHS3tyl/tyLl4SqhSFwISTvAVoEu3JdQ1oYlBlC9hyRkuE0D
	 0XjTVwjdHLHic4zB2ZniOX6tnkjI9dWw+WERPDzFmjBScn96AiSqY1kdxa/IXMy5GI
	 tR/IQWFxuvNgPE/cK75DD1/UErcS2zH5n5h7xe6Z1lRfPQ06TGlfMNyMkU+5uQJsU4
	 WBOx/s6HdEJ3DNP7Pdm+R4oF48hUmJ275RSvACpD/UQ5LEUm9eKqCEFd/RCbxNja1f
	 9IgR0Oo8t4/kF07HafW640oIG7OtFcSwOjpqquDyyihonS3vzniMwB6qBa0mhG0Bwi
	 GpUMTkoLkmnHw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A05BC7115A;
	Tue, 17 Jun 2025 09:07:27 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Tue, 17 Jun 2025 10:54:43 +0200
Subject: [PATCH 2/5] dt-bindings: phy: rockchip-inno-csi-dphy: add rk3588
 variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-rk3588-csi-dphy-v1-2-84eb3b2a736c@collabora.com>
References: <20250616-rk3588-csi-dphy-v1-0-84eb3b2a736c@collabora.com>
In-Reply-To: <20250616-rk3588-csi-dphy-v1-0-84eb3b2a736c@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750150493; l=2895;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=fLuP6l4pge2OTjFyNlRHCdovdOVbah0f1mpcQE7Vn4A=;
 b=iM0cTXpH/DwAzcZlyAonVYAbPzQZPRRtV6DKJjpdidZlu4LHinT+I+CdhJ85/XpAL9xC1JBDF
 /7tnNDJymhMAFmqdlEvoCE6njPm3L1Br/wa3FmtQfRJOviM+mrtKQlx
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_100733_428872_FE970AAF 
X-CRM114-Status: GOOD (  10.01  )
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
Reply-To: michael.riesch@collabora.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Michael Riesch <michael.riesch@collabora.com>

The Rockchip RK3588 variant of the CSI-2 DPHY features two reset lines.
Add the variant and allow for the additional reset.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 .../bindings/phy/rockchip-inno-csi-dphy.yaml       | 60 ++++++++++++++++++++--
 1 file changed, 55 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
index 5ac994b3c0aa..6755738b13ee 100644
--- a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
@@ -21,6 +21,7 @@ properties:
       - rockchip,rk3326-csi-dphy
       - rockchip,rk3368-csi-dphy
       - rockchip,rk3568-csi-dphy
+      - rockchip,rk3588-csi-dphy
 
   reg:
     maxItems: 1
@@ -39,18 +40,49 @@ properties:
     maxItems: 1
 
   resets:
-    items:
-      - description: exclusive PHY reset line
+    minItems: 1
+    maxItems: 2
 
   reset-names:
-    items:
-      - const: apb
+    minItems: 1
+    maxItems: 2
 
   rockchip,grf:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
       Some additional phy settings are access through GRF regs.
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,px30-csi-dphy
+              - rockchip,rk1808-csi-dphy
+              - rockchip,rk3326-csi-dphy
+              - rockchip,rk3368-csi-dphy
+              - rockchip,rk3568-csi-dphy
+    then:
+      properties:
+        resets:
+          items:
+            - description: exclusive PHY reset line
+
+        reset-names:
+          items:
+            - const: apb
+
+      required:
+        - reset-names
+    else:
+      properties:
+        resets:
+          minItems: 2
+
+        reset-names:
+          minItems: 2
+
 required:
   - compatible
   - reg
@@ -59,7 +91,6 @@ required:
   - '#phy-cells'
   - power-domains
   - resets
-  - reset-names
   - rockchip,grf
 
 additionalProperties: false
@@ -78,3 +109,22 @@ examples:
         reset-names = "apb";
         rockchip,grf = <&grf>;
     };
+  - |
+    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
+    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        csi_dphy0: phy@fedc0000 {
+            compatible = "rockchip,rk3588-csi-dphy";
+            reg = <0x0 0xfedc0000 0x0 0x8000>;
+            clocks = <&cru PCLK_CSIPHY0>;
+            clock-names = "pclk";
+            #phy-cells = <0>;
+            resets = <&cru SRST_CSIPHY0>, <&cru SRST_P_CSIPHY0>;
+            rockchip,grf = <&csidphy0_grf>;
+            status = "disabled";
+        };
+    };

-- 
2.39.5



