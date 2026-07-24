Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9464EC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 11:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TZG1jLJFfrGuyYIZbp9zg7IHzYdJ5nVY+HYiYc9Z034=; b=HDqLY0QVl+xtYK0vIQdLen5Z4b
	N3ofuC6ZNe5hUoWpLamDBzV0o/93MVxhueGqn7FRnY89pTdtpzRB1FO4gd4su0Gu5ykO0HmDMDIvZ
	wHS/vxh19na0NCCRGMLHHrUCbqX0+fifZyu7nLBAoLFUn86iwVH6DLodMGMC2fj5PuB/MTLE02YDt
	BB79k7aDwFgJxxsVulukKsaV2UiIjQGsfVk6Y9TMl06IUgpt71f6kjMFjmg3QQOR8lLVzoaV+Jdbx
	gCKVhRDhxpaaYB41eS8n5/+WyaiPigRVI3uS7xXItpXKsh4UJG3hY1n/niwE1RlgWh4J1k3gaXwHh
	rXS48ZDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnE6D-0000000GIIp-1MoS;
	Fri, 24 Jul 2026 11:29:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnE6C-0000000GIIF-060n;
	Fri, 24 Jul 2026 11:29:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6AC0F43FD7;
	Fri, 24 Jul 2026 11:29:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F3CF3C2BCB3;
	Fri, 24 Jul 2026 11:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784892591;
	bh=QCNui0KdBUBlrUWMOvfLZPo+juF8+67R6ju1Xq6ckwY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qMHwzkMyfHk9GVFuq1m4wW768y12QTwcZ7n6tv2WIJDODi6Vru3WaJbx0DKXFPJj0
	 NQ07XtAss5OsoaAAV7OwjTpy1U0S3O1OR9U2wLLhPTwTPUxJcQ6iJYLEtHuTaHdS9T
	 UvLNw3YLK+7bSa1ogD+nKoKIAYkrk93FOpXz6DGP4R9N1kWnUsT6/YKawVPGKXpCbE
	 yNJMB7OWA1mIEAFJDfrz6xL3BB2oHPeavHIPnJZ8q4JsuoQwp+oxmdiij1/Iu+Rkpj
	 bpoFCrKSQc+1NVXMqQlrC2sL4kUkFbmUIe/IoRsyEhtQaqgm5cx73+bLX5d6YNQ9/T
	 /HaQLXBg5F85w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD308C531C9;
	Fri, 24 Jul 2026 11:29:50 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Fri, 24 Jul 2026 14:07:06 +0300
Subject: [PATCH v2 1/3] dt-bindings: nvmem: mediatek: efuse: add mt6572
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-6572-nvmem-v2-1-e58d16a29621@protonmail.com>
References: <20260724-6572-nvmem-v2-0-e58d16a29621@protonmail.com>
In-Reply-To: <20260724-6572-nvmem-v2-0-e58d16a29621@protonmail.com>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Lala Lin <lala.lin@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784892588; l=1007;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=nuU2fNRtn+r/1kk0ZhaxODdhDU8esK5VbNO0Kcgpgoo=;
 b=L7tqSgdl8MY1vNgqq/ul9NO03Q0TCsUnTzMob6hp3Yy4Mx4UQUiDE/B3LwCI20vNjI1yVegg1
 /KKiTFFTEutBVk43yW+QBtzbo8gwO/LwZCq1UKhQnoRJ0/ze+uL8+R6
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Roman Vivchar <rva333@protonmail.com>

Add a compatible string for the mt6572 SoC efuse controller.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
index f9323b3ecfc8..e10947164941 100644
--- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
@@ -24,13 +24,16 @@ properties:
 
   compatible:
     oneOf:
+      - enum:
+          - mediatek,mt6572-efuse
+          - mediatek,mt8186-efuse
+
       - items:
           - enum:
               - mediatek,mt8188-efuse
               - mediatek,mt8189-efuse
               - mediatek,mt8196-efuse
           - const: mediatek,mt8186-efuse
-      - const: mediatek,mt8186-efuse
 
       - items:
           - enum:

-- 
2.54.0



