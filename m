Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DF9606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 10:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fq8G39gx;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UjQ/kRxo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YjhWyGcQ/8hVnGizK5MNNn3D6g+ipWoPWJTbRgGnr1E=; b=fq8G39gxubPZpE
	jPpN6MzIgkCOINMr4ClUIek6J4bf1O/V2QkLLTh17LSxjaXmMTKRauE74M2OqfJD8Lmav22ilipfk
	S4OVhzReX5n71PwqonvMH82y8FMfFEHT15LDWX3DrNLlC5YmKhK6RQmQKAbBOqwA8vTfkOP9Blpq/
	eHrMBMyDnuncc+VVVi+Gjo8XiGlpaBThcf7sUaIyHaEBpGDEinnumpUbk9O5F8m/fjys47QiXv1kX
	orPPHxI7JOlA3CZ4yxQQapGMaAR5hAHQhnrdPtN7283XcEuIfq2MPPdLi89yI+bQ/tU+W1ju0+62T
	OAlD6DGt06ZNxBpZEG6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHeO-00000002ENq-0HZO;
	Mon, 26 Oct 2026 10:09:56 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHeH-00000002EKb-0SnM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 10:09:50 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so8138675e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 03:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793009387; x=1793614187; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YjhWyGcQ/8hVnGizK5MNNn3D6g+ipWoPWJTbRgGnr1E=;
        b=UjQ/kRxop+wXmOczHLg2p41fL75b9/UnU8pwhQ2Z8fp7371bcmjZ673eYA/MpWbgPa
         /q53DNisNSALXvWWS44HPw731kQBqPU4ooRdmkp15nTrlG3ZP+Pe3w76n7rJFVXRyZla
         xxIPFWieHa2mUc4Yy/x4gmX3d09PGVfNu3yioUoU0Wd7MSoG+7mU1HPBlgQ2aTl2AJIv
         FMuoDQ+5qsaBpe4Q58Sz40JUVns5fGQcPYmihviZd5qHuofGNRXnMCEdbpZhgHXVJ7is
         JRXKBDlsKX4RIhBTnbCO0S+x2coSh6izGP55p6QJVGxl8cwyKadxhdohmDpFZsaKZjRW
         u+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009387; x=1793614187;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YjhWyGcQ/8hVnGizK5MNNn3D6g+ipWoPWJTbRgGnr1E=;
        b=of/Y5IpIbdW7toN3RX/2oMK/1U7sDPh92AWqE/0d15jUbPUI3rGDCEDYOov3DDn04n
         X6uMpc4B2dvuT/kerUEzC0WcHeURO0zC3sLKKzd7DjD/cSH/KjdWQd0gzajEsuUGmOX8
         5w2hahfPtc+eVMUqEbsyGC95PHfDWdXGS9Xboigawv9ufjT++mv5tDOz6JmzkfG2wJ+J
         UnXjC1qzEwUZp2Dxktc7k6iF3ZqS3nOuQYJFyZ9A5CENdtiz1AnEzdnYZ9BuAykHn5dd
         5Dtw68oxO/g5mO0OQ0GFj3mM3UfwTQiHvFN4HL/RXXxXL2TDLD3DkTMuq1qIgvI+cXCu
         swaA==
X-Forwarded-Encrypted: i=1; AKwUvBy4pbdlz17Uc4aSQvEY60XcowMwJ0ZTkdUceayCr2L9bMLM50u0O0MN9XEeyWBW0yKCWDbAt/I/WxFX//POChyO@lists.infradead.org
X-Gm-Message-State: AFq9FYLu5C9+KztA5lSV6OrCLw3GSxu1McvvoO6WTa1UnuJsKphRIaep
	B+6DETzAMuWVi08s54ZVZVYfeFw3gXfmiMQouCtu4+w0qCwhcC+c4aYzRWTwM/wHWKI=
X-Gm-Gg: AYBFou0tmlJ+0DvofpQLE/5oITKj1ApNsMArM6FuG13dCYMGjXQ+El+gYCzV56LaCrO
	uRYrtZo1bxZE1FU/lIEeD8+nJPUmDd/iH5wK0DeQ2LEKXJdmFAgYb96TVTQJDhUS5zGp6IgwOio
	vhvBL9DTf0OG8w6q7poYE5JO7mDC3+AMsswRKhy+DlVjrYMFSS6tx6j2LIUHX2Tuh4qJC/gEoKF
	q3wIVCtKna1DnpeLAmRGJZ25/xpD5h77REOgf43fWA7nAzVMipWWzlN6RSvZaI1YUbvYP0HCrUL
	0LTPIT17KjTbfhDbvZyNdE1wBGZZS0NmxIEbKlhhmFqOXJyAaKDwvTBXS3+OgS2c0miX1Cqcp2o
	KSMXuuzhLgpz4YuZIKqhouGzhIv1uFXOjSTbfnHu6r0oPBKmsVFb739YpjXoJe/sIkwJwnBXGZ5
	5qwv+lRjN1NnCihM4Fcli4ePUO5rr8BOmif9AaiBz1ZIOQVmvIk15YoiOWpcFBebbmOm1+gK9TP
	W2vRtgdT/RUy3MqDIMHa9nVwJ2Q/3r4yXjxkcht23NcWxlCzwSmAl1p+c9rB1DEUPQplQ/PgKZj
	WPVlq9ndXtdU+n9OpLQwvWyn1zDrVYjnLF0Y4urSyOI=
X-Received: by 2002:a05:600c:c08d:b0:4a3:7344:13b4 with SMTP id 5b1f17b1804b1-4a373be2a68mr73417995e9.14.1793009387038;
        Mon, 26 Oct 2026 03:09:47 -0700 (PDT)
Received: from localhost (p200300f65f19a904bf765b6740c3076b.dip0.t-ipconnect.de. [2003:f6:5f19:a904:bf76:5b67:40c3:76b])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a35a2d6f6fsm178981245e9.12.2026.10.26.03.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:09:46 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] remoteproc: elf_loader: Create new callback for copying segments to remote cpu
Date: Mon, 26 Oct 2026 11:09:30 +0100
Message-ID: <4757287789726692e13b141b3b2af5245ae17e30.1793008847.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1793008847.git.u.kleine-koenig@baylibre.com>
References: <cover.1793008847.git.u.kleine-koenig@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4531; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=iP/a86pijHCRmv9wBS5FEuq1LQ6MVYUXu9CglvvJMck=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq3yberBd3EQ5Kxjbd3sOQabalehlLr8is9shUn Mr7VDefgJCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCat8m3gAKCRCPgPtYfRL+ TnoBCACmPXG59pHH37OKjk0cHYhrDhchNp4kPrX3S2palkOtr/leAierbz+le2U+7KOrhvBU7KO OP80a7baa8OKpNF6noVMplFsMaR+1zwsJh1ljDSDNIWaTCV0iSh9ffxQCGITsepdNgcKiJx2+8Y zc1UyNiNySdsVvA19Uob6xHpTkz1UEvdmm9MBU2AU3FGEV7jED+HEIOSLn0cTCC/+4gMJcR5rWz VpfXJVB8ddeqWCanJj6J9nA9f3OrlROMm3uV8+Y0L6HXRJFE/0BlFpH0w+RJlUii6GXn0RG4Ncw M6aTTX3VJ0mn53FOzapKvPhm9N2hPV+DrHOkOouTEGWRCUN3
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_030949_176865_02354A68 
X-CRM114-Status: GOOD (  21.25  )
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Some devices have special needs about how an Elf segment is copied to
the remote cpu's memory space where the default implementation using
memcpy_toio/memcpy and memset_io/memset isn't suitable. An affected
mainline driver is imx-dsp-rproc which includes a near-copy of
rproc_elf_load_segments() just to handle the IRAM only allowing 32 bit
accesses. On (not-yet-mainline) ADI SC846 the respective memory isn't
directly accessible at all and DMA must be used to copy the data.

The new callback can be used to implement just the driver specific
memcpy + memset to increase code reuse.

The patch only appears big because of indentation changes.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/remoteproc/remoteproc_elf_loader.c | 63 ++++++++++++----------
 include/linux/remoteproc.h                 |  3 ++
 2 files changed, 39 insertions(+), 27 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
index da3cddbe7d4c..0698bba2db89 100644
--- a/drivers/remoteproc/remoteproc_elf_loader.c
+++ b/drivers/remoteproc/remoteproc_elf_loader.c
@@ -227,35 +227,44 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
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
+				dev_err(dev, "Failed to copy segment %d to device addres 0x%llx: %pe\n",
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
+					memset_io((void __iomem *)(ptr + filesz), 0, memsz - filesz);
+				else
+					memset(ptr + filesz, 0, memsz - filesz);
+			}
 		}
 	}
 
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 00019b1895e6..ffa22c2f04af 100644
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
@@ -99,6 +100,8 @@ struct rproc_ops {
 	int (*detach)(struct rproc *rproc);
 	void (*kick)(struct rproc *rproc, int vqid);
 	void * (*da_to_va)(struct rproc *rproc, u64 da, size_t len, bool *is_iomem);
+	int (*memcpy_tova)(struct rproc *rproc, u64 da, const void *src, size_t filesz, size_t memsz);
+
 	int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
 	int (*handle_rsc)(struct rproc *rproc, u32 rsc_type, void *rsc,
 			  int offset, int avail);
-- 
2.47.3


