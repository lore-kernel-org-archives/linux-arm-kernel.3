Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64AD6CCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 11:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c9r5W/KsY8w9shEEuLt5rFhhVh41VepTKr0R2XZHIdI=; b=lM5so4u/RdcA1U5Nna1uuZ0AMW
	gL870X4dOyjGGvT+yWdRoFvsOAySnv7yuZjgm5vxTyKG32TEhvezN0YbWBRjKRVSmmzyKMld1EA+4
	wh1Gfhjjvl2XM4i56b6Y6LQW2Oteesb+8ivYDbDdDeAb407roEsrxxtr2lP2OQ5o23yK4G/QBbOrZ
	CNpMmPO+XZKirVx/ZKTlQOPqSKBPe8FkbUQq3OcJIlcIW5cPO/CY7x1EpPA71e+loNZrCvdOtts/H
	nBza9uxP7UISvbxhpH1qP9qcayTJWCO4ZuIqSfwkzejcIgINbJGoFCdqufPQ12aXBIAZ69Zsvt7I5
	Kt5rG2Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBtFK-0000000623j-0qim;
	Thu, 23 Oct 2025 11:12:45 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBtF5-000000061pc-1KTx;
	Thu, 23 Oct 2025 11:12:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=c9r5W/KsY8w9shEEuLt5rFhhVh41VepTKr0R2XZHIdI=; b=yMN8qMWmkQEZsxHY/Xto3vO3ak
	Y2TqtbuNvwJJFlhGLdzZh8XDs632pmECzFWzU7EZYK51xA458czcBc77jkEU++NyW2s6e0oO3PFRQ
	SK71D9+GdIOLqfEeYqbVewI6tN9RGg1l+3abcDLGxkKovp2sPnv+2Xi06S8LKYtTsC1bLfdfj46ni
	FFEnHP25nZ1xo36MjebGAlWb6L8ucGn7MqoB7c/Fsg+bDriA0BwMTjGvyaV1suDkjRGncOBuwB/2S
	6qmg02jVMDIMnqYCfnll/Ihm9G0Hy4jEBGnmUQwYf2A0ysY7eX0el5B8pd2iNn/tE/+N2VU55TMCM
	PCBPdSrA==;
Received: from i53875a07.versanet.de ([83.135.90.7] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vBtEz-0002w5-Ek; Thu, 23 Oct 2025 13:12:21 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jonas@kwiboo.se
Subject: [PATCH v2 5/5] MAINTAINERS: add dwmac-rk glue driver to the main Rockchip entry
Date: Thu, 23 Oct 2025 13:12:12 +0200
Message-ID: <20251023111213.298860-6-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251023111213.298860-1-heiko@sntech.de>
References: <20251023111213.298860-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_041227_383098_CD43C889 
X-CRM114-Status: GOOD (  10.87  )
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

The dwmac-rk glue driver is currently not caught by the general maintainer
entry for Rockchip SoCs, so add it explicitly, similar to the i2c driver.

The binding document in net/rockchip-dwmac.yaml already gets caught by
the wildcard match.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 545a4776795e..5b9c056b47cd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3296,6 +3296,7 @@ F:	drivers/*/*/*rockchip*
 F:	drivers/*/*rockchip*
 F:	drivers/clk/rockchip/
 F:	drivers/i2c/busses/i2c-rk3x.c
+F:	drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
 F:	sound/soc/rockchip/
 N:	rockchip
 
-- 
2.47.2


