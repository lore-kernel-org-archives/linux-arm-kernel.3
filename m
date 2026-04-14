Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C039ED7B87
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 08:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AeXmKtBVL9mYa+wPYte2JagumjsgvY/89ENqzDq1Vps=; b=doyMEYoBqjExStuvShgspKgxIy
	lC/MwUDpzkvfU6KyyLJ68049UEFRx78Gk9XpcPU70RywJCrLvya00aFIz2OTyg2k+MuRJvCzQkai5
	kfefkgDH/W9dOQMj1mqNTrciKPsZDz6JqGkmcr2ahetk6r5/FffkMcr2se6z2YycWwHEef28ASJ8Y
	rxAAtH/ABBKKRViPCr/Jay7JNsX8GY4kEtV1i6BDlI/A3jSOJYpS8s9XbXiq4xinX55qDFagXOTnE
	4sUg42g704NYaww5QqNGtHm2ZFhj0TXjJ81HgOovdIChbgIkYORHNWjcXfXCpNTVvG1xBtbrpybi8
	slD7JoTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCZGN-0000000H00v-1c9B;
	Tue, 14 Apr 2026 08:36:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCZGL-0000000H00P-25gV
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Apr 2026 08:36:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=AeXmKtBVL9mYa+wPYte2JagumjsgvY/89ENqzDq1Vps=; b=a8WIqSb/tz7sb5z1oJ9lI3XjjK
	PljJN6FlUi6DQD9IIVJPjS8W0rGz0A2+ew6vN5QFeX3ILFnxYkNQf/UKefnkhDoOqF6tzeYuG+3DK
	NaB0BUfahfTfknm0Ij22DRtu+cOT3klxaUGskU90iWgvuB6uL39jJZSRG0ochXHhqiG7jl99lplRK
	ps/R33HqrUDz8PxhY+fjeHZ22MXqzEWAm/0G+GR356IF3bmkHucD7Mo4PE7AUX7WJJIhvlZjLYXF6
	1g+FAm7rgJxIBx+aFuXSL4kJJkRkmeIt38rPARGupXcwst5YbOebTqTmdu8IcaH46tkRpfieAC/nR
	VzKFcMmA==;
Received: from layka.disroot.org ([178.21.23.139])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCZG4-00000000WNG-2F7H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 08:36:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id EF581260C9;
	Tue, 14 Apr 2026 10:36:18 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DQARs8_HN2Qc; Tue, 14 Apr 2026 10:36:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1776155778; bh=lGIiTmh/Tvj2Fo/RSnjUrTEXiEw1HIe+Smy8NJBXI3s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Kf/xX/s4mGX8l7QFaxFhEmb2fN+KPznqwW/gfpQKwf1CUGIp711F7lAjJkC/HK/cA
	 6yhKUdbeqY/ML+AAATWJAlzNGmm6o23ppryEmChlu2S/+kgbl4mkOBq+Xj1fcjy2GY
	 /a/WB//+KdD3sZZIt3ombYCo26hyCeTL/YjwG6EDtpfRHuXGwyXJJaIk6eTyGyc8Rk
	 3QRpowBcL+9tlbryQ2047gmpbvQtXNA4SthbnhmD7rxFCsyqavWvUoG49A0PtCoIFr
	 33BJJ/Y7adLf5zUtWKRhDHvm43q5ZFyym0/pyljIy/iQu6iw5eAqwZNh+C8N580bJr
	 T9R2HoWjKx37Q==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 14 Apr 2026 14:06:00 +0530
Subject: [PATCH v2 1/2] mmc: dw_mmc: implement option for configuring DMA
 threshold
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-dwmmc-dma-thr-v2-1-4058078f5361@disroot.org>
References: <20260414-dwmmc-dma-thr-v2-0-4058078f5361@disroot.org>
In-Reply-To: <20260414-dwmmc-dma-thr-v2-0-4058078f5361@disroot.org>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaehoon Chung <jh80.chung@samsung.com>, 
 Shawn Lin <shawn.lin@rock-chips.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_093632_823901_010883A2 
X-CRM114-Status: GOOD (  14.57  )
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

Some controllers, such as certain Exynos SDIO ones, are unable to
perform DMA transfers of small amount of bytes properly. Following the
device tree schema, implement the property to define the DMA transfer
threshold (from a hard coded value of 16 bytes) so that lesser number of
bytes can be transferred safely skipping DMA in such controllers. The
value of 16 bytes stays as the default for controllers which do not
define it. This value can be overridden by implementation-specific init
sequences.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/mmc/host/dw_mmc.c | 5 +++--
 drivers/mmc/host/dw_mmc.h | 2 ++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
index 20193ee7b73eb..9dd9fed4ccf49 100644
--- a/drivers/mmc/host/dw_mmc.c
+++ b/drivers/mmc/host/dw_mmc.c
@@ -40,7 +40,6 @@
 				 SDMMC_INT_RESP_ERR | SDMMC_INT_HLE)
 #define DW_MCI_ERROR_FLAGS	(DW_MCI_DATA_ERROR_FLAGS | \
 				 DW_MCI_CMD_ERROR_FLAGS)
-#define DW_MCI_DMA_THRESHOLD	16
 
 #define DW_MCI_FREQ_MAX	200000000	/* unit: HZ */
 #define DW_MCI_FREQ_MIN	100000		/* unit: HZ */
@@ -821,7 +820,7 @@ static int dw_mci_pre_dma_transfer(struct dw_mci *host,
 	 * non-word-aligned buffers or lengths. Also, we don't bother
 	 * with all the DMA setup overhead for short transfers.
 	 */
-	if (data->blocks * data->blksz < DW_MCI_DMA_THRESHOLD)
+	if (data->blocks * data->blksz < host->dma_threshold)
 		return -EINVAL;
 
 	if (data->blksz & 3)
@@ -3245,6 +3244,8 @@ int dw_mci_probe(struct dw_mci *host)
 		goto err_clk_ciu;
 	}
 
+	host->dma_threshold = 16;
+
 	if (host->rstc) {
 		reset_control_assert(host->rstc);
 		usleep_range(10, 50);
diff --git a/drivers/mmc/host/dw_mmc.h b/drivers/mmc/host/dw_mmc.h
index 42e58be74ce09..fc7601fba849f 100644
--- a/drivers/mmc/host/dw_mmc.h
+++ b/drivers/mmc/host/dw_mmc.h
@@ -164,6 +164,8 @@ struct dw_mci {
 	void __iomem		*fifo_reg;
 	u32			data_addr_override;
 	bool			wm_aligned;
+	/* Configurable data byte threshold value for DMA transfer. */
+	u32			dma_threshold;
 
 	struct scatterlist	*sg;
 	struct sg_mapping_iter	sg_miter;

-- 
2.53.0


