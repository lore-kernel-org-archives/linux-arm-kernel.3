Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE1EC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 18:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9URX2g2bLrhkgpjZmXJowFGtvU2zsLAihvZ4yWH4FH0=; b=rN5VFA5zB8lwhsrprl8sPVTkHD
	YRvkvrwTCrJ4BHOYYk1YCzzqW8FfTiwWR6fmHn3VTzOsiVy22wYXwPUTOj+jhrLJadOZEwCXfvgoQ
	UMnVFNlN2ec8CQ28wTAsAxafQKcVQANlNQM3KAgNpZCfKgu5LNrl+BFBmeNp2BqD6QHIybPokkrrx
	rEH09RpExqbU/ryq75dqmeJuu8ukM7mpH2INLDjUj6vw3++A/LZdFeGCLySMFNEfXZmcKtdQ7B+4p
	cbMdb6Am4V349UhwjwwnXPBzNMnQeKk6fxBBNL4qPu6ZXij38OE5l0L7gG6fAuzvod1cKT3A04sPv
	iLShaAiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD60c-00000001Xsx-25MT;
	Thu, 08 May 2025 18:30:14 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD5ye-00000001Xfn-29IB;
	Thu, 08 May 2025 18:28:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=9URX2g2bLrhkgpjZmXJowFGtvU2zsLAihvZ4yWH4FH0=; b=QpcOgrgtM1z4rr7pYPCegX05KV
	hrm8GBC1By1IIeARcq4yyi8+2teu4lr6v6pk09sunHGnvqRZl+Rjk5E3x2Wp8MUEpmEGt2ocuRxdx
	v18q47cMkFhnwwtCKu52PTsVtvPQ4HhvvFIKVLDF6YcZ9KEYWKQNyuB9bNaHBF90+zg12gU6nlpUq
	zFwQObMmdPPJgc/Ah9grzicDMKr15RxX+erpvjUPEDe+HrzZQV6MGjtu5W8xNzzNJSiEoV7Xr7Yhp
	lf5BN5RjeS+uGMIsiHxqR8bTdgWreVdrptxrjQI1xhx4JcdTQUb8EvMnn4IFxbr3vgw5ezPWtIcNF
	TC3Y65Cw==;
Received: from [61.8.144.177] (helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uD5yb-0000tP-PT; Thu, 08 May 2025 20:28:09 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nicolas.frattaroli@collabora.com
Subject: [PATCH 2/2] clk: rockchip: rename gate-grf clk file
Date: Thu,  8 May 2025 20:27:52 +0200
Message-ID: <20250508182752.1925313-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250508182752.1925313-1-heiko@sntech.de>
References: <20250508182752.1925313-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_112812_569236_ECD5EDA2 
X-CRM114-Status: GOOD (  10.68  )
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

All Rockchip clock types live in files starting with clk-foo, so rename
the newly added gate-grf-clock to follow that scheme.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/rockchip/Makefile                       | 2 +-
 drivers/clk/rockchip/{gate-grf.c => clk-gate-grf.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename drivers/clk/rockchip/{gate-grf.c => clk-gate-grf.c} (100%)

diff --git a/drivers/clk/rockchip/Makefile b/drivers/clk/rockchip/Makefile
index f0e0b2c6e876..c281a9738d9f 100644
--- a/drivers/clk/rockchip/Makefile
+++ b/drivers/clk/rockchip/Makefile
@@ -8,13 +8,13 @@ obj-$(CONFIG_COMMON_CLK_ROCKCHIP) += clk-rockchip.o
 clk-rockchip-y += clk.o
 clk-rockchip-y += clk-pll.o
 clk-rockchip-y += clk-cpu.o
+clk-rockchip-y += clk-gate-grf.o
 clk-rockchip-y += clk-half-divider.o
 clk-rockchip-y += clk-inverter.o
 clk-rockchip-y += clk-mmc-phase.o
 clk-rockchip-y += clk-muxgrf.o
 clk-rockchip-y += clk-ddr.o
 clk-rockchip-y += gate-link.o
-clk-rockchip-y += gate-grf.o
 clk-rockchip-$(CONFIG_RESET_CONTROLLER) += softrst.o
 
 obj-$(CONFIG_CLK_PX30)          += clk-px30.o
diff --git a/drivers/clk/rockchip/gate-grf.c b/drivers/clk/rockchip/clk-gate-grf.c
similarity index 100%
rename from drivers/clk/rockchip/gate-grf.c
rename to drivers/clk/rockchip/clk-gate-grf.c
-- 
2.47.2


