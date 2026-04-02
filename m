Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5212CC6B00
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 07:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d3iOn4TA5Xaky86RaAqEhxLIVyS4Ci8QTLshB5nOVoQ=; b=c8CZfBq/ooIwHGL8qSrP3C3bB0
	25S+LgR+FE6RFL+jZg82Lix0LC8u4n5Ft7sefc50SZroG0A9sDx/Hc8u3BP/lu/19+Fa50HY7nN0y
	ib+gMpMr5wzUAfwcN6ZjnMXcl3hA9OMocsofjY8VkU2dcVrPV5X9Bmp55uAceh+m/GBA1yFSs4Fb1
	NNcH3WytvyM0FeoHmhw1CCY4ovhaB6key1eAf7WTbm3gCzlVjvjGpyLbGDAr7s0feyKdkYfmisetI
	cPctekXy468Xfx+YFc03IWZEoHK7ECRtrVeLiw+emwAF1inAjvae9BSnmMWZ/0BNGDQYwGpYQCv6K
	yeiCBY3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Clk-0000000H74X-3qrl;
	Thu, 02 Apr 2026 07:47:12 +0000
Received: from fsn-vps-1.bereza.email ([162.55.44.2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Cli-0000000H73X-19Ib
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 07:47:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bereza.email; s=mail;
	t=1775116026; bh=CF7O3i7wHSzlyimOTIc/kLCwdu7hGG6ESx7aNHgmZKQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YO+fG+cHociVuiNRfv2Aquhhm8HO/hcJjZnR2tL8+48Asp/a9n01WNjJA5zLEk+D0
	 Yqj9zL0MqleqT6hVkSIT5gejgqXG5KbHlxQVHE9flxDRkq4LpSm9xnzTQoo6Cuao5R
	 LUdPgW4StDCpyo1EoJXT8D6CqMEDoupZyg6EbPqH0hSiwoBZ5lAV4L9N8N6lm1mnZ7
	 9oiJFRx4TD5z+/9IqR5UiVT1VNtGUrrh761E9AJi+qxINcVEt5taHBXLuPyY4OyxOz
	 j2N4NUnHyAcGyUrm4R+plaZv9NilFcihhDKfp6ZaeVipsG7OBW2XZnYSx1k1cmNW0W
	 s+9LzQNJKYwpQ==
Received: from [127.0.1.1] (pd95bbad8.dip0.t-ipconnect.de [217.91.186.216])
	by fsn-vps-1.bereza.email (Postfix) with ESMTPSA id 67B966025A;
	Thu,  2 Apr 2026 09:47:06 +0200 (CEST)
From: Alex Bereza <alex@bereza.email>
Date: Thu, 02 Apr 2026 09:46:23 +0200
Subject: [PATCH v4 2/2] dmaengine: xilinx_dma: Rename XILINX_DMA_LOOP_COUNT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-fix-atomic-poll-timeout-regression-v4-2-f30d6a6c13cb@bereza.email>
References: <20260402-fix-atomic-poll-timeout-regression-v4-0-f30d6a6c13cb@bereza.email>
In-Reply-To: <20260402-fix-atomic-poll-timeout-regression-v4-0-f30d6a6c13cb@bereza.email>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Michal Simek <michal.simek@amd.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Tony Lindgren <tony@atomide.com>, 
 Kedareswara rao Appana <appana.durga.rao@xilinx.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Alex Bereza <alex@bereza.email>, 
 Suraj Gupta <suraj.gupta2@amd.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_004710_534672_F44E69E8 
X-CRM114-Status: GOOD (  11.13  )
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

Rename XILINX_DMA_LOOP_COUNT to XILINX_DMA_POLL_TIMEOUT_US because it is
a timeout value, not a loop count for polling register in microseconds.

No functional changes.

Reviewed-by: Suraj Gupta <suraj.gupta2@amd.com>
Signed-off-by: Alex Bereza <alex@bereza.email>
---
 drivers/dma/xilinx/xilinx_dma.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 345a738bab2c..253c27fd1a0e 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -165,8 +165,8 @@
 #define XILINX_DMA_FLUSH_MM2S		2
 #define XILINX_DMA_FLUSH_BOTH		1
 
-/* Delay loop counter to prevent hardware failure */
-#define XILINX_DMA_LOOP_COUNT		1000000
+/* Timeout for polling various registers */
+#define XILINX_DMA_POLL_TIMEOUT_US	1000000
 /* Delay between polls (avoid a delay of 0 to prevent CPU stalls) */
 #define XILINX_DMA_POLL_DELAY_US	10
 
@@ -1336,7 +1336,7 @@ static int xilinx_dma_stop_transfer(struct xilinx_dma_chan *chan)
 	return xilinx_dma_poll_timeout(chan, XILINX_DMA_REG_DMASR, val,
 				       val & XILINX_DMA_DMASR_HALTED,
 				       XILINX_DMA_POLL_DELAY_US,
-				       XILINX_DMA_LOOP_COUNT);
+				       XILINX_DMA_POLL_TIMEOUT_US);
 }
 
 /**
@@ -1352,7 +1352,7 @@ static int xilinx_cdma_stop_transfer(struct xilinx_dma_chan *chan)
 	return xilinx_dma_poll_timeout(chan, XILINX_DMA_REG_DMASR, val,
 				       val & XILINX_DMA_DMASR_IDLE,
 				       XILINX_DMA_POLL_DELAY_US,
-				       XILINX_DMA_LOOP_COUNT);
+				       XILINX_DMA_POLL_TIMEOUT_US);
 }
 
 /**
@@ -1370,7 +1370,7 @@ static void xilinx_dma_start(struct xilinx_dma_chan *chan)
 	err = xilinx_dma_poll_timeout(chan, XILINX_DMA_REG_DMASR, val,
 				      !(val & XILINX_DMA_DMASR_HALTED),
 				      XILINX_DMA_POLL_DELAY_US,
-				      XILINX_DMA_LOOP_COUNT);
+				      XILINX_DMA_POLL_TIMEOUT_US);
 
 	if (err) {
 		dev_err(chan->dev, "Cannot start channel %p: %x\n",
@@ -1787,7 +1787,7 @@ static int xilinx_dma_reset(struct xilinx_dma_chan *chan)
 	err = xilinx_dma_poll_timeout(chan, XILINX_DMA_REG_DMACR, tmp,
 				      !(tmp & XILINX_DMA_DMACR_RESET),
 				      XILINX_DMA_POLL_DELAY_US,
-				      XILINX_DMA_LOOP_COUNT);
+				      XILINX_DMA_POLL_TIMEOUT_US);
 
 	if (err) {
 		dev_err(chan->dev, "reset timeout, cr %x, sr %x\n",

-- 
2.53.0


