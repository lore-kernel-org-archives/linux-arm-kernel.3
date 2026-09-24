Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B375DC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 09:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C1L1QJ9ClrrXq97dcRnz+pEft41M3NcVr3EGCrMBZnk=; b=hWYgUdKSTEXTVvDny/JkLtqctq
	6lXwzplALNPrHhLqhYRDqI3ZiV7OTbRMhaLx/SlIaZ2l1ubY6tKb2/EMD6e9AjfR//gH43HT7L5GV
	AWmjHr9dnxzL2fB9enxzqxCwy2HrKrc4nIe9q0BVNk3iROAiJ1Ek9prpndgKAtWeqwejb7t3oXqbC
	faviaCn7BcMCcB0nZqeC5g+DWm+P8e1lS5qZ1A08yw9/qOKhrAe935vQS4FJVqSTFhz6VrX+sYCcC
	oBtwgx2qRlvkOF1eltODO+wwylVIb0wKXzptd44LO/TFRKnCK1LFmDUoRwSmeoEbJnyigHgt6j9L4
	nGZKgQxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fvB-0000000AbGY-1sO2;
	Thu, 24 Sep 2026 09:39:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fv9-0000000AbFW-3fi2;
	Thu, 24 Sep 2026 09:39:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E9AA743E11;
	Thu, 24 Sep 2026 09:39:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3F57C2BCF5;
	Thu, 24 Sep 2026 09:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790242754;
	bh=bT2W1UDZF4zdPaoV4uUSUjqsSdEIUuEZX91HiXXbM3U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=heZJ5oISsm99AdOvdPiYsZstT5Yc3rpzFpCmQhUcmPum1jmT1hfNx95XxQVLy/ATD
	 XzOmTBz0N5qNk3czuJ1PFUtMcxGGt1XMsdxg9i58LLtfS00nh74IjmaBdMb77aAzU9
	 GEQO/PV+UbeGFZvM+r3KKSuIziPhXJsCA9cuyGdGMXaGKQ83mB1inDcDg189XFRaOD
	 M2Gi6iHcxAzzUjJ6OPNiGcsl01NWYI9349Y/bSlbrVfoGbRsC/McSNv83u5o3oqlam
	 HI9vThN3B2nXSFDcevgr1RzZktbRxqmhYkEQv9IttsXP6UpFahOWTEQapFTRstqZJZ
	 h0Ku5zYDGTWZw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA380C98311;
	Thu, 24 Sep 2026 09:39:14 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Thu, 24 Sep 2026 12:38:30 +0300
Subject: [PATCH v3 1/3] dt-bindings: soc: mediatek: pwrap: add mt6572
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-6572-pwrap-v3-1-64769b6446ac@protonmail.com>
References: <20260924-6572-pwrap-v3-0-64769b6446ac@protonmail.com>
In-Reply-To: <20260924-6572-pwrap-v3-0-64769b6446ac@protonmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790242752; l=991;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=uNVyUZDV8R4iF2b6R4zcLD0vBmolhtFBIa0lDNJRWD4=;
 b=ftKlSyYqYUwhwaHAhRGBN11hEB23eQMqN7A1kzia/kjMRE6hb3OiWVgCC/d6sPjxSDM0ciaMo
 NNpAy1U0jB6A2Yb5KlDkCS16tkgWUftcpAvI7Ai31nkUpFNR9Wp1flX
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

Add a compatible string for the mt6572 SoC.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
index e7c4a3984c60..a3cf11153fba 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
@@ -31,6 +31,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt2701-pwrap
+              - mediatek,mt6572-pwrap
               - mediatek,mt6765-pwrap
               - mediatek,mt6779-pwrap
               - mediatek,mt6795-pwrap

-- 
2.55.0



