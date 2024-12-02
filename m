Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D27D4979C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 04:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hseVzBMDvBaWEboZzS5XheW5neKM457O4eIzeDIYSxY=; b=RGBoQTAdtFVUeF/Wc7KVFhPbBy
	5f5mk3N3zfoKyZmGt7HOpu+cYAF7wr5lLH6846mUpZZz8Ne6zWNy9KRHsNh27iBk3AxwdhyOL9aUK
	sxQvvmSkf1LigNLwDwRWOuRbeGGht9/3NkDgOdV/MA16fFRVb6+CCtW4oKOGb+Rx6i9hrl/3hbxdx
	WC1awWnfJqUo9Tl0ugyECql1KNXJXbVTUl3W3YNYGE2TsbB7S2y+CV6tsnln6oi6FmsJwpaqUeKr2
	/oXXFZB/da/Uwll8EX6Qbd4Q2NaoNaxwgdAYP4YUCfeZPwCqcolnU5CTxRQGg3/7FT2dRU2tGrGHW
	FoMB6MFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHyKh-000000054OY-34r7;
	Mon, 02 Dec 2024 04:46:51 +0000
Received: from thales.epochal.quest ([51.222.15.28])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHyHn-0000000545B-16Lr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 04:43:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=epochal.quest;
	s=default; t=1733114627;
	bh=Uc4cUQX10gCThUVCN/Dj7IXiMDW/TpvvOgV47ajb33Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PTMdjBRotFtICZaNdmndcnzbIhiLtpEWFvCC7jbPmvJBu34rFeJ8lxtPyMpGoTwA/
	 KN9RJx0iTOzonEYidXZ5miPIeg/rnDZLSTv6afBOryGnJ9kspdXqd2T4hDJib2lgcq
	 Br1E/GbjiW1KCPzUg0dHxiNULFq/lQ8l+cLEjF8GAMKKmOoEeKwXY8umAe8Ce2wWGC
	 NEX3ZEOJeL5RHHrsUYdGhQc5AZP/6sb8pDcIBLyOJ9a9p0NxdQPKLLAye5/QdbpnTu
	 Vrelprdp2ZdOEBjkFiNwhUVjvP7afLYmULpiWCGmCBhmEcG2+yr+zgfvlEZrIhMjvh
	 0L97VeDbd3Hzw==
X-Virus-Scanned: by epochal.quest
From: Cody Eksal <masterr3c0rd@epochal.quest>
Date: Mon, 02 Dec 2024 00:43:26 -0400
Subject: [PATCH 1/2] dt-bindings: sram: sunxi-sram: Add A100 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-a100-syscon-v1-1-86c6524f24d7@epochal.quest>
References: <20241202-a100-syscon-v1-0-86c6524f24d7@epochal.quest>
In-Reply-To: <20241202-a100-syscon-v1-0-86c6524f24d7@epochal.quest>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Parthiban Nallathambi <parthiban@linumiz.com>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Cody Eksal <masterr3c0rd@epochal.quest>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_204351_364634_41913B37 
X-CRM114-Status: UNSURE (   9.30  )
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

The Allwinner A100 has a system configuration block similar to that of
the A64 and H6. Add a compatible for it.

Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
---
 .../devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml  | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
index d9322704f3588e036280d08deaf59972f1dfeb7f..a7236f7db4ec34d44c4e2268f76281ef8ed83189 100644
--- a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
+++ b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
@@ -47,7 +47,9 @@ properties:
           - const: allwinner,sun8i-v3s-system-control
           - const: allwinner,sun8i-h3-system-control
       - items:
-          - const: allwinner,sun50i-h6-system-control
+          - enum:
+              - allwinner,sun50i-a100-system-control
+              - allwinner,sun50i-h6-system-control
           - const: allwinner,sun50i-a64-system-control
 
   reg:

-- 
2.47.1


