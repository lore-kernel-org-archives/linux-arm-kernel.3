Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C77606A328
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 18:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z9dCeHL3;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RFnWQgkd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Qc1K6dw8YZ5zOMaIssAlpVtWAd8Vswo/yLcW5TaoQ6c=; b=z9dCeHL3DW9cOz
	UTNEKE2DVrDNRvyT7byxqzTRMGdMgw+fFtv4ZjnbhzUmdZZmAkXBk40GnuSwGhOiD70smd6OhjTlE
	NI6ok5ScfcT4wILy+PHg8YAqq/gzu/PQDoMPmip0VZKST0Ym2QqMB6l/eSu9UCwUX0pmPixGg28wN
	767GCOBvXMMEXQ8OaLvW0bKoHEvYM2LWIYGi7lHeKcqHJ9WPFpmehQTGcDDXihDi8Qcz88nLeQAUx
	ZIlhgH7JiLSsXT/2R8JqJjmU19FVv1DkWrceAwhEEav7lSbOwWtq1HjuqX1ui9P0E0h95hbag5kt4
	tRE7AOgPrD5dAkGP1VAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2ep-0000000AEdX-1W7w;
	Thu, 05 Nov 2026 18:57:56 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2cg-0000000ADGz-1HDB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 18:55:45 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-716c0217635so977523eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 10:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904941; x=1794509741; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qc1K6dw8YZ5zOMaIssAlpVtWAd8Vswo/yLcW5TaoQ6c=;
        b=RFnWQgkdpW3Mf+RwUmPe5iJa61owDz5R6P8KdLQGG6zwFulQGQ8eE7vKeLUk6DDp0a
         snhd7k9MGgrghU2eC7QEM1HLpJDP+oyIGnmh/fzEFWaYsAKKMjrDXr8GNgezBDPuc/kl
         8s8jHhQCQkXGx+LEsSVwDNSusOz4q9RBBOMjHdOUeZAzW4D9jcL30qCaxd1sPYcLFnjz
         Vq8l2HhjdhKjXXqsemPq0jK5kge4/I+saDjJAXI6jOtkMYc80fL5tTKYAbCj80smOl4J
         55Q0lo2+032vcefVR5IqYYrV4gJgyVJVN7jEX1pXZJNoZbWUHr07f60Rskvxrg7+4v1z
         BEZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904941; x=1794509741;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qc1K6dw8YZ5zOMaIssAlpVtWAd8Vswo/yLcW5TaoQ6c=;
        b=bzKqjEA06+btG2NQjmQPG4DPv+LzPYWlNJw6/Y7qor5dT4633WhB2jOsCdu3f3u5Mj
         lhoSUJuMl41RnbZF80H8+z0GMZgngOsgHM896VhHHPKSQpVHBArQjeJGuk4M1Vh3sNV9
         +6XQIaW6lwVdDexauDNa5uu9GipsobMoGv1bbykEzPApSGN37fmwHmqhblvnakPIZ3iP
         ghFKSUA9J9V1KdOkmEhlB8jMFqyEORQposx0joqDi20yC//V/sZ0Wi08xgcUkMhYJPC9
         YmZ1UnOkYNtU7vq13y8QzZSp8Yg0R6+4tCScddzgf38sF/60SgNj4rNkrLIVlpiVbiTi
         +UzA==
X-Forwarded-Encrypted: i=1; AKwUvBy4ChABIL4c7K7Bf0yWfH/iUrnjauWXfl0Q+piXRkGB0wpp4DuALQ1Ld7r1sbUSQfcaL7LE76eSEO4LufDz7XRg@lists.infradead.org
X-Gm-Message-State: APuU4Z+Y7oj8BMBgCbl8T7HvQjomQU4WT4qd8o5eoDnFWxo1DgB5oe/P
	rZcfBd2rueRtDV9pIkRvniy4a1Z5jdyZTiDwv4FusK8h6Yfdzpkxxegu
X-Gm-Gg: AYBFou0AKOtCBKRXtfhaUCTNZSRnmSRmucgVj+CAV+Nd5gecTBQujiIrLAEjZydJ+M+
	cxm073wyqTF4lOemGN8fSLxHJDawZu/Q1/blHcojTGu9+AbpWnLwrvN6cmrXw+W+zG592BKcoMx
	VKmMiiOhgFNHaD0hKk6jR0pjbO8ZEV3W4jzFb58XzeN9GM61KCY2o5NHSYUrShyErpDmytL4bte
	fjWfEGCrM8bJRPeI09ehuRQ1CgRjXbCeDI4ZERjdweOq/b/9pj0Xrm/LRpwxoaYE+j6k+eFuy0X
	z7O39iFlD59+0blHAA5NpuXjnqWsu3GoNVbxWO5pXN7eBm3MMuXqtikuEAUJgeXEzujEIeLtrhV
	isA72g7WT3/qTxRwZLlrrUePmYbFk8m6kMrNkcE5FLFKLlfZAEQ1xAWJqLpVbeERBLsnTpgKNmF
	FkxYJMsQPVVVzLsAhfCh2vf2git7yzTMd0f7I33K2J6GFcN/beJaN8raprV16zMRFcPifNfNmsN
	Y6Y66kslD8DxVbwfznTj3Y5AJCsmUR418meularrlNNr9aaiChIKW680gKtnqmV0vchyAuxQ0sE
	j3L8Qxr+cHOcSHCGONq2JCox/w+7OHOxSI3eU91A/722//WI+5YqcLomGCpb2Vn6FR691YBzQGS
	vPj3akAhA6xZHfyP8oJGYDfhsyPUtthHcFuvvFDyXd2+oPFUeT4U0FV07qa5kOAeRBwfGCer6MA
	UTFylDfO8aZldiB7uX61ZnzJGBmvImgjtE7fErnf1NUNuVpN7NciZd
X-Received: by 2002:a05:6820:c5ce:10b0:716:b936:7cf6 with SMTP id 006d021491bc7-716e73763e0mr260411eaf.4.1793904941072;
        Thu, 05 Nov 2026 10:55:41 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:39 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:22 -0700
Subject: [PATCH v10 06/26] mtd: rawnand: sunxi: propagate page-setup and
 erased-check errors
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-6-dca1f6ed29a8@gmail.com>
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
In-Reply-To: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_105543_237654_E4E1BA2C 
X-CRM114-Status: GOOD (  20.62  )
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

The ECC read callbacks ignore nand_read_page_op() failures. A command or
ready timeout can therefore leave the requested page unselected, yet the
driver continues with data transfers and can report success for stale
data. Return the setup error before starting PIO or DMA.

After an ECC error, the driver rereads the physical data and OOB with
randomization disabled to distinguish an erased chunk from corrupt data.
Those rereads can also fail. Do not pass stale buffers to
nand_check_erased_ecc_chunk() or count a transport failure as an ECC
result: return the reread error instead. Successful erased checks retain
their existing statistics and correction-count behavior.

Route PIO read errors through ECC disable. DMA has already released its
transfer resources before interpreting the results, and its caller
retries a failed read in PIO. Restore the corrected/failed counters from
before that DMA attempt so earlier steps are not counted again by the
retry; leave bad-block counters unchanged.

These unchecked returns were found by inspecting the read callbacks and
their NAND-operation helpers.

Fixes: 97d90da8a886 ("mtd: nand: provide several helpers to do common NAND operations")
Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 56 ++++++++++++++++++++++++++++++---------
 1 file changed, 44 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index ae18a7fbca77..9a7b365e998e 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1043,7 +1043,10 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
 	}
 }
 
-/* Return whether the chunk is erased, and account for its ECC result. */
+/*
+ * Return 1 for an erased chunk or 0 for an uncorrectable chunk, with ECC
+ * statistics updated in either case. Negative values report transport errors.
+ */
 static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 				       u8 *data, int data_off,
 				       u8 *oob, int oob_off,
@@ -1055,10 +1058,16 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 	int ret;
 
 	/* Check the physical representation for bitflips in erased pages. */
-	if (nand->options & NAND_NEED_SCRAMBLING)
-		nand_change_read_column_op(nand, data_off, data, ecc->size, false);
+	if (nand->options & NAND_NEED_SCRAMBLING) {
+		ret = nand_change_read_column_op(nand, data_off, data,
+						 ecc->size, false);
+		if (ret)
+			return ret;
+	}
 
-	nand_change_read_column_op(nand, oob_off, oob, oob_len, false);
+	ret = nand_change_read_column_op(nand, oob_off, oob, oob_len, false);
+	if (ret)
+		return ret;
 
 	ret = nand_check_erased_ecc_chunk(data, ecc->size, oob, oob_len, NULL, 0,
 					  ecc->strength);
@@ -1322,6 +1331,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	struct sunxi_nfc_ecc_read read = {
 		.buf = buf,
@@ -1329,6 +1339,8 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 		.oob_required = oob_required,
 		.dma = true,
 	};
+	unsigned int corrected = mtd->ecc_stats.corrected;
+	unsigned int failed = mtd->ecc_stats.failed;
 	struct scatterlist sg;
 	int ret, i;
 	u32 status, pattern_found, wait;
@@ -1380,9 +1392,19 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 	ret = sunxi_nand->oob_ops->read_batch(nand, &read, status, pattern_found,
 					    0, nchunks);
 	if (ret)
-		return ret;
+		goto err_stats;
+
+	ret = sunxi_nand->oob_ops->finish_read(nand, &read, NULL);
+	if (ret < 0)
+		goto err_stats;
+
+	return ret;
 
-	return sunxi_nand->oob_ops->finish_read(nand, &read, NULL);
+err_stats:
+	/* The caller retries the whole read in PIO mode. */
+	mtd->ecc_stats.corrected = corrected;
+	mtd->ecc_stats.failed = failed;
+	return ret;
 }
 
 static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
@@ -1468,7 +1490,9 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	};
 	int ret, i, cur_off = 0;
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1476,10 +1500,11 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	for (i = 0; i < ecc->steps; i++) {
 		ret = sunxi_nfc_hw_ecc_read_chunk(nand, &read, i, &cur_off);
 		if (ret < 0)
-			return ret;
+			goto out;
 	}
 
 	ret = sunxi_nand->oob_ops->finish_read(nand, &read, &cur_off);
+out:
 	sunxi_nfc_hw_ecc_disable(nand);
 
 	return ret;
@@ -1490,7 +1515,9 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 {
 	int ret;
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, oob_required, page,
 					       nand->ecc.steps);
@@ -1513,7 +1540,9 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	};
 	int ret, i, cur_off = 0;
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1522,10 +1551,11 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	     i < DIV_ROUND_UP(data_offs + readlen, ecc->size); i++) {
 		ret = sunxi_nfc_hw_ecc_read_chunk(nand, &read, i, &cur_off);
 		if (ret < 0)
-			return ret;
+			goto out;
 	}
 
 	ret = read.max_bitflips;
+out:
 	sunxi_nfc_hw_ecc_disable(nand);
 
 	return ret;
@@ -1538,7 +1568,9 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 	int nchunks = DIV_ROUND_UP(data_offs + readlen, nand->ecc.size);
 	int ret;
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, false, page, nchunks);
 	if (ret >= 0)

-- 
2.53.0


