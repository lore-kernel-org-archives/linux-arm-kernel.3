Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE2ED7237F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 12:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kA6UWnSApNuXEqPHoMKu9WTrSs0y5Kcyf2773WqKu/M=; b=11fOT3paUPjvpXL+uMXsZL8bBJ
	4CTD7GrRmMSSW3IzaBQcKqIbq1IstZJAIpxSaumlfkRwEi5PblGnsM65IlZysdwcOOR0Vf2vLFGVo
	g+XKS2Ale77q/WZJlWOruBUXXIOeGhoTPUcW0Lbp2ZPaHQxrtnsRpvCvVrrY9M04vryNkeR472W/c
	vDiO5HaUJHpbnbli37bS3I2Bnh5XMgATs44Uhxb+lTWIvkrmVM0S7zibyXKfNx+X8wtmCDUAoAMt5
	ojkI/BqFFQybnPONH4hD1evJLIo414FsPkpRh7i+J4m1mXR7UtjQxTrJziy9MD/QzKkW02zXqJLbh
	cDc+9dhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjGDQ-00000008u16-0rac;
	Fri, 23 Jan 2026 12:24:40 +0000
Received: from mail-m21470.qiye.163.com ([117.135.214.70])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjGDM-00000008twR-0Pz1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 12:24:37 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 31c0b4b12;
	Fri, 23 Jan 2026 20:24:30 +0800 (GMT+08:00)
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Wei Xu <xuwei5@hisilicon.com>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH v2 3/3] mmc: dw_mmc: Remove mshc alias support
Date: Fri, 23 Jan 2026 20:24:09 +0800
Message-Id: <1769171049-74327-4-git-send-email-shawn.lin@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1769171049-74327-1-git-send-email-shawn.lin@rock-chips.com>
References: <1769171049-74327-1-git-send-email-shawn.lin@rock-chips.com>
X-HM-Tid: 0a9bead02d3009cckunm9fc1f74e1df715
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQh5PGlZIH0lLSE9KHkJDSUpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=J4HIcYoFyiE5ZXAU1Qi1RcA3nJDEOy7gNMOkIydFCkx1o5QCxEl8XHs4Rguu0BPlw6raPCAe4/H/ifS6N7OMYM/3bNw9lG3jJOWh6c8wBfrad04lLyRXWSjDerfyvbGTiITWX/4Ok9Zsm/r+AbY8mVzl4mH/+tQi/oxDO14Mhz4=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=kA6UWnSApNuXEqPHoMKu9WTrSs0y5Kcyf2773WqKu/M=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_042436_419587_9F5434BF 
X-CRM114-Status: GOOD (  13.02  )
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

Remove the long-deprecated mshc alias support, as the mmc core already
provides alias functionality through the standard mmc alias. This eliminates
the redundant dual-alias system. The driver now obtains the controller ID
from struct mmc_host::index(supplied by mmc alias) instead of the legacy mshc
alias.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

Changes in v2: None

 drivers/mmc/host/dw_mmc.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
index a328a36..8cbaa9e 100644
--- a/drivers/mmc/host/dw_mmc.c
+++ b/drivers/mmc/host/dw_mmc.c
@@ -2846,13 +2846,10 @@ static int dw_mci_init_host_caps(struct dw_mci *host)
 	if (drv_data)
 		mmc->caps |= drv_data->common_caps;
 
-	if (host->dev->of_node) {
-		ctrl_id = of_alias_get_id(host->dev->of_node, "mshc");
-		if (ctrl_id < 0)
-			ctrl_id = 0;
-	} else {
+	if (host->dev->of_node)
+		ctrl_id = mmc->index;
+	else
 		ctrl_id = to_platform_device(host->dev)->id;
-	}
 
 	if (drv_data && drv_data->caps) {
 		if (ctrl_id >= drv_data->num_caps) {
-- 
2.7.4


