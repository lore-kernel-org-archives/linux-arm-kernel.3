Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F57CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 23:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mr0dLe8R/V9uIy7NeFvsArdV+69948rqLmURwy5Y+Fs=; b=rwvZfhNHMIf5gwA2nBsW75y07Z
	0BB5ML0tbru2IvQdrD3HefVYC6girNilnTtDOZInL2ocAe8F6Aauw2X8qFgVLfS2UGOjUAJ9YwQyD
	9Wj63KqRjTWBfPx6QCR+35r4iq2LyuzWJDrQv+AIjEpnhkVwc4QLfxGL4H1oBIMvSODnHETIIql2R
	SfYbqbETy7xUfSVCr6N4JP2tVljdumMFMRYmO/QK2wMPnxoyOzAt1RZtS6YNWfJqUtPwAfYWygF2u
	C9OxQRwxXocBw4/J8RFMSz6wGNd01tV10F6yDiDcGAikpg+rf/3royuVLDlKdIHcXkd/LHqUOEIdg
	lTSBligQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDsQ-0000000ELYv-1pAy;
	Mon, 01 Sep 2025 23:23:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utBez-0000000Dtt7-3DHQ;
	Mon, 01 Sep 2025 21:01:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F1F76451C9;
	Mon,  1 Sep 2025 21:01:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C686CC4CEF5;
	Mon,  1 Sep 2025 21:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756760512;
	bh=0i9GyZfKTp11tFuGLpcI9sqzS/VX2YxPG9sUde5/E2c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=U8JzkuwM3u6Acs+qTZ2ZRmvDkbEjT8hT0ZFw4CN+RGn7kLikiUHFimzb6y5yW8YHQ
	 gC3uzDQwaTiZxDBza8IOEkHw/ZJi60+198/pPLxrw/T+5hlPfh2OwbuaXnt/y2OE4p
	 lcdxKeOeKGGDVvJ3DSXV+kXhqrr8uPBBn8zPCJndwLJv/xY7yT0k+2MC/RC0lGn8NK
	 bnBYx0xGf/KjHaKP2NZWTUreZXgao73GleT6/bofQQTQ7GEUlMKMbsVDzqcr/pVjOE
	 m9gkLX5+d5JERcomKVvcR9UEtEwFrlmYZDWqM7loLYlE6cFA9Kb4LJE17px8VNSloL
	 yduUQwXmS1Hkw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B19BCCA1002;
	Mon,  1 Sep 2025 21:01:52 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Mon, 01 Sep 2025 22:47:44 +0200
Subject: [PATCH v3 3/7] dt-bindings: phy: rockchip-inno-csi-dphy: add
 rk3588 variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-rk3588-csi-dphy-v3-3-a5ccd5f1f438@collabora.com>
References: <20250616-rk3588-csi-dphy-v3-0-a5ccd5f1f438@collabora.com>
In-Reply-To: <20250616-rk3588-csi-dphy-v3-0-a5ccd5f1f438@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Diederik de Haas <didi.debian@cknow.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Collabora Kernel Team <kernel@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756759662; l=2642;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=BWFwRKFAbzrCTHgoNhrC2467CbLUxPGoZVsDuHv4H7c=;
 b=0czArA1ITOmxFWBtw11FrbEGI1xv6KFhDnksdNLZ753DqIkLziGJrhhdwnO+Pi5szSnee6/M1
 U6abVJH6hw+BdIljo8oHXnmvoHr6GhbsF3cF9KaV9J4tiTp23SdwzHc
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_140153_874689_7AAC1EA2 
X-CRM114-Status: GOOD (  11.08  )
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
 .../bindings/phy/rockchip-inno-csi-dphy.yaml       | 50 +++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
index 9ad72518e6da..e37c9fd74788 100644
--- a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
@@ -21,6 +21,7 @@ properties:
       - rockchip,rk3326-csi-dphy
       - rockchip,rk3368-csi-dphy
       - rockchip,rk3568-csi-dphy
+      - rockchip,rk3588-csi-dphy
 
   reg:
     maxItems: 1
@@ -40,11 +41,15 @@ properties:
 
   resets:
     items:
-      - description: exclusive PHY reset line
+      - description: APB reset line
+      - description: PHY reset line
+    minItems: 1
 
   reset-names:
     items:
       - const: apb
+      - const: phy
+    minItems: 1
 
   rockchip,grf:
     $ref: /schemas/types.yaml#/definitions/phandle
@@ -64,6 +69,30 @@ allOf:
     then:
       required:
         - power-domains
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
+          maxItems: 1
+
+        reset-names:
+          maxItems: 1
+    else:
+      properties:
+        resets:
+          minItems: 2
+
+        reset-names:
+          minItems: 2
 
 required:
   - compatible
@@ -91,3 +120,22 @@ examples:
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
+        phy@fedc0000 {
+            compatible = "rockchip,rk3588-csi-dphy";
+            reg = <0x0 0xfedc0000 0x0 0x8000>;
+            clocks = <&cru PCLK_CSIPHY0>;
+            clock-names = "pclk";
+            #phy-cells = <0>;
+            resets = <&cru SRST_P_CSIPHY0>, <&cru SRST_CSIPHY0>;
+            reset-names = "apb", "phy";
+            rockchip,grf = <&csidphy0_grf>;
+        };
+    };

-- 
2.39.5



