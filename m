Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5924F33803
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 14:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X7VQhh/JhXPu5QGrk0qvjueePPB/glmqNU70q+jezU4=; b=m2HCT+M73eFXm/6tBrSI1/0KiE
	ugH8Uf3z8LXGBTyD6EahfDVyYS9uR7uTgOGhfSDRwodjJYo2eFOxszKXayKE1ua79cXeouAiEeH7J
	3MSfP8nDL/MdZUnuqHr/WgqCmOVBJ6QovRU6xqKRICExlfRT2bwRGSepKqytZT7uN68HPSfzmG4s3
	nmVwhb9kMT2zZ7Y+ofOcN2/f5j8sFHkMvxE/oYgm9qUcMnKzPV57kK6l0WQrgdkkaczfdHA9L6HF8
	CpcfvdXe/9DrJnMpJKI3Os506DSHbR9b2A5t5fOEgIzIZRmVS5hutdeM+yCws2N4ncuVJYsvj+sxr
	2z3nwzgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2VMO-00000006aM2-2lgA;
	Tue, 17 Mar 2026 14:25:28 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2VM6-00000006ZxQ-3S28;
	Tue, 17 Mar 2026 14:25:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 304424E42659;
	Tue, 17 Mar 2026 14:25:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 071435FC9A;
	Tue, 17 Mar 2026 14:25:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1FEE7104505F9;
	Tue, 17 Mar 2026 15:25:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773757508; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=X7VQhh/JhXPu5QGrk0qvjueePPB/glmqNU70q+jezU4=;
	b=xyTOn8IvIlhEGY/bUbA+/zRDLkFqn/mY/Ad8sb3AZUPABlwwMFyAmtMY7SUvbW+jc2qUpZ
	qxREUJv6tjB8xR6Ltkow1J/05VD2ddosGJAaGkE8sDv3ZUDFAvWzpk5dOnA3zdv98qPwuy
	hgIHCxQbdSE7rnMNc6ykEV81gTvw6fsuutA8t/8sjPzq2Zc8mb3s4pUlog1yo62sptE11F
	fVRGVO3Ls+ectEH9ik6q1N3jVAHNC8lZwTLLBL1rcF/BbTJTmIqGeAmqqtnUh47N156u9z
	IaLhG+3yXotxq4RFYgdl4Ztu8l2I1yMz55e+rtcsQp4oZ6Pol+f5jPBj5+90nQ==
From: Richard Genoud <richard.genoud@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
	Maxime Ripard <mripard@kernel.org>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH v3 8/9] mtd: rawnand: sunxi: fix typos in comments
Date: Tue, 17 Mar 2026 15:24:36 +0100
Message-ID: <20260317142437.580204-9-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260317142437.580204-1-richard.genoud@bootlin.com>
References: <20260317142437.580204-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_072511_001441_CA87B321 
X-CRM114-Status: GOOD (  12.44  )
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

Fix lenghts -> lengths and chuncks -> chunks

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 81e491be3563..3d2580d39e70 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -272,7 +272,7 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
  *
  * @has_mdma:		Use mbus dma mode, otherwise general dma
  *			through MBUS on A23/A33 needs extra configuration.
- * @has_ecc_block_512:	If the ECC can handle 512B or only 1024B chuncks
+ * @has_ecc_block_512:	If the ECC can handle 512B or only 1024B chunks
  * @has_ecc_clk:	If the controller needs an ECC clock.
  * @has_mbus_clk:	If the controller needs a mbus clock.
  * @legacy_max_strength:If the maximize strength function was off by 2 bytes
@@ -294,7 +294,7 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
  * @nstrengths:		Size of @ecc_strengths
  * @max_ecc_steps:	Maximum supported steps for ECC, this is also the
  *			number of user data registers
- * @user_data_len_tab:  Table of lenghts supported by USER_DATA_LEN register
+ * @user_data_len_tab:  Table of lengths supported by USER_DATA_LEN register
  *			The table index is the value to set in NFC_USER_DATA_LEN
  *			registers, and the corresponding value is the number of
  *			bytes to write

