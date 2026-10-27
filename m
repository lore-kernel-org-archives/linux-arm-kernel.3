Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6813606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 16:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WltZ2nB2;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ATF1VTad
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ruVwcP2FUbNIC1wRL8tzJrFYBtNWcUbLSa7yLT2xgXA=; b=WltZ2nB2ya1hYr
	9Yg6VrXmyX9B9w7swagX/PZUZQocYWaegtMdL6r684eyiE0/p7GGFPbXYnOybgIqnD40R6/kP8PNo
	kSw16WOzJYUp/sF+HaeYJwQ2SOn4PyeASWOhgbBjnyRyV0LTmObXlG+YZKsI3L95jMgwsyK/q0AeT
	CopuA7m8biC53mwfo8kOzDhwHpQLMAkLg9jwEICRrBvNS0DJw25C3+RCTgPJwV0r7RCtIa6M0rzXk
	TCS7kaKZ8eScaIx/vyNa7vzF7v/p5ZFKGMVVfVxHSCM56Rx1Cp/3hzjIPDaCQCqyMd0WbQ+OtNLJh
	8kvPBJJLpPt0SRiyS0CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjzh-00000005Lhd-0dUC;
	Tue, 27 Oct 2026 16:25:49 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjzZ-00000005LfQ-3oLQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 16:25:43 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so106015e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 09:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793118339; x=1793723139; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ruVwcP2FUbNIC1wRL8tzJrFYBtNWcUbLSa7yLT2xgXA=;
        b=ATF1VTad7T+i0a4ZJIcBsePcVnUJ9hveExTgARhFTVb5NvMB4GJALr4iBMMC/ykgrJ
         HBIysv1mKtrPWFfY8I1/AmP7eyNjP6UWbivpUBzYCuwLXvtEJBszQo108aOA7+iiFw08
         SADHB3E+JOxihmlrmTs+6RSIEroxqTsdnFaE4bIHgFZ9QA5i3JjTQm+/zp2vmR2kVqrA
         ldpMGugKihdtTzlAtnQtLb3Q/8PYJFYEUnkgi5DilVtjYI0TpIVGKfXtQtfPNLagDiCx
         XmC1UXApGCIImd4M2TC2kBRO+1hYPIT0FAcxzTTfhWElBdY0BN8W1L/Ctda9+Fin5BSs
         8LEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793118339; x=1793723139;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ruVwcP2FUbNIC1wRL8tzJrFYBtNWcUbLSa7yLT2xgXA=;
        b=xgLrZ/RQnbPJiJiRyvtoQDJLfAPwMFfRGcmM2gVMawRGXKxXGYS3YZDRIX5QTUXtTn
         drMedKg471RR575S0o/w+pFU5t7fXmqqZE6bzdenZM9Cgv7LUBIzxznUtDCPccRp1B7t
         EWyPNZpOrb7XNAaHK4yqch9fCtF4OqC1B8tY4P+UZBobIfm3RKiaYo3JuIW3jGL9lA+a
         ikhhhG/BZrLnlpSoe/6tWBactyND5qoqQ4hX0tMbwrS6CoJVXi6b1ezV87U4FyePHHo1
         2PGlI6o1o8wgOmQCgIO5gQM9hmWzL6stwJo0ZK5ZZz9m4KDB6DCJkzcgdmdcnDhRJMRW
         dyGQ==
X-Forwarded-Encrypted: i=1; AKwUvByw4UdeoywFpyhRan5gShp7YXNdzaQfvolS2WFs3f8iIEbZUGiQUxv+im1RSKxmdJBw3xUgxnzGdjNgfOGV0tvG@lists.infradead.org
X-Gm-Message-State: AFq9FYIO1MCrk3+scKZcH3L/afJg3j0+bX5SUXtfm4KGxH+KQ5oogTA4
	KIXkblscE1YLUFswP72nLI4JPcVMI/E+OJ7F3d6+ID+CZYUHMJv6387wv1aLBaBAXQw=
X-Gm-Gg: AYBFou2IvMdXto9JHQ75Q1fjauE7suYxyNnX1KloBCjf02f27cGCWmz+O8/o2jue2RB
	UeuGv9zhzSpzuj2S9xLJIyv0/9KiE3DDgitzj5prFUysbXATt/LB+ybEXuPjaayDM7m86qW7qBX
	JeujqsuSJGHhwoRLjp7ohoyTksgA8wt2IJ9/6VxDmVUPavscBaeyY1sjXFQTdlC4sX1R4r39TZa
	LiObdu/W57oaBSKUSqi2SKYqhO9mvC61Q2X3msOq5q4BCpLkXQ40u8yWwOB+QHXcFNBs1thEVSt
	wZtJBK/nQLA/lEwnAX2m2Qp2Z1UOXfGjoVOZUBBoY2fgazPILxOF4UDoEjahtefXKBwACHfF59M
	nTHUbXUBL19SDPJI6wzVCMjOhGfowY4Wwdd6SzHpqZRrInecDzEfsUygVPeFUdHUDkCAZCtmqIx
	vN6E/7mABr0zUp5m0hMe1QVBt+4mFWFJcSjZk/JkCrhQ1FZ7QAh8AVl2BW3YpuBQde4YcoDQk9d
	erpahK4SZ1kYWz+nvdkdOGE+G/S8SuPBVvxK9xBcu4PCAI396VX2JcAV35P0xha+byFIVzB1BOL
	k5MRedhN2dSh+T1iNlaGXfs5ffgXByXixZgKPxFyE73qZj7Qr5sAJ5qIoH0slQ36
X-Received: by 2002:a05:600c:1391:b0:4a1:fc0a:8b75 with SMTP id 5b1f17b1804b1-4a35ac9f430mr206232885e9.24.1793118339017;
        Tue, 27 Oct 2026 09:25:39 -0700 (PDT)
Received: from localhost (p200300f65f19a90461358920bbb0c5ad.dip0.t-ipconnect.de. [2003:f6:5f19:a904:6135:8920:bbb0:c5ad])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ebcb8e0sm22996206f8f.29.2026.10.27.09.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 09:25:38 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v2 1/2] remoteproc: elf_loader: Create new callback for copying segments to remote cpu
Date: Tue, 27 Oct 2026 17:25:20 +0100
Message-ID: <15d90126debc21c116c9e862a007afa4d81f704c.1793117996.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1793117996.git.u.kleine-koenig@baylibre.com>
References: <cover.1793117996.git.u.kleine-koenig@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4592; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=xVwXpYXWgABJZ9x21P2crTLydOse+u663MkGSpQhphM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq4NB0UKaEa77WgrPF9mWEd8jdnTucff0k56SvQ /7jqxppSbCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauDQdAAKCRCPgPtYfRL+ TmQRB/41RdBguIWrTGSuq3Br1wn3037QSqHgAqDnMnMeug563he8OY8v6f+CtVGPgXSx5QVz+iA AAq1nMA9eiM6vaqNfUMtAhSPOpvyFx95JPVD7XLogbKEFxB/TC/QRLOmzbrfadSBWZefgX4dEKe Sx6sL2irRsarkZcZnLdENK79iV81WsBzeqN7GynA3EJt7w9uCXsaEl+a22XMtcJHELNMuSfyyNk f9Kcon02OOS/Ia9yJQkXEQEL+rWybwPQNkGOZOuNn35OM1rpH/oY7dqIkiTMh7WyypOJvwUI2jb +9Cz47RoIu/eQrSdVio4Rx2d3oMxR10j9nrhGxt+2VMqMTYj
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_092542_260815_C67AF5CC 
X-CRM114-Status: GOOD (  20.90  )
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


