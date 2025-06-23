Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A17E5C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 14:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yy5N0D0b0n3hxIXHB7o+Bh0eFttWecHRuCbsTe7qwlc=; b=KTebq+x7dTI9XbiMOKpVq8ZQac
	/W91dFPvFBuWGc070utjsurHHKmzBGyfA1A378Ibl+bonzcZyhjd0oTlaQLqe/PpnY1DvNT1D0uSn
	C1yB1Qc33U5NodeepNqIAUQKPjEXFbKPaK6MfTlBr7STZXIxq1ara7KmDZ2Z2LBxNdudwPv0d8iKj
	M07ExR6lrx3a2TIhDJPchdj9rrSXE58RqpOaaxB9MsahwA4oYaIHthUZRjOCFU3/xkHwH2HQXwCWW
	zsuxb1+ZU+DH4jaLtty20ye0o77YBSFm5hP2BEguUtswmKnQqoUPIOazQ6q+xOdJcGeIQSOr1CLBv
	njfgVGVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTidn-000000038xU-287D;
	Mon, 23 Jun 2025 14:59:23 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfs8-00000002bBX-1iwb;
	Mon, 23 Jun 2025 12:02:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680119;
	bh=jO2rjFk9i243G6Aw+p0m6PxiIWHJHcPYQISiJmBvTKc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lcj5TK7bu0qWiStHrfRqT5uzRdTb+RFr//YbMOPGIrLZVCm3fqtqdVy+nx8Cz//IY
	 ZN6FQru9SwLvQSOxLd5gLnu6WejVqE17vNXgijzEiMSBBSZBXwLgeUqyBL2L2Y/6/l
	 b45jYNHxeK8HOILW8U/S73VtjeM4d6+FRSuzQ8Nt6YWTH5Nkvz8xEHSZqjjYL+nKhZ
	 yQZKfyGFbR64Zq3RXxvdJhiUDua12xqn3V/26qQoy6J0cSVYg9kq+St4ZMaFzN8oaR
	 PU8QsUCFYxVphCBODtuLC4j3dUDDtbyeASNXh07BoQis+F6irHUtMkXL5JIJro/V1m
	 7Z9Tpu7hi9ycA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4540017E0342;
	Mon, 23 Jun 2025 14:01:58 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ulf.hansson@linaro.org,
	y.oudjana@protonmail.com,
	fshao@chromium.org,
	wenst@chromium.org,
	lihongbo22@huawei.com,
	mandyjh.liu@mediatek.com,
	mbrugger@suse.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v1 01/13] dt-bindings: power: mediatek: Document mediatek,bus-protection
Date: Mon, 23 Jun 2025 14:01:42 +0200
Message-ID: <20250623120154.109429-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623120154.109429-1-angelogioacchino.delregno@collabora.com>
References: <20250623120154.109429-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_050200_604122_D121C1F1 
X-CRM114-Status: GOOD (  10.22  )
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

Add a new mediatek,bus-protection property in the main power
controller node and deprecate the old mediatek,infracfg,
mediatek,infracfg-nao and mediatek,smi properties located in
the children.

This is done in order to both simplify the power controller
nodes and in preparation for adding support for new generation
SoCs like MT8196/MT6991 and other variants, which will need
to set protection on new busses.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../power/mediatek,power-controller.yaml      | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
index 9c7cc632abee..2530c873bb3c 100644
--- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
+++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
@@ -44,6 +44,18 @@ properties:
   '#size-cells':
     const: 0
 
+  mediatek,bus-protection:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      A number of phandles to external blocks to set and clear the required
+      bits to enable or disable bus protection, necessary to avoid any bus
+      faults while enabling or disabling a power domain.
+      For example, this may hold phandles to INFRACFG and SMI.
+    minItems: 1
+    maxItems: 3
+    items:
+      maxItems: 1
+
 patternProperties:
   "^power-domain@[0-9a-f]+$":
     $ref: "#/$defs/power-domain-node"
@@ -123,14 +135,17 @@ $defs:
       mediatek,infracfg:
         $ref: /schemas/types.yaml#/definitions/phandle
         description: phandle to the device containing the INFRACFG register range.
+        deprecated: true
 
       mediatek,infracfg-nao:
         $ref: /schemas/types.yaml#/definitions/phandle
         description: phandle to the device containing the INFRACFG-NAO register range.
+        deprecated: true
 
       mediatek,smi:
         $ref: /schemas/types.yaml#/definitions/phandle
         description: phandle to the device containing the SMI register range.
+        deprecated: true
 
     required:
       - reg
@@ -138,6 +153,31 @@ $defs:
 required:
   - compatible
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8183-power-controller
+    then:
+      properties:
+        mediatek,bus-protection:
+          minItems: 2
+          maxItems: 2
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8365-power-controller
+    then:
+      properties:
+        mediatek,bus-protection:
+          minItems: 3
+          maxItems: 3
+
 additionalProperties: false
 
 examples:
-- 
2.49.0


