Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6377606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 10:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zPfPOTwK;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ZVX7xpVJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DA1a6/jz2LWscq7d/CNTikpsrr1vkgOPB56H0ypHpFU=; b=zPfPOTwKjESBAl
	2pakJL0Sn9aqgbdER3wVV33YmpmADUXc6Qk01lg2YTof4FVLJof0Ky1mX58jr0+jEIKYjzPU2SPeN
	M/ufBROkhyhoaUOSEP9oYmq/79gWsOIgU9lyehUnCxvD2CstXYN9gHMTc/MiNNY+znmPu6nrqPRx8
	SWsPqD2VfdL3fEVzPc9dmhe1X6RTRMCQxKcpp9zC7gsfrJ2QIprtK2g7cNjac0VbPrEC7JORgZQdW
	UemauasbJordY+q0DKQ/MWe1M8RXTX9sykZO1pB6Mlylhb59KlMSs1JG99hvU3SnZShwa7a2YVg8S
	O5E4ezfoWrXCHQxCTRUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHeO-00000002EOB-0hMo;
	Mon, 26 Oct 2026 10:09:56 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHeJ-00000002ELL-1Y5d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 10:09:52 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so17570405e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 03:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793009389; x=1793614189; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DA1a6/jz2LWscq7d/CNTikpsrr1vkgOPB56H0ypHpFU=;
        b=ZVX7xpVJuMPNhBxW5Bwqq9N0cJZEJh8MtWa5mn/aMRF5kCU9iXU6U08J/boBFJ3FyH
         1+CxtkyIDKi9UqoP+ghP9oToLVC+Tw9wPvJBQgtkJ0f54TIToaO+8ImGIxDT/ZJ47xKs
         rTNWPLjwssLGCNcidk8bOFVIuMY0LyihPD5lH/B3RUtBSTvg+oNI/JG+NbwUivvhWtYD
         hm5/D5jF7LIwSqhyveRti9eMBqYCmiGyI6pc4Al3D7Bqx6rSmUi3ZXl3jemRYW2MY6UY
         vzaDUxizreMMGxkYmG2QhDLjHOBPy1T65OzvSyNJvbCWdzy2UQhAzomi28hIwPPA/lDX
         RUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009389; x=1793614189;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DA1a6/jz2LWscq7d/CNTikpsrr1vkgOPB56H0ypHpFU=;
        b=LCoBK6D/9zoFZq1GG33YTtb8fzzx7dQHOLh/bT3k8UqBykTPRpZZnZdquUlcC3kG/8
         Umjbe6Lhe9gqHQRRNssuSANJMgXQdMVwGbRv4zWlXUCnpBTXuTkj42KLAFAZOtVLXqzQ
         jjPQx9xlJ02uVgI/RFgBOzKTJ3P9Br3hAyDQKqOmHTzPQOZ0IDB+Q/Tp5a69yEdLtvyS
         PGXnQD5wUM00fkrzHP8hgoAv00t/jnvlV81T6UeJVkWtbX+Q68/av87LlRxn/vnJnSNE
         oV1Rny3q8sst0VhhxXALkaMKubndr7oBVDYuN6EaCWd323OEGHf8U5aSozl0DARldq7p
         1qsw==
X-Forwarded-Encrypted: i=1; AKwUvBy9YR2KYeC5ZQVh6tMUyeVjS+pgLTBtDM5OXK9icpOv95Iyc7QDXlNCMIj5OeQyP76+Y5XdiBo+uCdEMGGZvVSj@lists.infradead.org
X-Gm-Message-State: AFq9FYLOD4+fi2RDTM1EKzWUxMK265eUYx1dDYxiD8lP4pe+c2wo03Xl
	R5ssHraKUzTl57NxSCF/yUEFUOhj0ROXpN7VcYearmcjKtN8GGNVzMgG3RzKp2fP11k=
X-Gm-Gg: AYBFou1UWJrqJBU4VhlZ/mqUwrWCfkmLNMNoThSWiNZ9M1Sl6MZk13mu0GYpVs8gPXr
	peEXV5WuwFVOnEWdq2fvmRID2WIXvX+8UuV3RGlxrcyKJvhahuADpcnEY9PB1AjeF3b/rX98Skd
	RTzVwLYcfM55X8Nn1hTYkyLYSXqSxYpRmrtStowr+7Mm6OyvuPGHBfm3EG2R2uIZImLeWrYpWqN
	lzeTm8w94Zjinr/xiaqfWyLwV8sfQC+HdALhgeRzsWXrbfxLdU/SLFM92HuDH0ArikcJXv5S5ZO
	5D9E7ffM5HkfNE6hUvTiQttBozkRn5apQvvJfswTXxH6m/DRsuZrFvOW72I5iv3rYKRzy9wwssh
	VCiSvMDVZtZAJjGWSv2VV7La614m+yUt4GNwnK0hJSBl3/h+EFZ18QtYmsWKs5pZodaMvqIDvmA
	gXtfSzZjUKtUERaH/A5QRuBaMuu0gfE6kJ/uZBOBY+04k+jlRmY79dAUccT4bFxjS+/YftEGnZv
	cBep+Yv8zj7e0utY2blt4onOoLxDEtuCUWUwqy55DZr3VJASK1vZYcIOJxsWEjEaUoEHH1tOmmz
	1kWN4PPGmp2mtBNINFd9iCGrKPN/n4Uh9SWBAyCAKfPgdVCFZfxVC+qdTaceQGuI
X-Received: by 2002:a05:600c:1987:b0:4a1:db17:c7e6 with SMTP id 5b1f17b1804b1-4a35ac3a7b1mr105329285e9.2.1793009389330;
        Mon, 26 Oct 2026 03:09:49 -0700 (PDT)
Received: from localhost (p200300f65f19a904bf765b6740c3076b.dip0.t-ipconnect.de. [2003:f6:5f19:a904:bf76:5b67:40c3:76b])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ebc3bdbsm12723417f8f.19.2026.10.26.03.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:09:48 -0700 (PDT)
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
Subject: [PATCH 2/2] remoteproc: imx_dsp_rproc: Implement .memcpy_tova()
Date: Mon, 26 Oct 2026 11:09:31 +0100
Message-ID: <951ff0c2bad8709b77b5ac7086b70cc7d37ce51c.1793008847.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1793008847.git.u.kleine-koenig@baylibre.com>
References: <cover.1793008847.git.u.kleine-koenig@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5255; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=hxruU5Qpi7r2EJrNeBqarI1YguCnlDks2WjPOZVNhtc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq3ybhCmBylIiFeQF6JYkVphxgdtR4trriGdeKV WyMVHE5hfGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCat8m4QAKCRCPgPtYfRL+ TqZQB/469uqHF0RQ3p1EtU5kkJhZgfZbqHOiHj9dcj/QjmbMJRgCsw+/wIgRYW0IRiO/++pMNVX 2sQYzZnumvdt3pS9qoAvqTO+EdxGaFirLJxoABx1CDduUP1JpAsbpKaYNyEoJqt+5lQh3TMQcMq DlM1PL/u9DAx7b54WXxvPhB6vOWX0eptEk7qYWjz8vQ9Q4g2gmHL2RQKwWGE0GZ1yweUJQmCn+K qyD+Vbdi7el6bO9pv5+VP2gX9rLg+BFoCH2h2iQxTfeaCOXBqThL5xuza0JA19i0j+J+li58Fr7 TlwpNM4Dn/jozhd/xBFmZTToNdVIK2FJRuURwqTWCZtgSzTh
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_030951_451534_6D385FCD 
X-CRM114-Status: GOOD (  20.82  )
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


