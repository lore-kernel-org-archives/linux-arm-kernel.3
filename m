Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FD060A3813
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 18:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M2LiGLRh;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kcvll+Tf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3diKjpt3Hplj9bun3k4VWxlSuPRXvr0bzFEfcX1wVKA=; b=M2LiGLRhURD66+
	NtgZs9JXTp05a/UIVX6H3fNvk8CWpTt8gykNKb+cojDk4bVHW5b8zcep0Gdr2000bi8/d2lX5yecO
	iSp5tHoUB4Fjbl69JA3AVCGy6kZYWzppAgS1j4T6JyAGKriwl78fdJ5PeKmXLJ3Y03lWY1QnBGX+g
	yqshM9MLwcp9y37jlNX06D6bryuSMMT3UIygig7n0aSFitW1KMRgodYqCa4f6n6edTTzAiQINEFU4
	671ZASVAXnOq+WC4JZJ98di5Q8JzDlurPatH4nGSEOs5IlHg5v0LoSj1M5/tekvF/KZ0Gclluf3sw
	iRjotEsl7iQC2I+K132A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2cr-0000000ADQk-1shs;
	Thu, 05 Nov 2026 18:55:53 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2ca-0000000ADF8-3hcO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 18:55:44 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-6d290b10a35so1043639eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 10:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904936; x=1794509736; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3diKjpt3Hplj9bun3k4VWxlSuPRXvr0bzFEfcX1wVKA=;
        b=kcvll+Tf35SN2UOIK8OiEfUUYiEaHXvQDFwE6EN2+8pENQxxLJKdIQW7splKtbvauO
         fen7xFi0bhRnoTdGhqi6Sto+tT5eDnAU+MMEVyFsaTdGhIXA2fenthK0zTiZBCc70LPd
         2vx/Y83JyA7J6Tq+N2LzhHy1+4N2r6ghZb0cHD/1yJESSR9pxnnUETTUdDXRPonMyLkJ
         uSRNSraSDVgEtazsunMdcXmM9tsfgtrIqkeSfq9kzKFj5B4OwZSCzJutxZ5vw3oZg+Rf
         qSKCO/QfeYY01UO+yYr1VNhW9n+TWhOIEnU85M0BKvSbnU5ZsL4hp7i0ARzjISYw/2tw
         zH3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904936; x=1794509736;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3diKjpt3Hplj9bun3k4VWxlSuPRXvr0bzFEfcX1wVKA=;
        b=nedgZTnw7BVSiyx/iuONLrr+/cjwux1YwkkspGAUkdiQ82ikQqLGgvkc12nU6MVmy/
         JfNMEOlYfvZ8jQIaQC91UStmDFi0uc0hDYCJu15jwPbuL0ODScroQcUc4jBqbpRBQb8b
         ZwJtGKHvsUysBWXSbFZh4trpKTf5eIlKG51ZF4i+RS8Z1+nnXbFLaEOgLU8NUUy6Wtm+
         WIwpPfopTnG8/lqXsM9JCjRtMVIOpfDLtNzlSUkFGxwHNh45zKfk5JtmrDWMhhe9rMqn
         sEhR7N7QI3MHWgrdMHn13tnuLrPxYNfFZCbds37pL/LHSzA1Hnk9S2vp/7yYpvD/idX5
         2G2A==
X-Forwarded-Encrypted: i=1; AKwUvBx+fTC/sPjvhBw13VTqHn2Ys/8dV+rRTXgA8c553AzeE0Opvn8GY64477AHpzhHY9uvcOo1P1EhRkOhwC8PmI05@lists.infradead.org
X-Gm-Message-State: APuU4Z97NB4v9w5NZqt4dZEwT8Xx27WYcnVYZH51NauuLCvPhdYHHAWA
	OSV2Ke3zoJ/FBVLMStHmrwq6k7rM8z+i9HgJuFONeRT+fDhAcSlcPyUO
X-Gm-Gg: AYBFou1rWx8Wl9fsRC3cAtvAYiykcgpYR13CJUYzNoaKGVz+WGoToPv27sKWtXo0YVq
	Xcj3gjtrxsDshEHo8dC2MLCdmRvNwAXXyj2NY2fLgbcWUEsxnXZcsplO+7SIxNN1hZsRiDv7VAV
	ngsox6eV4e/WT7og9sGQULn+BsHNh0t8LQXP2ewxwgna6UXZVut8DWXrCcOkyfosR8qBglp48z0
	c59i1tZOS+Cr8/t+59QiuFaFhOK4UjhDzifnXaQJm9sntSn5DAIDvc2YO2AeoR1VQsfFwu8FRSN
	a4KFhA8xDaLxwV7sVO+yh3n2m+LzITkZ+as5ISZFdt9oF2YngTHb8IFK3GIxLba45CpJrIVWS2u
	V7Kg2PoxfmxpJd/N4zT/SC6gHhGT+xPoOhMCaZ0pM1kuAU/DNubX41eEU/DPjPd151U5rX7klip
	HbTTTK/xGTHIXsPICJC/YioULdOZf12v/HyX8+XFusWeSQiAAiV7s6Np6XY2b7wMXHbg+DOIDLS
	HydWChJ9qBA2TUoPsjqugMkCCh5n7Xu6PCvIVHjM4K5ae1FfaeOECv0RseKkYQayT5juo0cAucP
	DyJXjBqmJUMXe7hZHevQNro5Jd8gbbnUw0gaaum6MJ9sYfvms1y2bk2DW5CEJ7DHfJbcuLeiD7L
	EBGjsrnS/u+F0wvQErzUgKlXwl31MKkTnQV6o18jCmJa1DfeFnp55EfBRYRJZ/aZ89j6+pK/Pn6
	IwugFZS1YSvOfPNMfxpbbNqBjxIfN4rybhjbATdOc/+2AeN2Qe1Xmq
X-Received: by 2002:a05:6820:7408:b0:6d9:8a4a:7114 with SMTP id 006d021491bc7-716e790c5fdmr232093eaf.48.1793904935633;
        Thu, 05 Nov 2026 10:55:35 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:34 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:20 -0700
Subject: [PATCH v10 04/26] mtd: rawnand: sunxi: reject pages exceeding the
 ECC step limit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-4-dca1f6ed29a8@gmail.com>
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
 devicetree@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_105538_987801_8F326B63 
X-CRM114-Status: GOOD (  14.76  )
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

The controller has 16 ECC status slots on A10/A23 and 32 on H6/H616.
Hardware-ECC setup checks the strength and available OOB space, but does
not check that the page fits those slots. NAND identification can supply
a larger page size, and the NAND core does not enforce this
controller-specific limit.

If enough OOB space is available, an unsupported geometry can pass attach
and reach DMA code that indexes status and user-data registers by ECC
step. H6/H616 also represent enabled data blocks with a 32-bit mask. The
number of steps must fit the controller even when their user data fits
the register bank.

Reject excessive step counts before allocating user-data lengths or
installing the hardware-ECC callbacks. Check the final step size, after
strength maximization and the conversion from 512-byte to 1-KiB steps,
so valid geometries retain their existing layout. This also keeps PIO
fallback from accepting a page that the controller cannot handle.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-173724@kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 662d96fc2535..1a61f608ad91 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2223,6 +2223,11 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	ecc->bytes = ALIGN(ecc->bytes, 2);
 
 	nsectors = mtd->writesize / ecc->size;
+	if (nsectors > nfc->caps->max_ecc_steps) {
+		dev_err(nfc->dev, "unsupported number of ECC steps: %d (max %u)\n",
+			nsectors, nfc->caps->max_ecc_steps);
+		return -EINVAL;
+	}
 
 	ret = sunxi_nand->oob_ops->init_user_data(nand, nsectors);
 	if (ret)

-- 
2.53.0


