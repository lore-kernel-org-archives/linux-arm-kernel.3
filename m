Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DBDD35175
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 10:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+KrphrASz/LZy5/eA2d5JSQFpKV8L1kMJakAzyQ2k1c=; b=4Ts1bcGwHkNoiSGBpl251pAxGA
	x88SV2y3BF7o9rXRDl/ciw2s0prIg83NPNT7nCn8Uhf/j9Mp/CG3Baj6eC0s/VsPsWnpesHNr3oge
	V9nU6A92srm9Crja6FHql1gCPcIUNlI6mxzX0LzFzY2/sl1zjMmeDKFSvBGM1f5nd4dVneT9AD9ow
	vJlq/CuzM3vPMsg2RpQLldTRnV9ggBYZEH9g68v80iTD5f0wop7JpSpEFAkm3/jtjgh61Q3rc4ODb
	lt9IpSxqw9reRP+EXIIefSY3wyDPa8sWsC2rCw4N7ymdZAyUJ0XsR0VieUDNXkTfSt9Zz5s5GL0KH
	xWrHtIvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7tFw-0000000EZil-2XRZ;
	Wed, 01 Apr 2026 10:57:04 +0000
Received: from fsn-vps-1.bereza.email ([162.55.44.2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7tFu-0000000EZfw-2giP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 10:57:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bereza.email; s=mail;
	t=1775041020; bh=9YI3mR7RGj+FXV1f08vFjbtn+zYBmLDDNzXU0ekoR44=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PjqYLWLjqMaKbIakqE0KTgyHhH6palLoN0nAzlVrxhL0W3elcKAwhYAu31ClYBzs1
	 iZFS4XBBkRfnYBjTsmsMjsnKF3Iw+BDwDQsn3Ae33Hw4KtwpDQrFSb7m6rlVwJe/+Q
	 0jyhrF1IASVBehnmhl4k9gI5NSKmfoVhcmR5xPovtNnGrfzcrzdHwO7vmqcQXcs+Vw
	 vmyzKugCNbBrG8TY9tdysO9T+M2A2Ts6j7+0QdAIxnH4m5iXhc3X4aePc3wkIcabqT
	 u0oc3OT3KmhPLFYW+HR42quPBjHu855iIj8HGtPNNqbBgXE7GdhKGxkeC/FXaZt+q1
	 j+Z3SCfNCUtLw==
Received: from [127.0.1.1] (pd95bbad8.dip0.t-ipconnect.de [217.91.186.216])
	by fsn-vps-1.bereza.email (Postfix) with ESMTPSA id 7D0EA5DF96;
	Wed,  1 Apr 2026 12:57:00 +0200 (CEST)
From: Alex Bereza <alex@bereza.email>
Date: Wed, 01 Apr 2026 12:56:33 +0200
Subject: [PATCH v3 2/2] dmaengine: xilinx_dma: Rename XILINX_DMA_LOOP_COUNT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-fix-atomic-poll-timeout-regression-v3-2-85508f0aedde@bereza.email>
References: <20260401-fix-atomic-poll-timeout-regression-v3-0-85508f0aedde@bereza.email>
In-Reply-To: <20260401-fix-atomic-poll-timeout-regression-v3-0-85508f0aedde@bereza.email>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Michal Simek <michal.simek@amd.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Tony Lindgren <tony@atomide.com>, 
 Kedareswara rao Appana <appana.durga.rao@xilinx.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Alex Bereza <alex@bereza.email>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_035702_901990_7C7FD6AC 
X-CRM114-Status: GOOD (  11.89  )
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

Rename XILINX_DMA_LOOP_COUNT to XILINX_DMA_POLL_TIMEOUT_US because the
former is incorrect. It is a timeout value for polling various register
bits in microseconds. It is not a loop count.

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


