Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE4E3C5AC80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 10:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tCkzLUO8jupK5Bfyyo1EzqUcURHcXok2YUcg3cdLeVA=; b=stihrlHAM74QmIcdzVEtWZ8uRj
	XzJ/lnGbjkHMhod+Kxygy1AEDlGs64GYPrxGG7FnuzlX+PD6P9GjOtxDixOi/XOm9Q1bRMHYbhT9E
	05ZcolW18THP3Bnwpa42sbIMP5OoZCQ4ieSoFogAJAWu8gMuvMqDycXPVRBxJAbCoTn3lyoxiBnFB
	v1nLtdTmLKx51NxN108mDOVHeavDa+WJqy2QcKbYyWRTxYn7v0RqRajhWx95j/j9Fzvb7lXQOfEEa
	bxyHziepoMHEUeGtWBv/S7JgTzzSSf8ASTzHfkacrD+vHEX8pqa3MyqQQ5VLC/tbyhPdAn19v4hSy
	e27tVDpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsHak-00000007bLW-2Fw1;
	Fri, 07 Aug 2026 10:14:18 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsHah-00000007bJA-0Tdo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 10:14:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 94FB94E41136;
	Fri,  7 Aug 2026 10:14:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 69CF4603F0;
	Fri,  7 Aug 2026 10:14:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D3E9311C3751D;
	Fri,  7 Aug 2026 12:14:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786097648; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tCkzLUO8jupK5Bfyyo1EzqUcURHcXok2YUcg3cdLeVA=;
	b=hp2W1KId3Rp9Ta0F0jXoMfoi+RizYcnFwR+2ExycT6+ZudcGdgVf7wTfqcj7yxDgT/92Io
	RlRcDbikH/UrxdSL++vv9OwPFJpLwnJP/7GPIZ+0YQHGPJHVWCcUcLLc+DNtJoHbP5i9UJ
	Qqit5+Y745tvFVOPDwxrOtvCCIM+06oKUnCF1mP/oIkCgWajB/9YAGpRQq0Qggrr4ZizcC
	6wNYtnZ+LI8N2wgXVna6LaskWi/zPd0rXebH0TVJ2lL/u+S04QRnJ36oGcvISMpHRKQbuE
	heH2egYiahZZLPTegSTIxuJcpWE9zNvcdMvPGQxnYMrNrgVUP0aUJ/QpsNxnKw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 07 Aug 2026 12:13:53 +0200
Subject: [PATCH v2 01/18] mtd: spi-nor: Rename
 BFPT_DWORD15_QER_SR2_BIT1_BUGGY
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-winbond-v7-1-spi-nor-rv-addition-v2-1-7797642dfc40@bootlin.com>
References: <20260807-winbond-v7-1-spi-nor-rv-addition-v2-0-7797642dfc40@bootlin.com>
In-Reply-To: <20260807-winbond-v7-1-spi-nor-rv-addition-v2-0-7797642dfc40@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Steam Lin <STLin2@winbond.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_031415_286687_3B186B77 
X-CRM114-Status: GOOD (  13.26  )
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

The _BUGGY suffix is not super accurate. There is a behavior that indeed
seems strange, but it is somewhat documented. The fact is, with this QER
field the status register is considered 16-bit wide and if one writes
the first 8 bits (SR1) without the next 8 bits (SR2) then the content of
SR2 will be assumed to be 0x00 and will be cleared.

Rename it BFPT_DWORD15_QER_SR2_BIT1_NO_1B_WR to align with the other
namings (_NO_RD) and clarify the meaning of this field.

No functional change.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/sfdp.c | 2 +-
 drivers/mtd/spi-nor/sfdp.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index cf0e2dc7c120..526763c79f55 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -567,7 +567,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 		params->quad_enable = NULL;
 		break;
 
-	case BFPT_DWORD15_QER_SR2_BIT1_BUGGY:
+	case BFPT_DWORD15_QER_SR2_BIT1_NO_1B_WR:
 		/*
 		 * Writing only one byte to the Status Register has the
 		 * side-effect of clearing Status Register 2.
diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
index f74a0eb339ea..d976c6c9a4ad 100644
--- a/drivers/mtd/spi-nor/sfdp.h
+++ b/drivers/mtd/spi-nor/sfdp.h
@@ -84,7 +84,7 @@ struct sfdp_bfpt {
  */
 #define BFPT_DWORD15_QER_MASK			GENMASK(22, 20)
 #define BFPT_DWORD15_QER_NONE			(0x0UL << 20) /* Micron */
-#define BFPT_DWORD15_QER_SR2_BIT1_BUGGY		(0x1UL << 20)
+#define BFPT_DWORD15_QER_SR2_BIT1_NO_1B_WR	(0x1UL << 20)
 #define BFPT_DWORD15_QER_SR1_BIT6		(0x2UL << 20) /* Macronix */
 #define BFPT_DWORD15_QER_SR2_BIT7		(0x3UL << 20)
 #define BFPT_DWORD15_QER_SR2_BIT1_NO_RD		(0x4UL << 20)

-- 
2.54.0


