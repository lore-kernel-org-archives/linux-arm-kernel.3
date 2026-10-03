Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD82CA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 20:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ujjA/EfqFrllDMkLjfG6+3nwCZQypQgUzS75H0VKhkU=; b=YKDCo5iVHpT1uWYithGyo/DM9T
	ZLtc3vy/N90L9l2PdssTgysbk4hEY5beqa5wLWyv12y/JNECQiHJHWB8gxxp9WgWHMVtZsaqwGRN/
	XdYdpRnorKfa22GSuXj56gC6OYmEyjdtem/8LNZ1Pw/26hsczZofWSNhDp21kf2GH+UvMF498sLzW
	8cjYOjTKJaw6I9eKpRPTWq8C0gD2Rgni3TXD4i76zn87fF59GYlzqxPSecuOS3FfVnoKSAsRmP3OK
	DGiZmheWxu19VVeyWy6uoJTwUpj7CUtlfkuvSbyZ6mEgmxFCsbfweeN/kJwG917DEoQ4/f1kAxmCY
	lr5Eb83g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD5vT-0000000Dyzf-0TUK;
	Sat, 03 Oct 2026 20:01:43 +0000
Received: from mail.nozomi.space ([139.162.184.125])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD5vN-0000000DyyN-31ss;
	Sat, 03 Oct 2026 20:01:41 +0000
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nozomi.space;
	s=mail; t=1791057695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ujjA/EfqFrllDMkLjfG6+3nwCZQypQgUzS75H0VKhkU=;
	b=s3y7zaA/vOa/6nJn9RV1/S648MlfyLxv6NYSbtwk56kRlvGiddXt6T4G8FGyk/cDSkwh3r
	3w70x96Kjew76d2ZtIsu6Zr6+zQdiASBIgvvRG5/F8EvxvhK1wzVHx0A4FQ90cPAms3P2h
	KZJCA0SFLK5aozVZ+TwtuDNKCBtrP3w2aNMLr9iWJjy3dL4v+Mh6qRocsMQLTqYnwFqxZi
	vxo/xeTgHZjOaBPPNaEFCI/9UeNBevdDVKBXe94vDT604KmuyR1V/jIsLH/1VLT44toa7c
	7xOEzQjFm1Tf6HR99gmDrS6izV+UxHRdTgYsZzuLZ3InJgD40n7BWHuf0i9QpQ==
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
Subject: [PATCH 1/3] dt-bindings: gpu: mali-bifrost: Add the MT8188 MFGCFG phandle
Date: Sat,  3 Oct 2026 22:01:30 +0200
Message-ID: <20261003200132.866240-2-michal@nozomi.space>
In-Reply-To: <20261003200132.866240-1-michal@nozomi.space>
References: <20261003200132.866240-1-michal@nozomi.space>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_130139_745523_F6202A4F 
X-CRM114-Status: GOOD (  10.19  )
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
MFG configuration block routes the SoC system timer to it, and the
setting is lost whenever the GPU power domain is turned off. The GPU
driver has to restore it on every power-up, so it needs a reference to
that block.

Add an optional mediatek,mfgcfg phandle. Allow it on MT8370 as well,
which shares the GPU and the MFG block with MT8188 and its GPU node in
mt8188.dtsi. It is optional so that existing devicetrees stay valid;
without it the timestamp counter reads zero, as before.

Signed-off-by: Michał Kopeć <michal@nozomi.space>
---
 .../bindings/gpu/arm,mali-bifrost.yaml          | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 9db9f84ad964b..08c1c22a270cb 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -122,6 +122,12 @@ properties:
   nvmem-cells:
     maxItems: 1
 
+  mediatek,mfgcfg:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the MFG configuration block, which routes the SoC system
+      timer to the GPU timestamp counter.
+
 required:
   - compatible
   - reg
@@ -226,6 +232,17 @@ allOf:
       required:
         - power-domains
         - power-domain-names
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              enum:
+                - mediatek,mt8188-mali
+                - mediatek,mt8370-mali
+    then:
+      properties:
+        mediatek,mfgcfg: false
   - if:
       properties:
         compatible:
-- 
2.55.0


