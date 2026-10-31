Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E4A606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 20:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h7jGSU7o;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i2RO2T6D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=lLEWRWhxY0X5Qhcbz/EtLWHCv/8fQ6WLPeE028PNRtE=; b=h7jGSU7okleZSPHiGvCDb+iNKm
	R7rDL44Qx2WcM5U53CfVJ231+LpQq1xWom60qx4Bf0gEergWjBIyzm+2qkmysDgY9UDc4FPbEGqeR
	Xh8eZec1wRKojOJOLP4hQ36YpYZYRk1qXerT6VCmDmLF90Og3jWIXs8RY1YCj3rhmTWDOsDYfOR0q
	Cu+B3QdR2mtNMtkt4rlmrOX9wmuFvQzo+mQ0n0Ul4liuEBDgEbNWBvbiL7nPNoCHRNQknMDicKa1f
	ut8s2SPkP4bf6mgIK/WInpXN/qpbF94BHTRTlRMxHv0auN69hvgJXXxwajg7gGSed2NljN0YzC/fz
	Nl+PskeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNFOk-0000000Dedv-4Ap0;
	Sat, 31 Oct 2026 20:09:54 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNFOi-0000000DedD-1eCd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 20:09:54 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2e5fb79ce82so11522005ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 13:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793477391; x=1794082191; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lLEWRWhxY0X5Qhcbz/EtLWHCv/8fQ6WLPeE028PNRtE=;
        b=i2RO2T6DceVJhXyYhh6KSi/22W9WptRho70kHwE5luWFtezzlmbvAYHQ1rUr0OwMkc
         Vn4EoAXBBOshjB9T2z1cM43C9n7HfuNQZL4eI5DbEaR9nLnNMJuXD3xPfxH0GkzPUXSm
         dBn64z/7xi5yoLvAaju3fQulovnuK1IZSFbm/H22Pj4A//x5a7p+uO2G9qRzVAykM4NN
         lnnBIcaWR8EP7wvxGWtaofqcAp0C74koeOWWHU3+3AZLwg5huU/3wDYPWR9RnslSfE5o
         zD4gAdQ+dfElfN/RHI7G4GeHB0k7h78CIsKB5xM19qXjiBoney+vPOappE156bJQUQMA
         qzDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793477391; x=1794082191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lLEWRWhxY0X5Qhcbz/EtLWHCv/8fQ6WLPeE028PNRtE=;
        b=NHKmwSrhvBYHkSsi+JtMPGULiAn2o+X4dst+M4X6VX6G8GTHKl3JOoqjOoEk6Uth0J
         1A551rT55F5Iq7gxszfYUm5sgP6xo3OHaH+4h9XML0rL5XP11PnYMotid6OnInTR6VX1
         LRgHaFAysBtNEBjBNLXDLDqhQ3OD4EmVNKKLEuoJRYz20jIVluLwQ7pWp7hyN3GxvYu0
         BgtWOwPo0sewjiMOw/xPGq6fPiIudGDD0dcO1D63NL714y69R3hgE6mwdziTuldQFVEf
         FBKx83IeWgEmNNRJyRMLUvv5nr82Rl7kOGOi8COnCvzXDQwBcl3wpRKxD7pw/iF2s1yi
         Z3SA==
X-Forwarded-Encrypted: i=1; AKwUvBwVwFQWKFbrqAKm0n1oGDuAQRv/bkPY1OJg5Y3cafINSQeSzi7I/2Hcp2EabTcimVrA4N5yS/U7FHpqIKr/Mfv2@lists.infradead.org
X-Gm-Message-State: AFq9FYIFw/Y5cuszuJMLbI8pddVPlXk6qXrKmAX8kwoFgGPtYQax9hUU
	ivgq3TxBuOqVTDE2A1zcImiGy7XWKG9V/A/jGEghVi0QHOob1i35W74V
X-Gm-Gg: AYBFou24mWoGRFJH7riNHwHbAJRQYn4o2xbg0V2Ps0X05WLJrK4H9qnOMBghDUb7Q4v
	1+sclBQJJQqzkyvu+kBaqjjVLttDoAw12cC26gQo8ZMWYdlSxKtaMYXXI19r042WYz12Uos/ldt
	XjKxg8bD+PbrA4UMgb3BuAj5YK3J+5VpdxhcLHvp2KF1O5CBp0nR69ArtiDRPzR6KPXD9QzzJm/
	NjtMQ6gPrOfVpI4A24rvYqLnQHs7cUYHyc+XmS9VRKHr6YjBpRsx173ir2jEvoLjAtkRUVdbo+j
	86k5M3+MED4yBgBC7oyz8kY2K1PRDrXrOCFVa51gU9Rsc9b+x7owTIp30U8KZ3JLTsvCqZjPuSB
	myIrlVfdeDgwera/NjZ34b58/WL6synMNdfs99Pmkc5whmmoaZI7QOKcIaUlnGGL3JJ97QClDih
	vN8+pRLQH8DCUeHafyz+yk83y6JHUKy81GfGdULQPk405uKlhmvj7RpoAs5qOZLy74g5GX4YyWj
	PJ+ZxFFLMJssg7Vg+ZQNx97SOe0pROWLT3mnX4bOM0M2AcxDQYAo+C7XHzsN8aESPudBIATgA3R
	/9KNZyFjuAQ945wFTizW9xwEhI33fAvViC+WfwcG4NccSm02bHY=
X-Received: by 2002:a17:903:1a08:b0:2e5:54b9:6b37 with SMTP id d9443c01a7336-2eb364bbb41mr60052995ad.28.1793477390781;
        Sat, 31 Oct 2026 13:09:50 -0700 (PDT)
Received: from ArchLinux-E5-Server.lan ([240e:3a2:ac01:77c0:1:3024:80c:fbbb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb38e9633fsm16660465ad.0.2026.10.31.13.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 13:09:49 -0700 (PDT)
From: ZHENPENG YUAN <yuanzhenpeng210@gmail.com>
To: linux-mmc@vger.kernel.org,
	ulfh@kernel.org
Cc: martin.blumenstingl@googlemail.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ZHENPENG YUAN <yuanzhenpeng210@gmail.com>
Subject: [RFC PATCH] mmc: meson-mx-sdhc: add DMA bounce buffer support
Date: Sun,  1 Nov 2026 04:09:25 +0800
Message-ID: <20261031200925.3364-1-yuanzhenpeng210@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_130952_430276_39F8A06A 
X-CRM114-Status: GOOD (  27.72  )
X-Spam-Score: -1.9 (-)
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

The Meson MX SDHC controller uses a single DMA address for each
transfer. Since the driver leaves max_segs at the MMC core default
of 1, large I/O requests are split into single-segment requests,
typically 4 KiB each.

On an Amlogic S805, this limits eMMC sequential read throughput
to approximately 15 MiB/s despite using HS200 timing.

Add a 128 KiB DMA bounce buffer for multi-segment requests and
advertise up to 64 scatterlist segments. Single-segment requests
continue to use direct DMA. If buffer allocation fails, fall back
to the original single-segment limit.

Testing on a Xunlei OneCloud (Meson8b, Samsung 8GME4R eMMC)
running Linux 7.3.1:

  Block size       Before       After
  4 KiB            14.47        14.69 MiB/s
  64 KiB           15.06        63.21 MiB/s
  128 KiB          15.08        75.13 MiB/s
  1 MiB            15.07        75.93 MiB/s

For a 128 MiB sequential read, block requests decreased from
32768 to 1024.

Direct I/O SHA256 readback verification and fio CRC32C write
verification passed. No MMC errors were observed.

Assisted-by: LLM
Signed-off-by: ZHENPENG YUAN <yuanzhenpeng210@gmail.com>
---
 drivers/mmc/host/meson-mx-sdhc-mmc.c | 165 ++++++++++++++++++++++++---
 1 file changed, 149 insertions(+), 16 deletions(-)

diff --git a/drivers/mmc/host/meson-mx-sdhc-mmc.c b/drivers/mmc/host/meson-mx-sdhc-mmc.c
index fb49ea712..c62583a80 100644
--- a/drivers/mmc/host/meson-mx-sdhc-mmc.c
+++ b/drivers/mmc/host/meson-mx-sdhc-mmc.c
@@ -16,6 +16,7 @@
 #include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
+#include <linux/scatterlist.h>
 #include <linux/types.h>
 
 #include <linux/mmc/host.h>
@@ -29,6 +30,12 @@
 #define MESON_SDHC_MAX_BLK_SIZE					512
 #define MESON_SDHC_NUM_TUNING_TRIES				10
 
+/*
+ * A 128 KiB request spans at most 33 pages when it is not page aligned.
+ * The extra entries give the block layer room to merge a full request.
+ */
+#define MESON_SDHC_MAX_SEGS					64
+
 #define MESON_SDHC_WAIT_CMD_READY_SLEEP_US			1
 #define MESON_SDHC_WAIT_CMD_READY_TIMEOUT_US			100000
 #define MESON_SDHC_WAIT_BEFORE_SEND_SLEEP_US			1
@@ -48,6 +55,17 @@ struct meson_mx_sdhc_host {
 	struct mmc_command		*cmd;
 	int				error;
 
+	/*
+	 * The controller has a single DMA address register, so requests that
+	 * are not physically contiguous have to be bounced through this
+	 * buffer.
+	 */
+	void				*bounce_buf;
+	size_t				bounce_buf_size;
+	dma_addr_t			dma_addr;
+	unsigned int			dma_len;
+	bool				dma_bounce;
+
 	struct regmap			*regmap;
 
 	struct clk			*pclk;
@@ -220,8 +238,7 @@ static void meson_mx_sdhc_start_cmd(struct mmc_host *mmc,
 			   FIELD_PREP(MESON_SDHC_CTRL_PACK_LEN, pack_len));
 
 	if (cmd->data)
-		regmap_write(host->regmap, MESON_SDHC_ADDR,
-			     sg_dma_address(cmd->data->sg));
+		regmap_write(host->regmap, MESON_SDHC_ADDR, host->dma_addr);
 
 	meson_mx_sdhc_wait_cmd_ready(mmc);
 
@@ -362,32 +379,97 @@ static void meson_mx_sdhc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
 
 static int meson_mx_sdhc_map_dma(struct mmc_host *mmc, struct mmc_request *mrq)
 {
+	struct meson_mx_sdhc_host *host = mmc_priv(mmc);
 	struct mmc_data *data = mrq->data;
-	unsigned int dma_len;
+	enum dma_data_direction dir;
+	struct scatterlist *sg;
+	unsigned int len, total_len;
+	int i, nents;
 
 	if (!data)
 		return 0;
 
-	dma_len = dma_map_sg(mmc_dev(mmc), data->sg, data->sg_len,
-			     mmc_get_dma_dir(data));
-	if (!dma_len) {
-		dev_err(mmc_dev(mmc), "dma_map_sg failed\n");
+	dir = mmc_get_dma_dir(data);
+	len = data->blocks * data->blksz;
+	host->dma_len = len;
+	host->dma_bounce = false;
+
+	/*
+	 * A request that consists of a single scatterlist entry is already
+	 * contiguous from the controller's point of view and can be
+	 * programmed directly.  This is also the only case where transfers
+	 * larger than the advertised max_req_size may occur (SDIO).
+	 */
+	if (data->sg_len == 1 && data->sg->length >= len) {
+		nents = dma_map_sg(mmc_dev(mmc), data->sg, data->sg_len, dir);
+		if (!nents) {
+			dev_err(mmc_dev(mmc), "dma_map_sg failed\n");
+			return -ENOMEM;
+		}
+
+		host->dma_addr = sg_dma_address(data->sg);
+		return 0;
+	}
+
+	total_len = 0;
+	for_each_sg(data->sg, sg, data->sg_len, i)
+		total_len += sg->length;
+
+	if (!host->bounce_buf || len > host->bounce_buf_size ||
+	    total_len < len) {
+		dev_err(mmc_dev(mmc),
+			"cannot DMA %u bytes in %u segments\n",
+			len, data->sg_len);
+		return -EINVAL;
+	}
+
+	if (dir == DMA_TO_DEVICE) {
+		if (sg_copy_to_buffer(data->sg, data->sg_len, host->bounce_buf,
+				      len) != len) {
+			dev_err(mmc_dev(mmc),
+				"failed to copy data into the bounce buffer\n");
+			return -EIO;
+		}
+	}
+
+	host->dma_addr = dma_map_single(mmc_dev(mmc), host->bounce_buf, len,
+					dir);
+	if (dma_mapping_error(mmc_dev(mmc), host->dma_addr)) {
+		dev_err(mmc_dev(mmc), "dma_map_single failed\n");
 		return -ENOMEM;
 	}
 
+	host->dma_bounce = true;
+
 	return 0;
 }
 
+static void meson_mx_sdhc_unmap_dma(struct meson_mx_sdhc_host *host,
+				    struct mmc_data *data)
+{
+	struct device *dev = mmc_dev(host->mmc);
+
+	if (host->dma_bounce) {
+		dma_unmap_single(dev, host->dma_addr, host->dma_len,
+				 mmc_get_dma_dir(data));
+		host->dma_bounce = false;
+	} else {
+		dma_unmap_sg(dev, data->sg, data->sg_len,
+			     mmc_get_dma_dir(data));
+	}
+}
+
 static void meson_mx_sdhc_request(struct mmc_host *mmc, struct mmc_request *mrq)
 {
 	struct meson_mx_sdhc_host *host = mmc_priv(mmc);
 	struct mmc_command *cmd = mrq->cmd;
+	int ret = 0;
 
 	if (!host->error)
-		host->error = meson_mx_sdhc_map_dma(mmc, mrq);
+		ret = meson_mx_sdhc_map_dma(mmc, mrq);
 
-	if (host->error) {
-		cmd->error = host->error;
+	if (host->error || ret) {
+		cmd->error = host->error ? host->error : ret;
 		mmc_request_done(mmc, mrq);
 		return;
 	}
@@ -596,11 +678,6 @@ static irqreturn_t meson_mx_sdhc_irq_thread(int irq, void *irq_data)
 			regmap_update_bits(host->regmap, MESON_SDHC_PDMA, val,
 					   val);
 		}
-
-		dma_unmap_sg(mmc_dev(host->mmc), cmd->data->sg,
-			     cmd->data->sg_len, mmc_get_dma_dir(cmd->data));
-
-		cmd->data->bytes_xfered = cmd->data->blksz * cmd->data->blocks;
 	}
 
 	meson_mx_sdhc_wait_cmd_ready(host->mmc);
@@ -625,6 +702,40 @@ static irqreturn_t meson_mx_sdhc_irq_thread(int irq, void *irq_data)
 		 */
 		meson_mx_sdhc_clear_fifo(host->mmc);
 
+	if (cmd->data) {
+		struct mmc_data *data = cmd->data;
+		size_t len = data->blksz * data->blocks;
+		bool bounced = host->dma_bounce;
+
+		/*
+		 * Unmap the data after the controller has been quiesced so
+		 * that neither the reset nor the FIFO flush can race with an
+		 * ongoing DMA transfer.  dma_unmap_single() (for bounced
+		 * reads) also invalidates the CPU caches, so the copy below
+		 * sees the data written by the controller.
+		 */
+		meson_mx_sdhc_unmap_dma(host, data);
+
+		if (!data->error) {
+			if (bounced && data->flags & MMC_DATA_READ) {
+				size_t copied;
+
+				copied = sg_copy_from_buffer(data->sg,
+							     data->sg_len,
+							     host->bounce_buf,
+							     len);
+				if (copied != len) {
+					dev_err(mmc_dev(host->mmc),
+						"failed to copy data from the bounce buffer\n");
+					data->error = -EIO;
+				}
+			}
+
+			if (!data->error)
+				data->bytes_xfered = len;
+		}
+	}
+
 	meson_mx_sdhc_request_done(host);
 
 	return IRQ_HANDLED;
@@ -813,8 +924,17 @@ static int meson_mx_sdhc_probe(struct platform_device *pdev)
 
 	mmc->max_req_size = SZ_128K;
 	mmc->max_seg_size = mmc->max_req_size;
-	mmc->max_blk_count = FIELD_GET(MESON_SDHC_SEND_TOTAL_PACK, ~0);
 	mmc->max_blk_size = MESON_SDHC_MAX_BLK_SIZE;
+	/*
+	 * The controller has a single DMA address register.  Allowing the
+	 * block layer to merge more segments is only safe because requests
+	 * consisting of multiple segments are bounced through a contiguous
+	 * buffer.  Keep every request within max_req_size so that it always
+	 * fits into that buffer; SDIO uses max_blk_count to split transfers
+	 * as well.
+	 */
+	mmc->max_blk_count = mmc->max_req_size / mmc->max_blk_size;
+	mmc->max_segs = MESON_SDHC_MAX_SEGS;
 	mmc->max_busy_timeout = 30 * MSEC_PER_SEC;
 	mmc->f_min = clk_round_rate(host->sd_clk, 1);
 	mmc->f_max = clk_round_rate(host->sd_clk, ULONG_MAX);
@@ -823,6 +943,19 @@ static int meson_mx_sdhc_probe(struct platform_device *pdev)
 	mmc->caps |= MMC_CAP_WAIT_WHILE_BUSY | MMC_CAP_HW_RESET;
 	mmc->ops = &meson_mx_sdhc_ops;
 
+	host->bounce_buf = devm_kmalloc(dev, mmc->max_req_size, GFP_KERNEL);
+	if (host->bounce_buf) {
+		host->bounce_buf_size = mmc->max_req_size;
+	} else {
+		/*
+		 * Without the bounce buffer only physically contiguous
+		 * requests can be handled, so fall back to the old limit.
+		 */
+		mmc->max_segs = 1;
+		dev_warn(dev,
+			 "failed to allocate the DMA bounce buffer, using single-segment transfers\n");
+	}
+
 	ret = mmc_of_parse(mmc);
 	if (ret)
 		goto err_disable_pclk;
-- 
2.56.0


