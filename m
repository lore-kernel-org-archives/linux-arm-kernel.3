Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBA9606D824
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 20:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3PRxtGDC;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qMLt/RJh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EBvELyKu2dMwI8vyGLt+92VXSFlR51MbGColCfpUNIs=; b=3PRxtGDCdTpOeO
	4/RU+EZ62QHbP/t5ACJP4ODkZcb6TbceQbyf7rytxBpSW1Balshq8Q9rBPTXG6EVymOjqqlBHgN3V
	3XheWqh0yNP/aCaxf09E4+gUnovDCIlTkptOkRjYkSNqtj8kzKDXJSV8Oeo+SnoiU7losxd/ax/hT
	PIsKDxsKhlmWa1c5W3OV44ppieqYLCyOWH/ktV2lSeMZpz1IXgLKEGWIbYtrMr0kX6DD+LiCdtNJz
	amANQOHycvG7PKQ97EKQyDFiDPCrOYaXAkl7XreKlQx+fimAtrn9z+2aMe0sW54m+H/quA2+jLwwQ
	nhREYlztrWR5Fe+qqoGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4EC-0000000AaOf-3B3J;
	Thu, 05 Nov 2026 20:38:32 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4E2-0000000AaLN-39i0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 20:38:27 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6b1b13e09ffso1989335a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 12:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793911100; x=1794515900; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EBvELyKu2dMwI8vyGLt+92VXSFlR51MbGColCfpUNIs=;
        b=qMLt/RJhUHnsCiuS3nMIHPHFA/M5cd6xuGdCRKMm02RUzaCfgjDdzq7r3G2lQBk7MD
         YVk52BpHMPYBeZMDszoCHbItgQtG3xwXM1+4LdYEiSjacMKecUsZYCxsp6OMhjpWl+dU
         /hBghvbRB9dgumh95WvDhhBEPxglWXFcC4oo9Ova868lA0W6N2hw/5FV8JuFYidKobsm
         R7/KHBeWaLpsl1mmNxK3Oe/kgalP836GPAAkDB3nqhKuS6oEDezPamUE0rLAwdmJrX7d
         571dAUIG3isisY9sQofcCu9RgSViVZfSrna4gdb2zwWyUBzDiN9eQYmiCgRQnMlBYq4H
         FzGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911100; x=1794515900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EBvELyKu2dMwI8vyGLt+92VXSFlR51MbGColCfpUNIs=;
        b=hgOqlc84clghLEupnkg6worr2nBsf+xOJGfAEQM0zNzE/1cLbzcyuQ7bieyFCTXRcq
         gE2OY8xCRTaTQg8OwLa6yQeARgaNNkB3amD5OtTVaqSQHpHB2NQW93j1BrVekIBM0F1G
         Ni0idxS1PiJXNCz2Yt6zwSF+fFAzx0ZEbP4rq36rJQPs9UtS7VXKvY7kK5cI8AjfnTtc
         4SlMmAuSWZ919Qdv5ckKaYpK6218PAkXdtmOpRyU6OIOW4s8H4+NnQp84+OMIvkybGmO
         i8KyIXjvqn46MEugq2xSzziSDMPSzfi5waehR8Xra/eKy9w0cdAdBFd8E4NozEKZH6om
         BuYg==
X-Forwarded-Encrypted: i=1; AKwUvBwq5RF+xiSfnwUTgATK1ptE8uqjAD/8lkfBPKmehFjfWvysB4tS8zFoi1R3svQ90vponM22aVeAc+OkAM/cSzcB@lists.infradead.org
X-Gm-Message-State: APuU4Z/6K9fl2EvUHZUeMdC8U7BYyMFdJvqDHp2Ct2sK+FynBmZpVTY7
	DbQEPa2HajV0g8yS39VE2cL9w9odnXT7IZ3Faw1xWloHyRrmdu7TuP2s
X-Gm-Gg: AYBFou18rVvY2q3SeTvuzcsKJgrzboJe189pWM9xGJ25Rl3f9ZYeZrdI0t7+A+ZJ0hL
	QgDgizeRrGLkYU5e7ElBOSm9tgKU8EPSfZNG5YfAMU0gHF5201BwyT08QWUgIUev2tIYkpdrVb1
	Qg3WpfCKDzAQlwkCUcRqntD8iJ5iniaQJAEbUM64Nvehd1HLLe1TBT8X2416FsRPhx/o76wCV5Z
	BPsGZ6eofwQRTmVwps0vMVg59zsjJdiofjAkxtq3TnWWNfOVenlTLq+DGT/6SnGqVZ9xw3BL1ea
	JZwZOK9EdG7TBo0ZgURO+0ZjR+3MBVzLxXEwlapN/82uCteVL5LHARqN0mDVQvhMUWWoe5m2rwk
	xrkvjJkBlMV5UHyEo9B/90uMI5Py+SPOiFozoxxJaXYGe7QoLR6KL+x64hMXDHNKqAX8df3l3O3
	zA9nq1eOTrrxw7HSyJ9la8oMiayRdBeDRJWHCmo2BNPExRTaUExW9lncHX968gshznaaXTHr1Lr
	6rnCAuF9tPGVEX+KZUjiFYIA5kVRWO/PspZR4Tx7SwaAsDE0OSdEz2HyDSmHWr20r7QjFvUltwM
	3dIOzEHXAmzmgVLQiBoH0dYiL+hLv/8g/QsUNNzdJ0yHA5cvvTJoBR1yAf1kMx6KXkHbJzcxbVQ
	hcx/nrkdnYBvvwRMlHPZMurDHzDiRsqgTG59F1i/kHgiDy5lDkhtfq8G0j7joxudCbAA3wK81BX
	jajHlvedK8Wz7t5/9CwD1TK3M2PW0YbeIbrdm9Z6s71XtIUnbb4JGeP60kgT8O9lndk+jC
X-Received: by 2002:a05:6402:2111:b0:6b4:95cf:24f with SMTP id 4fb4d7f45d1cf-6b5977ed8f8mr277799a12.19.1793911099648;
        Thu, 05 Nov 2026 12:38:19 -0800 (PST)
Received: from mb-HP-ZBook-Power-16-inch-G11-Mobile-Workstation-PC.dynamic.ziggo.nl (2001-1c00-1106-0900-938c-4ed8-a3bb-093f.cable.dynamic.v6.ziggo.nl. [2001:1c00:1106:900:938c:4ed8:a3bb:93f])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b57feb668bsm886834a12.13.2026.11.05.12.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:38:19 -0800 (PST)
From: Mario Behn <mario.behn@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>
Cc: linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mario Behn <mario.behn@gmail.com>
Subject: [PATCH v1 1/2] spi: zynq-qspi: read flash above 16 MiB via the extended address register
Date: Thu,  5 Nov 2026 21:37:33 +0100
Message-ID: <20261105203734.979168-2-mario.behn@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105203734.979168-1-mario.behn@gmail.com>
References: <20261105203734.979168-1-mario.behn@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_123825_778196_F4D6A2C7 
X-CRM114-Status: GOOD (  31.00  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


The Zynq QSPI controller sends at most 3 address bytes, and spi-nor needs
4-byte addresses for a flash larger than 16 MiB (W25Q256 on the Pluto+), so
the probe failed with -22 and no /dev/mtd* appeared.

Keep the flash in 3-byte mode and handle a 4-byte-address operation
inside the controller driver: write enable, Write Extended Address
Register with addr >> 24, the operation with the 3-byte opcode and the
low 24 address bits, then the register back to 0, so that U-Boot and the
BootROM find bank 0 after a reset. adjust_op_size keeps one read inside
a 16 MiB bank. EN4B and EX4B are swallowed so that the flash never
leaves 3-byte mode.

Also stop writing the address bytes through xqspi->txbuf into the
spi_mem_op structure; use a local buffer.

This stage is READ ONLY: every operation that does not read data (write
enable, program, erase, status register write) is refused with -EROFS.
Verified on the Pluto+ (W25Q256, ef4019): the md5 of all four partitions
equals the one read on 6.12, including the 30 MiB partition that crosses
the bank boundary.

Signed-off-by: Mario Behn <mario.behn@gmail.com>
---
 drivers/spi/spi-zynq-qspi.c | 152 +++++++++++++++++++++++++++++++++---
 1 file changed, 142 insertions(+), 10 deletions(-)

diff --git a/drivers/spi/spi-zynq-qspi.c b/drivers/spi/spi-zynq-qspi.c
index d762aaf452af..e20019a03964 100644
--- a/drivers/spi/spi-zynq-qspi.c
+++ b/drivers/spi/spi-zynq-qspi.c
@@ -16,6 +16,7 @@
 #include <linux/spi/spi.h>
 #include <linux/workqueue.h>
 #include <linux/spi/spi-mem.h>
+#include <linux/mtd/spi-nor.h>
 
 /* Register offset definitions */
 #define ZYNQ_QSPI_CONFIG_OFFSET		0x00 /* Configuration  Register, RW */
@@ -222,21 +223,69 @@ static void zynq_qspi_init_hw(struct zynq_qspi *xqspi, unsigned int num_cs)
 			ZYNQ_QSPI_ENABLE_ENABLE_MASK);
 }
 
+/*
+ * The controller sends at most 3 address bytes. A flash larger than 16 MiB
+ * is therefore kept in 3-byte mode and reached through the Extended Address
+ * Register (EAR): an operation with a 4-byte address is turned into
+ * WREN + WREAR(addr >> 24) + the 3-byte form of the operation, and the EAR is
+ * set back to 0 afterwards, so that U-Boot and the BootROM find the flash in
+ * bank 0 after a reset (the same scheme as the ADI 6.12 spi-nor code, but in
+ * the controller driver instead of the spi-nor core).
+ */
+#define ZYNQ_QSPI_BANK_SIZE		0x1000000U
+#define ZYNQ_QSPI_OP_WREAR		0xc5	/* Write Extended Address Register */
+
 static bool zynq_qspi_supports_op(struct spi_mem *mem,
 				  const struct spi_mem_op *op)
 {
-	if (!spi_mem_default_supports_op(mem, op))
+	struct spi_mem_op nop = *op;
+
+	/* check the shape of the operation as if the address had 3 bytes */
+	if (nop.addr.nbytes == 4)
+		nop.addr.nbytes = 3;
+	if (!spi_mem_default_supports_op(mem, &nop))
 		return false;
 
-	/*
-	 * The number of address bytes should be equal to or less than 3 bytes.
-	 */
-	if (op->addr.nbytes > 3)
+	if (op->addr.nbytes > 4)
 		return false;
 
 	return true;
 }
 
+static int zynq_qspi_adjust_op_size(struct spi_mem *mem,
+				    struct spi_mem_op *op)
+{
+	if (op->addr.nbytes == 4 && op->data.nbytes) {
+		u32 room = ZYNQ_QSPI_BANK_SIZE - (op->addr.val & (ZYNQ_QSPI_BANK_SIZE - 1));
+
+		/* one operation must not cross a 16 MiB bank */
+		if (op->data.nbytes > room)
+			op->data.nbytes = room;
+	}
+
+	return 0;
+}
+
+/* opcode with a 4-byte address -> the same opcode with a 3-byte address */
+static u8 zynq_qspi_opcode_3b(u8 opcode)
+{
+	switch (opcode) {
+	case SPINOR_OP_READ_4B:		return SPINOR_OP_READ;
+	case SPINOR_OP_READ_FAST_4B:	return SPINOR_OP_READ_FAST;
+	case SPINOR_OP_READ_1_1_2_4B:	return SPINOR_OP_READ_1_1_2;
+	case SPINOR_OP_READ_1_2_2_4B:	return SPINOR_OP_READ_1_2_2;
+	case SPINOR_OP_READ_1_1_4_4B:	return SPINOR_OP_READ_1_1_4;
+	case SPINOR_OP_READ_1_4_4_4B:	return SPINOR_OP_READ_1_4_4;
+	case SPINOR_OP_PP_4B:		return SPINOR_OP_PP;
+	case SPINOR_OP_PP_1_1_4_4B:	return SPINOR_OP_PP_1_1_4;
+	case SPINOR_OP_PP_1_4_4_4B:	return SPINOR_OP_PP_1_4_4;
+	case SPINOR_OP_BE_4K_4B:	return SPINOR_OP_BE_4K;
+	case SPINOR_OP_BE_32K_4B:	return SPINOR_OP_BE_32K;
+	case SPINOR_OP_SE_4B:		return SPINOR_OP_SE;
+	default:			return opcode;	/* already a 3-byte opcode */
+	}
+}
+
 /**
  * zynq_qspi_rxfifo_op - Read 1..4 bytes from RxFIFO to RX buffer
  * @xqspi:	Pointer to the zynq_qspi structure
@@ -522,12 +571,13 @@ static irqreturn_t zynq_qspi_irq(int irq, void *dev_id)
  *
  * Return: 0 in case of success, a negative error code otherwise.
  */
-static int zynq_qspi_exec_mem_op(struct spi_mem *mem,
-				 const struct spi_mem_op *op)
+static int zynq_qspi_exec_plain_op(struct spi_mem *mem,
+				   const struct spi_mem_op *op)
 {
 	struct zynq_qspi *xqspi = spi_controller_get_devdata(mem->spi->controller);
 	int err = 0, i;
 	u8 *tmpbuf;
+	u8 addrbuf[3];
 
 	zynq_qspi_chipselect(mem->spi, true);
 	zynq_qspi_config_op(xqspi, mem->spi, op);
@@ -547,10 +597,10 @@ static int zynq_qspi_exec_mem_op(struct spi_mem *mem,
 	}
 
 	if (op->addr.nbytes) {
-		for (i = 0; i < op->addr.nbytes; i++) {
-			xqspi->txbuf[i] = op->addr.val >>
+		for (i = 0; i < op->addr.nbytes; i++)
+			addrbuf[i] = op->addr.val >>
 					(8 * (op->addr.nbytes - i - 1));
-		}
+		xqspi->txbuf = addrbuf;
 
 		reinit_completion(&xqspi->data_completion);
 		xqspi->rxbuf = NULL;
@@ -611,9 +661,91 @@ static int zynq_qspi_exec_mem_op(struct spi_mem *mem,
 	return err;
 }
 
+/* Stage 2: the flash is read-only through this driver. */
+static bool zynq_qspi_op_is_read(const struct spi_mem_op *op)
+{
+	if (op->data.nbytes && op->data.dir == SPI_MEM_DATA_IN)
+		return true;
+	return false;
+}
+
+static int zynq_qspi_ear_cmds(struct spi_mem *mem, const struct spi_mem_op *like,
+			      u8 ear, bool wren_after)
+{
+	struct spi_mem_op wren = SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WREN, 1),
+					    SPI_MEM_OP_NO_ADDR,
+					    SPI_MEM_OP_NO_DUMMY,
+					    SPI_MEM_OP_NO_DATA);
+	u8 *buf = kmalloc(1, GFP_KERNEL);
+	struct spi_mem_op wrear = SPI_MEM_OP(SPI_MEM_OP_CMD(ZYNQ_QSPI_OP_WREAR, 1),
+					     SPI_MEM_OP_NO_ADDR,
+					     SPI_MEM_OP_NO_DUMMY,
+					     SPI_MEM_OP_DATA_OUT(1, buf, 1));
+	int ret;
+
+	if (!buf)
+		return -ENOMEM;
+	*buf = ear;
+	wren.max_freq = like->max_freq;
+	wrear.max_freq = like->max_freq;
+
+	ret = zynq_qspi_exec_plain_op(mem, &wren);
+	if (!ret)
+		ret = zynq_qspi_exec_plain_op(mem, &wrear);
+	if (!ret && wren_after)
+		ret = zynq_qspi_exec_plain_op(mem, &wren);
+	kfree(buf);
+	return ret;
+}
+
+static int zynq_qspi_exec_mem_op(struct spi_mem *mem,
+				 const struct spi_mem_op *op)
+{
+	struct spi_mem_op nop = *op;
+	u8 ear;
+	int ret, ret2;
+
+	/* Leaving 4-byte mode is not needed: the flash is never put in it. */
+	if (!op->addr.nbytes && !op->data.nbytes && !op->dummy.nbytes &&
+	    (op->cmd.opcode == SPINOR_OP_EN4B || op->cmd.opcode == SPINOR_OP_EX4B))
+		return 0;
+
+	/* read-only guard: only operations that read data from the flash */
+	if (!zynq_qspi_op_is_read(op)) {
+		dev_warn_ratelimited(&mem->spi->dev,
+				     "read-only: op %#x refused\n", op->cmd.opcode);
+		return -EROFS;
+	}
+
+	if (op->addr.nbytes != 4)
+		return zynq_qspi_exec_plain_op(mem, op);
+
+	ear = (op->addr.val >> 24) & 0xff;
+	nop.cmd.opcode = zynq_qspi_opcode_3b(op->cmd.opcode);
+	nop.addr.nbytes = 3;
+	nop.addr.val = op->addr.val & (ZYNQ_QSPI_BANK_SIZE - 1);
+
+	if (ear) {
+		ret = zynq_qspi_ear_cmds(mem, op, ear, false);
+		if (ret)
+			return ret;
+	}
+
+	ret = zynq_qspi_exec_plain_op(mem, &nop);
+
+	if (ear) {
+		ret2 = zynq_qspi_ear_cmds(mem, op, 0, false);
+		if (!ret)
+			ret = ret2;
+	}
+
+	return ret;
+}
+
 static const struct spi_controller_mem_ops zynq_qspi_mem_ops = {
 	.supports_op = zynq_qspi_supports_op,
 	.exec_op = zynq_qspi_exec_mem_op,
+	.adjust_op_size = zynq_qspi_adjust_op_size,
 };
 
 static const struct spi_controller_mem_caps zynq_qspi_mem_caps = {
-- 
2.53.0


