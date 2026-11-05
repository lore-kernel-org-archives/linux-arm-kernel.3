Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2363606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 18:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UgwoLp8j;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ZYKEiuQy;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b5RzRVtC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Du4EE64glD0wtWCQ+qs5atx2KYOu7ZM2ZnRx2xMlHc8=; b=UgwoLp8jegWOxA
	lkuuw8pjJD7f4yC5YkLasNwCxagO/n2fGAtVKMrfBs3KY9M3eZDKCb++0Z8FTA6Zat01aoL0oRxxr
	NvtVMmFrq2rrj041SZfg2HIBgSDh7hhVyCQLw267OXRAfo3ohqb5eTvixV8Z70ahmFzgFvaoxAR6X
	BQzcU4vuB040UAotF/IpC0D2JeFTaFqv77jVnpciPW8Zep5DxJxI7G4yVK4F87cKiR+GsbGuqJjAk
	srCm2e5UGK1cn4ZLK6g0B2tdQR/JZ1idljm6bM2y+abqucDzStNesWv0ZJt7c9E12LjePm5tf43Ua
	+TV6WpB9wvaKupTZLANg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2eP-0000000AEPB-3RQn;
	Thu, 05 Nov 2026 18:57:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2cz-0000000ADTR-2vJE
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Nov 2026 18:56:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Du4EE64glD0wtWCQ+qs5atx2KYOu7ZM2ZnRx2xMlHc8=; b=ZYKEiuQymC3KgdGa4PYYrugFQl
	vzv9FXJcSDvwC+EZR5INkI0EsfOY/j8dlN4YuGO3AIZ3oyCxkG3qmo9aeggRjy0Dy66LDXaPSkzbp
	EjfRPIKKEsGzVP/SDmNrBY0iqKxrSxZr2+wFvJx6JvbmujrabNbd5w5DgKpbvfEpvrXGUZzCkQ29r
	4NosYobvqNp6b2nJ+iyEIjazyKj2eHoH7MTmcHR/EkbYTgX7speCmx/eIFn+Wtqp5bGvbm7OVDl5r
	yy45gnd6QpnTTmrYIrvTr3HKIhDM1s68aWUqGOOewePPq6v2kYgnnO/dmAkbGCTgscsUd2hempr5H
	b7Ug6lrA==;
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2cx-00000003R28-15hY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 18:56:00 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-6fbf1ba31fbso921278eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 10:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904957; x=1794509757; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Du4EE64glD0wtWCQ+qs5atx2KYOu7ZM2ZnRx2xMlHc8=;
        b=b5RzRVtCKIa4GtS5ctEQq6YwjBh9i45uRFzCimu/K0ZXHQAl1J2f3FIqhAyRPoDNZ8
         iHynhgNNR+QIO1NDvwCFBdn1moWJqL5L9n5LX5Hc52Y3PEu8UxvxqDNmnL+KP2DdKjGk
         up/Pnvf/7cq9kYipdnWL5mnR+AttjnV3WRmx16+W7rXDfketkYIXgEuFO8o7SY+gLPgo
         8Zu7dXtW5ipTzQ5UkeRWQV/w/bqkpsbYCV+Y5x6TkgAvLEMFAF7jaP+tjzEzoaQs/t4H
         RAD3kF4L9WS52UkolELIIOj9Q1mVjC8fJmE7I1tkEP1p7o5XLq0++nYGut7MTmcUobWc
         Qcjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904957; x=1794509757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Du4EE64glD0wtWCQ+qs5atx2KYOu7ZM2ZnRx2xMlHc8=;
        b=gBWzwFWWlp/DYDjgSIf2MfWjLnSsHXTMxDErlGsG+E0UuRPh1i82C/A+YlmwUOrlLW
         oz9OXYyWO0kE5lzcjNu1hB+p+TBpxPgI7LJK8EqsgWrUiZ6loeTUTd9q0W9LoRLw14Mr
         z6LWhIpbaqBD4i0lHXnbfwhVTd+P2fNuCDVPo8rQ+H1Drgn9AkNfsFoQMoZ1Fa/gxSUh
         mz5RJJ6DtEWSqjOLvRRHuU+ZP8QsPdYmUzM3Sq3FVIpfayHkZFETMvJG5l1CW/OJhL0F
         RwgMyIVcLtmi9J2UZMHxwpFeWEGYA37KhriC90nBOwQJJF72jyXZ7y94SiGXCJwIXaNc
         fHZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQRHHEIngkK7TarsreAJyEMNOH/iKks7PKV9EyXoWPb3/Gt5LJNHXszT4qUqb6ix5by6Pc6QQwhxcgOF3hCHUP@lists.infradead.org
X-Gm-Message-State: APuU4Z9XE/pjdrL8x4av7FQeobro404Z9nSUqMc2AkjLJQEScLgz20/z
	mvesnonjIEGmrh1fN0JaspIrPIb25udaW6fdwQRiTspWWCK8pWtLl35J
X-Gm-Gg: AYBFou13tP1RTuy6ApntR3vT/TckEGYmAIiaRhNqOeYPvqIMk8AO1z+RYmpR1PCdtY/
	SmgnpKzU0wdASa+1SAUkmS8BRxv783vhLhqJkkU2u/JrmhpArIPRhuj3ZGsrQGamlRSPIzoOEo6
	M+iqmXk7vEoXZJ0vj1/GJNR3Wn+1VKfrDUBYWM2l2pi6ovsb5yQmUfynkdsegdc7/xyp3Xk9Rkx
	1ecDnykzoBozFZeBjwINt1J7tRlW3mqsP8oDfpircfpcaQp7pAAGNd7lyfsnS5dITxvWJE7XBgz
	JTZgHHBIzWmkPMf6NaQYiIuyq53OAIe7YgCtCMnlxlYos5l8Y0hHzDRBTa4gd4kcb5DatKRmIyf
	WwnSxSnRy9P6qr64Lg/Vd1X09JTzTvc3XsM1bcfIO3Ma6ThO8ks/r3BKNlpStcO+I1s830dGZ3o
	ViuPgdTz3n0JN0Z/ITsJXfmt7e3XsWh8jkyGUh/qy4u2Sl6B6aczy9/fRoxzwrBb3E3lImxvcsP
	PSKIhRwBHfRA6dDn1FXuAfGXg1z4Ar+mUUDL6N6+FFLgajNvqEGFRolpUucNyVwljwR24QmQYvU
	SMxTWrv9Nz8sDI+DUxtQmgVyFkdqWzJ96I7LQZ1Nbw160fM+ZAQR+uAyrMa9lRepdrHi7E5fM0H
	2LaeAj6SqK8s1J53Cv4iQ9rZTdTUt3cJHgZqx1R3vb2PnuY87/yY9tBNnJhxaJbeUdYTG3Z8ojn
	qzRFLYlZVE3Nx6T7335vJhKPZiFW6BjRtpbvLLp0bXK2I+71p6+SL4
X-Received: by 2002:a05:6820:a513:20b0:6fc:4051:d2d7 with SMTP id 006d021491bc7-716e78ed246mr305545eaf.38.1793904957427;
        Thu, 05 Nov 2026 10:55:57 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:32 -0700
Subject: [PATCH v10 16/26] mtd: rawnand: sunxi: propagate chip clock setup
 errors
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-16-dca1f6ed29a8@gmail.com>
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
X-CRM114-CacheID: sfid-20261105_185559_204092_BB448EC1 
X-CRM114-Status: GOOD (  18.23  )
X-Spam-Score: 0.1 (/)
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

Chip selection ignores clk_set_rate() failures and caches the requested
rate anyway. It then installs timing registers calculated for that rate
and proceeds with the NAND operation. Subsequent selections do not retry
the rate change because the cache already matches the requested rate.

Return the clock error before changing the controller configuration and
update the cached rate only after a successful clock change. Propagate
the error through exec_op() and the DMA page-write path so neither issues
a command with timings for a clock rate that was not installed.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 0b92bbe19c0a..7c80f52c517d 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -651,16 +651,25 @@ static void sunxi_nfc_dma_op_abort(struct sunxi_nfc *nfc)
 		dmaengine_terminate_all(nfc->dmac);
 }
 
-static void sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
+static int sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(sunxi_nand->nand.controller);
 	struct sunxi_nand_chip_sel *sel;
 	u32 ctl;
+	int ret;
 
 	if (cs >= sunxi_nand->nsels)
-		return;
+		return -EINVAL;
+
+	if (nfc->clk_rate != sunxi_nand->clk_rate) {
+		ret = clk_set_rate(nfc->mod_clk, sunxi_nand->clk_rate);
+		if (ret)
+			return ret;
+
+		nfc->clk_rate = sunxi_nand->clk_rate;
+	}
 
 	ctl = readl(nfc->regs + NFC_REG_CTL) &
 	      ~(NFC_PAGE_SHIFT_MSK | NFC_CE_SEL_MSK | NFC_RB_SEL_MSK | NFC_EN);
@@ -672,14 +681,11 @@ static void sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
 
 	writel(mtd->writesize, nfc->regs + NFC_REG_SPARE_AREA(nfc));
 
-	if (nfc->clk_rate != sunxi_nand->clk_rate) {
-		clk_set_rate(nfc->mod_clk, sunxi_nand->clk_rate);
-		nfc->clk_rate = sunxi_nand->clk_rate;
-	}
-
 	writel(sunxi_nand->timing_ctl, nfc->regs + NFC_REG_TIMING_CTL);
 	writel(sunxi_nand->timing_cfg, nfc->regs + NFC_REG_TIMING_CFG);
 	writel(ctl, nfc->regs + NFC_REG_CTL);
+
+	return 0;
 }
 
 static int sunxi_nfc_buf_chunk_size(struct sunxi_nfc *nfc, int len)
@@ -1824,7 +1830,9 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 	u32 wait;
 	int first_step, batch_steps, ret, i;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
+	ret = sunxi_nfc_select_chip(nand, nand->cur_cs);
+	if (ret)
+		return ret;
 
 	for (first_step = 0; first_step < ecc->steps; first_step += batch_steps) {
 		unsigned int reg_index = 0;
@@ -2627,9 +2635,13 @@ static int sunxi_nfc_exec_op(struct nand_chip *nand,
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	const struct nand_op_parser *parser;
+	int ret;
 
-	if (!check_only)
-		sunxi_nfc_select_chip(nand, op->cs);
+	if (!check_only) {
+		ret = sunxi_nfc_select_chip(nand, op->cs);
+		if (ret)
+			return ret;
+	}
 
 	if (sunxi_nand->sels[op->cs].rb >= 0)
 		parser = &sunxi_nfc_op_parser;

-- 
2.53.0


