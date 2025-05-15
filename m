Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E77C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 12:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Mime-Version:Message-ID:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CNhMupuOowX+2eiTF/wbY7MZLXkzol8JDRl8AGjt4B8=; b=nPCmpRDVvDTk+RKMKmGksnkev9
	5/LePFjdKT4uaz+UGLU65BqxIGcfC7cfjua7w4+rduu6D8DMrHTTI4OjVlOSNK9sKE3taG5tGBqb3
	X73MgHk/Qt5ihARbOR00CtgS+Wz99tdVkCI2PYnidPTW3eJNWsNmIia0Y6xN7ioaB1/0Y/BKDkTlL
	pZ5UCjtIuF1MZqryTvHlCgn6u6F7gtzU3jcuX60QNsVUTzEb4kGLN4qyILTRpoSq2x9NbJ1o+fxWZ
	UXGYUMGawoUh0f6fzDRAcNB28JigntC02TUmtQpdIzKgQ/Ph+fle2sw/ZOsV2H1qu8IQDGlc1xfqc
	VLN8FmDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFXwf-00000000b6n-2aes;
	Thu, 15 May 2025 12:44:17 +0000
Received: from mxhk.zte.com.cn ([63.216.63.40])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFXue-00000000aqU-0ypy;
	Thu, 15 May 2025 12:42:13 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4Zyqbb3T1xz8R03d;
	Thu, 15 May 2025 20:42:03 +0800 (CST)
Received: from njb2app07.zte.com.cn ([10.55.22.95])
	by mse-fl1.zte.com.cn with SMTP id 54FCfvOW029395;
	Thu, 15 May 2025 20:41:57 +0800 (+08)
	(envelope-from long.yunjian@zte.com.cn)
Received: from mapi (njb2app06[null])
	by mapi (Zmail) with MAPI id mid201;
	Thu, 15 May 2025 20:42:01 +0800 (CST)
Date: Thu, 15 May 2025 20:42:01 +0800 (CST)
X-Zmail-TransId: 2afe6825e11940d-aafa2
X-Mailer: Zmail v1.0
Message-ID: <20250515204201502Kzmj4I6k5Fv2FjqyEjF6n@zte.com.cn>
Mime-Version: 1.0
From: <long.yunjian@zte.com.cn>
To: <ulf.hansson@linaro.org>
Cc: <florian.fainelli@broadcom.com>, <bcm-kernel-feedback-list@broadcom.com>,
        <rjui@broadcom.com>, <sbranden@broadcom.com>, <wahrenst@gmx.net>,
        <u.kleine-koenig@baylibre.com>, <fang.yumeng@zte.com.cn>,
        <linux-mmc@vger.kernel.org>, <linux-rpi-kernel@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <ouyang.maochun@zte.com.cn>, <mou.yi@zte.com.cn>,
        <xu.lifeng1@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBtbWM6IGJjbTI4MzU6IFVzZSBzdHJfcmVhZF93cml0ZSgpIGhlbHBlcg==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 54FCfvOW029395
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6825E11B.002/4Zyqbb3T1xz8R03d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_054212_425512_8617CFE2 
X-CRM114-Status: UNSURE (   8.41  )
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

From: Yumeng Fang <fang.yumeng@zte.com.cn>

Remove hard-coded strings by using the str_read_write() helper.

Signed-off-by: Yumeng Fang <fang.yumeng@zte.com.cn>
---
 drivers/mmc/host/bcm2835.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/bcm2835.c b/drivers/mmc/host/bcm2835.c
index e5f151d092cd..def054ddd256 100644
--- a/drivers/mmc/host/bcm2835.c
+++ b/drivers/mmc/host/bcm2835.c
@@ -44,6 +44,7 @@
 #include <linux/scatterlist.h>
 #include <linux/time.h>
 #include <linux/workqueue.h>
+#include <linux/string_choices.h>

 #include <linux/mmc/host.h>
 #include <linux/mmc/mmc.h>
@@ -391,8 +392,7 @@ static void bcm2835_transfer_block_pio(struct bcm2835_host *host, bool is_read)

 				if (time_after(jiffies, wait_max)) {
 					dev_err(dev, "PIO %s timeout - EDM %08x\n",
-						is_read ? "read" : "write",
-						edm);
+						str_read_write(is_read), edm);
 					hsts = SDHSTS_REW_TIME_OUT;
 					break;
 				}
@@ -435,12 +435,12 @@ static void bcm2835_transfer_pio(struct bcm2835_host *host)
 		      SDHSTS_CRC7_ERROR |
 		      SDHSTS_FIFO_ERROR)) {
 		dev_err(dev, "%s transfer error - HSTS %08x\n",
-			is_read ? "read" : "write", sdhsts);
+			str_read_write(is_read), sdhsts);
 		host->data->error = -EILSEQ;
 	} else if ((sdhsts & (SDHSTS_CMD_TIME_OUT |
 			      SDHSTS_REW_TIME_OUT))) {
 		dev_err(dev, "%s timeout error - HSTS %08x\n",
-			is_read ? "read" : "write", sdhsts);
+			str_read_write(is_read), sdhsts);
 		host->data->error = -ETIMEDOUT;
 	}
 }
-- 
2.25.1

