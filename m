Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC249C88E56
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 04:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EoqaJxRX3qT28aClhgaCfrfYghT7IZdjt0FxLg5X70U=; b=hRRLsEBWSv3WZmVKvIwDaoEiTk
	/x4DrYkcLUaiIECZ3lJTIjp97BMaSuEcgglCpwvVP639qVv6h4N/VDzq0sPEyN574987i6wYMjSWo
	IJ6eYK8FK3ei+ySTXoU6wu5+TM56n5RAISoAVPVVxsgRWOQ+la6+jfyH6fTzrjXjahV51m8t0KIBR
	OXp8yG/2xsZiAE/+9XfWZUhNJ7nqLvOIyNxgyhwyg9nfyuZECuE3FlNho/MkrCJtkMTwGNPqh5oRU
	FnKFGaKyoxgCU8t5Y2tUxUhvc2zEErWN0dMPyDHiN5R/KB5yPVdcz+pzyspqisJpFyWwve5kRPoYA
	74h7dW1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bTk-00000001NP9-3zxf;
	Sun, 13 Sep 2026 04:06:08 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bT5-00000001MTy-2v37
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 04:05:30 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-6b9cb8883ecso1531574eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 21:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272326; x=1789877126; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EoqaJxRX3qT28aClhgaCfrfYghT7IZdjt0FxLg5X70U=;
        b=L5TgB/zPdGipnAaS84y2mpjFo5jsVEkQxfK6l7hP/8OgAgwM+Lnki3OIFSq3gx+AmP
         rVP9qAatHSwdARsGxAczv8HP1jowWnbWrzdAF1R65AoFZHrfsO6xRcVDrI9uExOVsqrt
         AfdgRYXjLSf9AFhhzUYc0i8EWEiFpEflyV9J94PzpkW9+B2/QmPV5ex0OHBjK8jTF6GB
         FuyO/uTZwCRfQJlie6iWQ936VL76z430JKKDa12l1BScR2bjwflXbvbGHuyRUcvGgcnl
         m8ZMSSJFjxZttoJovo2L95/CSNyGqYwOXKtWFwtiGrgBROiQXDpD7OjgBLxGP5OAb+oX
         +odQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272326; x=1789877126;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EoqaJxRX3qT28aClhgaCfrfYghT7IZdjt0FxLg5X70U=;
        b=PGd1Wn5LsJG8WKGv5lJWA2QX3En83ZAeuh6m/qz29EWw3Qnb3KLykYtDsvcyP21rTL
         1G/fCYAEfZmXpGtWsXaiwZeqhtri9HeaOd+2btQZeOx1VUnGeIHP6kVHHC3bTc/JMjdm
         ZSSM4flICBrrRZ2ziMKcxGAc1kAfT8NhbHOWrswFg1/WnDxptr8mX2O+QNECJ6AAt112
         p/6r4CiT7H3EYsKBkLr9/8FmepfkZealpzr+TPYmcOoeSV8hI+BdK58kNQidLeES1qbs
         JtILWl2KwM/sjioW0d5kv6vmOPEOKNocYm6qLw2tmbYySNR7dSVQD5WcP0K/swp8DpdS
         gP6A==
X-Forwarded-Encrypted: i=1; AKwUvBwhRINXaqb1Vlvni9RHTeWpnYJmziTY2sSraqfOVbXXeJ6hxryNj9KsbOKhTwKIkgtD+bJsVLnLPPS1AORWWgV2@lists.infradead.org
X-Gm-Message-State: AFuF++mqGxopdcLF6Lu26ppZU1ioFlYuFCJLuVBCYz4+Mx9bGkX90dWB
	C+eN8/Os3T2lYMtE5YujMwwU6l5AUGlg+63mUcBdnKeGx6+PQmepiaClHyNB9g==
X-Gm-Gg: AYBFou1UlfrAK2HC+dpQ1mDSWTRZd2TFZQZxRKdy788U258BVFuqc1QvX+PhCwdsPWz
	nX/IxQg6WOFH6XNUF8nYD66KD9ORjpXihdhiK0HGrtCmjCkg64imCt4ow0OIr3UgkTVpPdyRahx
	MggIdseh/EtylT1tm5nLtyg6EqK4vQIfFMUo0/dEPJsBx99cujFYyz2guDEcOJUvhOcMmt3mi+j
	04zX7k+VtK/L4P9q15HIedWMUlmvOx6lwQvV4fb1+MA1wpkRyI4hzqqA1zZmv49DuDecx5SHsAm
	cOFglx4QcpsHp2JbzS5LqgUJg05gou/SGJAHC421y+UCGTrplVTWKWOQLetXpVWKylLoN95UKtP
	mVxOeXYLQLneumii4vhEq9xPrsmyqjlqIDUgh+mfnc7btBD8j70t03Qq9+0EmpnsR4JezLwo2N+
	miCcLRQw0zUDANwajEVm3XOmVwDp99qocPHpWSA/mztYvPzad7bCtPWdEUfS4EVZyobrjhRFjan
	TSEITvo5E2aGsbN3EwE9mcGqXDYTbQJ49c47YI24LQX2Tj5rJJNch50Pt3GGT+Nao6xSACYME2L
	qVkdAZcKUKzxtIoQ3cqcWxcgAC4wvrQpmgtGxJEdMwi8tsJEgbA6rCj1xODNVFVV2Ho3JboGhX6
	dy19hsmZDBZiurziFNz18MZgGx8pvvQ==
X-Received: by 2002:a05:6820:2907:b0:6b5:ec2f:356a with SMTP id 006d021491bc7-6c3ce8c4c5emr400751eaf.27.1789272323609;
        Sat, 12 Sep 2026 21:05:23 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:05:02 -0600
Subject: [PATCH v4 11/17] mtd: rawnand: sunxi: support randomized OOB
 formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-11-4a64bed94229@gmail.com>
References: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
In-Reply-To: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_210527_869779_3C8F41DF 
X-CRM114-Status: GOOD (  29.80  )
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

The controller randomizer covers the bad block marker along with the
rest of the OOB data. The driver currently compensates the marker bytes
before writes and after reads so that they remain plain on flash.

Allwinner NAND firmware instead stores the marker through the
randomizer. Media using that format appears to contain bad blocks unless
the randomizer is enabled while reading the marker.

Honor the allwinner,randomized-oob property by marking the NAND as
requiring scrambling during normal hardware-ECC transfers and leaving
the marker in the randomizer data stream. Keep the existing plain marker
behavior when the property is absent. Reject the property with software
or disabled ECC because those paths do not operate the controller
randomizer.

Also reject an ECC step larger than the page so the NAND core cannot
fall back to software ECC after the driver's initial engine-type check.

Select the vendor's erased-spare predicate through the SoC capabilities
when the randomized format encounters an ECC error. Older controllers
require eight exact 0xff spare bytes, with the vendor spare-scan shortcut
for four exact bytes on the first page and pages 127 modulo 128 within
each eraseblock. Apply that shortcut only with the vendor's 1 KiB ECC
steps. H616 requires byte zero and at least nine of ten bytes to be 0xff.

Reconstruct the physical spare prefix from the protected user-data
registers, padding unavailable bytes with 0xff. Each ECC step restarts its
OOB randomizer; account for this when gathering the prefix from fixed
four-byte user-data fields. Accepted erased pages return all-0xff main
data and OOB without an ECC failure or a raw reread.

Also follow the vendor's all-zero-page override: when every ECC step
reports an all-zero physical pattern, return zeroed data and OOB with an
ECC failure, even if the hardware did not report one. Keep the ECC
exception disabled in this mode so uniform data still undergoes decoding.

Keep the original hardware-decoded main data and protected OOB on other
ECC failures, and report the failure through the ECC statistics. Bad-block
and BBT pattern scans inspect these buffers even after an ECC error; they
must not see the physical randomized representation. Preserve the normal
per-path representation of unprotected OOB bytes when they are requested.

Share page classification between PIO and DMA, including subpage reads.
Read the whole page for randomized-format subpage requests so that both
paths see the same spare prefix and all-zero-page status. Defer statistics
until OOB reads have succeeded, so a DMA-to-PIO retry is accounted once.
The plain-marker format keeps its existing physical erased-chunk check.

MTD_OPS_RAW behavior remains unchanged: raw accesses bypass both ECC and
randomization and expose the physical representation. This changes marker
handling on all supported controllers; the H6/H616 protected user-data
placement is handled separately.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 270 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 261 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 40746686142b..725cc302df9f 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -265,6 +265,7 @@ struct sunxi_nfc_timings {
  * @clk_rate: clk_rate required for this NAND chip
  * @timing_cfg: TIMING_CFG register value for this NAND chip
  * @timing_ctl: TIMING_CTL register value for this NAND chip
+ * @randomized_oob: use the randomized normal-page OOB format
  * @nsels: number of CS lines required by the NAND chip
  * @sels: array of CS lines descriptions
  * @user_data_bytes: array of user data lengths for all ECC steps
@@ -277,6 +278,7 @@ struct sunxi_nand_chip {
 	u32 timing_cfg;
 	u32 timing_ctl;
 	u8 *user_data_bytes;
+	bool randomized_oob;
 	int nsels;
 	struct sunxi_nand_chip_sel sels[] __counted_by(nsels);
 };
@@ -328,6 +330,7 @@ struct sunxi_nfc_mdma_desc {
  * @nuser_data_tab:	Size of @user_data_len_tab
  * @sram_size:		Size of the NAND controller SRAM
  * @timings:		Controller timing characteristics
+ * @spare_is_erased:	Vendor erased-page check on the physical spare prefix
  */
 struct sunxi_nfc_caps {
 	bool has_mdma;
@@ -356,6 +359,7 @@ struct sunxi_nfc_caps {
 	unsigned int max_ecc_steps;
 	int sram_size;
 	const struct sunxi_nfc_timings *timings;
+	bool (*spare_is_erased)(struct nand_chip *nand, const u8 *spare, int page);
 };
 
 /**
@@ -861,12 +865,18 @@ static void sunxi_nfc_randomizer_disable(struct nand_chip *nand)
 	       nfc->regs + NFC_REG_ECC_CTL);
 }
 
-static void sunxi_nfc_randomize_bbm(struct nand_chip *nand, int page, u8 *bbm)
+static void sunxi_nfc_randomize_buf(u16 state, u8 *buf, unsigned int len)
 {
-	u16 state = sunxi_nfc_randomizer_state(nand, page, true);
+	while (len--) {
+		*buf++ ^= state;
+		state = sunxi_nfc_randomizer_step(state, 8);
+	}
+}
 
-	bbm[0] ^= state;
-	bbm[1] ^= sunxi_nfc_randomizer_step(state, 8);
+static void sunxi_nfc_randomize_bbm(struct nand_chip *nand, int page, u8 *bbm)
+{
+	sunxi_nfc_randomize_buf(sunxi_nfc_randomizer_state(nand, page, true),
+				bbm, 2);
 }
 
 static int sunxi_nfc_randomizer_write_buf(struct nand_chip *nand,
@@ -974,7 +984,8 @@ static void sunxi_nfc_hw_ecc_get_prot_oob_bytes(struct nand_chip *nand, u8 *oob,
 	}
 
 	/* Undo hardware de-randomization for a plain on-flash BBM. */
-	if (bbm && (nand->options & NAND_NEED_SCRAMBLING))
+	if (bbm && (nand->options & NAND_NEED_SCRAMBLING) &&
+	    !sunxi_nand->randomized_oob)
 		sunxi_nfc_randomize_bbm(nand, page, oob);
 }
 
@@ -1035,7 +1046,8 @@ static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
 	u8 user_data[SUNXI_NFC_MAX_USER_DATA_SZ] = {};
 
 	/* Pre-randomize the BBM so the hardware writes it plain on flash. */
-	if (bbm && (nand->options & NAND_NEED_SCRAMBLING)) {
+	if (bbm && (nand->options & NAND_NEED_SCRAMBLING) &&
+	    !sunxi_nand->randomized_oob) {
 		memcpy(user_data, oob, user_data_sz);
 		sunxi_nfc_randomize_bbm(nand, page, user_data);
 		oob = user_data;
@@ -1103,6 +1115,37 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 	return ret >= 0;
 }
 
+/* Accumulate a whole randomized-OOB page before classifying its spare data. */
+struct sunxi_nfc_ecc_status {
+	u32 error_steps;
+	u32 zero_steps;
+	unsigned int corrected;
+	unsigned int max_bitflips;
+};
+
+static void sunxi_nfc_hw_ecc_record_status(struct nand_chip *nand,
+					   struct sunxi_nfc_ecc_status *result,
+					   int logical_step, int hw_step, u32 status,
+					   u32 pattern_found)
+{
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	u32 count;
+
+	if ((pattern_found & BIT(hw_step)) &&
+	    !(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(hw_step)))
+		result->zero_steps |= BIT(logical_step);
+
+	if (status & NFC_ECC_ERR(hw_step)) {
+		result->error_steps |= BIT(logical_step);
+		return;
+	}
+
+	count = readl(nfc->regs + NFC_REG_ECC_ERR_CNT(nfc, hw_step));
+	count = NFC_ECC_ERR_CNT(hw_step, count);
+	result->corrected += count;
+	result->max_bitflips = max(result->max_bitflips, count);
+}
+
 static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 				    int hw_step, u32 status, u32 pattern_found,
 				    unsigned int user_data_sz, bool *erased)
@@ -1145,7 +1188,8 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 				       u8 *oob, int oob_off,
 				       int *cur_off,
 				       unsigned int *max_bitflips,
-				       int logical_step, bool oob_required, int page)
+				       int logical_step, bool oob_required, int page,
+				       struct sunxi_nfc_ecc_status *result)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
@@ -1194,6 +1238,16 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
 	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
 
+	if (sunxi_nand->randomized_oob) {
+		sunxi_nfc_hw_ecc_record_status(nand, result, logical_step, hw_step,
+					       readl(nfc->regs + NFC_REG_ECC_ST),
+					       pattern_found);
+		memcpy_fromio(data, nfc->regs + NFC_RAM0_BASE, ecc->size);
+		sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, hw_step, bbm,
+						    page, user_data_sz);
+		return 0;
+	}
+
 	bitflips = sunxi_nfc_hw_ecc_correct(nand, data, oob_required ? oob : NULL,
 					    hw_step, readl(nfc->regs + NFC_REG_ECC_ST),
 					    pattern_found, user_data_sz, &erased);
@@ -1295,6 +1349,153 @@ static int sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
 	return 0;
 }
 
+static bool sun4i_a10_nfc_spare_is_erased(struct nand_chip *nand,
+					  const u8 *spare, int page)
+{
+	struct mtd_info *mtd = nand_to_mtd(nand);
+	unsigned int block_page = page % mtd_div_by_ws(mtd->erasesize, mtd);
+
+	/*
+	 * The older vendor spare scans recognize exact four-byte erased
+	 * signatures on page zero and pages 127 modulo 128. With their
+	 * 1 KiB ECC steps these correspond to four physical 0xff bytes.
+	 * Other pages require all eight spare bytes to be 0xff.
+	 */
+	if (nand->ecc.size == 1024 &&
+	    (!block_page || block_page % 128 == 127) &&
+	    !memchr_inv(spare, 0xff, USER_DATA_SZ))
+		return true;
+
+	return !memchr_inv(spare, 0xff, 8);
+}
+
+static bool sun50i_h616_nfc_spare_is_erased(struct nand_chip *nand,
+					    const u8 *spare, int page)
+{
+	unsigned int erased = 0;
+	int i;
+
+	/* Byte zero and at least nine of ten bytes must be 0xff. */
+	for (i = 0; i < 10; i++)
+		erased += spare[i] == 0xff;
+
+	return spare[0] == 0xff && erased >= 9;
+}
+
+static bool sunxi_nfc_hw_ecc_spare_is_erased(struct nand_chip *nand, int page)
+{
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	u16 state = sunxi_nfc_randomizer_state(nand, page, true);
+	u8 spare[10];
+	unsigned int len, pos = 0;
+	int i, off;
+
+	/*
+	 * Reconstruct the physical spare prefix from the hardware's decoded
+	 * user data. Each ECC step restarts the OOB randomizer; H6/H616 pack
+	 * the entire prefix in step zero. Pad unavailable bytes with 0xff.
+	 */
+	memset(spare, 0xff, sizeof(spare));
+	for (i = 0; i < ecc->steps && pos < sizeof(spare); i++) {
+		len = min_t(unsigned int, sunxi_nfc_user_data_sz(sunxi_nand, i),
+			    sizeof(spare) - pos);
+		off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
+		memcpy(spare + pos, nand->oob_poi + off, len);
+		sunxi_nfc_randomize_buf(state, spare + pos, len);
+		pos += len;
+	}
+
+	return nfc->caps->spare_is_erased(nand, spare, page);
+}
+
+static int sunxi_nfc_hw_ecc_read_unprotected_oob(struct nand_chip *nand,
+						 bool dma, int page)
+{
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct mtd_info *mtd = nand_to_mtd(nand);
+	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	unsigned int len, off;
+	u16 state;
+	int ret, i;
+
+	for (i = 0; i < ecc->steps; i++) {
+		len = sunxi_nfc_user_data_sz(sunxi_nand, i);
+		off = sunxi_get_ecc_offset(sunxi_nand, ecc, i);
+		ret = nand_change_read_column_op(nand, mtd->writesize + off,
+						 nand->oob_poi + off,
+						 ecc->bytes, false);
+		if (ret)
+			return ret;
+		/* Preserve each path's normal representation of ECC bytes. */
+		if (!dma) {
+			state = sunxi_nfc_randomizer_state(nand, page, true);
+			state = sunxi_nfc_randomizer_step(state, len * 8 + 15);
+			sunxi_nfc_randomize_buf(state, nand->oob_poi + off,
+						ecc->bytes);
+		}
+	}
+
+	off = sunxi_get_oob_offset(sunxi_nand, ecc, ecc->steps);
+	len = mtd->oobsize - off;
+	if (len) {
+		ret = nand_change_read_column_op(nand, mtd->writesize + off,
+						 nand->oob_poi + off, len, false);
+		if (ret)
+			return ret;
+		/* The unprotected tail uses the page seed and its 15-bit advance. */
+		state = sunxi_nfc_randomizer_state(nand, page, false);
+		state = sunxi_nfc_randomizer_step(state, 15);
+		sunxi_nfc_randomize_buf(state, nand->oob_poi + off, len);
+	}
+
+	return 0;
+}
+
+static int
+sunxi_nfc_hw_ecc_finish_randomized_read(struct nand_chip *nand, u8 *buf,
+					struct sunxi_nfc_ecc_status *result,
+					bool oob_required, bool dma, int page)
+{
+	struct mtd_info *mtd = nand_to_mtd(nand);
+	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	int ret;
+
+	/*
+	 * The vendor treats an all-zero physical page as bad, even without
+	 * ECC errors. This takes precedence over the spare-byte heuristic.
+	 */
+	if (result->zero_steps == GENMASK(ecc->steps - 1, 0)) {
+		memset(buf, 0, mtd->writesize);
+		memset(nand->oob_poi, 0, mtd->oobsize);
+		mtd->ecc_stats.failed += ecc->steps;
+		return 0;
+	}
+
+	if (result->error_steps && sunxi_nfc_hw_ecc_spare_is_erased(nand, page)) {
+		memset(buf, 0xff, mtd->writesize);
+		memset(nand->oob_poi, 0xff, mtd->oobsize);
+		return 0;
+	}
+
+	/*
+	 * Keep the original decoded main and protected OOB bytes on ECC failure.
+	 * BBT pattern scans inspect them even when an ECC error is reported.
+	 * Read the remaining OOB only when requested, not to classify the page.
+	 */
+	if (oob_required) {
+		ret = sunxi_nfc_hw_ecc_read_unprotected_oob(nand, dma, page);
+		if (ret)
+			return ret;
+	}
+
+	mtd->ecc_stats.corrected += result->corrected;
+	mtd->ecc_stats.failed += hweight32(result->error_steps);
+
+	return result->max_bitflips;
+}
+
 static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf,
 					    int oob_required, int page,
 					    int nchunks)
@@ -1304,6 +1505,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	struct sunxi_nfc_ecc_status result = {};
 	unsigned int corrected = mtd->ecc_stats.corrected;
 	unsigned int failed = mtd->ecc_stats.failed;
 	unsigned int max_bitflips = 0;
@@ -1366,6 +1568,14 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 		bool erased;
 		int bitflips;
 
+		if (sunxi_nand->randomized_oob) {
+			sunxi_nfc_hw_ecc_record_status(nand, &result, i, i, status,
+						       pattern_found);
+			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, i, !i,
+							    page, user_data_sz);
+			continue;
+		}
+
 		bitflips = sunxi_nfc_hw_ecc_correct(nand, randomized ? data : NULL,
 						    oob_required ? oob : NULL,
 						    i, status, pattern_found,
@@ -1393,6 +1603,10 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 		sunxi_nfc_hw_ecc_update_stats(nand, &max_bitflips, bitflips);
 	}
 
+	if (sunxi_nand->randomized_oob)
+		return sunxi_nfc_hw_ecc_finish_randomized_read(nand, buf, &result,
+							     oob_required, true, page);
+
 	if (status & NFC_ECC_ERR_MSK(nfc)) {
 		for (i = 0; i < nchunks; i++) {
 			int data_off = i * ecc->size;
@@ -1524,6 +1738,7 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	struct sunxi_nfc_ecc_status result = {};
 	unsigned int max_bitflips = 0;
 	int ret, i, cur_off = 0;
 	bool erased_chunk_found = false;
@@ -1546,13 +1761,19 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 		ret = sunxi_nfc_hw_ecc_read_chunk(nand, data, data_off, oob,
 						  oob_off + mtd->writesize,
 						  &cur_off, &max_bitflips,
-						  i, oob_required, page);
+						  i, oob_required, page, &result);
 		if (ret < 0)
 			goto out;
 		else if (ret)
 			erased_chunk_found = true;
 	}
 
+	if (sunxi_nand->randomized_oob) {
+		ret = sunxi_nfc_hw_ecc_finish_randomized_read(nand, buf, &result,
+							      oob_required, false, page);
+		goto out;
+	}
+
 	if (oob_required) {
 		ret = sunxi_nfc_hw_ecc_read_extra_oob(nand, nand->oob_poi, &cur_off,
 						      !erased_chunk_found, page);
@@ -1598,6 +1819,10 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	int ret, i, cur_off = 0;
 	unsigned int max_bitflips = 0;
 
+	/* The vendor spare test and all-zero detection classify a whole page. */
+	if (sunxi_nand->randomized_oob)
+		return sunxi_nfc_hw_ecc_read_page(nand, bufpoi, false, page);
+
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
@@ -1618,7 +1843,7 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 						  oob,
 						  oob_off + mtd->writesize,
 						  &cur_off, &max_bitflips, i,
-						  false, page);
+						  false, page, NULL);
 		if (ret < 0)
 			goto out;
 	}
@@ -1637,6 +1862,9 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 	int nchunks = DIV_ROUND_UP(data_offs + readlen, nand->ecc.size);
 	int ret;
 
+	if (to_sunxi_nand(nand)->randomized_oob)
+		return sunxi_nfc_hw_ecc_read_page_dma(nand, buf, false, page);
+
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
@@ -2249,6 +2477,10 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 		ecc->strength *= 2;
 	}
 
+	/* This format requires an ECC step that fits in the page. */
+	if (sunxi_nand->randomized_oob && mtd->writesize < ecc->size)
+		return -EINVAL;
+
 	/* Add ECC info retrieval from DT */
 	for (ecc_mode = 0; ecc_mode < nfc->caps->nstrengths; ecc_mode++) {
 		if (ecc->strength <= strengths[ecc_mode]) {
@@ -2317,6 +2549,10 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	sunxi_nand->ecc.ecc_ctl = NFC_ECC_MODE(nfc, ecc_mode) | NFC_ECC_EXCEPTION |
 				  NFC_ECC_PIPELINE | NFC_ECC_EN;
 
+	/* Run ECC on uniform data too, so the randomized spare bytes are decoded. */
+	if (sunxi_nand->randomized_oob)
+		sunxi_nand->ecc.ecc_ctl &= ~NFC_ECC_EXCEPTION;
+
 	if (ecc->size == 512) {
 		if (nfc->caps->has_ecc_block_512) {
 			sunxi_nand->ecc.ecc_ctl |= NFC_ECC_BLOCK_512;
@@ -2331,6 +2567,8 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 
 static int sunxi_nand_attach_chip(struct nand_chip *nand)
 {
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	const struct nand_ecc_props *requirements =
 		nanddev_get_ecc_requirements(&nand->base);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
@@ -2340,6 +2578,14 @@ static int sunxi_nand_attach_chip(struct nand_chip *nand)
 	if (nand->bbt_options & NAND_BBT_USE_FLASH)
 		nand->bbt_options |= NAND_BBT_NO_OOB;
 
+	if (sunxi_nand->randomized_oob &&
+	    ecc->engine_type != NAND_ECC_ENGINE_TYPE_ON_HOST)
+		return dev_err_probe(nfc->dev, -EINVAL,
+				     "Allwinner OOB format requires controller ECC\n");
+
+	if (sunxi_nand->randomized_oob)
+		nand->options |= NAND_NEED_SCRAMBLING;
+
 	if (nand->options & NAND_NEED_SCRAMBLING)
 		nand->options |= NAND_NO_SUBPAGE_WRITE;
 
@@ -2569,6 +2815,9 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 	if (!sunxi_nand)
 		return -ENOMEM;
 
+	sunxi_nand->randomized_oob =
+		of_property_read_bool(np, "allwinner,randomized-oob");
+
 	sunxi_nand->nsels = nsels;
 
 	for (i = 0; i < nsels; i++) {
@@ -2847,6 +3096,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
 	.max_ecc_steps = 16,
 	.sram_size = 1024,
 	.timings = &sun4i_a10_nfc_timings,
+	.spare_is_erased = sun4i_a10_nfc_spare_is_erased,
 };
 
 static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
@@ -2870,6 +3120,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
 	.max_ecc_steps = 16,
 	.sram_size = 1024,
 	.timings = &sun4i_a10_nfc_timings,
+	.spare_is_erased = sun4i_a10_nfc_spare_is_erased,
 };
 
 static const struct sunxi_nfc_caps sunxi_nfc_h616_caps = {
@@ -2896,6 +3147,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_h616_caps = {
 	.max_ecc_steps = 32,
 	.sram_size = 8192,
 	.timings = &sun50i_h616_nfc_timings,
+	.spare_is_erased = sun50i_h616_nfc_spare_is_erased,
 };
 
 static const struct of_device_id sunxi_nfc_ids[] = {

-- 
2.53.0


