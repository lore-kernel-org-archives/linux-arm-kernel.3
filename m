Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4851C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 13:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fkwdOn5n0SYL4gFgl3/rMnyEKOjKxd4O0ZvjvmC/+0A=; b=z/B75qzxC8VPRPcUOuF6mi9LrY
	h2NhvdPYtNqpM9/vNZhZuR/4jJMqetRMMbhqS4lJw9lKX0RpIBSMJlIj/a6+eMMFpxhNeNK6atsQB
	srCgP9j731BK4X3oJGRmIF16DIu+7pe2qzLRa708uUz2tf31jxab4di4gqvgjukW3FqP5MxtygfhA
	O6gIaqNODDoDAfvIzWejNu3Upt5GQwTbN7F0+Acrlp3L8uLYbDcMJAL8tlc8g6zoQqqp9PVE7g19L
	PAagI6E4zqcOmukKzgqOrAe8OppdzI5zsGFkSaQwbqjZHS4hjjRsqX4EzN38wekOqLJX6SyQpVyD7
	64pIcoBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFBzf-0000000FBTn-2iqJ;
	Wed, 14 May 2025 13:17:55 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFAvL-0000000Ez0V-2cCQ;
	Wed, 14 May 2025 12:09:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=fkwdOn5n0SYL4gFgl3/rMnyEKOjKxd4O0ZvjvmC/+0A=; b=W/6iWRlEDZg0ZCsT/zRUqahD40
	sYYWgIMslpFKa23oTi5EvGh3+b5lowPRjCJ4CXnGpkcztNSqiJcCZPB9kC9jAmxcvOmJLMeHOqTRt
	JBe643nFcNooeQVgW53xos19Y7/V9ZrO33uiZ4uZkxttyxf/CPuPcf91V5zr27FDec+kXwuExT7gP
	oaMYMvaVJhaZ0/mLugY7LQi4v9L4Kq8z8G3Tb+FRq7PbHsYhhYlP+Uuf183GHK3p2GI+bOhmHXEOc
	FV4ceqIbUrudx1hz6V2Uibk8vLPk686X9Djk6qXGjJToDNGxfS5BMa63VRbC3tEqXfWS0ptULRYTd
	m+Hurzrg==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uFAvK-0005f9-Bs; Wed, 14 May 2025 14:09:22 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: quentin.schulz@cherry.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 5/6] dt-bindings: arm: rockchip: add PX30-PP1516 boards from Theobroma Systems
Date: Wed, 14 May 2025 14:09:05 +0200
Message-ID: <20250514120906.2412588-6-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250514120906.2412588-1-heiko@sntech.de>
References: <20250514120906.2412588-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_050923_683015_CF448146 
X-CRM114-Status: GOOD (  10.13  )
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

PP1516 are Touchscreen devices built around the PX30 SoC and companion
devices to PX30-Cobra, again with multiple display options.

The devices feature an EMMC, OTG port and a 720x1280 display with a
touchscreen and camera

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 6435c724e682..58af37b4d6b8 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1119,6 +1119,14 @@ properties:
           - const: tsd,px30-cobra
           - const: rockchip,px30
 
+      - description: Theobroma Systems PX30-PP1516
+        items:
+          - enum:
+              - tsd,px30-pp1516-ltk050h3146w-a2
+              - tsd,px30-pp1516-ltk050h3148w
+          - const: tsd,px30-pp1516
+          - const: rockchip,px30
+
       - description: Theobroma Systems PX30-uQ7 with Haikou baseboard
         items:
           - const: tsd,px30-ringneck-haikou
-- 
2.47.2


