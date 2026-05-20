Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E807CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 10:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MnYP6f73aGtbiA5CWu55cNzYgg2OOTJQnEwonxCOQ5o=; b=D2AxJ/Cw3IDYrFqF73FjSaJ47U
	4MI5bVmoSfiw8PlAWj7W7YO2+Eft9FroluR/3LxliBMDxdRlQLS49EMYhP7cUU+KOZX2ll9b7zQKA
	kSiR8NxG8bt+JbhZzzykSAdABbjoNm274NjACpV+PhQGH6g71YVrMP1kdULMSvc6ioy9JGzFudNtX
	LkbC1+Jwh1PnB0vCvTJ824jYBsoPku2/XrxG3OheL14lMrUS74fDuaONstn9xguYi90liL7r3MQoA
	ak5kAexsu6K4cjQrd360T7KzVCDjxjod5cUzepeAfq1O2pX+6J0ZSXAFOqZuEwA/HcXDVBofl6Ipx
	m1qSN2Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPeB9-00000004KaF-1s3Y;
	Wed, 20 May 2026 10:29:31 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPeB6-00000004KZ0-2boN;
	Wed, 20 May 2026 10:29:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=MnYP6f73aGtbiA5CWu55cNzYgg2OOTJQnEwonxCOQ5o=; b=q0+ZGyqN/RFw7NNHegiXvuzzTL
	qfnKHMjBwldMq1AMH5zE7YT3Oo2GluM9Kqj/jZ36OPlp9FFOYq4+W8vFmdBr4TIquSwtZsHlAc/Gw
	qjFa97uj0P3f3FNetI6gcYxxRlZtWZ7sOP+wtrWbXfK4UhTdMJt+AVnls1NR4MExjxk6vpqjM6MbA
	hbA6zPcI/HHo1uBn0ybcGO0g6n1aNtCXdvO+wSMi/iKJBl8Ar3cb9bK59chrdJgc6uX8brdMG/WBm
	+loQO9t5SGKFtHOrsha64RKG81xvE4jZTGNMkI8stCRbRQYkf6ds5mBIjv3vHMn7MAmzbxZoQwZWn
	6A/TfVvA==;
From: Heiko Stuebner <heiko@sntech.de>
To: vkoul@kernel.org
Cc: neil.armstrong@linaro.org,
	heiko@sntech.de,
	jonas@kwiboo.se,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] phy: rockchip: inno-usb2: Add missing clkout_ctl_phy kerneldoc
Date: Wed, 20 May 2026 12:28:59 +0200
Message-ID: <20260520102859.1357411-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_032928_723107_BE3EC943 
X-CRM114-Status: GOOD (  10.94  )
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

Add the missing documentation for the newly added clkout_ctl_phy field.

Fixes: 2775541de058 ("phy: rockchip: inno-usb2: Add clkout_ctl_phy support")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202605150315.MyBNQOPB-lkp@intel.com/
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index 133cfd6624e8..7d8a533f24ae 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -170,7 +170,8 @@ struct rockchip_usb2phy_port_cfg {
  * @reg: the address offset of grf for usb-phy config.
  * @num_ports: specify how many ports that the phy has.
  * @phy_tuning: phy default parameters tuning.
- * @clkout_ctl: keep on/turn off output clk of phy.
+ * @clkout_ctl: register to enable output clk of phy, when set in GRF
+ * @clkout_ctl_phy: register to enable output clk of phy, when set inside phy
  * @port_cfgs: usb-phy port configurations.
  * @chg_det: charger detection registers.
  */
-- 
2.47.3


