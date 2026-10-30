Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F51D606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 16:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=24ZsMDGY;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ueUiB05b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NiCv4TzAu5z9UeTUiidIChOBFFfvn1mb27PyQpvB9kE=; b=24ZsMDGYhkoluM
	6ee3cHORuGgW5NgDmpnab2yLVA/1XM79GU5tC82VZfQxc3yUUgfo5Myk9B6OHnDLYDjyq1tDJxe3R
	MLOW9E1gycckVRSUyDtBkFujdk5TtVsuKuN3rJb67WnhOTe/Q3oqtLnBM3no9ei9Bz7BLFzT+M7Fk
	Pj8Y6YHVjStWdN/V1c/lVK5ap1sjLBvJCzWum84Kqww7J8xuNCElLQMvqlVLahVuxwmZ6/q0tkTvz
	L+OHh4YSV5Ps0OGl1avpxLJH5ucLE7G+QUf2Of4qMVKOdRJxlu+T7WcBKvckYA/crCvxMvF+c3bpS
	rBljTM5RDQC6gKR4LYPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpM6-0000000C6yv-0F9f;
	Fri, 30 Oct 2026 16:21:26 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpLx-0000000C6oT-0RkU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 16:21:19 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-48e9476e26aso274845fac.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 09:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793377275; x=1793982075; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NiCv4TzAu5z9UeTUiidIChOBFFfvn1mb27PyQpvB9kE=;
        b=ueUiB05btc3rjjrXeMOmDTXCzEBQI0VMYjBhr6JURplPV75bm1CaF0R1WaHHJW3kuN
         R7VMsvn1kiqUZA7BemtTyMRq/XYwdxdmNo7fZWBZtDkejw4L0O0veMJEEUQ5WMZqG5SD
         E76o8xGCbb5LedtukE53ciOopvbphTdIjyt3GPDyeo17XfW3ZwBgfaTvgBS9aPFTsZHm
         tSeamjsqooE/xvedaNgSpfAYYfeewAYKDTHrvH8PLfbHnDyKLPtdoSaYT7eRobJBhhLv
         sP2CVMMiDzYx0TBvwkTzIGfou/CzDKsPzKeSMj895mzlXPo4NzPq4EpDuykJRVbkmK41
         PyJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377275; x=1793982075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NiCv4TzAu5z9UeTUiidIChOBFFfvn1mb27PyQpvB9kE=;
        b=DV/3y2ZwAeRI5zrBMyNn6au4l11C97EIpCMkc6PMgA4zzj1LMunVGQmq3yvobx4CGI
         qNe7Z4MTmhoK391WnatoJGUFphRAPRVgu70XLKuwSxpJMog18WgpEvBttXiSi3top2ce
         NXZQSdJg4m8aGiSLftljZKJn1FOa0YyfJ9U7/UaaUyBFhZHBxwtrnicAec6p2voERQ2Y
         6DA0ZGBzqT7KmX25WxgCSLPqtompxDkZ8PMkqnMtSj0xeATjOMgYpEzZZsR/9KBytUdg
         ZbrjaSRNVj7hsN3V6QD6wVB44of8ThF9fHep09LYGsQWjq+MDcW/saunftftrvV1pEFd
         DgBg==
X-Forwarded-Encrypted: i=1; AKwUvBwjm0dSshXDSVphr7Ekw4uoJspK4WCzgtQiW46HAT2CnTao/qQfUjlE3HvCnQIYAnVabyjXhN+2aM2UNzyDXA/5@lists.infradead.org
X-Gm-Message-State: AFq9FYL/amTs6EbxHwmC2q10ne5NWAUYhWVKa+c5mn7smRmWr+IxLqsp
	FTGH2TUf/bVP0eXcnGqV8QKfILeULMMl1Vaf0SKHyZ1SUxKUhoWrJqA7
X-Gm-Gg: AYBFou3Fb/MCiNoilFfxnDklFh1rCUWL5pauAkvgLnExDBkK9bD31fCQXnUVC/wupas
	BGDBCfMSVq2K5dy4ldg471FmAkAU+aiVKsheWERUZsD6IIgRit3PyF1oPr3UKAApGNfcPti8YRi
	Dg6cPnDFm5WbiH+S8+TPtykcB7s3lMc6yqwf3x7R82MWdhky7NoLa/+TavE6lR1Oz+pmh4iSJog
	m9fepT8nSjKZ9WxIRbXhA/44c6PIqqXQpgzbcrEfsJ0igTT8VWpb0rtiaNLdOQvw5JxFzIMCUBV
	1mVyN+lUbMAAS7nOCOqFhnOI5emISzv0G4tow9cIeX8L7FJM9HhVYm312vctQmt88JgI1eeayAD
	n2NPJKxPDRkMSc447VwJh5kbzTPFnjIEUHfWNCVNbUEfSMeZG4wvBkc7BUceUnFxYzNzOBhLUie
	CuBR6QF1wM+Uz7hbblx/1fqBbVFrbmv3l8NcOP2ORA7a5v7GFsX41YfAlv14vyzGxTa44nIF6Uj
	IoRr6tAe9bcEfcmFP47NZuLMO7LooZuORrFMOHd6plkEJxI65RNYoTCncu1dXCJQIx8auRsiLPY
	EhBrfLDgReCZzHPFhYDuEI9GVKK8ICOQx+tev3jgjWVVdN0FBmtjpydtBuXYizddhFPzBBPc4Yl
	SR3dBoEqHl5Zxk7cGlMEXwzoPmkojNWO+BVI6v4nWxp6dj9FVn6YEgygg7v3/hEyA+AIraPBTVC
	bq87N9inxJ+ERsbGI=
X-Received: by 2002:a05:6871:3149:b0:4a7:4323:3fe1 with SMTP id 586e51a60fabf-4a9075f9d96mr1952103fac.20.1793377275138;
        Fri, 30 Oct 2026 09:21:15 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a92167b03csm322536fac.2.2026.10.30.09.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:21:14 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Han Xu <han.xu@nxp.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [PATCH v2 4/6] mtd: rawnand: omap2: terminate DMA when prefetch cannot be enabled
Date: Fri, 30 Oct 2026 16:20:39 +0000
Message-Id: <20261030162041.2998170-5-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030162041.2998170-1-samarth.colleges@gmail.com>
References: <20261030162041.2998170-1-samarth.colleges@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_092117_163584_EB36F00B 
X-CRM114-Status: GOOD (  14.46  )
X-Spam-Score: -2.1 (--)
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

When omap_prefetch_enable() fails because the prefetch engine is busy,
omap_nand_dma_transfer() unmaps the buffer and falls back to a CPU copy
without terminating the previously issued DMA descriptor. The descriptor
may therefore continue accessing the unmapped buffer, while its callback
could also signal info->comp for a subsequent transfer.

Terminate the DMA channel with dmaengine_terminate_sync() before
unmapping the buffer, ensuring that the outstanding transfer has stopped
before the fallback path proceeds.

Fixes: 03d3a1df6da6 ("mtd: nand: omap2: Start dma request before enabling prefetch")
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
This issue was identified by a research static analyzer for DMA
lifecycle ordering and has not been validated on hardware.

 drivers/mtd/nand/raw/omap2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index 552f36da7..b6bd4386c 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -417,9 +417,11 @@ static inline int omap_nand_dma_transfer(struct nand_chip *chip,
 	/*  configure and start prefetch transfer */
 	ret = omap_prefetch_enable(info->gpmc_cs,
 		PREFETCH_FIFOTHRESHOLD_MAX, 0x1, len, is_write, info);
-	if (ret)
+	if (ret) {
 		/* PFPW engine is busy, use cpu copy method */
+		dmaengine_terminate_sync(info->dma);
 		goto out_copy_unmap;
+	}
 
 	wait_for_completion(&info->comp);
 	tim = 0;
-- 
2.34.1


