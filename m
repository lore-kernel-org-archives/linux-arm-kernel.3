Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70674CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 10:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dzvJHHfL6SnRXyt4cDOGCDlRrgGGzOLMcJeSDRG4W4k=; b=OlUpryaF2XyyB0uYl/UEadvxRg
	ARZ0pWWvnGFifp30I3esOS2Ec/FABSMi7U7eqXhgg61jakkQv8DxrlgFAT4W0+1XKp682RALg9MQs
	rgbzdKwNbQxU4jbc9/6PpodrBk1HeBAy6CX2ogVl/tUdcjF7+Gu+vBkwvOox0gKUikM3tC3vie6TF
	i1Uq9ABwWc+cRWerkK0NgaOirtRpl9vPFsYxzaYI78PdP6zA5ecgEhwltim3ILvsncMvZyDPK4/+I
	dzPeJbqogATozbuBv7gj4BWR6tu0J9E/rapuheNtmX9IwnnnXv/qTZO1Vb2lQk+0FshX2zDJC6Jnl
	XK6874xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPIK-00000005CsQ-1EcX;
	Mon, 10 Nov 2025 10:38:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPI1-00000005CYa-24qp;
	Mon, 10 Nov 2025 10:38:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=dzvJHHfL6SnRXyt4cDOGCDlRrgGGzOLMcJeSDRG4W4k=; b=b7zCu7Kgeb54+7oldyCQzDGr8R
	GN6UjGZfua3OBqOz4HmdwoFfiOmatsluLgxvcPA5VFXLzBljILStTfz+2U/vVILPwnJSubDbx4gVo
	8rsBy0MijOvGRZqKuHZ+6ZhTuj6G/wdXMrwOnzAS6jBTkM7+SbMNAvxS+Rtzl/MMzcMVVouJrPIdJ
	HKKIIDjyMlpbyvAwJ0E/HUaszkDEKObMv2U/JkBZdNaBrVExZ7JsEslowH45H16GvxIcGnhOlpfzG
	zW5c8TatsrAd+T30twrLl+kvWvytoEItLVI2sXnPzRgJBj6e8gFu6lHQfFBt7iWeH4E6DMdwY7pFD
	InrR4Ojg==;
Received: from mgamail.intel.com ([192.198.163.16])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIOQI-0000000AP73-2Jfm;
	Mon, 10 Nov 2025 09:42:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762771102; x=1794307102;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8d25x9ub7lDRK48S73SYpy0iwN0Yoo3cVuRJzbx/ioU=;
  b=Qdw56yEoyf/YyI6aQ2TPuGPzvMxapMzP9W/BNXhQZ8R8/q7yHxd4lvMA
   CsMdUUapIS+lYyZiU5GHOXXnzCR1b/IpjO+d6Oik0Ky3iilSaHxdFLUs7
   d0lCOxgzboFx2a7fQgs0JfPfmnN/0zYN1w3BJfQFBb6yC6YX0iu/xwc2R
   zwCrBqkZ/F4oUOG3bH7Q+fZkNKhSdaAj2POYHxzwGBQiB90FyyVdD+BOZ
   jdlL/sMChWFNsgeawt7MbE491eqRbVsv1/eFb/ufl8yIY2PoYfMWNe5Tx
   YUPFy554mz5R/04IbBzyb5POKEmbwI5iENa1gyWC5JKc6rBFTxMA1Z0Ee
   A==;
X-CSE-ConnectionGUID: IRpAiP4+RYKhYqmbM9lXVA==
X-CSE-MsgGUID: O1uNcF+NTIqM1adN6PkXRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="52376885"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="52376885"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 02:38:20 -0800
X-CSE-ConnectionGUID: CYqWl+hQQxSdr9O7zh5M+w==
X-CSE-MsgGUID: 8xEG2Ta4Qwu334ueVKVTDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="193823228"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 10 Nov 2025 02:38:14 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 9B12AA0; Mon, 10 Nov 2025 11:38:07 +0100 (CET)
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
Subject: [PATCH v2 11/13] dmaengine: sa11x0: use sg_nents_for_dma() helper
Date: Mon, 10 Nov 2025 11:23:38 +0100
Message-ID: <20251110103805.3562136-12-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251110103805.3562136-1-andriy.shevchenko@linux.intel.com>
References: <20251110103805.3562136-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_094254_979468_46F9AE70 
X-CRM114-Status: GOOD (  11.25  )
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
 drivers/dma/sa11x0-dma.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/sa11x0-dma.c b/drivers/dma/sa11x0-dma.c
index dc1a9a05252e..3dd33d3f7987 100644
--- a/drivers/dma/sa11x0-dma.c
+++ b/drivers/dma/sa11x0-dma.c
@@ -526,7 +526,7 @@ static struct dma_async_tx_descriptor *sa11x0_dma_prep_slave_sg(
 	struct sa11x0_dma_chan *c = to_sa11x0_dma_chan(chan);
 	struct sa11x0_dma_desc *txd;
 	struct scatterlist *sgent;
-	unsigned i, j = sglen;
+	unsigned int i, j;
 	size_t size = 0;
 
 	/* SA11x0 channels can only operate in their native direction */
@@ -542,10 +542,7 @@ static struct dma_async_tx_descriptor *sa11x0_dma_prep_slave_sg(
 
 	for_each_sg(sg, sgent, sglen, i) {
 		dma_addr_t addr = sg_dma_address(sgent);
-		unsigned int len = sg_dma_len(sgent);
 
-		if (len > DMA_MAX_SIZE)
-			j += DIV_ROUND_UP(len, DMA_MAX_SIZE & ~DMA_ALIGN) - 1;
 		if (addr & DMA_ALIGN) {
 			dev_dbg(chan->device->dev, "vchan %p: bad buffer alignment: %pad\n",
 				&c->vc, &addr);
@@ -553,6 +550,7 @@ static struct dma_async_tx_descriptor *sa11x0_dma_prep_slave_sg(
 		}
 	}
 
+	j = sg_nents_for_dma(sgl, sg_len, DMA_MAX_SIZE & ~DMA_ALIGN);
 	txd = kzalloc(struct_size(txd, sg, j), GFP_ATOMIC);
 	if (!txd) {
 		dev_dbg(chan->device->dev, "vchan %p: kzalloc failed\n", &c->vc);
-- 
2.50.1


