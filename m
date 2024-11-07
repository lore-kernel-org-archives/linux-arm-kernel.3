Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20193D5D687
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 20:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dlF2ppYzrwkxKRIqxdACUVXIBjx0a0SOBqbSU1Wcp2U=; b=Qzz9xvD8a5oP1yaXdYUSPM7Iac
	fcnbUDvZv1yPP7wQj+MyaVF6INsTGmfhIg7RGjNyZFnX8N6313aHGOmORSURu8iVLNVcIdsOyf+Fu
	uthaKCev9bu7Y8/1nSfEZ2NC6x1q9tlvi4+ktjAyADA6NiRCSeNRke7RMBtHmuy+C+KxFHkYc8VuH
	4LpNH8NJpGoywyzzdglEco/ceDsD/JwEmZ96aDBXhf/3ST+u+lWS7huEu2SkU1dsasrsyHyZ4tckp
	dvlpsaFve6UkXtIFh55WK0whvaaiXQdbcd6oaMYExed0Z/SwqaontR75rqJIHZ29oJ9RCEGZgm+WV
	Xu7AMdRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t98iF-00000008CFu-2XK7;
	Thu, 07 Nov 2024 20:02:39 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t98UO-000000088ep-1uSK;
	Thu, 07 Nov 2024 19:48:22 +0000
Received: from umang.jain (unknown [IPv6:2405:201:2015:f873:c173:4b:4a04:3a21])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9B2E0792;
	Thu,  7 Nov 2024 20:48:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731008888;
	bh=RO0c7EoopaN1SQrMONOFRGPZT4eehsDieDHwLK5y4+E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fLGm/iU9sPvAnn5tjy3RYomLWN8cyiFhWWvRWnnRM9g4mdkwHcPj8VlW+G5pyUI1T
	 zx6AHenunLiXvdYbdB2obf1uUVTpwHVXABPVcs98qoNCyAkZUf7+NyV2l1SUnB7c6b
	 VVmUp/zSpJ74TS9VCvXHjwAeXePD98oyNdsS8t1Q=
From: Umang Jain <umang.jain@ideasonboard.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 1/3] staging: vc04_services: Cleanup TODO entry
Date: Fri,  8 Nov 2024 01:18:04 +0530
Message-ID: <20241107194806.90408-2-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241107194806.90408-1-umang.jain@ideasonboard.com>
References: <20241107194806.90408-1-umang.jain@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_114820_667422_10BD2357 
X-CRM114-Status: UNSURE (   9.98  )
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

The TODO entry "Fix behvaiour of message handling" no longer
applies due to killable completions [1]. Drop the entry from TODO list.

[1] https://lore.kernel.org/all/20240918163100.870596-1-umang.jain@ideasonboard.com/

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/staging/vc04_services/interface/TODO | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/TODO b/drivers/staging/vc04_services/interface/TODO
index 2ae75362421b..f6f24600aa86 100644
--- a/drivers/staging/vc04_services/interface/TODO
+++ b/drivers/staging/vc04_services/interface/TODO
@@ -26,12 +26,3 @@ kthreads, userspace, limitations) could be very helpful for reviewers.
 The code follows the 80 characters limitation yet tends to go 3 or 4 levels of
 indentation deep making it very unpleasant to read. This is specially relevant
 in the character driver ioctl code and in the core thread functions.
-
-* Fix behavior of message handling
-
-The polling behavior of vchiq_bulk_transmit(), vchiq_bulk_receive() and
-vchiq_queue_kernel_message() looks broken. A possible signal should be
-propagated back to user space to let the calling task handle it before
-retrying. Hopefully these msleep(1) shouldn't be necessary anymore.
-
-https://lore.kernel.org/linux-staging/CAK8P3a3HGm1cPo4sW9fOY4E8AN8yAq3tevXxU5m8bmtmsU8WKw@mail.gmail.com/
-- 
2.45.2


