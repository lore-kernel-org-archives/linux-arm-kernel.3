Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0939D606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 16:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PqLmdXbO;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=khtZvs1g
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mGr7t/EAFXFSUA+jAEctWicl0dyfbpawNQjldrWR+2E=; b=PqLmdXbOf9HJ2L
	llqif5nkSXB2lOoKKmvwX9fAO/8qlsRR1mdZ+blkbsdLvoFt2upev/UameS20DH1KcCdVsIOYudHP
	1i0mNErvz1gslkExXzh9iV/5bTO2sCpj9srl94OlpqHBrUBO/Nn68P9SYRZOywPDMxebvdE5NK2Ej
	mRy2PaQfTC2i88kkqbTO+BxlJDouoS1DNLMhoAdGAwIcp4FDXpmNZZc+y3hTY9h3htP+svMGtx4ss
	T6FMRnZLeJ7op86LyNXWx9SumzrTPsfQOZjY0nep2Uin2U0yw8IEm7qoAHKvTytjghopkXi/OhR5a
	SbqRCYHBPbRt+193+8qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjzh-00000005LiE-1Wdv;
	Tue, 27 Oct 2026 16:25:49 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjzb-00000005Lfe-1xEX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 16:25:44 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso150895e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 09:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793118341; x=1793723141; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mGr7t/EAFXFSUA+jAEctWicl0dyfbpawNQjldrWR+2E=;
        b=khtZvs1gFcwV/f7ihsf1fDhZBKOeYKhoiWpnOAEK2mD99KPLylkTN28VvFJdEfFtFv
         9UWud8P7c2KPv16glmmvNwOi/GNghsAJNamQOSIHl9QBI9UvQ3Ryw8e5u0EYZVbnKFYP
         IAQ++9uTluUqE8+eGJU4+EA9FU9kAd562fUw1oPn1x8GUxmGhri9FUn7CijhS9sTALRB
         /f1S9oRyIfHkGcVpieSWXamBze8OpgSXwjV26UPFO/ZcwkObw7HWZkl4y8W7JPGqk4JW
         gQZEQJH94Xnf0XO1EDBo/1oZx0DhucQH9nir7+2PemIR09dAjQgCjiuKi/ZyrqSU+QT2
         041g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793118341; x=1793723141;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mGr7t/EAFXFSUA+jAEctWicl0dyfbpawNQjldrWR+2E=;
        b=XlJbNdkrTEeyEf/l+HaGSFiTTOnDx/LNkx8sgexdkHuialMIexWCGEao9FdklPGeQI
         38apWpGOwBGe7z796sFyPRfP1KaOXoCTr/jZ8ixqJKEodNgLov1nbuCh5Jnkmv/cEA2S
         8V02vO3eCey6SQIJ6S/MqTn2WThoa5OgqpkhJgL7Hy7qGh9ZYHPL6Ns49cVKRYPvOTke
         ZTWMFFwCPsDCX+5pdptob++eYV0XwM61EKBubHf8YYVHv68MaNt+r4JSWVpTh/QjrYS+
         yOgv5Knrz27QPRjvlWGA2EvMgOhmiIpFcGvnbpv5525KkpAkvXEfoRLLAqG+n8oqM4SS
         SypQ==
X-Forwarded-Encrypted: i=1; AKwUvBwbu5te18RoSGVVjDddpFeoCmCGzFkhMhoUSgQDuITw1+fMcbcn1oC4uUVjqEC0LirdKhordh57BIU1fLchgY8T@lists.infradead.org
X-Gm-Message-State: AFq9FYKs/hsZ19iqyVQaN58CVR1T+tVsIzbJ81Qnzfle7qBSjuPZRNFF
	gGqJv9HattOOl5mqLS2/Yx63SeZjUFeRvgSgNWo7yZZ1TQ3dZHY0NnaxlVRHNzw207I=
X-Gm-Gg: AYBFou3HF3Z2y0AZWV6f41gY7gTe/+oucfidE49wu/wwFLeqpwuSgiSHeKyX/K5P0qs
	8HVMlE/tWcxpo2cetWRfE9t0S6uj3W4yAGMSKGqTd9lpJl7p1jO7qGjasT2ZJgc6wUGqJRTZzcy
	ZMnMhlfSzzmrYa78fXpp73M720lg1vMIbXTa7OO5qcsfMBLThD8iK4eZbR2g+BS6Z2somRyO+DN
	hL+M7apWFp1iesbqOKWyY5JYqQpENk11trD62KQq2a7BLzPRFYRKVPHVMaR+h8efnhqGUsD6WHk
	iWrFMDsL6jfjoibWCZp08qLRtPdIwpCiEH8qzk4g49mOezQJss5WdsHCGoT3q7jhp9UTESnHMx3
	xbLa/Cnptgx9K4ziqVX/Qxf0XNqVdxrqJyynI9t8lSXj1A6aCkZZFvwhIUYbmX2IwBTEas36bvv
	rjkgBsZsW7jYbDJ9RXQY2Css11319erOaXupfd9nYVdbTu4Uuv1sSIkSt9qok8gVFL2eKlncUzV
	uTrob+7w8hfPO4W4kvSiumoP1pTVpBap8eRq/wvXok4UmtMYn/6H3yhayJZxjuV1Txn/1zuLZBF
	uW4x2VAp3ecpoeGNnscUvzuRKXao/9vdpn/1OLmp6gEv
X-Received: by 2002:a05:600c:8708:b0:4a2:1655:87db with SMTP id 5b1f17b1804b1-4a35aae70b1mr197677005e9.0.1793118341151;
        Tue, 27 Oct 2026 09:25:41 -0700 (PDT)
Received: from localhost (p200300f65f19a90461358920bbb0c5ad.dip0.t-ipconnect.de. [2003:f6:5f19:a904:6135:8920:bbb0:c5ad])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ecd37f4sm27880521f8f.44.2026.10.27.09.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 09:25:40 -0700 (PDT)
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
Subject: [PATCH v2 2/2] remoteproc: imx_dsp_rproc: Implement .memcpy_tova()
Date: Tue, 27 Oct 2026 17:25:21 +0100
Message-ID: <dc0e679eba5a0283b0d34e756c71db569583073c.1793117996.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1793117996.git.u.kleine-koenig@baylibre.com>
References: <cover.1793117996.git.u.kleine-koenig@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5297; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=zxEn3GKmjIkApottOw2da7a+5Ym3eFer8LHtbjoIoLM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq4NB4Y61sfaRi2UYlrmaLCQ3nunydMgUidzF3j s/XqaKg0N2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauDQeAAKCRCPgPtYfRL+ ToLAB/0aPuOObiuuIObcbkpH5A5QaaL4H3cXCd9/01L5Dh5K0yCQBGnI9uKXHZ1b2qeSP4TkJL+ W2NNHrkuYMlM+Prx/DYaYy4U694aG+lqt5lcHM+jH6T+lWzq8ee66w9k1P+8kT06/RFyKlGfR60 2NcgdzlKqrZNk2Sh5RbGERfBzxy9hnDgz9+XTdxQ6iCkLKIKeh0IBdxGnDWnUa1rztDoUHtbhXL cfXos9ahRqgGyXOnfMAwnHGgX9S8eDfISFJTdXDe5kuXX/7mqK4tmLQP+20PNtWy0OBT5xfC6gE jxveX618fTLZ1vq7f72HZkRmkxo2Tf0Yl4wQGaz9J+uSfE2Y
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_092543_555335_DAB57F57 
X-CRM114-Status: GOOD (  20.78  )
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


