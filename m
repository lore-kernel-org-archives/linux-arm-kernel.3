Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBB5E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 09:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JpEWkVoO4RXba/rgKMxL/Z8ArtALwq7ono1kXj0OSeQ=; b=K8AWz4RutXi/Gs7ZoWb8P+hpE2
	luMxmLyfh7h5u8WSgSVP8y4h26GdugWnbHmLu4P8zd74WTq7yhUmrlsFsR74ZP/H8ceU86t7+l+oU
	5gPgoAs6zuYpI8VWJ+ndfjsIjM2Ap7mfSUhzaswBzZp/iQDmVu2DXEHvUE+XbKKHgyjpUK9eAh3Ey
	TFrMZvknYEqCG9m17dyZJOCj3B4jNYl7LsMTj/kpHBqCjSIGg+ItIIAYPN8JGsdwQu9angiyY8aJ+
	XRL9e1l1II/zSWtybXltnqRq4FVV89eW1mMLEYNKfxczb1R9rGJVy81H0kXGkTwLzi71j6c/YRdUa
	XcACYhig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSYYc-00000006w2Y-2qq6;
	Tue, 31 Dec 2024 09:28:58 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSYXO-00000006vuU-3Dn9;
	Tue, 31 Dec 2024 09:27:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=JpEWk
	VoO4RXba/rgKMxL/Z8ArtALwq7ono1kXj0OSeQ=; b=i8omjwaxlWT2Oz9zaiLmD
	VnbO8teQ00uYmsd6GdQu4l+hlL8fVQBpK6S0Kfw56yiQ5aN2ZShHm5VWKT0vZ7z7
	KveXChDJcXRGSU4yxFNKO4PXFrqlkjjzlx6+Q+Xl4tUMoA4k0GpulN6GCRXxPiLr
	ebZ6r3bjhMgxS0xBunthEc=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3q9H6uHNn4DFGCw--.46410S2;
	Tue, 31 Dec 2024 17:27:26 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: vkoul@kernel.org
Cc: cristian.ciocaltea@collabora.com,
	heiko@sntech.de,
	kishon@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v3] dt-bindings: phy: Add rk3576 hdptx phy
Date: Tue, 31 Dec 2024 17:27:11 +0800
Message-ID: <20241231092721.252405-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3q9H6uHNn4DFGCw--.46410S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCF4fJFy5ur1rCF1UXr48Xrb_yoW5GrWxpa
	9xCFykJF1xGw13ZayDtwn5CF93tFsayr4ayrnagr13Wws3KrWavr4a9F15ZryYvr48tay5
	Krsrury3ZF4avrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UmjgsUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqQ-GXmdztQxoqAAAsT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_012743_192980_F6D21609 
X-CRM114-Status: UNSURE (   8.40  )
X-CRM114-Notice: Please train this message.
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

From: Andy Yan <andy.yan@rock-chips.com>

Add compatible for the HDPTX PHY on rk3576, which is compatible with
rk3588, but without rst_phy/rst_ropll/rst_lcpll.

In fact, these three reset lines are also optional on the rk3588,
they just used for debug, then they were removed on the rk3576 IC
design.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v3:
- Split from:
  https://lore.kernel.org/linux-rockchip/3330586.aeNJFYEL58@diego/T/#m02151cd8591d7fe92cf30ab69701ed57c1944c06

Changes in v2:
- Wrap commit message according to Linux coding style
- Make "rockchip,rk3588-hdptx-phy" const for "rockchip,rk3576-hdptx-phy"
- Make declare phy/ropll/lcpll reset line are not exit on rk3576

 .../phy/rockchip,rk3588-hdptx-phy.yaml        | 62 +++++++++++++------
 1 file changed, 44 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3588-hdptx-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3588-hdptx-phy.yaml
index 84fe59dbcf48..7a307f45cdec 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,rk3588-hdptx-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,rk3588-hdptx-phy.yaml
@@ -11,8 +11,13 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - rockchip,rk3588-hdptx-phy
+    oneOf:
+      - enum:
+          - rockchip,rk3588-hdptx-phy
+      - items:
+          - enum:
+              - rockchip,rk3576-hdptx-phy
+          - const: rockchip,rk3588-hdptx-phy
 
   reg:
     maxItems: 1
@@ -34,24 +39,12 @@ properties:
     const: 0
 
   resets:
-    items:
-      - description: PHY reset line
-      - description: APB reset line
-      - description: INIT reset line
-      - description: CMN reset line
-      - description: LANE reset line
-      - description: ROPLL reset line
-      - description: LCPLL reset line
+    minItems: 4
+    maxItems: 7
 
   reset-names:
-    items:
-      - const: phy
-      - const: apb
-      - const: init
-      - const: cmn
-      - const: lane
-      - const: ropll
-      - const: lcpll
+    minItems: 4
+    maxItems: 7
 
   rockchip,grf:
     $ref: /schemas/types.yaml#/definitions/phandle
@@ -67,6 +60,39 @@ required:
   - reset-names
   - rockchip,grf
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3576-hdptx-phy
+    then:
+      properties:
+        resets:
+          minItems: 4
+          maxItems: 4
+        reset-names:
+          items:
+            - const: apb
+            - const: init
+            - const: cmn
+            - const: lane
+    else:
+      properties:
+        resets:
+          minItems: 7
+          maxItems: 7
+        reset-names:
+          items:
+            - const: phy
+            - const: apb
+            - const: init
+            - const: cmn
+            - const: lane
+            - const: ropll
+            - const: lcpll
+
 additionalProperties: false
 
 examples:
-- 
2.34.1


