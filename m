Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452B7C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 07:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qlcAdCzEmbQ3h0azH0QO0T8RFkkIXiOHAJ/P2Vrp95U=; b=Ccv4HWaEtOr2JXnsWkGTzS/oZa
	cBU5AcRqbUZiJK3ZR7OF7y9i2u2ll1p2gJoa1UTLFjWqGZPglXXeB5GHnkwUxr1nXn1+UD1tzFov7
	+Pn0IgAdi/Uwz551bk5WTFszAkXqKBcuxBbnbpGgMOyEH/kYdsUs5tmMrQFn0axoTJDAiu8Z88YiY
	iV50CwqyIZ5ZT8TCCB03VNSKeQz55amZV9aazj3qvKVoyzRp9GHPtPNEAd+Tnc5bfjXPT8vZunSCw
	7FHHKAdiauc8sWp34gVF5jy96veuWhsmxAOWqKv7lkzXMf9SuOAUai2fWUM47vnsk9LCr3U5Uhu2A
	rRLYVA9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tszCa-0000000DGjw-0VYR;
	Fri, 14 Mar 2025 07:11:28 +0000
Received: from [42.101.60.213] (helo=mail.nfschina.com)
	by bombadil.infradead.org with smtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tszAu-0000000DGSF-0KXf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 07:09:45 +0000
Received: from liqiong-suma.shanghai.nfschina.local (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id 90FF36068096E;
	Fri, 14 Mar 2025 15:09:30 +0800 (CST)
X-MD-Sfrom: liqiong@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Li Qiong <liqiong@nfschina.com>
To: Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>
Cc: Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Li Qiong <liqiong@nfschina.com>
Subject: [PATCH] usb: remove the invalid comments
Date: Fri, 14 Mar 2025 15:09:21 +0800
Message-Id: <20250314070921.355986-1-liqiong@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_000944_279474_2CC7EA4C 
X-CRM114-Status: UNSURE (   8.15  )
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

These function don't return value, remove the invalid comments.

Signed-off-by: Li Qiong <liqiong@nfschina.com>
---
 drivers/usb/cdns3/cdns3-plat.c      | 2 --
 drivers/usb/gadget/udc/udc-xilinx.c | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/usb/cdns3/cdns3-plat.c b/drivers/usb/cdns3/cdns3-plat.c
index 59ec505e198a..735df88774e4 100644
--- a/drivers/usb/cdns3/cdns3-plat.c
+++ b/drivers/usb/cdns3/cdns3-plat.c
@@ -179,8 +179,6 @@ static int cdns3_plat_probe(struct platform_device *pdev)
 /**
  * cdns3_plat_remove() - unbind drd driver and clean up
  * @pdev: Pointer to Linux platform device
- *
- * Returns 0 on success otherwise negative errno
  */
 static void cdns3_plat_remove(struct platform_device *pdev)
 {
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


