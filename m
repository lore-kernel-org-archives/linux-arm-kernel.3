Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A08CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 10:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CRRV31QqPTF80b++Fiu86Z0iZwozvGJzuTNZJ6U5Evc=; b=Ot70KfLFEt1lBXTilvLiJYJWqH
	r+8TVSL2Lx76UJyjTz1D+PcNoxeFWwZvMPk4wc+Xjhobph9MWrbQepYDA697GYqJYdHRGijuTxUqK
	Vr9Cfx44uhSmCW51M6LxaOjCCtLlqTvC7qlSQJUAkAmIc4EnSmn4NeJq/lCxxeFRyGeHYcehDIcQ0
	+OvaBj/9PpoM+dQXep9U9ggafGILJYYnG6dIUX/823ulX2uBIHMLkmoVYrouYIFCruvSGwVtZFSzJ
	1C55j6E4JzY4QmmekyGpbY1qrcT7FkH66vIewDdtXrokW5PVT2m2uFe5u+VUxE1tqbMP/VeB+os2/
	J7zVxsXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXFjY-00000007KOW-19Cs;
	Wed, 10 Jun 2026 10:00:28 +0000
Received: from mail-m25494.xmail.ntesmail.com ([103.129.254.94])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXFjT-00000007KKh-2GI9;
	Wed, 10 Jun 2026 10:00:27 +0000
Received: from Vostro-3710.. (unknown [113.80.141.92])
	by smtp.qiye.163.com (Hmail) with ESMTP id 41d5b4a7a;
	Wed, 10 Jun 2026 18:00:16 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add HINLINK H28K
Date: Wed, 10 Jun 2026 18:00:05 +0800
Message-Id: <20260610100006.366963-2-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260610100006.366963-1-amadeus@jmu.edu.cn>
References: <20260610100006.366963-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9eb0f9b8dd03a2kunmd062ac7916b4dd
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZGENDVkJITx9LHxgdSh8YGVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkhVQ0tVSk9KVUJJWVdZFhoPEhUdFFlBWU9LSFVKS0hLSk
	xLVUpLS1VLWQY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_030023_790519_3B77F8FA 
X-CRM114-Status: UNSURE (   7.28  )
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

The HINLINK H28K (also known as LinkStar H28K) is a dual-gigabit SBC
based on the RK3528 SoC. Add devicetree binding documentation for it.

Link: https://wiki.seeedstudio.com/H28K_Datasheet/
Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d..3952987a2c3c 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -724,6 +724,11 @@ properties:
           - const: hardkernel,odroid-m2
           - const: rockchip,rk3588s
 
+      - description: HINLINK H28K
+        items:
+          - const: hinlink,h28k
+          - const: rockchip,rk3528
+
       - description: HINLINK H66K / H68K
         items:
           - enum:
-- 
2.34.1


