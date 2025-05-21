Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26375C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 08:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Mime-Version:Message-ID:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4WnVjYuC1WHRhIny3Oa0eb0x9K0KK1Hy3LLsTKmO6J8=; b=FyPcI4GkcTQFrxSOzwqDKRALUI
	8Yh4NCvVxPynP7QCIck7c+w2O/4Xg/+/BDQJIOVbbT5AsDlQmXJtkyztBMmo84nWHwL+ObVEwqstl
	svpTgU2XmMvVDpFkEKsr5prERIqBKOMNAJqP3qJ/MjPZ5sEJL65ilbLfA3T1I4iuvdDDhla0JP9Nm
	Z5xFtcGpjSUQdflfxTpXAh0DOqGprshwjrlhhAxeq9xBAd9zwtc1Ltav4izaHOPeEwu9/NF6xZwGS
	wehMsyPJrJ138avCpHwRBqlMq7E84wW5QnDmyhL+C1p5pNWV+ntLDfLENwHIqzcynKpUqaV2ceELk
	JYf1huJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHedX-0000000F8pi-0jZk;
	Wed, 21 May 2025 08:17:15 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHebU-0000000F8dF-12fM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 08:15:09 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4b2PNc4bTTz4x6Ct;
	Wed, 21 May 2025 16:14:56 +0800 (CST)
Received: from njy2app04.zte.com.cn ([10.40.12.64])
	by mse-fl1.zte.com.cn with SMTP id 54L8ElAk051014;
	Wed, 21 May 2025 16:14:47 +0800 (+08)
	(envelope-from long.yunjian@zte.com.cn)
Received: from mapi (njb2app05[null])
	by mapi (Zmail) with MAPI id mid201;
	Wed, 21 May 2025 16:14:49 +0800 (CST)
Date: Wed, 21 May 2025 16:14:49 +0800 (CST)
X-Zmail-TransId: 2afd682d8b79ffffffffaab-bd44e
X-Mailer: Zmail v1.0
Message-ID: <20250521161449954uFxEsoI6Zg_7wDu6IAfWk@zte.com.cn>
Mime-Version: 1.0
From: <long.yunjian@zte.com.cn>
To: <sudeep.holla@arm.com>
Cc: <cristian.marussi@arm.com>, <peng.fan@nxp.com>,
        <florian.fainelli@broadcom.com>, <fang.yumeng@zte.com.cn>,
        <arm-scmi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <dan.carpenter@linaro.org>,
        <christophe.jaillet@wanadoo.fr>, <mou.yi@zte.com.cn>,
        <ouyang.maochun@zte.com.cn>, <xu.lifeng1@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIHYyXSBmaXJtd2FyZTogYXJtX3NjbWk6IFVzZSBkZXZfZXJyX3Byb2JlKCkgc2ltcGxpZnkgdGhlIGNvZGU=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 54L8ElAk051014
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 682D8B80.000/4b2PNc4bTTz4x6Ct
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_011508_460460_B774A4ED 
X-CRM114-Status: GOOD (  11.37  )
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

From: Yumeng Fang <fang.yumeng@zte.com.cn>

In the probe path, dev_err() can be replaced with dev_err_probe()
which will check if error code is -EPROBE_DEFER and prints the
error name. It also sets the defer probe reason which can be
checked later through debugfs.

Signed-off-by: Yumeng Fang <fang.yumeng@zte.com.cn>
---
v1 -> v2
(1) Order the includes alphabetically.
(2) Delete "ret = PTR_ERR(*)", and then replace ret in dev_err_probe with "PTR_ERR(*)".

 .../firmware/arm_scmi/transports/mailbox.c    | 20 +++++++------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
index bd041c99b92b..764cbeac2492 100644
--- a/drivers/firmware/arm_scmi/transports/mailbox.c
+++ b/drivers/firmware/arm_scmi/transports/mailbox.c
@@ -8,6 +8,7 @@

 #include <linux/err.h>
 #include <linux/device.h>
+#include <linux/dev_printk.h>
 #include <linux/mailbox_client.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -214,31 +215,24 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,

 	smbox->chan = mbox_request_channel(cl, tx ? 0 : p2a_chan);
 	if (IS_ERR(smbox->chan)) {
-		ret = PTR_ERR(smbox->chan);
-		if (ret != -EPROBE_DEFER)
-			dev_err(cdev,
-				"failed to request SCMI %s mailbox\n", desc);
-		return ret;
+		return dev_err_probe(cdev, PTR_ERR(smbox->chan),
+				     "failed to request SCMI %s mailbox\n", desc);
 	}

 	/* Additional unidirectional channel for TX if needed */
 	if (tx && a2p_rx_chan) {
 		smbox->chan_receiver = mbox_request_channel(cl, a2p_rx_chan);
 		if (IS_ERR(smbox->chan_receiver)) {
-			ret = PTR_ERR(smbox->chan_receiver);
-			if (ret != -EPROBE_DEFER)
-				dev_err(cdev, "failed to request SCMI Tx Receiver mailbox\n");
-			return ret;
+			return dev_err_probe(cdev, PTR_ERR(smbox->chan_receiver),
+					     "failed to request SCMI Tx Receiver mailbox\n");
 		}
 	}

 	if (!tx && p2a_rx_chan) {
 		smbox->chan_platform_receiver = mbox_request_channel(cl, p2a_rx_chan);
 		if (IS_ERR(smbox->chan_platform_receiver)) {
-			ret = PTR_ERR(smbox->chan_platform_receiver);
-			if (ret != -EPROBE_DEFER)
-				dev_err(cdev, "failed to request SCMI P2A Receiver mailbox\n");
-			return ret;
+			return dev_err_probe(cdev, PTR_ERR(smbox->chan_platform_receiver),
+					     "failed to request SCMI P2A Receiver mailbox\n");
 		}
 	}

-- 
2.25.1

