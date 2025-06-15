Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B51CC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Jun 2025 12:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PuEzzfIfWwzRJ/zNxyRZDGcoJnWQ6eEJg9eSNjAqfo0=; b=pd0oWF45bI18sm8rqPZM7IDmHA
	bcbY4v5yXZ/4Gpz4+5OtcUYytyX1WURsWAFchmaAVPliKfZzPnEu0Luz5ZoJ1B7ttY2xCPqX1FxWb
	K8mbeAeRPhx2uoRS6C4gkby4NPToAf3eG7nsrLmFq8O/BsZt+nTdTD/6EmCx5qL2Pn3boqhrGjhTx
	ild8YiK0AKDudt8Sca1H4n7P+WsPBpDqGMo9WIICIa9ySGe+E9Y1bSBUKK/iP8B63SRy9ypwfk34c
	YgEfssXkYnebmZFrTsS+7DOqCrR3VGBFgRLwvIPYAD4kOw5ySDq0eZf6A+OgCzvv5eAtGE37BqWNX
	ZJukhdww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQmgh-00000002Uiw-2dCz;
	Sun, 15 Jun 2025 12:42:15 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQmeT-00000002Ueo-2aHg;
	Sun, 15 Jun 2025 12:39:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Pu
	EzzfIfWwzRJ/zNxyRZDGcoJnWQ6eEJg9eSNjAqfo0=; b=B7Fh0gchsrav2ZLM62
	gpStOygzS84AztvKTh2HoZtAfe41g52/EK65LqP2GmoW0ljaYRTVPli3y4NBAsNO
	3WxTFc+M7Cv5u/aVYZgnEu1S7h+ZJgLSg0VWQ7d/cb0q9/rAdq9MAA0aO7Ql2bYL
	3ShaNhucLKduCTEguYhDdLAqQ=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3L54Dv05ovyaWIg--.33417S2;
	Sun, 15 Jun 2025 20:39:34 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: sboyd@kernel.org,
	zhangqing@rock-chips.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH] clk: rockchip: rk3568: Add PLL rate for 132MHz
Date: Sun, 15 Jun 2025 20:39:05 +0800
Message-ID: <20250615123922.661998-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3L54Dv05ovyaWIg--.33417S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZw17Aw13Ary5CF47Cry8Zrb_yoWDJrbEgF
	yUZr4fGw4Fqr95K3ZrJan7u3y0qwnFvFn5Ww10ya15Ga4qvF9YgF4fXw1kC34UJr42gFZ3
	KFy5JrykCrnxKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8xOz7UUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hJtXmhOtCzZuwAAsv
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_053958_023901_723A2694 
X-CRM114-Status: UNSURE (   7.04  )
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

From: Andy Yan <andy.yan@rock-chips.com>

Add PLL rate for 132 MHz to allow raydium-rm67200 panel with
1080x1920 resolution to run at 60 fps that driven by VPLL.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 drivers/clk/rockchip/clk-rk3568.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/rockchip/clk-rk3568.c b/drivers/clk/rockchip/clk-rk3568.c
index d48ab9d6c0646..97d279399ae84 100644
--- a/drivers/clk/rockchip/clk-rk3568.c
+++ b/drivers/clk/rockchip/clk-rk3568.c
@@ -79,6 +79,7 @@ static struct rockchip_pll_rate_table rk3568_pll_rates[] = {
 	RK3036_PLL_RATE(200000000, 1, 100, 3, 4, 1, 0),
 	RK3036_PLL_RATE(148500000, 1, 99, 4, 4, 1, 0),
 	RK3036_PLL_RATE(135000000, 2, 45, 4, 1, 1, 0),
+	RK3036_PLL_RATE(132000000, 1, 66, 6, 2, 1, 0),
 	RK3036_PLL_RATE(128000000, 1, 16, 3, 1, 1, 0),
 	RK3036_PLL_RATE(126400000, 1, 79, 5, 3, 1, 0),
 	RK3036_PLL_RATE(119000000, 3, 119, 4, 2, 1, 0),
-- 
2.43.0


