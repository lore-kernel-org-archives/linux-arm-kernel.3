Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D776DC02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 11:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n50bXjL6CzsZAywq5myPb2oe8TPuInq6nzZ0FGMySmo=; b=xYW5km6Pk5IK/9i1mUdsZOjJu1
	55SzVGsaavWeQHNvsCZGaJ8QI7eu/GbT5s2onF5Y2SnAA+cBDx3/R5lX4IjlITAsoWazUeDSojxyh
	pj1vt2MOS5qeL09MjukHGKs9yNE+cVj7N3Kv5BAo1Ai0FmmTWF76Ty2dwvfWZpixKVV34xb1ZOspp
	Ckv6d2yI2PCOUaPTvMF80ccYBpir8FmFYXt7a8EpULiWfqIs2Dso200g9fxBiOHUFio48gTchCT1P
	MjTR4bgzuZD67sbwfuW0qjea8n0UQ7MQOFTkJH9tZo4DlnrYa6j851Zwsd9q6fyw0kxu3PhhPJeNZ
	5QM41ILw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taCm1-00000007mmi-3Rwi;
	Tue, 21 Jan 2025 11:50:26 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taBZo-00000007b6h-2Ay2;
	Tue, 21 Jan 2025 10:33:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=n50bX
	jL6CzsZAywq5myPb2oe8TPuInq6nzZ0FGMySmo=; b=WtnYvh5OrLJFZkembmmv4
	e4nr+f9ubsoWJy9Gnfb1GbEUULNTD/MAK/pC71wYRN4DVCRXHBx0K0AwqcokU4JP
	W6unlYhmKcIW3ciQr+BsxFp+c6Bsf0na3r6vMB2PBlSqsddYEDvhw1Y1dHawSHjL
	Od0NExiP+mhW7kyojd5wQk=
Received: from ProDesk.. (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgDHkqjYd49nreMjBg--.21590S12;
	Tue, 21 Jan 2025 18:33:09 +0800 (CST)
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
Subject: [PATCH v12 10/13] dt-bindings: display: vop2: describe constraint SoC by SoC
Date: Tue, 21 Jan 2025 18:32:47 +0800
Message-ID: <20250121103254.2528004-11-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250121103254.2528004-1-andyshrk@163.com>
References: <20250121103254.2528004-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PCgvCgDHkqjYd49nreMjBg--.21590S12
X-Coremail-Antispam: 1Uf129KBjvJXoWxZF4UWFWrJw47tw1kZF4Dtwb_yoW5WF4kpa
	93Cas8X3y8Gr1UWw4ktF1rCw40qF93Aw4xJrn7t3WxGa1qvF4UG3yagrn8Ar9xWrsrZaya
	kFs0kw15J3y2vr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j8zV8UUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hfbXmePdPc5zgAAsc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_023344_985605_2324BD38 
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

From: Andy Yan <andy.yan@rock-chips.com>

As more SoCs variants are introduced, each SoC brings its own
unique set of constraints, describe this constraints SoC by
SoC will make things easier for adding new variant.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v12:
- Only change the description method for existing SoC.

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

 .../display/rockchip/rockchip-vop2.yaml       | 44 +++++++++++++------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
index 2531726af306..f23939e67fd0 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
@@ -14,6 +14,7 @@ description:
 maintainers:
   - Sandy Huang <hjc@rock-chips.com>
   - Heiko Stuebner <heiko@sntech.de>
+  - Andy Yan <andyshrk@163.com>
 
 properties:
   compatible:
@@ -120,43 +121,58 @@ allOf:
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
+          maxItems: 1
 
         ports:
           required:
             - port@0
             - port@1
             - port@2
-            - port@3
-
-      required:
-        - rockchip,grf
-        - rockchip,vo1-grf
-        - rockchip,vop-grf
-        - rockchip,pmu
 
-    else:
-      properties:
         rockchip,vo1-grf: false
         rockchip,vop-grf: false
         rockchip,pmu: false
 
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
+          maxItems: 1
 
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
 
-- 
2.34.1


