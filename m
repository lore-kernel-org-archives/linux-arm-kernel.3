Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC05C71130
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 17:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v4TLQmAGOcWD0y8Mnt5eC5Fpk/ELMiMig19bQQmdhOg=; b=vxA/r6DNM4bW/2BCn3/UxTOkw9
	kgNwtJ93DfBS3Nt2L+ELvtMecvkWMgVBhaUohwfr5lg80PkIiv63PnAVHxxWNKY54A2a0bOQeqJ+b
	Cf1e/t1B1NosW6Nj0C56gcSjtSQXjbEIDXQx8veih9ERsUVdOWyd1fjuX20q8lJzFJyAZi2vZOw7d
	AB2RHL+5Iw3gy9Hoq/lXoA7OfHE2DAx17Uz9ZjNAKwPqFwEueAKDbin7e2fvDZb1Gp5sgKvB7dF3O
	NBOgHUbcZ4Y/oTrEYY2eR+zD3HPIgNXdXmxHMIKfCZ+wWmqItZwGK9srRcNFf8CbwpNgNDCge2FTV
	5T68JsjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYpkn-00000003BWT-0znA;
	Mon, 07 Jul 2025 17:35:45 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYp2N-000000033ze-0H5r;
	Mon, 07 Jul 2025 16:49:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=v4TLQmAGOcWD0y8Mnt5eC5Fpk/ELMiMig19bQQmdhOg=; b=j1FbE116GrdVoQK9ijrfRr8Hhx
	TKwzoBePZ7MsI/oHcKP5Cogld+t1KdRxusbn1hDlul5ZDEqw1WXz/dKOWKFwMq6fuGmURKHIYpwI6
	+k/xPiFDjgAE/5cedxZbeskedf3TXPbmX2GVW5nlLekqnESEMRxzQ1IXjXNCeZp6r3pXHZtw8NhAD
	kGrmjsG2uq9QxSjTCW+FSDeGYGqoya5bEPu7yCHelco4DfzNz3hpn/TC9QIOUNbr9lvrOzqWXZfT7
	wsRHwLxwbF/127nqi0xlgGT07+j2Jp5cAKlX5SDXdk9iZ9LMZUKqrGxAaZkUraoCJwKddFVrxBd7i
	sRSAtywA==;
Received: from i53875bf5.versanet.de ([83.135.91.245] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uYp1u-0004yl-N8; Mon, 07 Jul 2025 18:49:22 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: neil.armstrong@linaro.org,
	quic_jesszhan@quicinc.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	andyshrk@163.com,
	nicolas.frattaroli@collabora.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 08/13] dt-bindings: display: rockchip: Add rk3576 to RK3588 DW DSI2 controller schema
Date: Mon,  7 Jul 2025 18:49:01 +0200
Message-ID: <20250707164906.1445288-9-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250707164906.1445288-1-heiko@sntech.de>
References: <20250707164906.1445288-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_094951_155360_FA2EE44D 
X-CRM114-Status: GOOD (  10.30  )
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

The rk3576 controller is based on the same newer Synopsis IP as the one
found in the rk3588.

Its external setting bits in the GRF are different though, so it needs
its own distinct compatible.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 .../bindings/display/rockchip/rockchip,rk3588-mipi-dsi2.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-mipi-dsi2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-mipi-dsi2.yaml
index 53384e47b507..75cd1c13fa52 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-mipi-dsi2.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-mipi-dsi2.yaml
@@ -12,6 +12,7 @@ maintainers:
 properties:
   compatible:
     enum:
+      - rockchip,rk3576-mipi-dsi2
       - rockchip,rk3588-mipi-dsi2
 
   reg:
-- 
2.47.2


