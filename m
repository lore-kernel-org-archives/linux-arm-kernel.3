Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C11FBC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 May 2025 20:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=34MJqkf/MBQYKv6xrK8XN0qAOR0duJ0rHYmPfngbh7c=; b=t8xPMmYjYUpi4VlHhjBdyLwEOb
	epZgx0C/lD9nNC4f2UHXzZF0xN6gofnMQxKLfliVLZm0xmzRjqKr5F+zLPqyRXWLDjG0fXki2XmTx
	ikfrTLiGkSCsQKcVj9rTRgufzTsi2K75RidRgEVjFav+6VqPxRLO/zn78tmHc2TDJ0QdWu2KLdc8E
	mkDQ0VPes1aDfxHisW7EUpqsprrm/VgAkpu6ximD3Ge1vUMT0ZN8tzUqh7dg3FMCFdcGlOpeWMe62
	WmE+XzMjR+M5Z5RBavSDZ7O7NEWwvt0yxEavIWy3vDD3uKibBQnWTZBzk80hV8DhsdjutViPUnl26
	IJ9gXPaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBJLp-00000004SdP-40nF;
	Sat, 03 May 2025 20:20:45 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBJGi-00000004SAJ-32dZ;
	Sat, 03 May 2025 20:15:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=34MJqkf/MBQYKv6xrK8XN0qAOR0duJ0rHYmPfngbh7c=; b=K6rLuwsdadtqWUhzyG6NiJeYTT
	e24OrcraKgE07kdnkScvcOBxqW05tuaFktsIVZwoby/fab4bvAA34iRWoRduslEZ/z1W9vlLfyMvu
	XzSbt5hMjFUHQ3fcdOCGLGhdHmPeURFxDhRh2hprGhp76NdaNgKua8ZXfKHRrkIplrTqXq1h2jNys
	KwMN/kHQvFKRyp1lpu4YXPwtvXnvEngKkl8qKqGL7d0jUoB5DME3IPNj0+8vy619QAjjhrpbEqc4G
	uYbPrHXhJzFM41WmeKv5uugogvqY44nt60vls3umup4hYvLfhWNGm8m1B8Osk1H0jYs5buU3OM7z+
	6Cgvv6lQ==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uBJGh-0001hY-Em; Sat, 03 May 2025 22:15:27 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: vkoul@kernel.org,
	kishon@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: phy: rockchip,inno-usb2phy: add rk3036 compatible
Date: Sat,  3 May 2025 22:15:10 +0200
Message-ID: <20250503201512.991277-2-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250503201512.991277-1-heiko@sntech.de>
References: <20250503201512.991277-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_131528_764302_68838BF3 
X-CRM114-Status: UNSURE (   9.96  )
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

Add compatible for the USB2 phy in the Rockchip RK3036 SoC.

Apart from some bits that got swapped around in the phy registers, the
block is nearly the same as the one on the rk3128.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 .../devicetree/bindings/phy/rockchip,inno-usb2phy.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
index 6a7ef556414c..7bcefe8c22d1 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     enum:
       - rockchip,px30-usb2phy
+      - rockchip,rk3036-usb2phy
       - rockchip,rk3128-usb2phy
       - rockchip,rk3228-usb2phy
       - rockchip,rk3308-usb2phy
@@ -184,6 +185,7 @@ allOf:
           contains:
             enum:
               - rockchip,px30-usb2phy
+              - rockchip,rk3036-usb2phy
               - rockchip,rk3128-usb2phy
               - rockchip,rk3228-usb2phy
               - rockchip,rk3308-usb2phy
-- 
2.47.2


