Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F7E606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 20:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=grFmrw5A;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XGykRTsI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UPvgTlYh271ksxX8dw0Tb6RYwBWSB/xct0guWKo1nsA=; b=grFmrw5AuqhEf2
	DVEpPaLQ8yhVKs8QDr9ANnSSU5knRQqq1CDzM9fhLFZKjwDnE7aUhpMEmoZWQWyBMW9KNdskXQgDH
	o936x9f89s+xTeHHRd+tn12qDlJDrNrnmSs4/QS2ggLj4sQNz3iAadAbII6uDu9zKMTbDsYWqsbM+
	9DdGUA9GX1375tU0AVaG1eJBFP5H2jnVUCxWFriHnf9uvzpmYQFuOpZ5b10IyN0GHImQP4pZ/HuUs
	uNrGGUYuy3Z164CeJkWOSl94+2PfkVcGZzf2WK3Y8VlcX187UJmQXIkXyh/yYVdApcwj8h45Py2xE
	skvaN1BthMSmV4M6FwkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2co-0000000ADNL-0CRg;
	Thu, 05 Nov 2026 18:55:50 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2cY-0000000ADEL-2Bwf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 18:55:43 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-7143451981fso1504246eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 10:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904933; x=1794509733; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UPvgTlYh271ksxX8dw0Tb6RYwBWSB/xct0guWKo1nsA=;
        b=XGykRTsI4Fh/CrxamSWQzqbcERCFwgHBjT7k02+3V0KOmIMjI9kJ5Im700frgE9DN8
         M0mCQsIqruCFvh7+N1i4IkfQRUFSabQCjkTmCrV8t/0D3xzB6hhQ/KCybzgCmYcAlN29
         MlmgXZzzaccy3e/acETA24qzCuoYJdkMszd+RJ31r9HFe8p0/CTEpNKZ8kzeZ4AR9vc3
         BYCQPrRpDAxWtzDgxKXiRzN67I7lYwlCmLBwrXpwcf+6PXBiYxC3QcaDjj2jvH3yZ2+d
         bLsKPyRUagCjWIZ+5J8NU0CmfAWKyLd6A2GLHcys55WgZSEfv54KXG9fDL9Xka+IZCk6
         K8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904933; x=1794509733;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UPvgTlYh271ksxX8dw0Tb6RYwBWSB/xct0guWKo1nsA=;
        b=LHXqMf/9/r0HMH0WpLVE/PO8KsjVjwHbc/fQ37B46QQLQd4zuehKM/9NBWtRrty5R+
         R65YiYfBeSnxlzxCACDiCWfgYnF4mHPrtZEPJyojqpO8kd9me1q6+NqJNt9yw2IJMB6w
         BrwuXrbav9vnJ+7VsDcpzGF6cXfJ6apI9eaccXoA0rHBslE/4obHEyS0IzToirrVaK6B
         HrVj6xOkOuUJsNuZyaKa61eAMplNDAne51AeL4EnQ37ZtZ4WNzOe0pq59hRgHl8Je0ux
         e1y7J+viJgqtpq0SDyuGPDQAyG4z4zhnC10u+G7k/VP91IAx/kIq0fhpds31UsK1IbP8
         4KtQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmS++Krp8AJfHmdL/jRwL3KD4ugIlDRWCeK8ll2nxknrgDgrtPmZeSb32dI/cI19NAmNxk+8FvpEB7PcC00Gqh@lists.infradead.org
X-Gm-Message-State: APuU4Z8BHLYqC8yzrcMb9ILY9NeL8sFH+BYkj70OHEl9/IKqcVXud9Ck
	r8z8Nm6eHAb9s58APFOeTrmB0083UAqgVutpwOAEgm4V3aR2buToyB+Q
X-Gm-Gg: AYBFou0A6pKoiKpZG3+/8GoCxhwC0EAi7lzoCAeT1FmE2aFhBdEprRF9ivqA738vZjK
	HVeQjzM8kLRncIpcW3oqFjDGMy5e+NzsX5YI5I/tjvEjAXdw/9VBOqFyb8b4h+1wyGVR8Bt4mS6
	Gw6nDqZ+yb5b8Unp4T39ojYqpr9/ALiU3HAgn/InXRhIERao58fwM8Zw/F6IKgDqLoDq95ElnVR
	fwywj9aqQAe5dO/dxUA77xWucpbl00oAAcEtzLgP5lIDIQuYrXzBdY2z6Nhjh0x+n5Ul5FBxWlz
	OPYvmpUWHEqN5AiXZk+tfvwJ8RFkPWz17d4xOEywweK2bB+Vo7lgpmBlKDyUA//oOi27qfdquU8
	1EZFVCcKlsb3ncPap0srLySIhYuB4WcQoF6uEc1X2qRG+MzuPDAmMGDsDSyBwhahBDKR2zKMxLe
	CyjnuzpPOS+F5ll+3DnnSzt9LRA/KMlFB6lpWxBJ9Cqj8TSJfLRyad+lw3h6b4911S9nAMlFfkq
	odOl6YJL3BPZioBAvthVScA3rstYSr/iAsluJye90l3LzK4UrHdiJhTJUT4d77ryR0hGeSjcF4h
	h/7mpO9jv4pWMTwga8e2suBbjCCgVZcph1oDD3qd8/jMpVyw1TBQL0V97UgiV+LFdn9SltAi1g5
	vc04zx5oTpeUdZuSgK3ccuyjv9AhHR+huLNPvRJFfv/BZ32TkLWVIZradKhjFaaQM0vo+/hU5eo
	LzztBnDfI/BFnt+6ZawfhdMGn9xrcHpVBY2UCfyILrMPmOCl88SSgU8Gk74/xtpebyn+uyb7Ehr
	Q==
X-Received: by 2002:a05:6820:7048:b0:6f8:2346:cd89 with SMTP id 006d021491bc7-716e73a98famr324182eaf.13.1793904933325;
        Thu, 05 Nov 2026 10:55:33 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:19 -0700
Subject: [PATCH v10 03/26] mtd: rawnand: sunxi: avoid duplicate chip setup
 before page commands
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-3-dca1f6ed29a8@gmail.com>
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
X-CRM114-CacheID: sfid-20261105_105535_344095_9D52CD5F 
X-CRM114-Status: GOOD (  12.41  )
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

sunxi_nfc_select_chip() programs chip selection, timing and the
spare-area base. The page-read callbacks and PIO page/subpage writers
call it directly, then immediately call nand_read_page_op() or
nand_prog_page_begin_op(). Those helpers dispatch through
sunxi_nfc_exec_op(), which performs the same selection before executing
the command. No controller access between the two selections needs the
first one.

Remove the duplicate calls from those callbacks. Keep selection in the
DMA writer: it accesses registers and prepares DMA before program-begin,
so it cannot rely on the later exec_op() call. This removes redundant
setup only; selection still runs for each executed operation, with no
new cached state to invalidate after resets or chip switches.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index b75984961699..662d96fc2535 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1513,8 +1513,6 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	};
 	int ret, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	nand_read_page_op(nand, page, 0, NULL, 0);
 
 	sunxi_nfc_hw_ecc_enable(nand);
@@ -1537,8 +1535,6 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 {
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	nand_read_page_op(nand, page, 0, NULL, 0);
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, oob_required, page,
@@ -1562,8 +1558,6 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	};
 	int ret, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	nand_read_page_op(nand, page, 0, NULL, 0);
 
 	sunxi_nfc_hw_ecc_enable(nand);
@@ -1589,8 +1583,6 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 	int nchunks = DIV_ROUND_UP(data_offs + readlen, nand->ecc.size);
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	nand_read_page_op(nand, page, 0, NULL, 0);
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, false, page, nchunks);
@@ -1612,8 +1604,6 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 
 	sunxi_nfc_hw_ecc_enable(nand);
@@ -1652,8 +1642,6 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 
 	sunxi_nfc_hw_ecc_enable(nand);

-- 
2.53.0


