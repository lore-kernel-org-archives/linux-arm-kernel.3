Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F02C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 03:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iEV3oojg3U2eJSaxG1OETOyVCd9PZzwbh6RS1wsZRok=; b=IjFofXbZ+zeMRIxzYjeL2IHpyt
	ltR1T5srkPoqEyJGSw7e0ClMhhdTH9qZYQCJliBzD9T6IEWFIQes/f5m4ke1YdG88WcAQIUVVfdx4
	g5vv2zvRMMY9PoJstWAUjNGaZ9TyNB0qrY/VG9LFB/m59i87OCKDyZydaWZDdGa5QbsK5xObrbEls
	Qxg639iXMnWnUyz2nQBy+d56wkY3B+CAHtnY6+Zues6lMqj6gkE1XUbC2uwifsE3rxsCu8GabW+nt
	wh9MyhbPBcy3YOxzug4V+A1WU2v8cciK65cqbk38qPf9nuNQKkJHASG+m2rH+vBGCNfBFBOhKfqro
	Ju4rklFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1towsc-0000000H7Jp-13Dy;
	Mon, 03 Mar 2025 03:54:10 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1towjp-0000000H63F-18xh;
	Mon, 03 Mar 2025 03:45:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=iEV3o
	ojg3U2eJSaxG1OETOyVCd9PZzwbh6RS1wsZRok=; b=YUwAPBZYlM6LOUi00Gxt2
	py8CzXmwSo6A7qIoSqqJHoYjglkXxycRLSsGcnvvHdoQrjums/nH67PFPDxh2FGL
	brAqs9z9uaGWg1bNxtEO0V303QfQzSWG41UAUmmT1uMd8WgdWZDGMbsv9APjTtgc
	oNVnWCjtoDYIRItjeoRw3U=
Received: from ProDesk.. (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgC3Oc2lJcVnaJliJg--.43523S8;
	Mon, 03 Mar 2025 11:44:49 +0800 (CST)
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
	robh@kernel.org,
	sebastian.reichel@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v16 6/7] dt-bindings: display: vop2: Add rk3576 support
Date: Mon,  3 Mar 2025 11:44:20 +0800
Message-ID: <20250303034436.192400-7-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303034436.192400-1-andyshrk@163.com>
References: <20250303034436.192400-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PSgvCgC3Oc2lJcVnaJliJg--.43523S8
X-Coremail-Antispam: 1Uf129KBjvJXoWxWr1kWFWUuF4UtFW5trWkZwb_yoW5tF4fpa
	93Cas8XrW8Gr1UWw1ktF1rCwnYq3Z3Aw1Ykrn7Ka13KrsxtF48Ww4agrn8Zr9xWFy2vayj
	9F4Fkw17G3sFvr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UK_M-UUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gMFXmfFIit2JAABsy
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_194505_656273_08B9983B 
X-CRM114-Status: GOOD (  11.06  )
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

(no changes since v13)

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
index 083eadcf0588..f546d481b7e5 100644
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
@@ -136,6 +148,11 @@ allOf:
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
@@ -149,6 +166,39 @@ allOf:
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
@@ -164,6 +214,11 @@ allOf:
           minItems: 7
           maxItems: 9
 
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


