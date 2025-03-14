Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08526C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 10:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=PezkqZTNHtfn7HzJ2XPoDoUWXzYGcrdEYrS4gar5vd8=; b=AMWwdwCGDm0YWKe+XyDCpoJRfx
	FrbAVWJndoYFJIsYdLu/Q6HNyfwmhAVyARJlLkEYEsJLOUNOuaIBObKTMHtdp+yEbU/jOPSsCZ/gE
	u904iG0COawl2C/MV5Tg4QTnS1yv14P19iaNx2TN85yT/rdEqTkqORNTB99NEhc3bE1uXnnt6RwYN
	l/V7UMltAX3NedQw86ETIwGnxzU25L3Vdo0BHf1LdSEEGQbclhgOAsjW/kFMNU6K8SXKfSQcgwfGV
	7WSXTwnDjvdYpVmyvNk11eEHwMUDWNqO7W+vsNv5JWlS5iEgQhNTDA6Y2qhE2wV+lNmjpdg5t0FUm
	j2g19H6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt2Dt-0000000DpjE-1uGE;
	Fri, 14 Mar 2025 10:25:01 +0000
Received: from [42.101.60.213] (helo=mail.nfschina.com)
	by bombadil.infradead.org with smtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt261-0000000DocU-2ITl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 10:16:55 +0000
Received: from liqiong-suma.shanghai.nfschina.local (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id 0287C606FFD3E;
	Fri, 14 Mar 2025 18:16:44 +0800 (CST)
X-MD-Sfrom: liqiong@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Li Qiong <liqiong@nfschina.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Simek <michal.simek@amd.com>
Cc: Li Qiong <liqiong@nfschina.com>,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] usb: gadget: udc-xilinx: Remove the invalid comment
Date: Fri, 14 Mar 2025 18:16:39 +0800
Message-Id: <20250314101639.424013-2-liqiong@nfschina.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250314101639.424013-1-liqiong@nfschina.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_031653_746662_DD8A6C54 
X-CRM114-Status: UNSURE (   9.24  )
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

The function don't return value, remove the invalid comment.

Signed-off-by: Li Qiong <liqiong@nfschina.com>
---
v2: Split the first patch to two patches.
v3: Add changes from the previous version.

 drivers/usb/gadget/udc/udc-xilinx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/udc-xilinx.c b/drivers/usb/gadget/udc/udc-xilinx.c
index ae2aeb271897..fa94cc065274 100644
--- a/drivers/usb/gadget/udc/udc-xilinx.c
+++ b/drivers/usb/gadget/udc/udc-xilinx.c
@@ -2178,8 +2178,6 @@ static int xudc_probe(struct platform_device *pdev)
 /**
  * xudc_remove - Releases the resources allocated during the initialization.
  * @pdev: pointer to the platform device structure.
- *
- * Return: 0 always
  */
 static void xudc_remove(struct platform_device *pdev)
 {
-- 
2.30.2


