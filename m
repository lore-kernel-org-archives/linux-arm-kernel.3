Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD75C02198
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 07:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iV0y9uGnwXVK7zkkSzMw7t+xjHXK+RMqrkX1IUPW04w=; b=0Y5Q2eT9lzd2/AKlVS+RsMyc38
	85KLFsvxXXjPzSCXspJfiom9HcdRgB189j9obOVRpogXXw2feuk9YJG3+CrqGNSlfWE/FBCegAEir
	S4leWxvmsGRJ21rUPr2l1lYqSTZg5rFFmIfqsafX8LH68s3pAZfQz8F34EWeP0on07U/NvG92BxjE
	7wP5Xm72gJpBT/OS03aQEfj8EBhk7Zt3/1HWPhQWcEJV3UlqCItK1CjNif5kmsnOL9doVdN9Oom86
	zqidqJX+AcJZCD+q4zHYko7mMjt+xq2tTkPB7TJXRtaf1Knq+kJSyHo4STulUKLJZIcbnGkzMDUzR
	m9Tg/vsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfvwu-00000005V1M-33aA;
	Thu, 06 Feb 2025 07:05:20 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfved-00000005QYS-0MVB;
	Thu, 06 Feb 2025 06:46:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=iV0y9
	uGnwXVK7zkkSzMw7t+xjHXK+RMqrkX1IUPW04w=; b=HpT7dBdFhbn152lcQlzvq
	uU72oiOuLv3ItWFl42lTdqJ3SouYqEsDgMLEVowrBw+dX5VQwINz+mKUsWwv1jEn
	azbSoeWMModdvmGYgR7At0GmR+cZ9HuH7nEj5HJ0jRX4FRcwu8c38uKSh6h/HlwF
	S3RbjyuBiJsQzsmt69zuVc=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wC3162wWqRnLu9OKA--.43572S2;
	Thu, 06 Feb 2025 14:46:12 +0800 (CST)
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
Subject: [PATCH v13 12/13] dt-bindings: display: vop2: Add rk3576 support
Date: Thu,  6 Feb 2025 14:46:03 +0800
Message-ID: <20250206064607.11495-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206064457.11396-1-andyshrk@163.com>
References: <20250206064457.11396-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wC3162wWqRnLu9OKA--.43572S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWr1kWFWUuF4UtFW5trWkZwb_yoW5uFW3pa
	93C3Z5XrW8Gr1UWw4ktF1rCwnYq3Z3Ar4akrn2ya13Krsxtr48Ww4agr98Zr9xWFy2vayj
	9FsYkw17G3sFvr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UCQ6XUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqAjrXmekT+DVewAAsX
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_224627_541052_5AEA5D26 
X-CRM114-Status: GOOD (  11.26  )
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

Changes in v13:
- Use maxItems constraint for clocks in allOf block

Changes in v12:
- Split from patch 10/13

Changes in v11:
- Remove redundant min/maxItems constraint

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

 .../display/rockchip/rockchip-vop2.yaml       | 61 ++++++++++++++++++-
 1 file changed, 58 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
index cf68eb911118..2f5745255097 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
@@ -21,6 +21,7 @@ properties:
     enum:
       - rockchip,rk3566-vop
       - rockchip,rk3568-vop
+      - rockchip,rk3576-vop
       - rockchip,rk3588-vop
 
   reg:
@@ -38,10 +39,21 @@ properties:
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
@@ -132,6 +144,11 @@ allOf:
         clock-names:
           maxItems: 5
 
+        interrupts:
+          maxItems: 1
+
+        interrupt-names: false
+
         ports:
           required:
             - port@0
@@ -145,6 +162,39 @@ allOf:
       required:
         - rockchip,grf
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3576-vop
+    then:
+      properties:
+        clocks:
+          maxItems: 5
+
+        clock-names:
+          maxItems: 5
+
+        interrupts:
+          minItems: 4
+
+        interrupt-names:
+          minItems: 4
+
+        ports:
+          required:
+            - port@0
+            - port@1
+            - port@2
+
+        rockchip,vo1-grf: false
+        rockchip,vop-grf: false
+
+      required:
+        - rockchip,grf
+        - rockchip,pmu
+
   - if:
       properties:
         compatible:
@@ -160,6 +210,11 @@ allOf:
           minItems: 7
           maxItems: 7
 
+        interrupts:
+          maxItems: 1
+
+        interrupt-names: false
+
         ports:
           required:
             - port@0
-- 
2.34.1


