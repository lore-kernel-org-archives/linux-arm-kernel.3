Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27512606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 20:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JZhhuIX0;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PnNW8hsa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ex3VtA9PGW+lx4Jwo9zXOKsJ7tUqHQi29kWPU0YYtkI=; b=JZhhuIX0+si5Lk
	JBV3JqX72Xgp4XgJIfxFIxCVqV9IrI3X/W9hbXFyCb1ZvSm+F+Wc5i465aouN8qGmvfVPlP41V4+1
	JoghAIKaXgfXjtkcUtNs7mZHwRB1O3KqdNp6NAlhRB9viWcDYv6Dt4Z1lMAf8o34+Y2scmXJd3EIb
	0hLar/7OrewIWb+BijrXSrBv4QbskzioQgBCtbf04wCNtFd5dglueZuoN9DIgGiWAorlAb4xe0VjU
	Vh7+cDm7+gIHRPth5tQnptfbTyZiX6mBsOSCL1ufvyG/tWX9koPveXivdjz71tb+fTG5/v47nvCch
	+QKBAWE2KivBa5Eqbv0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2dD-0000000ADjA-2Fmc;
	Thu, 05 Nov 2026 18:56:16 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2cW-0000000ADDf-3gVw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 18:55:44 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-6d290b10a35so1043582eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 10:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904932; x=1794509732; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ex3VtA9PGW+lx4Jwo9zXOKsJ7tUqHQi29kWPU0YYtkI=;
        b=PnNW8hsaUxJvw4r6H5Mt8aum5BtSb7xdAvgT/glBt9bG2xKgPokyYs8rFsqInOxcR5
         yTdiwW61cVFyRcWvRLcZqswgenAm6DTFo3gPJAPTochQaDWphDTUG7qoujwx+YFCRO1U
         MrmpFLt5QF/+uCz3Ia/xDNXDba3MFt+p8qjgeMVy2uATHWI96WHfC/Sg1jEn6CnqjPHB
         rmw1eYW22kQezJNzpPSHONYsaSfqey1KWaLlQwr+ogDVCJxoQ5HUv8wH6ydDXTs4fEi5
         bdPldrDTOjax9nkyrlbUUcIB9POL3D/TQBoGe5xLlLUbJxRQDc9SR+I/uvpBhxZWd+d5
         eC/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904932; x=1794509732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ex3VtA9PGW+lx4Jwo9zXOKsJ7tUqHQi29kWPU0YYtkI=;
        b=FOEqWjocy/df3Y0bHgM+aHmORxn0bJAXz7F5SRHCLJrbF2yFSulBKklgPO5NpSv1XL
         cywG5XTc6ByfT8zTqp9y0qNWYZj6AIkC2cgRoECkECHoJxptVnIv7kljOREEcSJiN9I5
         SWnQNXycWs0vwKSvm2CeO3zrT3gh78tdr7ZWdFAENTroe7Q0GqxGs0y0eWwM37f04lY4
         69qruDgaYzLQcI0gLY4IKpAqhfZ6D+wWMGY6MSDqfgVtCUybxED+HydeX8OoEF/qVsr4
         0gEG16hOioYv0ohy+bJjFVMqr0pTFfwmcuPg64M68oXZO1k/i36PBO/xbM9oRuMGQXAc
         /z9g==
X-Forwarded-Encrypted: i=1; AKwUvBzZTJlEkyhQxPeMlG4scfJb4Uiw22li1V4/zZd/JAnH/7nG1LW3RuYrqWFd2KIRtxx8S921FBHdkees8HrVOjWC@lists.infradead.org
X-Gm-Message-State: APuU4Z8/FYHzrKEC4tFcIUeBvxc3+fmVNAzEybeSZZcMwQ2hNwN+h6c3
	gx34kH3jtuECkqyarx1bUufVgtSlLbqThxkykrJ/VaEefC08ZvkQfnE6
X-Gm-Gg: AYBFou3NX82U4JM/z8e+QjozGxBYZCFi2xl1midwnyrecRhpeuyaAymRCZPOc3ANWIL
	5J48nV8whRFLceceiZ5WoGCIN7WtaWn7OkPnSixYszkjGl2KDc3J9lc/E/rf4w5TewK69O0U3ik
	+YxoQYZI2ZLNNk6C3ta8LdykRTxwDZKpiL1BiQUL2lXJef1Fb2yyjzs9uvAlEjYvnhH5g6oBKou
	rBwe2XijjfdagnpNF0wa1r+g4LhgllzsmNAcU9FjoyVQONhO7eCxz1gs1sDoaFE6pFm4TfSvKbW
	+tGEYjRJ2CLICnRv1epQvuM+/O7yBXK0I6jbKau6SCqDrmJQCi0XC/ROo3OSb13jay0Odf9kakb
	g7tD+kgvRH93/JThGr6DpI7V++C+Dba2m5rKyryjrjszkWojRnq9rE83bxP0EdtgBpNon9ZZO4A
	J6RxRiKzLUxCf9AMsjnFjGrZt81gwmPWwMxAPT/b7Wwhb9mKudXIgffZs+Ut3HSX7Xnorx32SO4
	Oy7jdyWyuAMNfHRr9KdjYeHLfftGEdJpA8yfpsZq3wxJu1wgkdm0j/xK7bOmqZqzUBIp41tDxVs
	KOKezYd3RI2L8+JGk7J4mjUQ9G0sfuHCx6zyAG+ZN8t8mTJqPQ/NaBkbU1jHUAHDAMhxpzoDuIi
	c9sFH60u98XyW+NI2qSP3GS7ISFqjzBcVXWh0MvfaaARBnetmPKKiA7xIln9soTA6WACeNxDwk2
	gMiP4xyFAVwn2MuZIGD/I2gcBIIf32j7hn67f/PSPDzblAMqLORzN7pPtGoCDnh6qcbIiAJDYfo
	A==
X-Received: by 2002:a05:6820:2484:b0:6dd:bc51:888d with SMTP id 006d021491bc7-716e79f15c7mr263473eaf.87.1793904931737;
        Thu, 05 Nov 2026 10:55:31 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:31 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:18 -0700
Subject: [PATCH v10 02/26] mtd: rawnand: sunxi: share the buffer transfer
 chunk size
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-2-dca1f6ed29a8@gmail.com>
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
X-CRM114-CacheID: sfid-20261105_105532_969935_EB8CC9BB 
X-CRM114-Status: GOOD (  12.72  )
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

Use one helper to determine how many bytes a buffer read or write can
transfer in a single normal command. Keep the existing SRAM-size limit
and command sequencing unchanged.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 80006d1a33d6..b75984961699 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -659,6 +659,11 @@ static void sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
 	writel(ctl, nfc->regs + NFC_REG_CTL);
 }
 
+static int sunxi_nfc_buf_chunk_size(struct sunxi_nfc *nfc, int len)
+{
+	return min(len, nfc->caps->sram_size);
+}
+
 static void sunxi_nfc_read_buf(struct nand_chip *nand, uint8_t *buf, int len)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
@@ -671,7 +676,7 @@ static void sunxi_nfc_read_buf(struct nand_chip *nand, uint8_t *buf, int len)
 	while (len > offs) {
 		bool poll = false;
 
-		cnt = min(len - offs, nfc->caps->sram_size);
+		cnt = sunxi_nfc_buf_chunk_size(nfc, len - offs);
 
 		ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 		if (ret)
@@ -709,7 +714,7 @@ static void sunxi_nfc_write_buf(struct nand_chip *nand, const uint8_t *buf,
 	while (len > offs) {
 		bool poll = false;
 
-		cnt = min(len - offs, nfc->caps->sram_size);
+		cnt = sunxi_nfc_buf_chunk_size(nfc, len - offs);
 
 		ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 		if (ret)

-- 
2.53.0


