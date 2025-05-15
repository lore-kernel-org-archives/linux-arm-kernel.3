Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1005C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 12:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Mime-Version:Message-ID:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xlmBq8TMfK1E+EWpt6qSy8sJQ+Iypqj0wDktnphefm8=; b=0+Jo8TY8GUXwM7AG566MfxO3iB
	Y6//NtLh2kegjOAQmswQUreW/QROHBaeqWxrbcJG/GcMb3zcAIEeAO37z8lh7rQQem0R/H+WVf/Aj
	KcmHUL5pmTWFlNgT3Hs6qj8S2wHiyaF8zzbydDS4AX1C0xb/t1K8Lsg15cboiBJRXsO+MYtaRmgQA
	ns/wGTYfv5+wcNBr3WWN4hOn1QrKcDc30Ts7Md7irQ9ujSevzYHxtQOPDTzlG0Xc2YeS0OsREBIVC
	/05I3M9xXdzZiN/L4Pqa0hQB4Cdv4YvnifyFXzVto/fqf1OxKQwNqIywHKladNtHGXXrxACP9cx7R
	cG2fFsKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFXte-00000000adF-3Luk;
	Thu, 15 May 2025 12:41:10 +0000
Received: from mxhk.zte.com.cn ([63.216.63.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFXrd-00000000aSa-0sLN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 12:39:06 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZyqX72j6Yz5B1Gr;
	Thu, 15 May 2025 20:39:03 +0800 (CST)
Received: from njb2app05.zte.com.cn ([10.55.22.121])
	by mse-fl1.zte.com.cn with SMTP id 54FCcpcj026959;
	Thu, 15 May 2025 20:38:51 +0800 (+08)
	(envelope-from long.yunjian@zte.com.cn)
Received: from mapi (njy2app01[null])
	by mapi (Zmail) with MAPI id mid201;
	Thu, 15 May 2025 20:38:55 +0800 (CST)
Date: Thu, 15 May 2025 20:38:55 +0800 (CST)
X-Zmail-TransId: 2af96825e05f469-cbfdd
X-Mailer: Zmail v1.0
Message-ID: <20250515203855146Sn9x-Uw9Teur35mOjn41C@zte.com.cn>
Mime-Version: 1.0
From: <long.yunjian@zte.com.cn>
To: <sudeep.holla@arm.com>
Cc: <cristian.marussi@arm.com>, <peng.fan@nxp.com>, <justin.chen@broadcom.com>,
        <florian.fainelli@broadcom.com>, <arm-scmi@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <fang.yumeng@zte.com.cn>, <mou.yi@zte.com.cn>,
        <ouyang.maochun@zte.com.cn>, <xu.lifeng1@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBmaXJtd2FyZTogYXJtX3NjbWk6IFVzZSBkZXZfZXJyX3Byb2JlKCkgc2ltcGxpZnkgdGhlIGNvZGU=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 54FCcpcj026959
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6825E067.002/4ZyqX72j6Yz5B1Gr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_053905_398945_8696B489 
X-CRM114-Status: GOOD (  10.46  )
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
 drivers/firmware/arm_scmi/transports/mailbox.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
index bd041c99b92b..816e79537935 100644
--- a/drivers/firmware/arm_scmi/transports/mailbox.c
+++ b/drivers/firmware/arm_scmi/transports/mailbox.c
@@ -13,6 +13,7 @@
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/dev_printk.h>

 #include "../common.h"

@@ -215,10 +216,8 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 	smbox->chan = mbox_request_channel(cl, tx ? 0 : p2a_chan);
 	if (IS_ERR(smbox->chan)) {
 		ret = PTR_ERR(smbox->chan);
-		if (ret != -EPROBE_DEFER)
-			dev_err(cdev,
-				"failed to request SCMI %s mailbox\n", desc);
-		return ret;
+		return dev_err_probe(cdev, ret,
+				     "failed to request SCMI %s mailbox\n", desc);
 	}

 	/* Additional unidirectional channel for TX if needed */
@@ -226,9 +225,8 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 		smbox->chan_receiver = mbox_request_channel(cl, a2p_rx_chan);
 		if (IS_ERR(smbox->chan_receiver)) {
 			ret = PTR_ERR(smbox->chan_receiver);
-			if (ret != -EPROBE_DEFER)
-				dev_err(cdev, "failed to request SCMI Tx Receiver mailbox\n");
-			return ret;
+			return dev_err_probe(cdev, ret,
+					     "failed to request SCMI Tx Receiver mailbox\n");
 		}
 	}

@@ -236,9 +234,8 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 		smbox->chan_platform_receiver = mbox_request_channel(cl, p2a_rx_chan);
 		if (IS_ERR(smbox->chan_platform_receiver)) {
 			ret = PTR_ERR(smbox->chan_platform_receiver);
-			if (ret != -EPROBE_DEFER)
-				dev_err(cdev, "failed to request SCMI P2A Receiver mailbox\n");
-			return ret;
+			return dev_err_probe(cdev, ret,
+					     "failed to request SCMI P2A Receiver mailbox\n");
 		}
 	}

-- 
2.25.1

