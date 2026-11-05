Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201CD606A338
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 19:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GqYhWKcc;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=E4bbziFG;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gb2JotuX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Kyb9Vh//GYgUYYgsTf0Rac6RrMspxNg0WSg6hXKbfA4=; b=GqYhWKccmR8R56
	djyVveY/FDqIdgBc5KtqTIw/OndYvhnC6RpGxml1EnpLsh4wEhADba1feq+/U87oXmz1EOMF78xwa
	gy/YBtJghGN6wdHkBEgaS98kfvuGy56t/xf3rzcxbhKq73vXGgbzs/+Wqu/EUMc8KQD3zuXVGcvNa
	cC6joCHRWuwRoGDLwQGWixfLqGEIxdunPaXNvvdXTWRLeJFGwftzTmkebW/cynXgN+53YfMi9vKgM
	MUeMO7+u+u7/tbGGyYiLQjwSOQJoaFV+zTFquMARsNQuWxrABN2X3FZaJRDGY+ZxzrYlyiyBsz+Jo
	u/4ZxMwDvRAJoK7Rmrdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2hF-0000000AGI1-40Ns;
	Thu, 05 Nov 2026 19:00:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2d9-0000000ADei-3X4X
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Nov 2026 18:56:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Kyb9Vh//GYgUYYgsTf0Rac6RrMspxNg0WSg6hXKbfA4=; b=E4bbziFGLmgdyVCDbOQ+SnxPeQ
	1VEMsAwJ0tOTyAE8Bxlr8rwbI7S4EIDqyQTErmy/Tx2t1C2fsu2OfVEK9Gk7gMlDxiVbWh5HKzmpF
	UqKbfpEDs6Zv/TM6XwDFJ5McAFrWVtWgKGxJyG6pNCVCm1hZGk/d4d8tTUoLbtRnLLCrbvE46oOFT
	vlIZQa4YoPVnJV6eoNkWs3sKsY15w9+75bekVoTBYqxrF8tal3lBJdKkYEXr9WPGndTGk1mP5Y4HM
	tVyyQsF/ekGVSELGot68ro2RFeQRfl6vwFXXEugx2lgj6UH0VXyXFejzpPFHHqA1ZNjkgmmnyxL4W
	U5mWMa/w==;
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2d7-00000003R7Y-00hj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 18:56:10 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-6df5e315bd1so1891809eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 10:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904967; x=1794509767; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kyb9Vh//GYgUYYgsTf0Rac6RrMspxNg0WSg6hXKbfA4=;
        b=gb2JotuXhCu8Go+49Jg2eJxG1eb8uZQz31VMhvlT+X5uLHCA/I/8vD0iyR+RTmZRUW
         IpsdO76W2AyrWwno6vbtRf+/9aYYjPqGwbIzhuG5vsYecfM+qRJv69AhLiOO3aZ9uGvK
         0f3ZeLKgrtflSAlL0X/mlbrpP8BOWgphGGaUI/rmT+rZdCvEirpNbtIgV+I/wMw2QdkT
         mXjGy8Az7+0CnU27FwuoSEimAvVoGkPGjOUmCyRLPsfx+SYeCM0No+XNkxa25yD5muqx
         a4/C0/SCoPrFtSwariyZeYpkRMGelbArqTMxPfrYHRt2pHqvvZdaBL9R/2ed5vlfq5f3
         F54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904967; x=1794509767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kyb9Vh//GYgUYYgsTf0Rac6RrMspxNg0WSg6hXKbfA4=;
        b=cfjd2NaoWOApQ5IYwmV7ByW/dMQd/bn/GW/oCuNa9hca12Pf4tkmm6ZHFI12vYzSAM
         r4vyu6Duvsyl9jrWK/y1iNNjePsDFe4LmdmoANR1G8d8NcqHqhqh0LSlQktFrXkoqTY/
         ZFIh9/SvYqDbPUoUW3hEC+QjANvozXT2thuZKnA4oLY30OUKxWuV2z9anhttm89Lw30U
         nE4rao5LoKye6vEmz9sWYBprbHBtonrCyawuoHdVa2Xu7Cooe4FzNbpHug5PXESynn1E
         m63eZ5tKeTGgDIJsN6jAjjP9v4qtaAufpHFUnuTChZnHmim15i2zFozrxiT3T3m/bThk
         63IQ==
X-Forwarded-Encrypted: i=1; AKwUvBxs7GDLwDVkoDusUOdmXm+h7Ok6Opk9r4/owqDw7eUem/id5AbGPfyFKt0FbxgPnf2dHQV0Lv3DrnXPDmaRye9M@lists.infradead.org
X-Gm-Message-State: APuU4Z/gySmIiTkPV8YVB/r8cA/IeKiWPD722tISiHeRawbFEgCA27Xy
	917RiNk8nNcjmqZbAEB5xOoK6ZkU/StlwVgoaFetgmv5y3i+yJlxb+Wd
X-Gm-Gg: AYBFou30L438axBsw8dtOSAso+tmAjbz/hMFMWem+tEHNuePDWN/6YnYbo1of95L8MA
	WSGg/jR7kEeUtwNinGfRCYTJ444sg6CiVME8OexgwPkofmTzfSLHiAEUxK0vkoDlqZENKYsuAxi
	UhjCqVfQBK8eg/VCqmI3jtkN8gSFavR3dZr8ZWrmPlbheUhl7aWUQSwsLJYfVCobdrMrnbLr22A
	On4tXgTv7lNea08p4jBkCK7on+9zsoWdNMuieTJMnnA7JUop8nk82nIAYecl7aB9WF71qvH7VwR
	32zgrGkznD/Z9rlvA3YlYR+5+0+1mNiaPSemRjJJdQqRJDqODtdk5bS6CVC0UUnawCBFA7w+qX8
	ha/Rnf2tPyiX4fSCBZthCy4yFEulMG7hc4zpWhuCcsGVc+UOqYJ4qfyBXWwVBhUnNq0bYFs8FOy
	0irLTemkOtePHrrZk8/mOGruR/svUkYghuFHvSew7hMwJA2EPQ6ene0EP4shnb45EtI7uO4Dmva
	4tQbvInkHqC29lckAv9pSAHIk9uFkFsqsgjjGQ6ysUb7y92Y/3FnJuWDgYxk9pceIt19vsFEcBZ
	JvtOy2RZ7x2Ego8/MazEWD7P9S6RuGqharoExWG7ohzn7f24M3+hxM/89bpsqDCPFvraWM2PsWt
	FsryWZh47V/Z3ZYiBiBTzIwfSAxRfLNIAW6AUY7YACp8K4yto+OaE3kr7drVaPMn8836TOJwVLE
	tRclvlsfbC3zQk6XkRTOi1DybrHiAeV1qe1XQsjioldLM7VTFi8+H1IODS/cSdpult/4ey2xOMm
	w==
X-Received: by 2002:a05:6820:7408:b0:6dd:4f30:258f with SMTP id 006d021491bc7-716e79ad995mr250479eaf.56.1793904967200;
        Thu, 05 Nov 2026 10:56:07 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:56:06 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:40 -0700
Subject: [PATCH v10 24/26] mtd: rawnand: sunxi: reduce user-data length
 register accesses
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-24-dca1f6ed29a8@gmail.com>
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
X-CRM114-CacheID: sfid-20261105_185608_995551_96C81C96 
X-CRM114-Status: GOOD (  22.25  )
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

H6/H616 pack eight ECC steps' user-data length codes into each 32-bit
register. DMA currently clears all these registers, then
read-modify-writes one field per step, repeatedly accessing the same
words. Code zero means no user data; the other codes select lengths from
the controller's table.

Build each packed value in memory and write it once per DMA batch,
including zeros for unused slots. Take each length from the batch's
logical step but encode it in the corresponding batch-local hardware
slot. Rewrite every register on each batch rather than caching values
across resets or changes of chip.

Share the encoding with a PIO setter. PIO always uses hardware slot
zero, and its page callbacks clear all length registers before the chunk
loop. It can therefore write the slot-zero code directly, without a
read-modify-write. Keep the page-level clearing so unused slots are also
cleared after a DMA-to-PIO fallback. Older controllers without length
registers remain unaffected, and the chosen lengths and on-flash layout
do not change.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 79 +++++++++++++++++++++++++--------------
 1 file changed, 50 insertions(+), 29 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index c9135c8abf54..814331e16bce 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -57,7 +57,7 @@
 #define NFC_H6_USER_DATA_REGS	32
 #define NFC_REG_USER_DATA(nfc, x)	(nfc->caps->reg_user_data + ((x) * 4))
 #define NFC_REG_H6_USER_DATA_LEN 0x0070
-/* A USER_DATA_LEN register can hold the length of 8 USER_DATA registers */
+/* Each USER_DATA_LEN register holds eight 4-bit ECC-step user-data length codes. */
 #define NFC_REG_USER_DATA_LEN_CAPACITY 8
 #define NFC_REG_USER_DATA_LEN(nfc, step) \
 	 (nfc->caps->reg_user_data_len + \
@@ -1093,35 +1093,60 @@ static void sunxi_nfc_reset_user_data_len(struct sunxi_nfc *nfc)
 		writel(0, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, i));
 }
 
-static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
-					int len, int step)
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
 
-	val = readl(nfc->regs + NFC_REG_USER_DATA_LEN(nfc, step));
+	/* PIO uses slot zero; the page callback clears all other slots. */
+	writel(FIELD_PREP(NFC_USER_DATA_LEN_MSK(0), code),
+	       nfc->regs + NFC_REG_USER_DATA_LEN(nfc, 0));
+}
+
+static void sunxi_nfc_set_user_data_len_dma(struct nand_chip *nand,
+					    int first_step, int nchunks)
+{
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	int first, step, len, code;
+	u32 val;
+
+	if (!nfc->caps->reg_user_data_len)
+		return;
 
-	val &= ~NFC_USER_DATA_LEN_MSK(step);
-	val |= field_prep(NFC_USER_DATA_LEN_MSK(step), i);
-	writel(val, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, step));
+	/* Write each packed register once, including zeroes for unused slots. */
+	for (first = 0; first < nfc->caps->max_ecc_steps;
+	     first += NFC_REG_USER_DATA_LEN_CAPACITY) {
+		val = 0;
+		for (step = first; step < nchunks &&
+		     step < first + NFC_REG_USER_DATA_LEN_CAPACITY; step++) {
+			len = sunxi_nfc_user_data_sz(sunxi_nand, first_step + step);
+			code = sunxi_nfc_user_data_len_code(nfc, len);
+			if (code >= 0)
+				val |= field_prep(NFC_USER_DATA_LEN_MSK(step), code);
+		}
+		writel(val, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, first));
+	}
 }
 
 static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
@@ -1517,7 +1542,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, 0);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | NFC_ECC_OP,
@@ -1546,7 +1571,7 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
 	struct sunxi_nfc_ecc_snapshot snapshot;
 	struct scatterlist sg;
 	int page = read->page;
-	int ret, i;
+	int ret;
 	u32 wait;
 
 	if (first_step) {
@@ -1567,10 +1592,7 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
 		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
-	sunxi_nfc_reset_user_data_len(nfc);
-	for (i = 0; i < nchunks; i++)
-		sunxi_nfc_set_user_data_len(nfc,
-					    sunxi_nfc_user_data_sz(sunxi_nand, first_step + i), i);
+	sunxi_nfc_set_user_data_len_dma(nand, first_step, nchunks);
 	/* exec_op() restores the page's spare base during column changes. */
 	if (first_step)
 		writel(mtd->writesize + sunxi_get_oob_offset(sunxi_nand, ecc, first_step),
@@ -1686,7 +1708,7 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, nfc_step);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page,
 					    user_data_sz);
 
@@ -1955,7 +1977,7 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 			goto pio_fallback;
 		}
 
-		sunxi_nfc_reset_user_data_len(nfc);
+		sunxi_nfc_set_user_data_len_dma(nand, first_step, batch_steps);
 		for (i = first_step; i < first_step + batch_steps; i++) {
 			unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
 			int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
@@ -1963,7 +1985,6 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 
 			sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, reg_index, !i,
 							    page, user_data_sz);
-			sunxi_nfc_set_user_data_len(nfc, user_data_sz, i - first_step);
 			reg_index += user_data_sz / 4;
 		}
 

-- 
2.53.0


