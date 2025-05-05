Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4616DC3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 00:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DgzHiXqVCPvkjv01gr/QTbzunxVFAhzGRMzU+v6oQyk=; b=FCRIo6WacN5P5VW/DzkwSbgszV
	JQW1WOBb1tFvS1yP7k1hUF8Tee68YA03VYa6iXh8d8paE60YRVVt/LYBXd69TT7yjSCloT0MA2bJP
	RBzziW05eeHLZ3jYoXTvu8neaibfgr/15bw5CK+JmDOutJEWmoETAUzCI35aJh4p5bvQIqBNUekzz
	QzER9eOUtEld7I4K9ASspoysVvsLmzjvrebgwKxQ4YjArBeQho5RcBjvuHgRTLDpiYp5wU1Q56szN
	3f4HYrmqxD9ETRpTJzHeN1XJX5Z5CScRTRHfXpLMiYQrQEkMj/GMWIrbO9AhrvU7tzIlq0Hh92KCm
	f1mOi7oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC61t-00000009FgW-0xMA;
	Tue, 06 May 2025 00:19:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4Lt-00000008mqE-2s3r;
	Mon, 05 May 2025 22:31:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 02F9B5C5523;
	Mon,  5 May 2025 22:29:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC534C4CEEF;
	Mon,  5 May 2025 22:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484316;
	bh=RJzjm2jlMUB/SBLIUQp0a59U9HrB8VfoOl2O1qsQVxw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YegHN7jeXMIZqecNqCrivsJDs/1cIdvz88SUTdgrXCDqmfL3mHLzlqLp35CnVc8Fb
	 /fzvAC1rIl89Fd7YAdxmOFvICkIOx3/134ZX8VF0WopIN9Kt82/RKrljtc3w+Cu2xB
	 vRUII7hnltIM2BDDwRFEFhaVBO7T3MZh05uGQT7gBXSzRiirXj5iIv/wx77+eDhaG9
	 pss6RocPnwOPaP5ecQkRcBNxjBRbD0hgZm6r14psga34JFcpgtUoiwyjpvLrw962iK
	 OgR5p4CeyMCDU4t3nagkpNK2ky/gG57aet+ZpDQHqe5h2nwKx9YqQARPAKI5SXSkSr
	 WfCgFg96cXiTg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Damon Ding <damon.ding@rock-chips.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	kishon@kernel.org,
	heiko@sntech.de,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 450/642] phy: phy-rockchip-samsung-hdptx: Swap the definitions of LCPLL_REF and ROPLL_REF
Date: Mon,  5 May 2025 18:11:06 -0400
Message-Id: <20250505221419.2672473-450-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_153157_765926_E5B150D7 
X-CRM114-Status: UNSURE (   9.89  )
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

From: Damon Ding <damon.ding@rock-chips.com>

[ Upstream commit 2947c8065e9efdd3b6434d2817dc8896234a3fc0 ]

According to the datasheet, setting the dig_clk_sel bit of CMN_REG(0097)
to 1'b1 selects LCPLL as the reference clock, while setting it to 1'b0
selects the ROPLL.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Link: https://lore.kernel.org/r/20250205105157.580060-2-damon.ding@rock-chips.com
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 2fb4f297fda3d..920abf6fa9bdd 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -94,8 +94,8 @@
 #define LCPLL_ALONE_MODE		BIT(1)
 /* CMN_REG(0097) */
 #define DIG_CLK_SEL			BIT(1)
-#define ROPLL_REF			BIT(1)
-#define LCPLL_REF			0
+#define LCPLL_REF			BIT(1)
+#define ROPLL_REF			0
 /* CMN_REG(0099) */
 #define CMN_ROPLL_ALONE_MODE		BIT(2)
 #define ROPLL_ALONE_MODE		BIT(2)
-- 
2.39.5


