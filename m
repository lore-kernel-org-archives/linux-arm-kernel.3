Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC61CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 10:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qwFfKfZju4YbTXMWoQG2pzhN8XmqkZHI+yXg6pRSZUk=; b=IXyj+wS54tW81pYyJZXjMxVa+X
	L7xYJF+J7Li0kBai2/EYMsSYRG7h6JTVQ4vE8SiiXjwJAjC/a765RbQlQb8CXlPd9OusjFMChwYIS
	EfgwqgxIgkToobu08wgLuTHZPl6e+9dToLbxO4LxfcWE8d2KnHTN8VYZWRiaIoSBuGd7cLhpHytwd
	K0GTaS+8gkJNoPPFbJmsRHuMeYNtiMtoEWPsFRXDz2EwQy9NaunsolYuMzpkUR1KAamQhXOpXzbjd
	KJqtJ5eVpjd+azAoMgrKtrOXfgN9dR4H1jQOZ3GYVPDDWA7NEnbMQj6ZNyfjhUJ1tyOTFHIYpM9OC
	EUStGbQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPIB-00000005CkS-1wdE;
	Mon, 10 Nov 2025 10:38:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPHx-00000005CWH-0tEO;
	Mon, 10 Nov 2025 10:38:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=qwFfKfZju4YbTXMWoQG2pzhN8XmqkZHI+yXg6pRSZUk=; b=KOgcSDNJK5MdghpYhnkJGerMJF
	zBey+mlUPYer0k8krrZMWXLBBvV+dXl7S33Dtz8H4XWkut4zO2gZZwsRv5BtaSPzXk2A5Hch2Qj1g
	uXYOYVg4ThAOs+GzLz4+Y1rBTivAHOaSlFUrljw+QfS8Vffdt02yJFw9FS3Dh0OZf4u36efVtiZIw
	ixbCKab1n+VtzgiBqyak0ngsPSUeMvq0iAZT8+svpXr9RPmO7Q93hwyS1S93mf1TGHJESpt9iMQTT
	PIoGYeWPwlA+GceMG0eO6TmgGasDctmZ8N9FBazew6JHosRYTimaciYhUFirNx3QgEvQRv8wYrmo6
	7MrDlRtA==;
Received: from mgamail.intel.com ([198.175.65.14])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIOQD-0000000AP5S-1i4u;
	Mon, 10 Nov 2025 09:42:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762771098; x=1794307098;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MA2w2954CQGJIRmHnMHNUgOD+5NH8IaZPPzHHdoj9ZY=;
  b=TOGeWnvGyC3lxTCYmRKeUSaw6WwzLOEvEis4KOFTI5JOHPDRhlm1w/sL
   1x1wHdlbrA9EMBU09Ttnyaj3xS7b3trnMb11G9NcR5Djj93lN9si0kDlk
   Lgn+7KaEJd8O224IQ0zVaEDsfBzRSiLNyYFxoHCu0zfIDtdDsK5+/3oGo
   nkmM4N316ROUjlYCbMB6Axr7Hzle3BSGYXZekhdGaIV9aJ4AnSMEbc0NH
   wieiBEsr/erMe/kyI61UtEDow2vLNxq1APkhOK7LxSjCtvhVXgjITYeJk
   w14kOuvfK5W746g8c8XnCyWovZT5sv60A/lyWHIKPzCoaM6psam43oUET
   Q==;
X-CSE-ConnectionGUID: 5IEXZ2ywTcuQC0AnR9+CDQ==
X-CSE-MsgGUID: AUeYHW+SSni+gAD+0F1vPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="68665502"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="68665502"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 02:38:14 -0800
X-CSE-ConnectionGUID: Nmq1xKwAT2+kb5s6LTy5lQ==
X-CSE-MsgGUID: gUCneLtCQyKQPHfLplfDew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="193026293"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 10 Nov 2025 02:38:08 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 65D1895; Mon, 10 Nov 2025 11:38:07 +0100 (CET)
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
Subject: [PATCH v2 00/13] dmaengine: introduce sg_nents_for_dma() and convert users
Date: Mon, 10 Nov 2025 11:23:27 +0100
Message-ID: <20251110103805.3562136-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_094249_892396_87EB7FDF 
X-CRM114-Status: UNSURE (   8.73  )
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

A handful of the DMAengine drivers use same routine to calculate the number of
SG entries needed for the given DMA transfer. Provide a common helper for them
and convert.

I left the new helper on SG level of API because brief grepping shows potential
candidates outside of DMA engine, e.g.:

  drivers/crypto/chelsio/chcr_algo.c:154:  nents += DIV_ROUND_UP(less, entlen);
  drivers/spi/spi-stm32.c:1495:  /* Count the number of entries needed */

Changelog v2:
- dropped outdated patches (only 9 years passed :-)
- rebased on top of the current kernel
- left API SG wide It might

v1: https://patchwork.kernel.org/project/linux-dmaengine/patch/20161021173535.100245-1-andriy.shevchenko@linux.intel.com/

Andy Shevchenko (13):
  scatterlist: introduce sg_nents_for_dma() helper
  dmaengine: altera-msgdma: use sg_nents_for_dma() helper
  dmaengine: axi-dmac: use sg_nents_for_dma() helper
  dmaengine: bcm2835-dma: use sg_nents_for_dma() helper
  dmaengine: dw-axi-dmac: use sg_nents_for_dma() helper
  dmaengine: k3dma: use sg_nents_for_dma() helper
  dmaengine: lgm: use sg_nents_for_dma() helper
  dmaengine: pxa-dma: use sg_nents_for_dma() helper
  dmaengine: qcom: adm: use sg_nents_for_dma() helper
  dmaengine: qcom: bam_dma: use sg_nents_for_dma() helper
  dmaengine: sa11x0: use sg_nents_for_dma() helper
  dmaengine: sh: use sg_nents_for_dma() helper
  dmaengine: xilinx: xdma: use sg_nents_for_dma() helper

 drivers/dma/altera-msgdma.c                   |  5 ++--
 drivers/dma/bcm2835-dma.c                     | 19 +-------------
 drivers/dma/dma-axi-dmac.c                    |  5 +---
 .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    |  6 ++---
 drivers/dma/k3dma.c                           |  9 ++-----
 drivers/dma/lgm/lgm-dma.c                     |  9 ++-----
 drivers/dma/pxa_dma.c                         |  5 ++--
 drivers/dma/qcom/bam_dma.c                    |  9 ++-----
 drivers/dma/qcom/qcom_adm.c                   |  9 +++----
 drivers/dma/sa11x0-dma.c                      |  6 ++---
 drivers/dma/sh/shdma-base.c                   |  5 ++--
 drivers/dma/xilinx/xdma.c                     |  6 ++---
 include/linux/scatterlist.h                   |  2 ++
 lib/scatterlist.c                             | 25 +++++++++++++++++++
 14 files changed, 51 insertions(+), 69 deletions(-)

-- 
2.50.1


