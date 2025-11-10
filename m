Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2742CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 10:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0eOas0Kv8rKCGibuIOwbESdq+sjn5rQpyCiSwqawk4o=; b=RS0w4Dmd61vqUCjZNJIcSFAyaz
	phSlvQCOyZnejg56hLNAQNujQiqOTAGe6SFAg7eGGmKJDRSjJs2EJW4lpa/LBMseBnR1INmvK3zgk
	FdFR51p91CxN9rtZ+SYSUDNs8ADgE2q2b8grOWagr+1nv8V5MWUjFYKPBQgQD7eOakgGBZ1SgE6Xq
	T4YPB35oB+7RCUM3GQlcrUnXLNsAOyTNnaMtBWH+mCBQ6neqhSf1tMYbSYkfr1zcCHo4jGrvC7oC5
	VVA0jGYQpdIgInSemaLHq9NqRtkYfdeX6V6mvmUc7Xzc9VlcADPwuRHYdp8EIPOanw+zsSZn6n1UW
	U70nq6ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPIP-00000005Cxk-2Rz7;
	Mon, 10 Nov 2025 10:38:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPI2-00000005CZv-2VHP;
	Mon, 10 Nov 2025 10:38:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=0eOas0Kv8rKCGibuIOwbESdq+sjn5rQpyCiSwqawk4o=; b=DkDVtH1X7dINdEJuooy9qGXO1T
	u6ntcmCb+k2/gQ72tt0nJ6syPEsUwvCcmAqh+N5/jwJyLCiiZhEZTjxuSa7N+W2zrIleOmaAkbPz2
	YzRBE7JfKsclGLecBRu+hEjIQJZ6DMV0pyBM3KDd51FAzOTIEj1Z0MQ+JIMCJ01x7LcX5t99/otb+
	DrTLgYQIh493l3kRQIlGc6fgO0Br5Ct/nqwt3YSfZnCkceck0FMcuwJHQ1+X5pCadIiQrq/ygjuMV
	CpoypTX16Z3A3Euq0aIyr4dCKyscr8Y1DWNThDz3W2h5OdGUWDb8UbobNz3DBifKi5eBhrmkAaYMi
	MIcSf09Q==;
Received: from mgamail.intel.com ([192.198.163.12])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIOQI-0000000AP76-2Jfa;
	Mon, 10 Nov 2025 09:42:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762771102; x=1794307102;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8yAlrs00JSl0ed7bQ0uLXdi6Ey9t5OjHKtlhl1VgOJk=;
  b=LrD9w6kAIXI3itwhZ62Al6aXaYzjzh/SmSoHwj0u+mpk3TlRPW86g2ID
   RkbFvkY09TAJceSxFjcIyNAcPe+2IVjKeEhQdChXu+zFxak07dm0jHGVE
   zhIgeAD+G0gsXeDozo0/OW/B2twu8Gfh32Mn9pk/Ast25rz5VVEo8zmLS
   B70OBcOyqid889Nu6rkX4+qwr96YAl1mBPqBVNttdAuOWrQXNakMt+Aoh
   dlp96E6N6TPXBxYeDG1wOm67wholMeXzNqn2y256Aazrv6dBbMwVha4WZ
   DqYS3Js+wKXez4EWGGIPcf6BgNStgELzsCzwVBHjLeyxTCBbYGljq1Zqb
   g==;
X-CSE-ConnectionGUID: byIu4z1PTsWDI0faQuH2uA==
X-CSE-MsgGUID: AQ3tkojBQSKfjKMJVFyAyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="68677988"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="68677988"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 02:38:19 -0800
X-CSE-ConnectionGUID: iB+mA8BnRL6lJ5u2cXHMGg==
X-CSE-MsgGUID: lGPahJxqSQaaqozs/u17Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="188384808"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 10 Nov 2025 02:38:13 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 7E02F9A; Mon, 10 Nov 2025 11:38:07 +0100 (CET)
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
Subject: [PATCH v2 05/13] dmaengine: dw-axi-dmac: use sg_nents_for_dma() helper
Date: Mon, 10 Nov 2025 11:23:32 +0100
Message-ID: <20251110103805.3562136-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251110103805.3562136-1-andriy.shevchenko@linux.intel.com>
References: <20251110103805.3562136-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_094254_978675_61E495FB 
X-CRM114-Status: GOOD (  10.44  )
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
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index b23536645ff7..493c2a32b0fe 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -850,7 +850,7 @@ dw_axi_dma_chan_prep_slave_sg(struct dma_chan *dchan, struct scatterlist *sgl,
 	unsigned int loop = 0;
 	struct scatterlist *sg;
 	size_t axi_block_len;
-	u32 len, num_sgs = 0;
+	u32 len, num_sgs;
 	unsigned int i;
 	dma_addr_t mem;
 	int status;
@@ -867,9 +867,7 @@ dw_axi_dma_chan_prep_slave_sg(struct dma_chan *dchan, struct scatterlist *sgl,
 	if (axi_block_len == 0)
 		return NULL;
 
-	for_each_sg(sgl, sg, sg_len, i)
-		num_sgs += DIV_ROUND_UP(sg_dma_len(sg), axi_block_len);
-
+	num_sgs = sg_nents_for_dma(sgl, sg_len, axi_block_len);
 	desc = axi_desc_alloc(num_sgs);
 	if (unlikely(!desc))
 		goto err_desc_get;
-- 
2.50.1


