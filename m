Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F56CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 13:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9wegTyAMOcDYwLzVJ3tnWNwI9xtQpPRDlLX3DySsiJw=; b=PihAYLhUtuGFHFd9tkuNMEhoV/
	HEqhrXc/eawpRSevZMxTlpi5Ka2I6V/C9X9aHv01/V2hYwy6+u0a9SpDntnXpxe6UvwNKYA4vtwsQ
	spweDNnTcYcvB2l+M/oa9MyGCre58cuv/oJ04t0ZaBNNiYNUh331xzH3VNquiRplkRbAYyrnz22Tg
	1VsyW/cpkSARpBApOQNaPmGMmuCf7gjpq3l8P7W2Dkcc4hWQOFQiT4KrfHhrrjnyYgkubwGrY0YgG
	9M12BiSdE0fNhha1kPlHvVFJKhK9iYOJRVqWPBQvveVQVj2GPLvPxDyv/SKiuzhafIlB7/sHp5WCs
	vywBR4Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo07J-00000007adS-1k2Z;
	Mon, 18 Aug 2025 13:41:41 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unwfA-000000076zQ-4BM0;
	Mon, 18 Aug 2025 10:00:27 +0000
Received: from localhost.localdomain (unknown [119.122.213.154])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1fbaa9d00;
	Mon, 18 Aug 2025 18:00:17 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Chukun Pan <amadeus@jmu.edu.cn>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/4] dt-bindings: arm: rockchip: Add HINLINK H66K / H68K
Date: Mon, 18 Aug 2025 18:00:07 +0800
Message-Id: <20250818100009.170202-3-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250818100009.170202-1-amadeus@jmu.edu.cn>
References: <20250818100009.170202-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a98bc9f5efc03a2kunm3d9619f636a240
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZHkIeVktCGkMdGkkdHUxKSFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKSFVKTk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE5VSktLVU
	pCS0tZBg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_030026_327873_6253CADB 
X-CRM114-Status: UNSURE (   6.96  )
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

The HINLINK H66K/H68K are 2.5GbE SBC based on the RK3568 SoC.
Add devicetree binding documentation for them.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 28db6bd6aa5b..870c318fc8d4 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -683,6 +683,13 @@ properties:
           - const: hardkernel,odroid-m2
           - const: rockchip,rk3588s
 
+      - description: HINLINK H66K / H68K
+        items:
+          - enum:
+              - hinlink,h66k
+              - hinlink,h68k
+          - const: rockchip,rk3568
+
       - description: Hugsun X99 TV Box
         items:
           - const: hugsun,x99
-- 
2.25.1


