Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B848C5AD44
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 08:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D/3rwnUt4aX2Ul4iTK3VLZ31TeRrIefW+kZLdhrjNws=; b=kpd6p0A0CcUgfv+BcdU0h4mNOD
	dU0GTF2NELfwL647jA8Z0vcfPvcVRzaR7zpat2XVQfe4Lfks/kU0XJPPYS97F1cPzBD4KWKRRxE0K
	Xcl8KsR5z1+gF9fx02e46EPb0cCeSEKeV60AcygISza+3kYzUkLtYWt8JQLTRAvHQpLR8xSrjvpPr
	BjPZeWkYiLfYijdfdpcivZuSA1rlzrHjGxETbeXD8n0L3AfcpNLwQQs+2BRYNNAyQ6DOKJX4iuLvz
	VwKH+AIBSOgmxe2hwnPMaM/R6dbNXejfp/y2snDj4YWYwfiuBhsjZmllUb9cKTCOcIhu6awGh2lUU
	2sJci71Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsbz4-0000000990q-1e1a;
	Sat, 08 Aug 2026 08:00:46 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsbyy-000000098zF-47IX;
	Sat, 08 Aug 2026 08:00:45 +0000
Received: from Vostro-3710.. (unknown [14.220.232.127])
	by smtp.qiye.163.com (Hmail) with ESMTP id 494038e87;
	Sat, 8 Aug 2026 16:00:30 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: rockchip: Add Radxa E54C
Date: Sat,  8 Aug 2026 16:00:17 +0800
Message-Id: <20260808080018.1492239-2-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260808080018.1492239-1-amadeus@jmu.edu.cn>
References: <20260808080018.1492239-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9fe06346dc03a2kunm975b5a9f61262
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTUJCVh5JTExCQx8ZSB5PSVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVUpJTFlXWRYaDxIVHRRZQVlPS0hVSktIS0
	pMS1VKS0tVS1kG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_010041_189047_98F1CA99 
X-CRM114-Status: UNSURE (   7.49  )
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

The Radxa E54C is a high-performance network computer developed by Radxa
based on the RK3582 SoC. Add devicetree binding documentation for it.

Link: https://radxa.com/products/network-computer/e54c
Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 082df5fe2ff6..89696401e1e5 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1005,9 +1005,11 @@ properties:
           - const: radxa,e20c
           - const: rockchip,rk3528
 
-      - description: Radxa E52C
+      - description: Radxa E52C/E54C
         items:
-          - const: radxa,e52c
+          - enum:
+              - radxa,e52c
+              - radxa,e54c
           - const: rockchip,rk3582
           - const: rockchip,rk3588s
 
-- 
2.34.1


