Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1978D606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 20:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ENht9Kgr;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vf5UqJqp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8FLK5L4m7kGeWnbYjP4uSPNLUtTL4HW4u70VBTQSqv4=; b=ENht9KgrYdviGW
	M+IfAlRNo+1nojmobqqvbNjsZWzz0V5gWDVBuLf008KQ6pKWqRSQ1M9l1Byhgj5zOuL8C5RaF3r/D
	Mk4lt/ph4hZNE+oB/iNmqPH50/wJI3/PBrPsHtZoYI/mE42zIt5q6HMiES2xij9unvJRwWFTTFQ7d
	AvzFmYFeAa1cAaWffXrSCN1IOYu7cF0uP0Wp/t0TrCos/R1jTpug/silR+GtrslOlF6D4ItvC7iVU
	ze0XtwI8pKAHp5IAK6LEepSAmu2xO+qaVSc6Mo7K7mDWL2RtQiQ5e8TnQHqqbIUFkAzyOVUjpD4Fq
	9Z3+5MaAweUadr6gSX9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2ck-0000000ADJY-013B;
	Thu, 05 Nov 2026 18:55:46 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2cV-0000000ADD9-3l86
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 18:55:36 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-6d68de53053so1244653eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 10:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904931; x=1794509731; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8FLK5L4m7kGeWnbYjP4uSPNLUtTL4HW4u70VBTQSqv4=;
        b=Vf5UqJqpr7bY1bk2gCNt5qb0ZKBm42dA6OaLxCd130T73/Q7uS22r24KoPXTAVCcYJ
         9Ou9j/P5X0Eq7rSbZ1YiuHECM90oq5m2vqxVM31W7K+kSURER8vbGqXbQOh+ubgQvYI4
         szZHEPfvdKAoUjVN2Hn1RED7u0XX+iQWef6M0Unc4Kg8ppbY5LcBbBNWiRwHkg7vC2xJ
         YNbZGGfkfdi3jFrCK9HRhSaBcxOp+VzuKM79wal0d5/bxMkqHwA4z8Lam79DQcL/2SeR
         vF/DzRQ6g3IpiQG0NtJk9LxVRWdhMVP6PyPvlZ4XJqRpnagxO4jlwfEEQjWjaviVtXrQ
         rD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904931; x=1794509731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8FLK5L4m7kGeWnbYjP4uSPNLUtTL4HW4u70VBTQSqv4=;
        b=Uf3Cv4cpTK7BdhAfrfyymHkUPib0stRfYCEoj4VjYKzbNb2o21o9mEaHjFWB1Wcyzq
         Ux2k6rB6SjuThh26Hq7pfINaPJ6BsR+Hstw6mFDG9kpFMy4fyuWy8b1sLbDs34TgDKPx
         3kn5KaejYSxlmgSWTTnqyQsQsyVLdkDqLzyRijcE+zMf+ghhS8T+ibzdXxDBbVpgddIY
         QLmVywImCPgnZoxlhhdUzPvF299B9KS6NyHMKIAuPHNL78heiV6g2oseQPPIahQhSpbj
         AATrDltsmdbpY4jhNyy3hF3Iz5Qhpv2flzswWlftDJKNmvH3fIb4yt7pe/181iqmtKb6
         FEOg==
X-Forwarded-Encrypted: i=1; AKwUvBw/6hh2e+R1gkqDMhvXwHBVDE2mT4LFVsS/01cfTzflBBtUxNMQilnTONEMsu1vC5UaSQ2V5szUW6EZekQJNQUW@lists.infradead.org
X-Gm-Message-State: APuU4Z/5g3tIhoUSOMq/A8hcOK+gCh3W5KcjmaVaPyCzEldIQMbIfAbn
	zThPB1OYzaZs/2/jtdbEYKB4H/AkJVS9Hu94tCxyhHLkb7mV/3FdVnfG
X-Gm-Gg: AYBFou0A3bMgq28SBQ3xpYnb2Wb62IEeV/4xfe8ZvAAOPerJidXfdu/25/ZUzKgrPVR
	n49oFOpRn1vDteUuvv3T/o2iKcd6+QtzgXREPYk70Oz5q54isQExIyRrnKfWn0cTqmzEaF+YehB
	My2Xtz4m3VEaRiHqudj7zsd5ulpQjlWG9J0xT3mbvLHigYeocjy6kTol1ni+8wSSw86xNh1hZYu
	ZwJBwhwRISLJnac85JsGz/NZe/9224YoFUTXXm7A5Dr2RrarR28tKSXHRmLtg7MSMVAapoiUQna
	LZiXoHNFSWvNDSw52HruV9aUKMSlYi74VNNJ1v6N2/LP8AIYeIq/DB/jUSUOzN12xFX0gQrEZAY
	LVR7+y5ecG2us6/ZL5qu8Lx61G3U8onpPVBalrcan6julvYajgJlQ6YOe4pcwk7Qi1bEZFMC0+K
	6wijnzX2namqJF7XsPXJtx66q6n7hevOfA0RFhQjk7oKqk06x6Ks06CY+JLoolAWsTLT1bIQ7cN
	2RVkuz6bmcxgC6yR9wUqU9WYJi2J6ty4tP8EV41dl5ubYSQ5h/8K7jrkb9MTDkBS/qe0gCQ2ReS
	WJEA+vLNXM26U23A0K6PNUv3g2C2kUr5UgQN3IwChV/+KvNklMlNwRIKhx1Lcpwl9XezBnKJrtE
	vUbhnn1HCkXssbvnbV+5OSAY188gkBC2vOGco62GOAKWYg1sbbbr34mMhGUgPIv8jqLVFq0zrlT
	DuAOAGy6ESPE/iF/MnKca9YSnh9YGg8+Zou0SieStnYWlOXcm6Wxzy
X-Received: by 2002:a05:6820:1387:b0:716:c3a0:48db with SMTP id 006d021491bc7-716e78c0135mr318160eaf.25.1793904930446;
        Thu, 05 Nov 2026 10:55:30 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:17 -0700
Subject: [PATCH v10 01/26] mtd: rawnand: sunxi: centralize OOB handling
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-1-dca1f6ed29a8@gmail.com>
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
X-CRM114-CacheID: sfid-20261105_105532_009484_FC7F88BB 
X-CRM114-Status: GOOD (  27.05  )
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

PIO and DMA interpret the same hardware-ECC results, retrieve protected
OOB bytes and check unreadable chunks for erased data in separate paths.
Keeping that policy in both transfer paths makes fixes easy to apply to
one path but miss in the other.

Share the processing through per-chip OOB operations selected at attach.
A read callback consumes one PIO step or a completed DMA batch. A finish
callback handles the OOB tail and returns the largest correction count.
Keep primary ECC-transfer sequencing and DMA ownership in the transfer
functions. Interpretation callbacks may issue supplementary OOB reads or
raw erased-page rereads. Carry the full-page buffer, page, correction
count and whether any chunk was erased in a per-read context.

Move user-data reservation and layout setup behind the same operations.
The existing plain and scrambled-with-plain-BBM modes share geometry and
read handling. Only the scrambled mode transforms the first two user bytes
to compensate hardware randomization and keep the on-flash marker plain.
Preserve fixed and variable user-data allocation, including the older
controllers' extra two-byte reservation when maximizing ECC strength.

This preserves the existing register accesses, transfer ordering, OOB
length selection, error handling and ECC accounting. In particular,
retain DMA's two passes: consume corrected OOB before raw erased-page
rereads. PIO keeps its current parity representation and physical reread
behavior. Spell out the PIO and DMA OOB-read branches so their different
parity reads remain visible. OOB-length fixes, read-error handling and
register-read caching are separate changes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 554 +++++++++++++++++++++-----------------
 1 file changed, 303 insertions(+), 251 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index f41feebe4257..80006d1a33d6 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -256,12 +256,38 @@ struct sunxi_nfc_timings {
 	s32 tRHW[SUNXI_NFC_TIMING_STEPS];
 };
 
+struct sunxi_nfc_ecc_read;
+
+/* OOB geometry and interpretation; callbacks may issue supplementary reads. */
+struct sunxi_nfc_oob_ops {
+	/* Reserve OOB bytes for nsteps before ecc->steps is initialized. */
+	unsigned int (*min_user_data)(struct nand_chip *nand, int nsteps);
+	/* Install the user-data layout for the selected ECC geometry. */
+	int (*init_user_data)(struct nand_chip *nand, int nsteps);
+	/* Optional symmetric conversion of the on-flash bad-block marker. */
+	void (*transform_bbm)(struct nand_chip *nand, int page, u8 *bbm);
+	/*
+	 * first_step is page-relative; status bits use transfer-local slots.
+	 * PIO uses slot zero even when first_step is nonzero.
+	 * Return zero on success or a negative I/O error.
+	 */
+	int (*read_batch)(struct nand_chip *nand, struct sunxi_nfc_ecc_read *read,
+			  u32 status, u32 pattern_found, int first_step, int nsteps);
+	/*
+	 * Finish remaining OOB; return max bitflips or a negative I/O error.
+	 * cur_off is an absolute NAND column, or NULL if unknown.
+	 */
+	int (*finish_read)(struct nand_chip *nand, struct sunxi_nfc_ecc_read *read,
+			   int *cur_off);
+};
+
 /**
  * struct sunxi_nand_chip - stores NAND chip device related information
  *
  * @node: used to store NAND chips into a list
  * @nand: base NAND chip structure
  * @ecc: ECC controller structure
+ * @oob_ops: OOB geometry and ECC-result interpretation
  * @clk_rate: clk_rate required for this NAND chip
  * @timing_cfg: TIMING_CFG register value for this NAND chip
  * @timing_ctl: TIMING_CTL register value for this NAND chip
@@ -273,6 +299,7 @@ struct sunxi_nand_chip {
 	struct list_head node;
 	struct nand_chip nand;
 	struct sunxi_nand_hw_ecc ecc;
+	const struct sunxi_nfc_oob_ops *oob_ops;
 	unsigned long clk_rate;
 	u32 timing_cfg;
 	u32 timing_ctl;
@@ -908,6 +935,7 @@ static u8 sunxi_nfc_user_data_sz(struct sunxi_nand_chip *sunxi_nand, int step)
 	return sunxi_nand->user_data_bytes[step];
 }
 
+/* PIO uses register zero; DMA concatenates user data within each transfer. */
 static void sunxi_nfc_hw_ecc_get_prot_oob_bytes(struct nand_chip *nand, u8 *oob,
 						int step, bool bbm, int page,
 						unsigned int user_data_sz)
@@ -946,8 +974,8 @@ static void sunxi_nfc_hw_ecc_get_prot_oob_bytes(struct nand_chip *nand, u8 *oob,
 	}
 
 	/* De-randomize the Bad Block Marker. */
-	if (bbm && (nand->options & NAND_NEED_SCRAMBLING))
-		sunxi_nfc_randomize_bbm(nand, page, oob);
+	if (bbm && sunxi_nand->oob_ops->transform_bbm)
+		sunxi_nand->oob_ops->transform_bbm(nand, page, oob);
 }
 
 /*
@@ -1007,9 +1035,9 @@ static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
 	u8 user_data[SUNXI_NFC_MAX_USER_DATA_SZ] = {};
 
 	/* Randomize the Bad Block Marker. */
-	if (bbm && (nand->options & NAND_NEED_SCRAMBLING)) {
+	if (bbm && sunxi_nand->oob_ops->transform_bbm) {
 		memcpy(user_data, oob, user_data_sz);
-		sunxi_nfc_randomize_bbm(nand, page, user_data);
+		sunxi_nand->oob_ops->transform_bbm(nand, page, user_data);
 		oob = user_data;
 	}
 
@@ -1055,6 +1083,41 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
 	}
 }
 
+/* Return whether the chunk is erased, and account for its ECC result. */
+static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
+				       u8 *data, int data_off,
+				       u8 *oob, int oob_off,
+				       unsigned int user_data_sz,
+				       unsigned int *max_bitflips)
+{
+	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	unsigned int oob_len = ecc->bytes + user_data_sz;
+	int ret;
+
+	/* Check the physical representation for bitflips in erased pages. */
+	if (nand->options & NAND_NEED_SCRAMBLING)
+		nand_change_read_column_op(nand, data_off, data, ecc->size, false);
+
+	nand_change_read_column_op(nand, oob_off, oob, oob_len, false);
+
+	ret = nand_check_erased_ecc_chunk(data, ecc->size, oob, oob_len, NULL, 0,
+					  ecc->strength);
+
+	sunxi_nfc_hw_ecc_update_stats(nand, max_bitflips, ret);
+
+	return ret >= 0;
+}
+
+/* Shared across a read's transfers; buf remains the full-page buffer base. */
+struct sunxi_nfc_ecc_read {
+	u8 *buf;
+	int page;
+	unsigned int max_bitflips;
+	bool oob_required;
+	bool dma;
+	bool has_erased_chunk;
+};
+
 static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 				    int step, u32 status, u32 pattern_found,
 				    bool *erased)
@@ -1094,98 +1157,6 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 	return NFC_ECC_ERR_CNT(step, tmp);
 }
 
-static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
-				       u8 *data, int data_off,
-				       u8 *oob, int oob_off,
-				       int *cur_off,
-				       unsigned int *max_bitflips,
-				       int step, bool oob_required, int page)
-{
-	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
-	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
-	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	int raw_mode = 0;
-	u32 pattern_found;
-	bool bbm = !step;
-	bool erased;
-	int ret;
-	/* From the controller point of view, we are at step 0 */
-	const int nfc_step = 0;
-
-	if (*cur_off != data_off)
-		nand_change_read_column_op(nand, data_off, NULL, 0, false);
-
-	sunxi_nfc_randomizer_read_buf(nand, NULL, ecc->size, false, page);
-
-	if (data_off + ecc->size != oob_off)
-		nand_change_read_column_op(nand, oob_off, NULL, 0, false);
-
-	ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
-	if (ret)
-		return ret;
-
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, nfc_step);
-	sunxi_nfc_randomizer_config(nand, page, false);
-	sunxi_nfc_randomizer_enable(nand);
-	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | NFC_ECC_OP,
-	       nfc->regs + NFC_REG_CMD);
-
-	ret = sunxi_nfc_wait_events(nfc, NFC_CMD_INT_FLAG, false, 0);
-	sunxi_nfc_randomizer_disable(nand);
-	if (ret)
-		return ret;
-
-	*cur_off = oob_off + ecc->bytes + user_data_sz;
-
-	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
-	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
-
-	ret = sunxi_nfc_hw_ecc_correct(nand, data, oob_required ? oob : NULL,
-				       nfc_step, readl(nfc->regs + NFC_REG_ECC_ST),
-				       pattern_found, &erased);
-	if (erased)
-		return 1;
-
-	if (ret < 0) {
-		/*
-		 * Re-read the data with the randomizer disabled to identify
-		 * bitflips in erased pages.
-		 */
-		if (nand->options & NAND_NEED_SCRAMBLING)
-			nand_change_read_column_op(nand, data_off, data,
-						   ecc->size, false);
-		else
-			memcpy_fromio(data, nfc->regs + NFC_RAM0_BASE,
-				      ecc->size);
-
-		nand_change_read_column_op(nand, oob_off, oob,
-					   ecc->bytes + user_data_sz, false);
-
-		ret = nand_check_erased_ecc_chunk(data,	ecc->size, oob,
-						  ecc->bytes + user_data_sz,
-						  NULL, 0, ecc->strength);
-		if (ret >= 0)
-			raw_mode = 1;
-	} else {
-		memcpy_fromio(data, nfc->regs + NFC_RAM0_BASE, ecc->size);
-
-		if (oob_required) {
-			nand_change_read_column_op(nand, oob_off, NULL, 0,
-						   false);
-			sunxi_nfc_randomizer_read_buf(nand, oob, ecc->bytes + user_data_sz,
-						      true, page);
-
-			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, nfc_step,
-							    bbm, page, user_data_sz);
-		}
-	}
-
-	sunxi_nfc_hw_ecc_update_stats(nand, max_bitflips, ret);
-
-	return raw_mode;
-}
-
 /*
  * Returns the offset of the OOB for each step.
  * (it includes the user data before the ECC data.)
@@ -1241,18 +1212,166 @@ static void sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
 		*cur_off = mtd->oobsize + mtd->writesize;
 }
 
-static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf,
-					    int oob_required, int page,
-					    int nchunks)
+/* Interpret one PIO step or a completed DMA batch before reusing its status. */
+static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
+				    struct sunxi_nfc_ecc_read *read,
+				    u32 status, u32 pattern_found,
+				    int first_step, int nsteps)
 {
-	bool randomized = nand->options & NAND_NEED_SCRAMBLING;
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	unsigned int max_bitflips = 0;
-	int ret, i, raw_mode = 0;
+	bool randomized = nand->options & NAND_NEED_SCRAMBLING;
+	unsigned int user_data_sz;
+	int i, ret;
+
+	for (i = 0; i < nsteps; i++) {
+		int step = first_step + i;
+		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, step);
+		u8 *data = read->buf + step * ecc->size;
+		u8 *oob = nand->oob_poi + oob_off;
+		bool erased;
+		int bitflips;
+
+		user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
+		bitflips = sunxi_nfc_hw_ecc_correct(nand,
+						    !read->dma || randomized ? data : NULL,
+						    read->oob_required ? oob : NULL,
+						    i, status, pattern_found, &erased);
+		if (bitflips < 0) {
+			/* Preserve PIO data before the raw erased-page check. */
+			if (!read->dma && !randomized)
+				memcpy_fromio(data, nfc->regs + NFC_RAM0_BASE, ecc->size);
+			continue;
+		}
+
+		if (erased) {
+			read->has_erased_chunk = true;
+			continue;
+		}
+
+		if (!read->dma)
+			memcpy_fromio(data, nfc->regs + NFC_RAM0_BASE, ecc->size);
+
+		if (read->oob_required) {
+			/* Keep the existing PIO and DMA representations of parity. */
+			if (read->dma) {
+				nand_change_read_column_op(nand, mtd->writesize + oob_off,
+							   oob, ecc->bytes + user_data_sz, false);
+			} else {
+				nand_change_read_column_op(nand, mtd->writesize + oob_off,
+							   NULL, 0, false);
+				sunxi_nfc_randomizer_read_buf(nand, oob,
+							      ecc->bytes + user_data_sz,
+							      true, read->page);
+			}
+
+			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, i, !step,
+							    read->page, user_data_sz);
+		}
+
+		sunxi_nfc_hw_ecc_update_stats(nand, &read->max_bitflips, bitflips);
+	}
+
+	if (!(status & NFC_ECC_ERR_MSK(nfc)))
+		return 0;
+
+	/* Finish consuming the batch's corrected OOB before raw error rereads. */
+	for (i = 0; i < nsteps; i++) {
+		int step = first_step + i;
+		int data_off, oob_off;
+
+		if (!(status & NFC_ECC_ERR(i)))
+			continue;
+
+		data_off = step * ecc->size;
+		oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, step);
+		user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
+		ret = sunxi_nfc_hw_ecc_read_error(nand, read->buf + data_off, data_off,
+						  nand->oob_poi + oob_off,
+						  mtd->writesize + oob_off, user_data_sz,
+						  &read->max_bitflips);
+		if (ret < 0)
+			return ret;
+		if (ret)
+			read->has_erased_chunk = true;
+	}
+
+	return 0;
+}
+
+static int sunxi_nfc_oob_finish_read(struct nand_chip *nand,
+				     struct sunxi_nfc_ecc_read *read, int *cur_off)
+{
+	if (read->oob_required)
+		sunxi_nfc_hw_ecc_read_extra_oob(nand, nand->oob_poi, cur_off,
+						!read->has_erased_chunk, read->page);
+
+	return read->max_bitflips;
+}
+
+static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
+				       struct sunxi_nfc_ecc_read *read,
+				       int step, int *cur_off)
+{
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	int data_off = step * ecc->size;
+	int oob_off = nand_to_mtd(nand)->writesize + sunxi_get_oob_offset(sunxi_nand, ecc, step);
+	int page = read->page;
+	u32 pattern_found;
+	int ret;
+
+	if (*cur_off != data_off)
+		nand_change_read_column_op(nand, data_off, NULL, 0, false);
+
+	sunxi_nfc_randomizer_read_buf(nand, NULL, ecc->size, false, page);
+
+	if (data_off + ecc->size != oob_off)
+		nand_change_read_column_op(nand, oob_off, NULL, 0, false);
+
+	ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
+	if (ret)
+		return ret;
+
+	sunxi_nfc_set_user_data_len(nfc, user_data_sz, 0);
+	sunxi_nfc_randomizer_config(nand, page, false);
+	sunxi_nfc_randomizer_enable(nand);
+	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | NFC_ECC_OP,
+	       nfc->regs + NFC_REG_CMD);
+
+	ret = sunxi_nfc_wait_events(nfc, NFC_CMD_INT_FLAG, false, 0);
+	sunxi_nfc_randomizer_disable(nand);
+	if (ret)
+		return ret;
+
+	*cur_off = oob_off + ecc->bytes + user_data_sz;
+
+	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
+	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
+
+	return sunxi_nand->oob_ops->read_batch(nand, read,
+					     readl(nfc->regs + NFC_REG_ECC_ST),
+					     pattern_found, step, 1);
+}
+
+static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
+					    int oob_required, int page, int nchunks)
+{
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	struct sunxi_nfc_ecc_read read = {
+		.buf = buf,
+		.page = page,
+		.oob_required = oob_required,
+		.dma = true,
+	};
 	struct scatterlist sg;
+	int ret, i;
 	u32 status, pattern_found, wait;
 
 	ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
@@ -1299,83 +1418,12 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 	status = readl(nfc->regs + NFC_REG_ECC_ST);
 	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
 	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
+	ret = sunxi_nand->oob_ops->read_batch(nand, &read, status, pattern_found,
+					    0, nchunks);
+	if (ret)
+		return ret;
 
-	for (i = 0; i < nchunks; i++) {
-		int data_off = i * ecc->size;
-		unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
-		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
-		u8 *data = buf + data_off;
-		u8 *oob = nand->oob_poi + oob_off;
-		bool erased;
-
-		ret = sunxi_nfc_hw_ecc_correct(nand, randomized ? data : NULL,
-					       oob_required ? oob : NULL,
-					       i, status, pattern_found,
-					       &erased);
-
-		/* ECC errors are handled in the second loop. */
-		if (ret < 0)
-			continue;
-
-		if (oob_required && !erased) {
-			/* TODO: use DMA to retrieve OOB */
-			nand_change_read_column_op(nand,
-						   mtd->writesize + oob_off,
-						   oob, ecc->bytes + user_data_sz, false);
-
-			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, i, !i,
-							    page, user_data_sz);
-		}
-
-		if (erased)
-			raw_mode = 1;
-
-		sunxi_nfc_hw_ecc_update_stats(nand, &max_bitflips, ret);
-	}
-
-	if (status & NFC_ECC_ERR_MSK(nfc)) {
-		for (i = 0; i < nchunks; i++) {
-			int data_off = i * ecc->size;
-			unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
-			int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
-			u8 *data = buf + data_off;
-			u8 *oob = nand->oob_poi + oob_off;
-
-			if (!(status & NFC_ECC_ERR(i)))
-				continue;
-
-			/*
-			 * Re-read the data with the randomizer disabled to
-			 * identify bitflips in erased pages.
-			 * TODO: use DMA to read page in raw mode
-			 */
-			if (randomized)
-				nand_change_read_column_op(nand, data_off,
-							   data, ecc->size,
-							   false);
-
-			/* TODO: use DMA to retrieve OOB */
-			nand_change_read_column_op(nand,
-						   mtd->writesize + oob_off,
-						   oob, ecc->bytes + user_data_sz, false);
-
-			ret = nand_check_erased_ecc_chunk(data,	ecc->size, oob,
-							  ecc->bytes + user_data_sz,
-							  NULL, 0,
-							  ecc->strength);
-			if (ret >= 0)
-				raw_mode = 1;
-
-			sunxi_nfc_hw_ecc_update_stats(nand, &max_bitflips, ret);
-		}
-	}
-
-	if (oob_required)
-		sunxi_nfc_hw_ecc_read_extra_oob(nand, nand->oob_poi,
-						NULL, !raw_mode,
-						page);
-
-	return max_bitflips;
+	return sunxi_nand->oob_ops->finish_read(nand, &read, NULL);
 }
 
 static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
@@ -1452,11 +1500,13 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	unsigned int max_bitflips = 0;
+	struct sunxi_nfc_ecc_read read = {
+		.buf = buf,
+		.page = page,
+		.oob_required = oob_required,
+	};
 	int ret, i, cur_off = 0;
-	bool raw_mode = false;
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
@@ -1466,28 +1516,15 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 
 	sunxi_nfc_reset_user_data_len(nfc);
 	for (i = 0; i < ecc->steps; i++) {
-		int data_off = i * ecc->size;
-		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
-		u8 *data = buf + data_off;
-		u8 *oob = nand->oob_poi + oob_off;
-
-		ret = sunxi_nfc_hw_ecc_read_chunk(nand, data, data_off, oob,
-						  oob_off + mtd->writesize,
-						  &cur_off, &max_bitflips,
-						  i, oob_required, page);
+		ret = sunxi_nfc_hw_ecc_read_chunk(nand, &read, i, &cur_off);
 		if (ret < 0)
 			return ret;
-		else if (ret)
-			raw_mode = true;
 	}
 
-	if (oob_required)
-		sunxi_nfc_hw_ecc_read_extra_oob(nand, nand->oob_poi, &cur_off,
-						!raw_mode, page);
-
+	ret = sunxi_nand->oob_ops->finish_read(nand, &read, &cur_off);
 	sunxi_nfc_hw_ecc_disable(nand);
 
-	return max_bitflips;
+	return ret;
 }
 
 static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
@@ -1513,11 +1550,12 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 					 u8 *bufpoi, int page)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
-	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	struct sunxi_nfc_ecc_read read = {
+		.buf = bufpoi,
+		.page = page,
+	};
 	int ret, i, cur_off = 0;
-	unsigned int max_bitflips = 0;
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
@@ -1528,23 +1566,15 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	sunxi_nfc_reset_user_data_len(nfc);
 	for (i = data_offs / ecc->size;
 	     i < DIV_ROUND_UP(data_offs + readlen, ecc->size); i++) {
-		int data_off = i * ecc->size;
-		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
-		u8 *data = bufpoi + data_off;
-		u8 *oob = nand->oob_poi + oob_off;
-
-		ret = sunxi_nfc_hw_ecc_read_chunk(nand, data, data_off,
-						  oob,
-						  oob_off + mtd->writesize,
-						  &cur_off, &max_bitflips, i,
-						  false, page);
+		ret = sunxi_nfc_hw_ecc_read_chunk(nand, &read, i, &cur_off);
 		if (ret < 0)
 			return ret;
 	}
 
+	ret = read.max_bitflips;
 	sunxi_nfc_hw_ecc_disable(nand);
 
-	return max_bitflips;
+	return ret;
 }
 
 static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
@@ -2066,6 +2096,58 @@ static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize
 	return 0;
 }
 
+static unsigned int sunxi_nfc_oob_min_user_data(struct nand_chip *nand, int nsteps)
+{
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	unsigned int size = 0;
+	int i;
+
+	/* Variable lengths reserve the first word, which contains the BBM. */
+	if (nfc->caps->reg_user_data_len)
+		return USER_DATA_SZ;
+
+	for (i = 0; i < nsteps; i++)
+		size += sunxi_nfc_user_data_sz(sunxi_nand, i);
+
+	/* Preserve the older platforms' extra BBM reservation and ECC strength. */
+	if (nfc->caps->legacy_max_strength)
+		size += 2;
+
+	return size;
+}
+
+static int sunxi_nfc_oob_init_user_data(struct nand_chip *nand, int nsteps)
+{
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+
+	if (!nfc->caps->reg_user_data_len)
+		return 0;
+
+	/* Prioritize ECC strength, then use the remaining space for user data. */
+	return sunxi_nfc_maximize_user_data(nand, nand_to_mtd(nand)->oobsize,
+					  nand->ecc.bytes, nsteps);
+}
+
+/*
+ * Both modes use the same layout and ECC policy. Scrambled transfers also
+ * compensate the first two user bytes to keep the on-flash BBM unmodified.
+ */
+static const struct sunxi_nfc_oob_ops sunxi_nfc_plain_oob_ops = {
+	.min_user_data = sunxi_nfc_oob_min_user_data,
+	.init_user_data = sunxi_nfc_oob_init_user_data,
+	.read_batch = sunxi_nfc_oob_read_batch,
+	.finish_read = sunxi_nfc_oob_finish_read,
+};
+
+static const struct sunxi_nfc_oob_ops sunxi_nfc_scrambled_plain_bbm_oob_ops = {
+	.min_user_data = sunxi_nfc_oob_min_user_data,
+	.init_user_data = sunxi_nfc_oob_init_user_data,
+	.transform_bbm = sunxi_nfc_randomize_bbm,
+	.read_batch = sunxi_nfc_oob_read_batch,
+	.finish_read = sunxi_nfc_oob_finish_read,
+};
+
 static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 				       struct nand_ecc_ctrl *ecc,
 				       struct device_node *np)
@@ -2090,33 +2172,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 		ecc->size = 1024;
 		nsectors = mtd->writesize / ecc->size;
 
-		if (!nfc->caps->reg_user_data_len) {
-			/*
-			 * If there's a fixed user data length, subtract it before
-			 * computing the max ECC strength
-			 */
-
-			for (i = 0; i < nsectors; i++)
-				total_user_data_sz += sunxi_nfc_user_data_sz(sunxi_nand, i);
-
-			/*
-			 * The 2 BBM bytes should not be removed from the grand total,
-			 * because they are part of the USER_DATA_SZ.
-			 * But we can't modify that for older platform since it may
-			 * result in a stronger ECC at the end, and break the
-			 * compatibility.
-			 */
-			if (nfc->caps->legacy_max_strength)
-				bytes -= 2;
-
-			bytes -= total_user_data_sz;
-		} else {
-			/*
-			 * User-data lengths are encoded in four-byte units. Reserve
-			 * the first word because it contains the two BBM bytes.
-			 */
-			bytes -= USER_DATA_SZ;
-		}
+		bytes -= sunxi_nand->oob_ops->min_user_data(nand, nsectors);
 
 		/*
 		 * Once all user data has been subtracted, the rest can be used
@@ -2175,20 +2231,12 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 
 	nsectors = mtd->writesize / ecc->size;
 
-	/*
-	 * The rationale for variable data length is to prioritize maximum ECC
-	 * strength, and then use the remaining space for user data.
-	 */
-	if (nfc->caps->reg_user_data_len) {
-		ret = sunxi_nfc_maximize_user_data(nand, mtd->oobsize,
-						   ecc->bytes, nsectors);
-		if (ret)
-			return ret;
-	}
+	ret = sunxi_nand->oob_ops->init_user_data(nand, nsectors);
+	if (ret)
+		return ret;
 
-	if (total_user_data_sz == 0)
-		for (i = 0; i < nsectors; i++)
-			total_user_data_sz += sunxi_nfc_user_data_sz(sunxi_nand, i);
+	for (i = 0; i < nsectors; i++)
+		total_user_data_sz += sunxi_nfc_user_data_sz(sunxi_nand, i);
 
 	if (mtd->oobsize < (ecc->bytes * nsectors + total_user_data_sz))
 		return -EINVAL;
@@ -2232,6 +2280,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 
 static int sunxi_nand_attach_chip(struct nand_chip *nand)
 {
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	const struct nand_ecc_props *requirements =
 		nanddev_get_ecc_requirements(&nand->base);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
@@ -2254,6 +2303,9 @@ static int sunxi_nand_attach_chip(struct nand_chip *nand)
 	if (!ecc->size || !ecc->strength)
 		return -EINVAL;
 
+	sunxi_nand->oob_ops = nand->options & NAND_NEED_SCRAMBLING ?
+		&sunxi_nfc_scrambled_plain_bbm_oob_ops : &sunxi_nfc_plain_oob_ops;
+
 	switch (ecc->engine_type) {
 	case NAND_ECC_ENGINE_TYPE_ON_HOST:
 		ret = sunxi_nand_hw_ecc_ctrl_init(nand, ecc, np);

-- 
2.53.0


