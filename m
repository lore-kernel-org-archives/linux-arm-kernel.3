Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E69FD0045
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 01:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fLnh8cJkpRyEUBmwcxwXWzoK4z1Idun0OWB6GKOJpWM=; b=Qa3imeVPLoI9tVpcvqWMF9Be5O
	jJULhz+4h4EHlzNZslLkvRgCy270oCiZHz7JB80//GETEQ27ZDGsC1N/+1LHWkjYgRlSNUE1gtu1A
	Cv3YC7FPugI4bAWxncQk87vFVft9O2nS+8UMuoZTGAbN8XCCqmmuRcKPN2duRTtg0S6XYX541PtYU
	rSwTj5oI+TlcxXxhvnuMJEUXCxZv+mteQRcPHZQvUNzreKxA196zIAtdYvs6iD7AseCMi0abPpO+2
	7SHVorgSaWHavvo4pbVx8TGN2Ud5XeYNy1s6A3XpjmTt3odBnbF4yyYJgHUWLMFfaRHfzkLgLhamW
	MRBmpD7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwW0Y-0000000Agrg-2HsV;
	Sun, 01 Mar 2026 01:54:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwW0V-0000000Agpw-1RVl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 01:54:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 013354058A;
	Sun,  1 Mar 2026 01:54:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05087C19421;
	Sun,  1 Mar 2026 01:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772330046;
	bh=SO2B0CyaS7nK/LfgfMKexgW2jOXtjzciAdXsj8TqOF4=;
	h=From:To:Cc:Subject:Date:From;
	b=EB8jKFh2IjDi+KKfD9/zgmPowEG+TjjiAacKHfTO7PvGAjXP3xuRskL2hB+jdhFI6
	 eNgP31dCqdfoqDe1pzaEg3+2nv8J7Y8T348m5soz4XIXjR/HnCJxDOXVk39cCRHmap
	 r93m0WqF7JksdMd4y/Rw9FwJlFIt6DQBLq6W0yFRC64e0VKLVFZksflPfRb8skNUij
	 UM+reUI1/E6F6iDXnPKv84hfa2HPm+pOqWqLyHrSTna70AIJ8mwMDVfwqBG71Mzhcy
	 SFHmR+PI7JKhJzer/KUwTZ3cSD2C+4N21uiRn6yMJH5w/X3AH/9P8WpnHm6bfpttnu
	 rr08xRauPZPZA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	carlos.song@nxp.com
Cc: Frank Li <Frank.Li@nxp.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: FAILED: Patch "i2c: imx-lpi2c: fix SMBus block read NACK after byte count" failed to apply to 5.15-stable tree
Date: Sat, 28 Feb 2026 20:54:04 -0500
Message-ID: <20260301015404.1721001-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_175407_417600_66E4DB80 
X-CRM114-Status: GOOD (  25.46  )
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

The patch below does not apply to the 5.15-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From efdc383d1cc28d45cbf5a23b5ffa997010aaacb4 Mon Sep 17 00:00:00 2001
From: Carlos Song <carlos.song@nxp.com>
Date: Fri, 23 Jan 2026 18:54:58 +0800
Subject: [PATCH] i2c: imx-lpi2c: fix SMBus block read NACK after byte count

The LPI2C controller sends a NACK at the end of a receive command
unless another receive command is already queued in MTDR. During
SMBus block reads, this causes the controller to NACK immediately
after receiving the block length byte, aborting the transfer before
the data bytes are read.

Fix this by queueing a second receive command as soon as the block
length byte is received, keeping MTDR non-empty and ensuring
continuous ACKs. The initial receive command reads the block length,
and the subsequent command reads the remaining data bytes according
to the reported length.

Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus driver")
Signed-off-by: Carlos Song <carlos.song@nxp.com>
Cc: <stable@vger.kernel.org> # v4.10+
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
Link: https://lore.kernel.org/r/20260123105459.3448822-1-carlos.song@nxp.com
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 107 ++++++++++++++++++++++-------
 1 file changed, 83 insertions(+), 24 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index be7134eefc2f5..f97f73faec82d 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -5,6 +5,7 @@
  * Copyright 2016 Freescale Semiconductor, Inc.
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
@@ -90,6 +91,7 @@
 #define MRDR_RXEMPTY	BIT(14)
 #define MDER_TDDE	BIT(0)
 #define MDER_RDDE	BIT(1)
+#define MSR_RDF_ASSERTED(x) FIELD_GET(MSR_RDF, (x))
 
 #define SCR_SEN		BIT(0)
 #define SCR_RST		BIT(1)
@@ -482,7 +484,7 @@ static bool lpi2c_imx_write_txfifo(struct lpi2c_imx_struct *lpi2c_imx, bool atom
 
 static bool lpi2c_imx_read_rxfifo(struct lpi2c_imx_struct *lpi2c_imx, bool atomic)
 {
-	unsigned int blocklen, remaining;
+	unsigned int remaining;
 	unsigned int temp, data;
 
 	do {
@@ -493,15 +495,6 @@ static bool lpi2c_imx_read_rxfifo(struct lpi2c_imx_struct *lpi2c_imx, bool atomi
 		lpi2c_imx->rx_buf[lpi2c_imx->delivered++] = data & 0xff;
 	} while (1);
 
-	/*
-	 * First byte is the length of remaining packet in the SMBus block
-	 * data read. Add it to msgs->len.
-	 */
-	if (lpi2c_imx->block_data) {
-		blocklen = lpi2c_imx->rx_buf[0];
-		lpi2c_imx->msglen += blocklen;
-	}
-
 	remaining = lpi2c_imx->msglen - lpi2c_imx->delivered;
 
 	if (!remaining) {
@@ -514,12 +507,7 @@ static bool lpi2c_imx_read_rxfifo(struct lpi2c_imx_struct *lpi2c_imx, bool atomi
 	lpi2c_imx_set_rx_watermark(lpi2c_imx);
 
 	/* multiple receive commands */
-	if (lpi2c_imx->block_data) {
-		lpi2c_imx->block_data = 0;
-		temp = remaining;
-		temp |= (RECV_DATA << 8);
-		writel(temp, lpi2c_imx->base + LPI2C_MTDR);
-	} else if (!(lpi2c_imx->delivered & 0xff)) {
+	if (!(lpi2c_imx->delivered & 0xff)) {
 		temp = (remaining > CHUNK_DATA ? CHUNK_DATA : remaining) - 1;
 		temp |= (RECV_DATA << 8);
 		writel(temp, lpi2c_imx->base + LPI2C_MTDR);
@@ -557,18 +545,77 @@ static int lpi2c_imx_write_atomic(struct lpi2c_imx_struct *lpi2c_imx,
 	return err;
 }
 
-static void lpi2c_imx_read_init(struct lpi2c_imx_struct *lpi2c_imx,
-				struct i2c_msg *msgs)
+static unsigned int lpi2c_SMBus_block_read_length_byte(struct lpi2c_imx_struct *lpi2c_imx)
 {
-	unsigned int temp;
+	unsigned int data;
+
+	data = readl(lpi2c_imx->base + LPI2C_MRDR);
+	lpi2c_imx->rx_buf[lpi2c_imx->delivered++] = data & 0xff;
+
+	return data;
+}
+
+static int lpi2c_imx_read_init(struct lpi2c_imx_struct *lpi2c_imx,
+			       struct i2c_msg *msgs)
+{
+	unsigned int temp, val, block_len;
+	int ret;
 
 	lpi2c_imx->rx_buf = msgs->buf;
 	lpi2c_imx->block_data = msgs->flags & I2C_M_RECV_LEN;
 
 	lpi2c_imx_set_rx_watermark(lpi2c_imx);
-	temp = msgs->len > CHUNK_DATA ? CHUNK_DATA - 1 : msgs->len - 1;
-	temp |= (RECV_DATA << 8);
-	writel(temp, lpi2c_imx->base + LPI2C_MTDR);
+
+	if (!lpi2c_imx->block_data) {
+		temp = msgs->len > CHUNK_DATA ? CHUNK_DATA - 1 : msgs->len - 1;
+		temp |= (RECV_DATA << 8);
+		writel(temp, lpi2c_imx->base + LPI2C_MTDR);
+	} else {
+		/*
+		 * The LPI2C controller automatically sends a NACK after the last byte of a
+		 * receive command, unless the next command in MTDR is also a receive command.
+		 * If MTDR is empty when a receive completes, a NACK is sent by default.
+		 *
+		 * To comply with the SMBus block read spec, we start with a 2-byte read:
+		 * The first byte in RXFIFO is the block length. Once this byte arrives, the
+		 * controller immediately updates MTDR with the next read command, ensuring
+		 * continuous ACK instead of NACK.
+		 *
+		 * The second byte is the first block data byte. Therefore, the subsequent
+		 * read command should request (block_len - 1) bytes, since one data byte
+		 * has already been read.
+		 */
+
+		writel((RECV_DATA << 8) | 0x01, lpi2c_imx->base + LPI2C_MTDR);
+
+		ret = readl_poll_timeout(lpi2c_imx->base + LPI2C_MSR, val,
+					 MSR_RDF_ASSERTED(val), 1, 1000);
+		if (ret) {
+			dev_err(&lpi2c_imx->adapter.dev, "SMBus read count failed %d\n", ret);
+			return ret;
+		}
+
+		/* Read block length byte and confirm this SMBus transfer meets protocol */
+		block_len = lpi2c_SMBus_block_read_length_byte(lpi2c_imx);
+		if (block_len == 0 || block_len > I2C_SMBUS_BLOCK_MAX) {
+			dev_err(&lpi2c_imx->adapter.dev, "Invalid SMBus block read length\n");
+			return -EPROTO;
+		}
+
+		/*
+		 * When block_len shows more bytes need to be read, update second read command to
+		 * keep MTDR non-empty and ensuring continuous ACKs. Only update command register
+		 * here. All block bytes will be read out at IRQ handler or lpi2c_imx_read_atomic()
+		 * function.
+		 */
+		if (block_len > 1)
+			writel((RECV_DATA << 8) | (block_len - 2), lpi2c_imx->base + LPI2C_MTDR);
+
+		lpi2c_imx->msglen += block_len;
+		msgs->len += block_len;
+	}
+
+	return 0;
 }
 
 static bool lpi2c_imx_read_chunk_atomic(struct lpi2c_imx_struct *lpi2c_imx)
@@ -613,6 +660,10 @@ static bool is_use_dma(struct lpi2c_imx_struct *lpi2c_imx, struct i2c_msg *msg)
 	if (!lpi2c_imx->can_use_dma)
 		return false;
 
+	/* DMA is not suitable for SMBus block read */
+	if (msg->flags & I2C_M_RECV_LEN)
+		return false;
+
 	/*
 	 * When the length of data is less than I2C_DMA_THRESHOLD,
 	 * cpu mode is used directly to avoid low performance.
@@ -623,10 +674,14 @@ static bool is_use_dma(struct lpi2c_imx_struct *lpi2c_imx, struct i2c_msg *msg)
 static int lpi2c_imx_pio_xfer(struct lpi2c_imx_struct *lpi2c_imx,
 			      struct i2c_msg *msg)
 {
+	int ret;
+
 	reinit_completion(&lpi2c_imx->complete);
 
 	if (msg->flags & I2C_M_RD) {
-		lpi2c_imx_read_init(lpi2c_imx, msg);
+		ret = lpi2c_imx_read_init(lpi2c_imx, msg);
+		if (ret)
+			return ret;
 		lpi2c_imx_intctrl(lpi2c_imx, MIER_RDIE | MIER_NDIE);
 	} else {
 		lpi2c_imx_write(lpi2c_imx, msg);
@@ -638,8 +693,12 @@ static int lpi2c_imx_pio_xfer(struct lpi2c_imx_struct *lpi2c_imx,
 static int lpi2c_imx_pio_xfer_atomic(struct lpi2c_imx_struct *lpi2c_imx,
 				     struct i2c_msg *msg)
 {
+	int ret;
+
 	if (msg->flags & I2C_M_RD) {
-		lpi2c_imx_read_init(lpi2c_imx, msg);
+		ret = lpi2c_imx_read_init(lpi2c_imx, msg);
+		if (ret)
+			return ret;
 		return lpi2c_imx_read_atomic(lpi2c_imx, msg);
 	}
 
-- 
2.51.0





