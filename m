Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B1AD5E39D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 15:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wg9Xf8V8em1zSRB5KPAJPFBdeTO21Kdvkx26K1bPMoE=; b=cfIQ/j9ceXk4TZYykIqUS+mFFy
	JMr7FXLVlSUPdw/wuKxIQsRiMXbdDwtXNJkfgih0uSTQRO6eNPl+LRgaru26J1U/d0lJ6mvkfdGom
	1qH/fgeh2xvAcZrMRhgpU2vXCVq0u4zck7rdQPxXlukZLuj9gG7EcTKpF7LZeJClF2JHgpU7AFXiy
	uamXXKC2wSdVwpc2tfT2w7u7C6a/w7fn0Ufa3TEVs7Ukcu4NXhqauuJClC7BZq0eylsAug9u5D2bb
	ZWbqISrimnPTBgmA76Op2ntjNjTjTTlgRSOrgE5qoNYx3rY1ZMQHif2uscnPAgWNkkn/hI2/FUb9E
	1nGHjSKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVWeB-00000005PYm-1yI5;
	Tue, 16 Dec 2025 15:07:31 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVWe8-00000005PXQ-387n;
	Tue, 16 Dec 2025 15:07:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id; bh=wg9Xf8V8em1zSRB
	5KPAJPFBdeTO21Kdvkx26K1bPMoE=; b=TytGPF1YqVKWl4BoIq5EE8XbYRAQ7LM
	ZOYiYT9hIFOq4ZeqQdQRn66lpVV2V6mmUGAKCOuJQT/bSB4bzbX+/GGRWPG8vxYd
	eTnrY0Dn5/jmRwjGk8TT7zvFL9R5n9Ta0NFrThm6kH4UCjOogKEYcBqxBWuFwHm+
	o52c5miM5uls=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgDnD+lkdUFpZsvsIQ--.30056S2;
	Tue, 16 Dec 2025 23:06:28 +0800 (CST)
From: Lizhe <sensor1010@163.com>
To: heiko@sntech.de,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org,
	Lizhe <sensor1010@163.com>
Subject: [PATCH 1/2] [PATCH net-next v2 1/2] net: stmmac: dwmac-rk: rename phy_power_on to avoid conflict
Date: Tue, 16 Dec 2025 07:06:11 -0800
Message-Id: <20251216150611.3616-1-sensor1010@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: PSgvCgDnD+lkdUFpZsvsIQ--.30056S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tFW5Xw4xCrWfXFyDurWrAFb_yoW8Xr47pa
	97AF9Fyw1kJryxGa12qFsrZa45Cw47try0gF1xZ34fuF13u34qqr10yrW0yF1UKrWkWF9I
	yF4UA3Z7C3W7CrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piG2NtUUUUU=
X-Originating-IP: [223.65.97.179]
X-CM-SenderInfo: 5vhq20jurqiii6rwjhhfrp/xtbC3RQl0GlBdXRpeQAA3F
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_070729_140640_3D103D13 
X-CRM114-Status: UNSURE (   9.16  )
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

Rename local function 'phy_power_on' to 'rk_phy_power_set' to avoid
conflict with PHY subsystem function. Keep original error handling.

Signed-off-by: Lizhe <sensor1010@163.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 0a95f54e725e..2f5a65c235aa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1498,7 +1498,7 @@ static int gmac_clk_enable(struct rk_priv_data *bsp_priv, bool enable)
 	return 0;
 }
 
-static int phy_power_on(struct rk_priv_data *bsp_priv, bool enable)
+static int rk_phy_power_set(struct rk_priv_data *bsp_priv, bool enable)
 {
 	struct regulator *ldo = bsp_priv->regulator;
 	struct device *dev = bsp_priv->dev;
@@ -1692,7 +1692,7 @@ static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
 		dev_err(dev, "NO interface defined!\n");
 	}
 
-	ret = phy_power_on(bsp_priv, true);
+	ret = rk_phy_power_set(bsp_priv, true);
 	if (ret) {
 		gmac_clk_enable(bsp_priv, false);
 		return ret;
@@ -1713,7 +1713,7 @@ static void rk_gmac_powerdown(struct rk_priv_data *gmac)
 
 	pm_runtime_put_sync(gmac->dev);
 
-	phy_power_on(gmac, false);
+	rk_phy_power_set(gmac, false);
 	gmac_clk_enable(gmac, false);
 }
 
-- 
2.17.1


