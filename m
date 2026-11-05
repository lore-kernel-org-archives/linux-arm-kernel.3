Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1900606A330
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qliWDpvA;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jIIrsYBN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mGr7t/EAFXFSUA+jAEctWicl0dyfbpawNQjldrWR+2E=; b=qliWDpvAN2mOLC
	BoqIFwNKPVTSsDU/HiWBJo/V7rzVTgLPYjdgDSgMnoyjl5SpB4BJ9W+vxS5PZTNkjqxmmMlq/6WWd
	lybXLmsKfBZbjLe5ZxOwpu8+kjsoK4b+uKaWWxl2Nsrgo8dOKj/xVW8oVAMXcbFpnUW5gv9KibxFx
	Fh+sYeFy2uVz1eWomnSTUbOb541bB1mFuU4zX1yAVFU2pbXUaOBNPB615exPOgOOdoe3D9hvT0/Ha
	SeA+GWp2dhHviddbRVZeD0FMZDS66yeSlzwCXpULnfDYsmBH0xnSbxQrG9wK6gyPdFyfMxLr4WEaW
	NUs9dFPGlpQxtFM5/iVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOw8a-00000008noF-3VdM;
	Thu, 05 Nov 2026 12:00:12 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOw8Y-00000008nlP-08Us
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:00:11 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so19057175e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 04:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793880008; x=1794484808; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mGr7t/EAFXFSUA+jAEctWicl0dyfbpawNQjldrWR+2E=;
        b=jIIrsYBNI8hsvMHbdkIklxMMLhIxC/YNCz8YVDukzUQFZkpY98M7Zu85EaOTAzouxx
         8QeT9ViP9sJoQIdvoDeKFkBPUSCk7UTRweH+vDloX65JIRN3AeOyN4VOg52k94Qo9rwD
         HXRgoKb0KgC6mt5SnYYhwzES8sIqJxgvzJiD23G0xl7KoVRGVZ7OdBHslFOF8Uzat+rP
         Rl3uXLqdNfXT5guPjFFca7rppf+ZGS9f7hzIOp4nv8uq+HWznzDvLiiJLSkKdu4kmljb
         0n6gSwSvGEnk/c9nMWifyVpZDp+3MPEI+udDnzzG9v2NpVQp7JrPupzFlNDml0C6LxM4
         eo5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793880008; x=1794484808;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mGr7t/EAFXFSUA+jAEctWicl0dyfbpawNQjldrWR+2E=;
        b=Ww5XNAeSIVewjXYo81WA3ZSkNrcTTkx/nLTx+4c3ShBnpUa/nZqrlBHjNHejFWucXR
         WhAd/YeiZtRswru2Poii04bz28e5vDN6hoUhBtQAhiW65C1Z16l258noVrmhsacRJzax
         tJnGVInNZ6nefjG9otUExi4nE/eDlQx8FZYoBTTqgAooVNuSFIaOlOh+VStvgMC7xqfP
         z2Q4d0W7KJJxk09VlKuXCh3e0jISMvZbZlo1lICtsvPngBONY+VjVQGTgvlw88qr0I1b
         v5nFTXKAwNuXEDTIMJZBdnbTXqk8tKCNPiRG/ka1nNjpZtv95ltzvc/TN4hJMGLd0FOk
         vs3A==
X-Forwarded-Encrypted: i=1; AKwUvBxL3n1m8haRnZ6DVxnLLBcitrJntpMnMIICZBPv0EZ8FawsEOfdiTEOGbehtiehCRLzUHyEsBwbA6pl3JwSF6O0@lists.infradead.org
X-Gm-Message-State: APuU4Z+qcLaQyCsX4aJdtDjmtDmzovADl3gZeApfk4LjlbodxJcI5iLT
	nbiNqR5LTEx29AMK/imUiA1gt3IxMiP/N0dB+hQJk0alDd9wdD6Wv3AnVMJLChEC4nY=
X-Gm-Gg: AYBFou2Z/DTa+idPPL2GAUbYZwkqu4oXt7k2cgDxdziP6LGyZiydrOKfOVQDb6Zbn5K
	4WgyV/BO0Py6iyUv7Z0zLqKBGEGeoy04lptQOIna+yiDbbQJFeL34O/d3EB1MBkMbQC6fzt6Sfc
	83s11uZXNCwwHp/c7BDub9NETUMtMeHGmp/uN2DOmOOI+b9RatGp9BGrqUOQqs/S0hEtSMTKn7T
	9l0lTX18xlLqlCyYdl5xFFoGRDMX+lCoSMzPP1GQ+MB/VoKuF1JwCYBRjbdekIJd5cYsFIM+E2P
	/ZFxsTol9nbtS832J1TNpWrnxjBEm41wIWAxhaAf4LoUTd6+KxFQCr4jCCRj2Jte7BWxTa2KtvC
	cQyQl/it5umhjJWKzqPnJ45cRlRddhumnqb+cOflxBNpnvVrn2Aveyonw+KZbAx70spLOxy/rUc
	8JYHVEBnhqdpRbNMIRbDxwEWsF8gR+ZG4qOXSgxrypOMFCdrEVo6kUZgqCXVaZHCW/L2GPepYon
	hJOCQ1cuK8TXUNvnBo6lPI8WSXQUmTjfpnOI/EjTetBpfCL4VS/SVe9DU1hkVf+LFCxxEqGUkHD
	NIP4grqVwAyiEkIo7kB9fNaiZXBQR4s/4p5H4w+fCtacjS37/WlqT7Qs3o2VeF1BR6kEVEvy3V6
	TCAVAysBTtoVL4Dqz
X-Received: by 2002:a05:600c:8b54:b0:4a1:fa21:fd90 with SMTP id 5b1f17b1804b1-4ac16bc547dmr439771995e9.9.1793880007587;
        Thu, 05 Nov 2026 04:00:07 -0800 (PST)
Received: from localhost (p200300f65f19a904ae40ca5165ccacb8.dip0.t-ipconnect.de. [2003:f6:5f19:a904:ae40:ca51:65cc:acb8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4b572bba207sm57515205e9.10.2026.11.05.04.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:00:06 -0800 (PST)
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
Subject: [PATCH v3 2/2] remoteproc: imx_dsp_rproc: Implement .memcpy_tova()
Date: Thu,  5 Nov 2026 12:59:52 +0100
Message-ID: <5e187f338148963ab46454f367551aab8209c3c4.1793879714.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1793879714.git.u.kleine-koenig@baylibre.com>
References: <cover.1793879714.git.u.kleine-koenig@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5297; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=zxEn3GKmjIkApottOw2da7a+5Ym3eFer8LHtbjoIoLM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq7G+7DhnDwRRIC8qtXfVeHqm4pTsPOGhHrwGyK IdEPSeorwmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauxvuwAKCRCPgPtYfRL+ TjXBB/wNMNXXTvWrrWPBibs4j3OlIMqcZVQ19fZYj8o76ykEh9/YhJfVtNSsaRnc6GF483NVwwH kzY+UoSVFv12D9Zj9anjy2qrzG5EhQMNwUSC+VXgMmssVLYNj0dsq7cppE08gx7Q0qDGqmDebMB IV66y0m7uifq3HOpcxlVI447ZR0jT330UVNWsHnULm7Ji5PbnMFCXicR3EAvIRgg0ylcXQ6GXX2 S5v+Q5Yr+uKRCLNRLmMez32Ltl2FtVcFxGXmcDbhDXt+g/DXc/ss6MHD754CbOmuLQRGi6urIGw VbImt9FKYfcOLqKB5BIZ1k/zwKYD2BriV38Ql+K27vJZj3HZ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_040010_122015_A2D6E99F 
X-CRM114-Status: GOOD (  20.85  )
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

This callback allows to use the core's rproc_elf_load_segments()
function instead of reimplementing it for very minor changes.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 120 ++++++++---------------------
 1 file changed, 30 insertions(+), 90 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 96d619daf3f5..324c10f18507 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -864,97 +864,41 @@ static int imx_dsp_rproc_memset(void *addr, u8 value, size_t size)
 	return 0;
 }
 
-/*
- * imx_dsp_rproc_elf_load_segments() - load firmware segments to memory
- * @rproc: remote processor which will be booted using these fw segments
- * @fw: the ELF firmware image
- *
- * This function loads the firmware segments to memory, where the remote
- * processor expects them.
- *
- * Return: 0 on success and an appropriate error code otherwise
- */
-static int imx_dsp_rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
+static int imx_dsp_rproc_memcpy_tova(struct rproc *rproc, u64 da, const void *src,
+				     size_t filesz, size_t memsz)
 {
 	struct device *dev = &rproc->dev;
-	const void *ehdr, *phdr;
-	int i, ret = 0;
-	u16 phnum;
-	const u8 *elf_data = fw->data;
-	u8 class = fw_elf_get_class(fw);
-	u32 elf_phdr_get_size = elf_size_of_phdr(class);
+	void *ptr;
+	int ret;
 
-	ehdr = elf_data;
-	phnum = elf_hdr_get_e_phnum(class, ehdr);
-	phdr = elf_data + elf_hdr_get_e_phoff(class, ehdr);
+	/* grab the kernel address for this device address */
+	ptr = rproc_da_to_va(rproc, da, memsz, NULL);
+	if (!ptr) {
+		dev_err(dev, "bad phdr da 0x%llx mem 0x%zx\n", da, memsz);
+		return -EINVAL;
+	}
 
-	/* go through the available ELF segments */
-	for (i = 0; i < phnum; i++, phdr += elf_phdr_get_size) {
-		u64 da = elf_phdr_get_p_paddr(class, phdr);
-		u64 memsz = elf_phdr_get_p_memsz(class, phdr);
-		u64 filesz = elf_phdr_get_p_filesz(class, phdr);
-		u64 offset = elf_phdr_get_p_offset(class, phdr);
-		u32 type = elf_phdr_get_p_type(class, phdr);
-		void *ptr;
-
-		if (type != PT_LOAD || !memsz)
-			continue;
-
-		dev_dbg(dev, "phdr: type %d da 0x%llx memsz 0x%llx filesz 0x%llx\n",
-			type, da, memsz, filesz);
-
-		if (filesz > memsz) {
-			dev_err(dev, "bad phdr filesz 0x%llx memsz 0x%llx\n",
-				filesz, memsz);
-			ret = -EINVAL;
-			break;
-		}
-
-		if (offset + filesz > fw->size) {
-			dev_err(dev, "truncated fw: need 0x%llx avail 0x%zx\n",
-				offset + filesz, fw->size);
-			ret = -EINVAL;
-			break;
-		}
-
-		if (!rproc_u64_fit_in_size_t(memsz)) {
-			dev_err(dev, "size (%llx) does not fit in size_t type\n",
-				memsz);
-			ret = -EOVERFLOW;
-			break;
-		}
-
-		/* grab the kernel address for this device address */
-		ptr = rproc_da_to_va(rproc, da, memsz, NULL);
-		if (!ptr) {
-			dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
-				memsz);
-			ret = -EINVAL;
-			break;
-		}
-
-		/* put the segment where the remote processor expects it */
-		if (filesz) {
-			ret = imx_dsp_rproc_memcpy(ptr, elf_data + offset, filesz);
-			if (ret) {
-				dev_err(dev, "memory copy failed for da 0x%llx memsz 0x%llx\n",
-					da, memsz);
-				break;
-			}
-		}
-
-		/* zero out remaining memory for this segment */
-		if (memsz > filesz) {
-			ret = imx_dsp_rproc_memset(ptr + filesz, 0, memsz - filesz);
-			if (ret) {
-				dev_err(dev, "memset failed for da 0x%llx memsz 0x%llx\n",
-					da, memsz);
-				break;
-			}
+	/* put the segment where the remote processor expects it */
+	if (filesz) {
+		ret = imx_dsp_rproc_memcpy(ptr, src, filesz);
+		if (ret) {
+			dev_err(dev, "memory copy failed for da 0x%llx memsz 0x%zx\n",
+				da, memsz);
+			return ret;
 		}
 	}
 
-	return ret;
+	/* zero out remaining memory for this segment */
+	if (memsz > filesz) {
+		ret = imx_dsp_rproc_memset(ptr + filesz, 0, memsz - filesz);
+		if (ret) {
+			dev_err(dev, "memset failed for da 0x%llx memsz 0x%zx\n",
+				da, memsz);
+			return ret;
+		}
+	}
+
+	return 0;
 }
 
 static int imx_dsp_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
@@ -969,7 +913,6 @@ static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmware *fw)
 	struct imx_dsp_rproc *priv = rproc->priv;
 	const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
 	struct rproc_mem_entry *carveout;
-	int ret;
 
 	/* Reset DSP if needed */
 	if (dsp_dcfg->reset)
@@ -985,11 +928,7 @@ static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmware *fw)
 		}
 	}
 
-	ret = imx_dsp_rproc_elf_load_segments(rproc, fw);
-	if (ret)
-		return ret;
-
-	return 0;
+	return rproc_elf_load_segments(rproc, fw);
 }
 
 static const struct rproc_ops imx_dsp_rproc_ops = {
@@ -998,6 +937,7 @@ static const struct rproc_ops imx_dsp_rproc_ops = {
 	.start		= imx_dsp_rproc_start,
 	.stop		= imx_dsp_rproc_stop,
 	.kick		= imx_dsp_rproc_kick,
+	.memcpy_tova	= imx_dsp_rproc_memcpy_tova,
 	.load		= imx_dsp_rproc_load,
 	.parse_fw	= imx_dsp_rproc_parse_fw,
 	.handle_rsc	= imx_dsp_rproc_handle_rsc,
-- 
2.47.3


