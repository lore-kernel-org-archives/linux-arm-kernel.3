Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBFEE7718F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Dec 2024 12:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tWjTAOLgd9HkbIXFzlj06PfRlzkvfWEKiYD/XWeq8os=; b=yp4rrZQb/5Jimct3CiGhEto+I6
	IGgtansulruTo+IzAdP7yd4A0UAEx/uYNK9tjP9XW1+zv3c7JLZ6EF+oCR11p/8GVDCpVyUGoBRQE
	eVny4hghuvnWCdSoVzkuTJxdTEjGjk98PgaNBN6UQeTlokV74KfVVqzDd33RCEsNqsYRf1xFjxkmN
	jiNx9ptAIjnifQlsoxKajNeBFfKQPaLE7G9lE1fu4hTXwMdhr4UUUiNMPtuUdPIcLoscpaUuEq4xK
	sxUFm8jRb6vJ+5tQUzBdOoFN8VnyX5sDDpn2EpfNhWUu5wBuh1z/CUB4MFz6d4aeUg6WdtL4thWw1
	wMFyzOEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRVyQ-00000001s2w-0jGH;
	Sat, 28 Dec 2024 12:31:18 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRVq2-00000001qbt-1iel;
	Sat, 28 Dec 2024 12:22:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=tWjTA
	OLgd9HkbIXFzlj06PfRlzkvfWEKiYD/XWeq8os=; b=LXGi/i2CbK8w97uz6lNmS
	fevRKfb7w9vg03qEzbeuO6Xpdrs7vlVFmDxID48ZcUnJBWw7PR3F+AfIQ0bh1vXG
	8ErwPmIwr0Z8g7evJjVT4J+hRPLDrXzSjtXAW88tYMlsWZMmXOR01riv5dahx1yV
	gpXGS/fByXPWdZjDRJK4iU=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3t0tl7W9nUxdCCQ--.1009S7;
	Sat, 28 Dec 2024 20:22:07 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de,
	krzk+dt@kernel.org,
	joro@8bytes.org
Cc: cl@rock-chips.com,
	robh@kernel.org,
	hjc@rock-chips.com,
	vkoul@kernel.org,
	devicetree@vger.kernel.org,
	detlev.casanova@collabora.com,
	cristian.ciocaltea@collabora.com,
	dri-devel@lists.freedesktop.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v2 5/8] dt-bindings: display: vop2: Add rk3576 support
Date: Sat, 28 Dec 2024 20:21:48 +0800
Message-ID: <20241228122155.646957-6-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241228122155.646957-1-andyshrk@163.com>
References: <20241228122155.646957-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3t0tl7W9nUxdCCQ--.1009S7
X-Coremail-Antispam: 1Uf129KBjvJXoWxWr1kWFWxArW5XFyUKr4xXrb_yoW5XF13pa
	93CFyDXrWxGF1UXw4ktFn5Can5tF9Yyw4Ykrn7ta17KrsIgF4kWw4agr1DJr13WF17ZayY
	9FsYk347G39avr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j7L05UUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqA-DXmdv62k-HQAAsS
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241228_042238_852709_47784BE2 
X-CRM114-Status: UNSURE (   8.13  )
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

Add vop found on rk3576, the main difference between rk3576 and the
previous vop is that each VP has its own interrupt line.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v2:
- describe constraint SOC by SOC, as interrupts of rk3576 is very
  different from others
- Drop Krzysztof's Reviewed-by, as this version changed a lot.

Changes in v1:
- ordered by soc name
- Add description for newly added interrupt

 .../display/rockchip/rockchip-vop2.yaml       | 70 +++++++++++++++----
 1 file changed, 56 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
index 2531726af306..f28cea4a6d82 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
@@ -20,6 +20,7 @@ properties:
     enum:
       - rockchip,rk3566-vop
       - rockchip,rk3568-vop
+      - rockchip,rk3576-vop
       - rockchip,rk3588-vop
 
   reg:
@@ -37,10 +38,22 @@ properties:
       - const: gamma-lut
 
   interrupts:
-    maxItems: 1
-    description:
-      The VOP interrupt is shared by several interrupt sources, such as
-      frame start (VSYNC), line flag and other status interrupts.
+    minItems: 1
+    maxItems: 4
+    items:
+      - description:
+          vop system interrupt, such as bus error, and vsync for vop version under
+          rk3576.
+      - description:
+          independent interrupts for each video port, such as vsync and other video
+          port related error interrupts.
+
+  interrupt-names:
+    items:
+      - const: vop-sys
+      - const: vop-vp0
+      - const: vop-vp1
+      - const: vop-vp2
 
   # See compatible-specific constraints below.
   clocks:
@@ -127,31 +140,60 @@ allOf:
           minItems: 7
         clock-names:
           minItems: 7
-
         ports:
           required:
             - port@0
             - port@1
             - port@2
             - port@3
-
       required:
         - rockchip,grf
         - rockchip,vo1-grf
         - rockchip,vop-grf
         - rockchip,pmu
 
-    else:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3576-vop
+    then:
       properties:
-        rockchip,vo1-grf: false
-        rockchip,vop-grf: false
-        rockchip,pmu: false
-
         clocks:
-          maxItems: 5
+          minItems: 5
         clock-names:
-          maxItems: 5
-
+          minItems: 5
+        ports:
+          required:
+            - port@0
+            - port@1
+            - port@2
+        interrupts:
+          minItems: 4
+          maxItems: 4
+        interrupt-names:
+          items:
+            - const: vop-sys
+            - const: vop-vp0
+            - const: vop-vp1
+            - const: vop-vp2
+      required:
+        - rockchip,grf
+        - rockchip,pmu
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3568-vop
+              - rockchip,rk3566-vop
+    then:
+      properties:
+        clocks:
+          minItems: 5
+        clock-names:
+          minItems: 5
         ports:
           required:
             - port@0
-- 
2.34.1


