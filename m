Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A7BAD6A223
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 01:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E4MHW4BzHTPH0gpxIPCSWI+tksVh1xh56Waoyqa9hd0=; b=Hs5bkNfWA5ir09d1BKb4acYBjl
	HQUulwnShGaHcGvpZDOa1EhLXe/l4nTCVudVpes6rNZBnABCvRuLTp3y4ahEoFtf+XgmzjEee1H5x
	Vz77WhzLCygqRDG3y/ODYdTaicogogkqqV/2ayYC5rMzD/ksSfEhZ+AWizf2ewCCLoOVcX44YNEvd
	Q1L+/oHmj/vZxdCXZGr5JVXpic4MzfhqWRCDVEbgWsJURzI29Z8hKQ5tIsc2WJ1Obw4jGQSBI/I5X
	/VUQrlAEMFK1PSknNC0iGATPnYPz1j1/FHADWgBn185LAS94zYUxlIHuRKPNY7vksuZGG1ax6n3ip
	Dt55qfSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBl0i-00000001IBv-3ll4;
	Fri, 15 Nov 2024 01:20:32 +0000
Received: from cmccmta4.chinamobile.com ([111.22.67.137] helo=cmccmta1.chinamobile.com)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBkz8-00000001Hna-09ka
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 01:18:56 +0000
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46736a178829-f7132;
	Fri, 15 Nov 2024 09:18:48 +0800 (CST)
X-RM-TRANSID: 2ee46736a178829-f7132
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[223.108.79.101])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee56736a178f13-dc523;
	Fri, 15 Nov 2024 09:18:48 +0800 (CST)
X-RM-TRANSID: 2ee56736a178f13-dc523
From: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
To: frank.li@nxp.com
Cc: imx@lists.linux.dev,
	jassisinghbrar@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	s.hauer@pengutronix.de,
	shawnguo@kernel.org,
	zhang jiao <zhangjiao2@cmss.chinamobile.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2] mailbox: imx: Modify the incorrect format specifier
Date: Fri, 15 Nov 2024 09:18:46 +0800
Message-Id: <20241115011846.2330-1-zhangjiao2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <ZzYoWFVhfNnAcAmy@lizhi-Precision-Tower-5810>
References: <ZzYoWFVhfNnAcAmy@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_171854_618505_2D7B4EDC 
X-CRM114-Status: UNSURE (   7.87  )
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

From: zhang jiao <zhangjiao2@cmss.chinamobile.com>

Replace %i with %u in snprintf() because it is "unsigned int".

Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
v1->v2:
	Modify commit info and add review tag.

 drivers/mailbox/imx-mailbox.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index f815dab3be50..3fe51b2de89e 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -782,7 +782,7 @@ static int imx_mu_init_generic(struct imx_mu_priv *priv)
 		cp->chan = &priv->mbox_chans[i];
 		priv->mbox_chans[i].con_priv = cp;
 		snprintf(cp->irq_desc, sizeof(cp->irq_desc),
-			 "%s[%i-%i]", dev_name(priv->dev), cp->type, cp->idx);
+			 "%s[%i-%u]", dev_name(priv->dev), cp->type, cp->idx);
 	}
 
 	priv->mbox.num_chans = IMX_MU_CHANS;
@@ -819,7 +819,7 @@ static int imx_mu_init_specific(struct imx_mu_priv *priv)
 		cp->chan = &priv->mbox_chans[i];
 		priv->mbox_chans[i].con_priv = cp;
 		snprintf(cp->irq_desc, sizeof(cp->irq_desc),
-			 "%s[%i-%i]", dev_name(priv->dev), cp->type, cp->idx);
+			 "%s[%i-%u]", dev_name(priv->dev), cp->type, cp->idx);
 	}
 
 	priv->mbox.num_chans = num_chans;
-- 
2.33.0




