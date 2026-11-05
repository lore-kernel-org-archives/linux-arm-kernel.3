Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DCE606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CXak0gAu;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=lxUFfhrO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mAm8SWYjVHtkj7l4zPpOlmPJ3PIKILZqb4g9EPE7x6k=; b=CXak0gAuOx2N8P
	SMSyH0VoYOJILc1rCbW3A1fcsZY3ZJgGT974Yqhy54p+TXQ7vR9lXuDlgtQ+9ghAmu7oUchJyVlA3
	PaoAooqUZufX7Lq9EEwRZd5j+BJhs4bEriO9i1I5svduWWmmaybuKvqbL2n0v6lAwUDP0rhsmoDxk
	JmSHUBspZq/tWosb8QoeSCbN5bimXytw5yr2MyFu2DL2+p7XKq7eW2iBBZbvmcdkygABN9LDzXW11
	I16K3hUUobBuyzPx74Ygs6dCYg10aFZTUOe2pqtVLIkekuQsJwYue9RrcCzGVDmskcJaSUtTCD9lN
	CvG6pby/e6SytLcjJNYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOw8a-00000008nnd-1pLe;
	Thu, 05 Nov 2026 12:00:12 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOw8W-00000008nkW-0T8R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:00:09 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so13888875e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 04:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793880006; x=1794484806; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mAm8SWYjVHtkj7l4zPpOlmPJ3PIKILZqb4g9EPE7x6k=;
        b=lxUFfhrOKhSDimFEM0faEBqH/+dqhIQIkbI9ylhEVNvv6ogTfQOesJayd9foMjklfZ
         VjjgHSsXwW4M3jWdQiAHCmynFYbrlgnv64VRXWLmlccC05szd4v8C1j5NKRxceHb3d2J
         scBX1QSQ75VS58gIX4J6IumoNTYw7S0RQo818zLNLzhUmlBNBdOeB46Y4nA3cNUkQPAs
         fhSKogggTUFdrOPdCEfxAeB0T9S2fL8NAnaQ0j4+MYyR//Vuud4vR31t4XQIaIWphsZt
         1XpbEMO/Wl0pGpRGDp69LCVsHV8yXZVh0liAYFOPnjrL1aOj51mMjkaXesAxwCveMGaZ
         SYyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793880006; x=1794484806;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mAm8SWYjVHtkj7l4zPpOlmPJ3PIKILZqb4g9EPE7x6k=;
        b=YatxAe7EbrjkKfvGFzfh2flJwDCY/jXSeX5pyZ0sFe7KLojA3ucYKcGt2rDNbHDBWo
         Q8ZXZbWFgEzc5lftnvRF0KR1mpvG8Jy8MTm2JhTmtuegaAbGXvd+gUwrYyehBuMBnr/U
         kfSEajGzLoI/TP7XIaNUzA6drnkFA/wIv1J65Rhd+Y2WFJX8vwYyMTGWu6mHYITzuHIf
         6hgP5fYTka5Qby0gR2JkAg0oDyzRf6UioPQGQiaASLARhxtbrmtB1d7srgBismX0B///
         BlSht78zbvparWeADkEaVgBr1SRfafaJMta0ZwcHNoH33qIcVei3w0X4dKnQ7OVqc9x/
         OlLA==
X-Forwarded-Encrypted: i=1; AKwUvBztr9zPMjzT6iN1zycM623mwxsQVDK40yHC+BnRZNpLyavAykeWi2jxsfLRh0qQHSOHXqX0huoF2O3kA/rKE0h/@lists.infradead.org
X-Gm-Message-State: APuU4Z+2aB8WpHeG6oQ2KLfWA9nDwsjnT3BLKYN6mqPqnhDFtvZTJywV
	FXcBAQzO2nIrAPPSKlFdUFhXl2Eh1PnuJb4qyBrlSBUZgaCyPWv38De8L4xLvebEY3U=
X-Gm-Gg: AYBFou1+8g1faaFrw7jBpdvAiZe/OiQCt5u3oaNV5BR+kl4nHoklAtYT1tExvzR9aCp
	qTq9MUwHBde6PCQNuVf8Lh6JVxpvznKcttiwDWUHvlGIMTLw/y8RnA7VxbLF9cP3+WXExRDIJom
	3rsAQKZ48eZCU7l0y/c1xnJLXd6bh+DGBFqn5WWFGPRPTMATnMX1omlPS1zJEQh0BpAqg96koCN
	9sxI/4OdPlvnL0MCt+ipwq90Gm3obtGSpKVSqBEH7kEuz7KvfpTegWz1J010zUqGc9h9TXNQozg
	HjJoKxghJZnzUjoJs3tpiSUgPTLd/qQRSxAEcOJXkPuKKfu//c09SB7WHOdEwrNplaoeKJnMfSW
	AgI0zwypsiCI0VuiFeWNPUdWm7Ny2r/G9qQFu2WDfVP+oKOef5jFSaEN666mtzMdamOuEiXmmR1
	sKTOD1nqmVdac7YBXlmOCDOwRSm8g9HVqXRWJ+/npWcOf5r5WB60BYo0UxTxQqz/eQ/0flWeQUh
	a7nudAOMSJxT+le3Y2uvW6XmDbuR8+fGu//gOxXdRy9wczPJ/C7QLx4DOhZxIlYOyX86RfMidOK
	FkO02gnDogSLe30v9afG3NDCNS53ZQQhqiU6jNk6LTZ96xYlAObQrOFv94QUpywYkogrZAqDgbS
	42FMNVZkAPYPoW1al
X-Received: by 2002:a05:600c:1f93:b0:4a5:87b3:ddc1 with SMTP id 5b1f17b1804b1-4ac180f1ec7mr436813095e9.13.1793880005590;
        Thu, 05 Nov 2026 04:00:05 -0800 (PST)
Received: from localhost (p200300f65f19a904ae40ca5165ccacb8.dip0.t-ipconnect.de. [2003:f6:5f19:a904:ae40:ca51:65cc:acb8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4b56fca22e1sm73091395e9.14.2026.11.05.04.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:00:04 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v3 1/2] remoteproc: elf_loader: Create new callback for copying segments to remote cpu
Date: Thu,  5 Nov 2026 12:59:51 +0100
Message-ID: <50647b7d731fa54fdc3e2869f02de2096acdcff2.1793879714.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1793879714.git.u.kleine-koenig@baylibre.com>
References: <cover.1793879714.git.u.kleine-koenig@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4764; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=Z/fCIVp9RMJTrReXJyUJn6ua+y9sBVz+x0H7XlZvi4g=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq7G+5Gk4Q8ATYuAmIR9DTokmwc///VvCwal9RT 0Q+SzcLu66JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauxvuQAKCRCPgPtYfRL+ TnLPB/4nC79lPyLlqp10Q5F7ECcaSOk4HGB7s1h+upM72K8ZIRD4qE30eRuvw0eeyDwVqAIVE8p BAor5pNJ+SP4kvqA2oIUxtFqWsFQMOxAsHbfHs5DcCYjvyyrDc+f72Ax3/eiQg3x02Zbstqf61+ knGCo0cgViF8bSvnRkn7YdfeAdRWO06P7TUfGt6LakU0STGCVNz39MGsiVTdEqzYERqITokSStT zsuoA51dTkKAnw2B1nPeUAqItS9etWoDQCm9xeYoCPk+vXUuMUVleKV55rUOUBSljhUqx/CEgAy hb62FNMp4EmG3KK5vjaTGyiCyOvEyljj4nM+fDYQrz3yepib
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_040008_244111_921F01B0 
X-CRM114-Status: GOOD (  22.40  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Some devices have special needs about how an Elf segment is copied to
the remote cpu's memory space where the default implementation using
da_to_va() + memcpy_toio/memcpy and memset_io/memset isn't suitable. An
affected mainline driver is imx-dsp-rproc which includes a near-copy of
rproc_elf_load_segments() just to handle the IRAM only allowing 32 bit
accesses. On (not-yet-mainline) ADI SC846 the respective memory isn't
directly accessible at all and DMA must be used to copy the data. To
cover that usecase don't keep rproc_da_to_va() in
rproc_elf_load_segments() and let the new callback operate on the device
address.

The new callback can be used to implement just the driver specific
memory mapping + memcpy() + memset() to increase code reuse.

The patch only appears big because of indentation changes.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/remoteproc/remoteproc_elf_loader.c | 64 +++++++++++++---------
 include/linux/remoteproc.h                 |  4 ++
 2 files changed, 41 insertions(+), 27 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
index da3cddbe7d4c..3c749a39e5da 100644
--- a/drivers/remoteproc/remoteproc_elf_loader.c
+++ b/drivers/remoteproc/remoteproc_elf_loader.c
@@ -227,35 +227,45 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
 			break;
 		}
 
-		/* grab the kernel address for this device address */
-		ptr = rproc_da_to_va(rproc, da, memsz, &is_iomem);
-		if (!ptr) {
-			dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
-				memsz);
-			ret = -EINVAL;
-			break;
-		}
+		if (rproc->ops->memcpy_tova) {
+			ret = rproc->ops->memcpy_tova(rproc, da, elf_data + offset, filesz, memsz);
+			if (ret) {
+				dev_err(dev, "Failed to copy segment %d to device address 0x%llx: %pe\n",
+					i, da, ERR_PTR(ret));
+				break;
+			}
+		} else {
+			/* grab the kernel address for this device address */
+			ptr = rproc_da_to_va(rproc, da, memsz, &is_iomem);
+			if (!ptr) {
+				dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
+					memsz);
+				ret = -EINVAL;
+				break;
+			}
 
-		/* put the segment where the remote processor expects it */
-		if (filesz) {
-			if (is_iomem)
-				memcpy_toio((void __iomem *)ptr, elf_data + offset, filesz);
-			else
-				memcpy(ptr, elf_data + offset, filesz);
-		}
+			/* put the segment where the remote processor expects it */
+			if (filesz) {
+				if (is_iomem)
+					memcpy_toio((void __iomem *)ptr, elf_data + offset, filesz);
+				else
+					memcpy(ptr, elf_data + offset, filesz);
+			}
 
-		/*
-		 * Zero out remaining memory for this segment.
-		 *
-		 * This isn't strictly required since dma_alloc_coherent already
-		 * did this for us. albeit harmless, we may consider removing
-		 * this.
-		 */
-		if (memsz > filesz) {
-			if (is_iomem)
-				memset_io((void __iomem *)(ptr + filesz), 0, memsz - filesz);
-			else
-				memset(ptr + filesz, 0, memsz - filesz);
+			/*
+			 * Zero out remaining memory for this segment.
+			 *
+			 * This isn't strictly required since dma_alloc_coherent already
+			 * did this for us. albeit harmless, we may consider removing
+			 * this.
+			 */
+			if (memsz > filesz) {
+				if (is_iomem)
+					memset_io((void __iomem *)(ptr + filesz),
+						  0, memsz - filesz);
+				else
+					memset(ptr + filesz, 0, memsz - filesz);
+			}
 		}
 	}
 
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 00019b1895e6..e750a127cbc4 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -75,6 +75,7 @@ enum rsc_handling_status {
  * @detach:	detach from a device, leaving it powered up
  * @kick:	kick a virtqueue (virtqueue id given as a parameter)
  * @da_to_va:	optional platform hook to perform address translations
+ * @memcpy_tova:optional platform hook to copy data into remote memory range
  * @parse_fw:	parse firmware to extract information (e.g. resource table)
  * @handle_rsc:	optional platform hook to handle vendor resources. Should return
  *		RSC_HANDLED if resource was handled, RSC_IGNORED if not handled
@@ -99,6 +100,9 @@ struct rproc_ops {
 	int (*detach)(struct rproc *rproc);
 	void (*kick)(struct rproc *rproc, int vqid);
 	void * (*da_to_va)(struct rproc *rproc, u64 da, size_t len, bool *is_iomem);
+	int (*memcpy_tova)(struct rproc *rproc, u64 da, const void *src,
+			   size_t filesz, size_t memsz);
+
 	int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
 	int (*handle_rsc)(struct rproc *rproc, u32 rsc_type, void *rsc,
 			  int offset, int avail);
-- 
2.47.3


