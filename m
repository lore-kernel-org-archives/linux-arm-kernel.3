Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E48CC88E40
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 08:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TWYxqME/J0ZGh+4rhdO4kodCM+OpkopMyyvvaFCYW7w=; b=dge6lpO4pedj7dLiO7AAQ3ZSV9
	H7hhSLVIVyTSEL2iFQ5rz7zxkWof/6adVhfmAkFDEwgWIzQwE3599yL9tvZ0+VdwgAjgkrr/73+Hv
	UfoKF9pkg4TQOUM3WF3Udj92TLYAt4K+1NbV+9l8csRgbuTKx3vf07dK83hn74qB7Bi8t/tg0Z72O
	HFQtVE9r4fW/8K2BhZNv/hGwwcDa4SzWIVnoLx47jjKDaKr/0m4vwHIKWJ69ry0hHF9Y38yuoX5yU
	5VWrv1Q4QLStEGRuyxaM3NJaT4Nx1hnmZHKdz5OWY4ODrx7qN8OEUySPxephvubokH7OdSANMs45c
	y3oJS4mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Dj0-0000000B7Qf-2CD8;
	Wed, 09 Sep 2026 08:32:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4DiD-0000000B6cd-3Ze8
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Sep 2026 08:31:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=TWYxqME/J0ZGh+4rhdO4kodCM+OpkopMyyvvaFCYW7w=; b=pe3MyGez0Cn2afCiwM4g3efYNp
	+Hucw8Yc4To4rCN4cLz4T39jBYa16AT6meGCk8KOKXRom0BwKEkKGQ9cGAeFpimcJHSLKL/h6AVZL
	F9qIurV7nyVGzS6numWB6vLS8oRSGDR08e4Zu4QfOQKyIPOYHWxZ6pNmbkt+rimvj8hTunwsbpD0/
	kh/0KT9V6dLg6FK4kOLB0Fw2K4NLnPjphibtD2J2nIMdq8LdZZx5LWJLKwZAqwqZiGhV3JQNr89NI
	o1pIWVvx049DaoQudEaMj0sASD068ity41q4x61NVplKDy2Sfm7SwMRsQsMMsN2mIXcf6nCjBMVB0
	9Sia/qBw==;
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4Di7-00000000unO-27RN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 08:31:20 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-7e6b5737bb2so6234834a34.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 01:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942673; x=1789547473; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TWYxqME/J0ZGh+4rhdO4kodCM+OpkopMyyvvaFCYW7w=;
        b=KbKPj98dJDf3ub2vxUObdquNEU0zodyNHu1bT0/1Gdis4bWrXU7XpolX8IZkrJ9l7b
         61HDO5/gniN3LuFyhkFyWdEVp/R4PmkSaZfEmPHJ8YcIqdj4008/ztubbtFTN5EOxRFw
         c2fA9lQ60i6aiyZmYvbokZr3sSFlw22Gib0jcFzTl5jsMScY4o/KFRuFOhLz/wh2jQ7I
         tXFtNb3mXDfgX1/gL7WjuwdRuy3nhJLjKCawjr3pBEA5SmkjGfEFhTprPXaAH6L5QE1a
         +Q3QlK4L8H+zyHgVg8081pe9C0uSAFXcSdUeTbc2RDr9v8wfwgMJTE5rIp28Co343EvY
         5rDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942673; x=1789547473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TWYxqME/J0ZGh+4rhdO4kodCM+OpkopMyyvvaFCYW7w=;
        b=D0q3h/zqEFAcKnvFGkWyvg7iRlVCihp44v2eIjd9Krko+9UClvZrnsk5Ora1G+7ohg
         c8+Nt8VJCB0nF/0UXTQEqWxvPk1nUsVGyBhP5E4WL3HhenxqeR4cgcSAhbFBQpVRm56+
         20md6a+rNJswSASBX6Ru8lQpSpZIMczCZkOb9AHBCe3c5vgWqrj/bJOKDEjP3KcANqtl
         Lj8G2bE1d7/mkl4M9RZnX/d+U/eFzfkI5PUBN/Mp2Eq7C7uVHud8cV2mJMThvhjZBD+l
         6wJ0ILsNizm/gENWJ+pgKLKER4DMz0qlkxziWNnMKwva/oKZJEVVLz7Ypx83pIpeE1GI
         bMjA==
X-Forwarded-Encrypted: i=1; AKwUvBxIYq3nmFi3wFQSNcmA9vOz//0iNXswBmB06S0kMKuSLqregmU5jj272yCbGdmhTPnX/y1ovSU/P4HGmxIvdGyH@lists.infradead.org
X-Gm-Message-State: AFuF++kRy7cu+/fRfLxdivRVZHB8uS3OeHvNLLHF4F1gZBcuCXB9fWEa
	gVpB3LKUvZXVwy+RXILLgYrv7mTNvC6zxfg5SSLgQS4ykAucGbW/exuZ
X-Gm-Gg: AYBFou3kUm39jhoGUz7XZlqufrLcdyVemnTRHxXnOwmWUhTxSJZM7P601cI9EeVxAOP
	PTFu5cJ20ODykGPaFVrrQgTG9I2W0efd67CP9/ODq63RAS8JWeUePS2jCve/d0mhh/cg6znGWwU
	qc5wMjJWEr1iJoFL3meHsXuGNH0Pv2+DQ7VlOpW0ZqVgUVeuVkl2WbgvHiG9Lo4qpVleU+g9USk
	IJ4tjCSa45CpIkaroVMdtB37EsIQuFYt4QAxaOtCOGx7KPafXkVVdQPHoM7BMaV1GmQuVUf3JBF
	phbumKJH/Q/LYeK2lJn7o8T6LZh+O+yIHGV2ZHuh7BrUCGfU62fC4jg/UTTSMmUmq2aABd5xc2R
	GngzPiTdYZQh86msfJ7efRU9nvPxWPib/+vRG4q3OIt9wArp6q5AhP/LTkPH1BaL8JwbpOD+QE5
	Uc7dUS208YCo0+7p9AGOqQeO7J36F+RWN6KMwkF6EGGQbXGoTxavoksdi6XBc5quu2XyIsrOxLz
	ZqP+TT4NZhs4zc3Wr9K64JnvpSd5y26syFs7pvgv0KEeMV0tWeib5HkRXrxDbz1te9KR//7B7cu
	13YtNwwnNFExQywcjezWZPkxO3Kj5mJzIk/ww8mHAp0fh1JvNhE/ybGplI9AbZriH+g0dW0J16R
	MaB/6WBFiqRHfF+n3a5grMYmpLNh5uQY3PQI5wTg=
X-Received: by 2002:a05:6820:1987:b0:6b7:46fa:16a2 with SMTP id 006d021491bc7-6b746fa1a6bmr17306489eaf.55.1788942673434;
        Wed, 09 Sep 2026 01:31:13 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:31:12 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 02:30:47 -0600
Subject: [PATCH v3 14/15] mtd: rawnand: sunxi: reduce user-data length
 register accesses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-14-838cb0ba1547@gmail.com>
References: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
In-Reply-To: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
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
X-CRM114-CacheID: sfid-20260909_093116_247211_D65B9A9A 
X-CRM114-Status: GOOD (  19.51  )
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

DMA reads and writes clear every user-data length register and then
read-modify-write one field at a time. Multiple ECC steps share each
register, so this repeats MMIO accesses to the same words.

Build each register value in memory and write it once, including zero
lengths for unused slots. Reprogram every word for every DMA operation
instead of caching hardware state, so controller resets and switches
between chips need no special cache invalidation.

Share the length encoding with a PIO-specific setter. PIO always uses
hardware slot zero, and its page callbacks clear all length registers
before the chunk loop. Write the slot-zero value directly instead of
reading and modifying the same register for every chunk. Keep the
per-operation clearing so other slots remain zero after DMA fallback.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 73 +++++++++++++++++++++++++--------------
 1 file changed, 47 insertions(+), 26 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 9dc742ee4344..1c1fcea69108 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -996,35 +996,59 @@ static void sunxi_nfc_reset_user_data_len(struct sunxi_nfc *nfc)
 		writel(0, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, i));
 }
 
-static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
-					int len, int hw_step)
+static int sunxi_nfc_user_data_len_code(struct sunxi_nfc *nfc, int len)
 {
-	bool found = false;
-	u32 val;
 	int i;
 
+	for (i = 0; i < nfc->caps->nuser_data_tab; i++) {
+		if (len == nfc->caps->user_data_len_tab[i])
+			return i;
+	}
+
+	dev_warn(nfc->dev, "Unsupported length for user data reg: %d\n", len);
+	return -EINVAL;
+}
+
+static void sunxi_nfc_set_user_data_len_pio(struct sunxi_nfc *nfc, int len)
+{
+	int code;
+
 	/* not all SoCs have this register */
 	if (!nfc->caps->reg_user_data_len)
 		return;
 
-	for (i = 0; i < nfc->caps->nuser_data_tab; i++) {
-		if (len == nfc->caps->user_data_len_tab[i]) {
-			found = true;
-			break;
-		}
-	}
-
-	if (!found) {
-		dev_warn(nfc->dev,
-			 "Unsupported length for user data reg: %d\n", len);
+	code = sunxi_nfc_user_data_len_code(nfc, len);
+	if (code < 0)
 		return;
-	}
 
-	val = readl(nfc->regs + NFC_REG_USER_DATA_LEN(nfc, hw_step));
+	/* PIO uses slot zero; the page callback clears all other slots. */
+	writel(FIELD_PREP(NFC_USER_DATA_LEN_MSK(0), code),
+	       nfc->regs + NFC_REG_USER_DATA_LEN(nfc, 0));
+}
+
+static void sunxi_nfc_set_user_data_len_dma(struct nand_chip *nand, int nchunks)
+{
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	int first, step, len, code;
+	u32 val;
+
+	if (!nfc->caps->reg_user_data_len)
+		return;
 
-	val &= ~NFC_USER_DATA_LEN_MSK(hw_step);
-	val |= field_prep(NFC_USER_DATA_LEN_MSK(hw_step), i);
-	writel(val, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, hw_step));
+	/* Write each packed register once, including zeroes for unused slots. */
+	for (first = 0; first < nfc->caps->max_ecc_steps;
+	     first += NFC_REG_USER_DATA_LEN_CAPACITY) {
+		val = 0;
+		for (step = first; step < nchunks &&
+		     step < first + NFC_REG_USER_DATA_LEN_CAPACITY; step++) {
+			len = sunxi_nfc_user_data_sz(sunxi_nand, step);
+			code = sunxi_nfc_user_data_len_code(nfc, len);
+			if (code >= 0)
+				val |= field_prep(NFC_USER_DATA_LEN_MSK(step), code);
+		}
+		writel(val, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, first));
+	}
 }
 
 static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
@@ -1213,7 +1237,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, hw_step);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | NFC_ECC_OP,
@@ -1524,9 +1548,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
-	sunxi_nfc_reset_user_data_len(nfc);
-	for (i = 0; i < nchunks; i++)
-		sunxi_nfc_set_user_data_len(nfc, sunxi_nfc_user_data_sz(sunxi_nand, i), i);
+	sunxi_nfc_set_user_data_len_dma(nand, nchunks);
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 
@@ -1682,7 +1704,7 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, hw_step);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, hw_step, bbm, page,
 					    user_data_sz);
 
@@ -1977,7 +1999,7 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 	if (ret)
 		goto pio_fallback;
 
-	sunxi_nfc_reset_user_data_len(nfc);
+	sunxi_nfc_set_user_data_len_dma(nand, ecc->steps);
 	for (i = 0; i < ecc->steps; i++) {
 		unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
 		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
@@ -1985,7 +2007,6 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 
 		sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, i, !i, page,
 						    user_data_sz);
-		sunxi_nfc_set_user_data_len(nfc, user_data_sz, i);
 	}
 
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);

-- 
2.53.0


