Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85F7CA9EBD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 18:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A9TDMOuCORdDz/rW4tH87DC+y7wSf+XVxBuEz3/UlgI=; b=wjCchhXnFnJyudVCjcpWubW7fi
	ROhI2FBYJFdm25jn/1Ji1WbkmEO1da/4p0vDj60bHhZ4ZzroRR1LCgJprTixkaI60UXkHMDtOYQOK
	HFqFRImDG12k8PffH+CYoAZaJb6Cg/+si5B3LX3UBbp6qLTkwkg06we2cpeztjyB4J60sY7sOCnC5
	GJlXvmtAN1kwWUQkE/Ga+n+khIz4IT+fVV0MTj3msFgx8ntTLSkRkwV2Q9UNo0ELiBDIWoKliAA9q
	Zt3qEtltNomvIokQ0rnZnCdd/YOVlpaFYs7us8iBRwKgDNd0pP6s7Gu36qTc6/avQnN/I6UKshBnn
	xS6VP4fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFyac-00000009JNC-2r5u;
	Sun, 11 Oct 2026 18:48:06 +0000
Received: from mail.nozomi.space ([139.162.184.125])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFyaY-00000009JKi-0cfL;
	Sun, 11 Oct 2026 18:48:03 +0000
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nozomi.space;
	s=mail; t=1791744480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A9TDMOuCORdDz/rW4tH87DC+y7wSf+XVxBuEz3/UlgI=;
	b=YI5GJFe0WDeMYMyXwMbiD7mLRwAiVcZSPhz+ohu37TL7yz/1To3MiQf4NyLKrxeHJ/XhwV
	coztSffJmDjlXgdJDA+Tcz3a+0nyh5WVW6ruCJXsay5Qp0wA+KUD7w/WG5iE6nNiRoYpA0
	AVxVAZ+3DmjaGTKFCb4IA7Ud4W/tlSdnCXdbGhoiyJMjdJ0cfgQVE50CarcBhVcSi+UOyD
	M/wBcUyG/Z7l7FnKLxcB54sTCDuzbUNhxm23hfLl8pW3AtwqZw3b03/fHkW0UHRtfVDF7M
	hqli1S5Y2Z19iM7jl+ho2GCb5kgroWfdRA9J21fLsABLUe+RzR3OrwxMYgFJAA==
To: ulfh@kernel.org,
	angelogioacchino.delregno@collabora.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
Subject: [PATCH v2 1/4] dt-bindings: power: mediatek: Add the MT8188 access controllers
Date: Sun, 11 Oct 2026 20:47:52 +0200
Message-ID: <20261011184755.2058017-2-michal@nozomi.space>
In-Reply-To: <20261011184755.2058017-1-michal@nozomi.space>
References: <20261011184755.2058017-1-michal@nozomi.space>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_114802_328999_4EC40665 
X-CRM114-Status: GOOD (  10.54  )
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

On MT8188 the GPU timestamp counter only counts once a register in the
MFGCFG block feeds it the SoC system timer. MFGCFG loses that setting
whenever the MFG1 power domain is turned off, so the power controller
has to restore it after powering the domain on, and needs access to
MFGCFG for that.

Describe the blocks that the MT8188 power controller accesses,
INFRACFG_AO for bus protection and MFGCFG, and extend the description
of access-controllers to cover blocks with settings to restore.

Signed-off-by: Michał Kopeć <michal@nozomi.space>
---
 .../power/mediatek,power-controller.yaml         | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
index d03e4a9251635..8d96cde7c1a51 100644
--- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
+++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
@@ -54,7 +54,8 @@ properties:
     description:
       A number of phandles to external blocks to set and clear the required
       bits to enable or disable bus protection, necessary to avoid any bus
-      faults while enabling or disabling a power domain.
+      faults while enabling or disabling a power domain, or to restore
+      settings that a block loses when its power domain is turned off.
       For example, this may hold phandles to INFRACFG and SMI.
     minItems: 1
     maxItems: 6
@@ -188,6 +189,19 @@ allOf:
           minItems: 2
           maxItems: 2
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8188-power-controller
+    then:
+      properties:
+        access-controllers:
+          items:
+            - description: handle to INFRACFG_AO register block
+            - description: handle to MFGCFG register block
+
   - if:
       properties:
         compatible:
-- 
2.56.0


