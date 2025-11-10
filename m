Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FCE6CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 10:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s9E9lC+WMoZR92Al0pmzvT7sjMUK4NxBw8Z2GeSNwTw=; b=TI5SQy8p0xYZbswCTKtOEZJX7p
	WbSyaiC56K5t3HasUwgFmniAo7cPdDR/MvBgqw+M8uyHZCkQNw70pDJKFgB6w5WwFc9hH8qhFaiEU
	xGP0nzyLJkYh3bGzoawGUO3ApaGD7aHk8//3/BNQOLqwtdi95lBSRNw4ZnJqRgwgrEOU1NhsgB6xH
	EbNwNV6GxCMoV9ZOe4hbLucSxkN2mJ+pxnB8ki1FokDwi636QYFH1yaSUg6Ka+PI1KAn2Cpee5W44
	gZMgmi/nbJcmkQD9rcpcztfcYpeJX+Dxv08eXWW88U4FsSU3zOVaMBEtzVopt3R215sOlMibuq9JM
	xaoU3G9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPIF-00000005Coz-0Hpl;
	Mon, 10 Nov 2025 10:38:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPHy-00000005CXG-151C;
	Mon, 10 Nov 2025 10:38:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=s9E9lC+WMoZR92Al0pmzvT7sjMUK4NxBw8Z2GeSNwTw=; b=EH9NFxZJ0iGRgDyAZ/icUcNHJp
	tgz8b+YDdOmPoy3V5xUGK2IW1Pq/nnz8ia55noSmMTsK+zn1Yb87EW8p7ARYBpf6H77/qzaaapMM+
	0fU7B1LuTDggMxMMqTotiCdH6oZUm1mqtvziu8JsrqzkZN0z7Fa1suoxc1oS9nTM7818F8gSPXCzd
	bmG1LOVnhWllua+4KS3PGiKLxKpo6Kotwi5wy57zvbQhkZljnN8MFWQnoO5IoAdwKTmGVH61iYpUn
	Wa0Phnvk1xP/u2VDmX7/tTzeKoJKnIoaaNB+DJSIWyXCO0EMRY5jXNcxA4WnN0WAgDsaZoLWZbnS2
	CTHzj/jA==;
Received: from mgamail.intel.com ([198.175.65.20])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIOQD-0000000AP5T-1ieN;
	Mon, 10 Nov 2025 09:42:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762771098; x=1794307098;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V9ZbPC67zEMLsSzZBxILrfmvIIg4P70AT+EpRDl4Ip8=;
  b=kyadngAgVrYSy60No3MW9E1Ak/bHkNL3tHkk2NZDREoBZuTtF3GpykGi
   zyBKwo3g/1C0IK8xX5meO7am3MJLkkdtDVM8DVG2v6iLbKp6ORF/W4D+p
   SGboJHx+5uP2jix84Panlyv0Iy7Jed3On2PYYrAyxqstzrgu+SSOWj41s
   ZPB17LDVadDEl5D3qms26/FBV6Yld/ABeMLSJ1ON56slzoAu8MUNHbYNV
   swuIcJKcYzcnG+kj/4vG4qBMRk8os+2h6ftLck5WzI9I708fObTArOX36
   iKEFZ/BOm9m5R72/bUT4cNAVQQbJJLXqVmoq78D9WMdGi2hvuedFXGPub
   g==;
X-CSE-ConnectionGUID: OXGDlECATVqjAPp8oOQsGA==
X-CSE-MsgGUID: VIDEDewqSymsqukOvRpR+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="64518783"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="64518783"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 02:38:14 -0800
X-CSE-ConnectionGUID: HhTB2+reTraqdRK5b28MTQ==
X-CSE-MsgGUID: lyL+M5TITei5AbXW2Hs0og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="192750706"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 10 Nov 2025 02:38:08 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 78F7099; Mon, 10 Nov 2025 11:38:07 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Vinod Koul <vkoul@kernel.org>,
	Thomas Andreatta <thomasandreatta2000@gmail.com>,
	Caleb Sander Mateos <csander@purestorage.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Cc: Olivier Dautricourt <olivierdautricourt@gmail.com>,
	Stefan Roese <sr@denx.de>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Lizhi Hou <lizhi.hou@amd.com>,
	Brian Xu <brian.xu@amd.com>,
	Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 04/13] dmaengine: bcm2835-dma: use sg_nents_for_dma() helper
Date: Mon, 10 Nov 2025 11:23:31 +0100
Message-ID: <20251110103805.3562136-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251110103805.3562136-1-andriy.shevchenko@linux.intel.com>
References: <20251110103805.3562136-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_094250_849901_6B65E2B0 
X-CRM114-Status: GOOD (  10.84  )
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

Instead of open coded variant let's use recently introduced helper.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/dma/bcm2835-dma.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 0117bb2e8591..802b23be2fd8 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -260,23 +260,6 @@ static void bcm2835_dma_create_cb_set_length(
 	control_block->info |= finalextrainfo;
 }
 
-static inline size_t bcm2835_dma_count_frames_for_sg(
-	struct bcm2835_chan *c,
-	struct scatterlist *sgl,
-	unsigned int sg_len)
-{
-	size_t frames = 0;
-	struct scatterlist *sgent;
-	unsigned int i;
-	size_t plength = bcm2835_dma_max_frame_length(c);
-
-	for_each_sg(sgl, sgent, sg_len, i)
-		frames += bcm2835_dma_frames_for_length(
-			sg_dma_len(sgent), plength);
-
-	return frames;
-}
-
 /**
  * bcm2835_dma_create_cb_chain - create a control block and fills data in
  *
@@ -672,7 +655,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 	}
 
 	/* count frames in sg list */
-	frames = bcm2835_dma_count_frames_for_sg(c, sgl, sg_len);
+	frames = sg_nents_for_dma(sgl, sg_len, bcm2835_dma_max_frame_length(c));
 
 	/* allocate the CB chain */
 	d = bcm2835_dma_create_cb_chain(chan, direction, false,
-- 
2.50.1


