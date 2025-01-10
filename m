Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A833E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 10:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PbSDLsC+cEYKXDiQgjynyzRYF1jUFFvQxKH7fmjyQig=; b=i2iYwjCwt3QIDy+wS19f07/Mxd
	OtXKRatnU3JO2Ff5pIT1ZlGMcIsXvctAM7nwUySb5ZC5wrukHnkSBQDGo4aSzq60+GVvbJva97ZD1
	4+dn43DmhqR1q230x/4T9CtjJmwuBrzjaHTs3a4OcTmnWiLkkWib5+obNOntnIpk1TbErRHCT+E3Z
	kxVxVGLMUwtg02mef8+jzwzOn6mP9CyVJ/rTStFU4DBZkh/DYZ2ixmO6jjGiJiXwaZrzkQIbfyruv
	rgQmAkxiegKktsOLNy2v7J6SdDnaFhVjTsah4gJtvBvxNA5vr0FdJGapb31b8xDfz30jI1EK1QQCk
	W4Xc86ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWC8t-0000000EvSC-12zY;
	Fri, 10 Jan 2025 10:21:27 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWBwy-0000000Esm7-1rXt;
	Fri, 10 Jan 2025 10:09:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=PbSDL
	sC+cEYKXDiQgjynyzRYF1jUFFvQxKH7fmjyQig=; b=FMALCc8XrYq7fgwTm/Ozc
	5qzjGNkMaeFWGTT0HLZ7O/s+xIAnq4uWNYpe+Wck7fN0/7U86No2lShM4XLJK1wA
	pS6C/qQxm0fwz/CTa/GZMXic50mKfoTwyEu2GvZ9JX9wPfvXKnTdTgIEospZj+2z
	JeSHAd320/bDWbDNFnenR0=
Received: from ProDesk.. (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgBHPRKh8YBn2sBEEQ--.4640S12;
	Fri, 10 Jan 2025 18:08:47 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	derek.foreman@collabora.com,
	detlev.casanova@collabora.com,
	daniel@fooishbar.org,
	robh@kernel.org,
	sebastian.reichel@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v10 10/11] dt-bindings: display: vop2: Add rk3576 support
Date: Fri, 10 Jan 2025 18:08:25 +0800
Message-ID: <20250110100832.27551-11-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250110100832.27551-1-andyshrk@163.com>
References: <20250110100832.27551-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgBHPRKh8YBn2sBEEQ--.4640S12
X-Coremail-Antispam: 1Uf129KBjvJXoWxWr1kWFW7tFW7JF18AF1rtFb_yoWrAFyrpa
	93CFyDX3y8Gr1UWw4ktFn5Cws5tFn5Aw4akrn7ta17Kws0qF4kGw4agr1DJr13Wr42vaya
	9FsYk347G3sIvF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j0FALUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0g3QXmeA8KYWwAAAs2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_020908_899569_D7F6E5CB 
X-CRM114-Status: GOOD (  11.29  )
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

Changes in v10:
- Move interrupt-names back to top level
- Add constraint of interrupts for all platform
- Add constraint for all grf phandles
- Reorder some properties

Changes in v9:
- Drop 'vop-' prefix of interrupt-names.
- Add blank line between DT properties
- Remove list interrupt-names in top level

Changes in v8:
- Fix dt_binding_check errors
- ordered by soc name
- Link to the previous version:
  https://lore.kernel.org/linux-rockchip/6pn3qjxotdtpzucpul24yro7ppddezwuizneovqvmgdwyv2j7p@ztg4mqyiqmjf/T/#u

Changes in v4:
- describe constraint SOC by SOC, as interrupts of rk3576 is very
  different from others
- Drop Krzysztof's Reviewed-by, as this version changed a lot.

Changes in v3:
- ordered by soc name
- Add description for newly added interrupt

Changes in v2:
- Add dt bindings

 .../display/rockchip/rockchip-vop2.yaml       | 101 +++++++++++++++---
 1 file changed, 87 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
index 2531726af306..3bae71142018 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
@@ -14,12 +14,14 @@ description:
 maintainers:
   - Sandy Huang <hjc@rock-chips.com>
   - Heiko Stuebner <heiko@sntech.de>
+  - Andy Yan <andyshrk@163.com>
 
 properties:
   compatible:
     enum:
       - rockchip,rk3566-vop
       - rockchip,rk3568-vop
+      - rockchip,rk3576-vop
       - rockchip,rk3588-vop
 
   reg:
@@ -37,10 +39,21 @@ properties:
       - const: gamma-lut
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    maxItems: 4
     description:
-      The VOP interrupt is shared by several interrupt sources, such as
-      frame start (VSYNC), line flag and other status interrupts.
+      For VOP version under rk3576, the interrupt is shared by several interrupt
+      sources, such as frame start (VSYNC), line flag and other interrupt status.
+      For VOP version from rk3576 there is a system interrupt for bus error, and
+      every video port has it's independent interrupts for vsync and other video
+      port related error interrupts.
+
+  interrupt-names:
+    items:
+      - const: sys
+      - const: vp0
+      - const: vp1
+      - const: vp2
 
   # See compatible-specific constraints below.
   clocks:
@@ -120,43 +133,102 @@ allOf:
       properties:
         compatible:
           contains:
-            const: rockchip,rk3588-vop
+            enum:
+              - rockchip,rk3566-vop
+              - rockchip,rk3568-vop
     then:
       properties:
         clocks:
-          minItems: 7
+          minItems: 5
+
         clock-names:
-          minItems: 7
+          minItems: 5
+
+        interrupts:
+          minItems: 1
+          maxItems: 1
+
+        interrupt-names: false
 
         ports:
           required:
             - port@0
             - port@1
             - port@2
-            - port@3
+
+        rockchip,vo1-grf: false
+        rockchip,vop-grf: false
+        rockchip,pmu: false
 
       required:
         - rockchip,grf
-        - rockchip,vo1-grf
-        - rockchip,vop-grf
-        - rockchip,pmu
 
-    else:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3576-vop
+    then:
       properties:
+        clocks:
+          minItems: 5
+
+        clock-names:
+          minItems: 5
+
+        interrupts:
+          minItems: 4
+          maxItems: 4
+
+        interrupt-names:
+          minItems: 4
+          maxItems: 4
+
+        ports:
+          required:
+            - port@0
+            - port@1
+            - port@2
+
         rockchip,vo1-grf: false
         rockchip,vop-grf: false
-        rockchip,pmu: false
 
+      required:
+        - rockchip,grf
+        - rockchip,pmu
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3588-vop
+    then:
+      properties:
         clocks:
-          maxItems: 5
+          minItems: 7
+
         clock-names:
-          maxItems: 5
+          minItems: 7
+
+        interrupts:
+          minItems: 1
+          maxItems: 1
+
+        interrupt-names: false
 
         ports:
           required:
             - port@0
             - port@1
             - port@2
+            - port@3
+
+      required:
+        - rockchip,grf
+        - rockchip,vo1-grf
+        - rockchip,vop-grf
+        - rockchip,pmu
 
 additionalProperties: false
 
@@ -184,6 +256,7 @@ examples:
                               "dclk_vp1",
                               "dclk_vp2";
                 power-domains = <&power RK3568_PD_VO>;
+                rockchip,grf = <&grf>;
                 iommus = <&vop_mmu>;
                 vop_out: ports {
                     #address-cells = <1>;
-- 
2.34.1


