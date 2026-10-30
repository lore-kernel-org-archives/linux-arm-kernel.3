Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FB8606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 16:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pMYO+iAQ;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yKdSB1M9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OLRD/nhwFUuDTpwXog0Q7Wc+ALgde2fM6C+mADcBMYM=; b=pMYO+iAQgU9ZjC
	chbeUgblJBtyrsj6hSIevum25nKT6xp+bl9mrbWuP4Xt1/9SO94Fdarah8ggiY0vLuvskBiDbiX0u
	8Mhx4dhrwJPk7M6UM7W/eW60A/FjTIzThXpYpiuF8BadKfkgPN1PLJDXhJAZFBvgmKAd7IKKgISav
	TTG1Z/xyIb1RuSg7B2FknEghI3+/g6BT2E3VChLD2ChAdqy8lbaCDxtOwfnXcWyWu31hO5csNV2sP
	3vfwE3t3SfNzKhInzk7nf5godRr+N5xMSO0FsNOdyf8pJzfsu/pS0Mr53PvWGE06kpRDDCFcRu+Fq
	sPA3guLX74U5z3vrTFvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpLx-0000000C6qA-1RNf;
	Fri, 30 Oct 2026 16:21:17 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpLr-0000000C6l5-0vnZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 16:21:12 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-4a89b4a59a1so1777380fac.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 09:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793377270; x=1793982070; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OLRD/nhwFUuDTpwXog0Q7Wc+ALgde2fM6C+mADcBMYM=;
        b=yKdSB1M9GJ/By+Jv0eCsyH4Hy+s+0Z7URcZZ8FMbIUHcnfPM2hMi449KU4ESzYiDhY
         0VvUPTHlpxlarpM+AdNk4dCujbr6VXPL/ldjEc101Uc5ZRbxxAmOORT5jOxBjnv01Fxk
         9P3BTdLoJ3dnR4Gv2MWVo/qR0p7GPDemg7tbGhFvwUh0Y6Bq1t6hyUSTCIz14cBs/1zh
         DM1riJr1XJVdPeCa/wkdJpnHI387YFyIsZP4FezZnjEHSz/w3E/VTjABa9KctHRo3TZG
         rrMuAcLeOiO7CiL6BEMYUC0yJSufVPfAdzdmn/VD4izNsBppNMLmzbCOH/zVBOWBd94n
         EktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377270; x=1793982070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OLRD/nhwFUuDTpwXog0Q7Wc+ALgde2fM6C+mADcBMYM=;
        b=Uj3ExH4J/Ne7w1uELc6uBOGxsKLxcMhXG/Uhj+FcTNGbIzn3oM8vDn3eIp/c/zHeA0
         xHz6i0kQTK+ynGBLaSwJfVI42GdPxneinckT4XdQwPLl3hsf1Xyl/t1WsrHhDCNQIK6a
         a/+rPU7PzWNVk59RPdoZIXi4Qq2fn0MDxEeXSbBRnOgG4XS3z0wWdVpyfxeDozci3Idz
         he0eW0UzW0JLmt2K2ViRy3MkEzTtgiBMKhU4jXdxnD2eiG5FfW7Sin7+zyCO/+GrcBbE
         0VMFxy03EkuBF3PR5S6hQO6Ot/G9O9vmDPnqemDX58Gb5Pgb35XsnMN4mLip76hCEuQZ
         4Flg==
X-Forwarded-Encrypted: i=1; AKwUvBw8qhb7OR02sQTWk4AhMJvoCerSJFGs5z2S0cT6vqIBzxLTfe4JVchpRD52glW9+3mjBdF2xtXRpAfQlvI6yFws@lists.infradead.org
X-Gm-Message-State: AFq9FYLDZH6wiqG4j+s7qIMOHhuUKEmlabp2xUHK72t+kRqzEQx56r+m
	dD4X2IDGFCQF4K19N4TBRpCbAv5x8ExPa+dXf6ULynjk2CTyQTfSlO45
X-Gm-Gg: AYBFou3obNadcIr5SKrbbH/G8uWqwdNznxvahW0pV3c/gCCZfxr1PRolou3wHKfJuXH
	JIkk245Bl6ES9ffnuBbSNWMmaJWNBx/rU/QRqLq6Z7ligm05D3OyRRhRZDIYh1W5WkySzM+GOCA
	itcIkNWlnUPnL8SlpDZevMF8MzWFdOwFfgU7nbpSQP3dRRkAfClHb22+TEyx3J5PhntokqsqwC8
	u/QbxlztTuqwE4HVV5dbxdoLCPBJ6VWeh7gvlrECCWTOuo2aFBJBFeRnuPhzXLRbXhgONqga0Mo
	bWncCiYedwtSdGbYHrGxeeQrgrBwptkRB4vaw7YIBJxeohawkUk4kvooRhK4gEU3146sXfXHvEs
	g5Y/BPxrCThCRr6nKWQD/64v0fVhEn4lt4JOQTT16g4sEBAXKiygiX87KwFo9n96dgrx9oAEh5p
	jVRpHs1k0VgA5vSd69pEzgsjBtk2x4rNSxnP8s7btC6JUhVhnjpOo9TNQ6NwrHGPNtRi5YCC/TC
	suS205CtXNRGo59N13Y6cZIgtV7DVoNT3MIIfVtAA3ToK20T+MtxVPsjzTIc6uz14nOK1MNcqoc
	3yL4FIPLBABFPOEhuLwCR01QiskAvyhwXYteuN8yQ1oSdZhk+z0VRQpt+y8qrAUQ35yMDAxueii
	G6hZj/o1hDpdVtVfzfTS9pPEBqgqECiavji9a3kAJ1/Daf4+voR35PF+fRunxDBMgPxTDjH7Qkg
	M+TSSnikIGzDtOpWqL
X-Received: by 2002:a05:6871:5224:b0:470:e96b:43e6 with SMTP id 586e51a60fabf-4a90775db3amr1316890fac.18.1793377269740;
        Fri, 30 Oct 2026 09:21:09 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a92167b03csm322536fac.2.2026.10.30.09.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:21:09 -0700 (PDT)
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
Subject: [PATCH v2 3/6] mtd: rawnand: stm32_fmc2: retire data DMA before unmapping on errors
Date: Fri, 30 Oct 2026 16:20:38 +0000
Message-Id: <20261030162041.2998170-4-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030162041.2998170-1-samarth.colleges@gmail.com>
References: <20261030162041.2998170-1-samarth.colleges@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_092111_292784_6E224BD5 
X-CRM114-Status: GOOD (  15.76  )
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

When ECC descriptor preparation or submission fails in
stm32_fmc2_nfc_xfer(), the driver unmaps the data scatterlist without
terminating the previously issued DMA descriptor. The descriptor may
remain queued and execute when the next page operation starts,
potentially writing into a buffer that has already been unmapped and
returned to the NAND core. The timeout paths have a similar issue, as
they use dmaengine_terminate_all(), which does not guarantee that DMA
has stopped before the buffer is unmapped.

Terminate the outstanding data descriptor on ECC error paths and use
dmaengine_terminate_sync() on timeout paths, ensuring that DMA has
stopped before the associated mapping is released.

Fixes: 2cd457f328c1 ("mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash controller driver")
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index c08d6b176..82d630106 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -915,6 +915,7 @@ static int stm32_fmc2_nfc_xfer(struct nand_chip *chip, const u8 *buf,
 						   DMA_PREP_INTERRUPT);
 		if (!desc_ecc) {
 			ret = -ENOMEM;
+			dmaengine_terminate_sync(dma_ch);
 			goto err_unmap_data;
 		}
 
@@ -922,8 +923,10 @@ static int stm32_fmc2_nfc_xfer(struct nand_chip *chip, const u8 *buf,
 		desc_ecc->callback = stm32_fmc2_nfc_dma_callback;
 		desc_ecc->callback_param = &nfc->dma_ecc_complete;
 		ret = dma_submit_error(dmaengine_submit(desc_ecc));
-		if (ret)
+		if (ret) {
+			dmaengine_terminate_sync(dma_ch);
 			goto err_unmap_data;
+		}
 
 		dma_async_issue_pending(nfc->dma_ecc_ch);
 	}
@@ -939,9 +942,9 @@ static int stm32_fmc2_nfc_xfer(struct nand_chip *chip, const u8 *buf,
 	if (!wait_for_completion_timeout(&nfc->complete, timeout)) {
 		dev_err(nfc->dev, "seq timeout\n");
 		stm32_fmc2_nfc_disable_seq_irq(nfc);
-		dmaengine_terminate_all(dma_ch);
+		dmaengine_terminate_sync(dma_ch);
 		if (!write_data && !raw)
-			dmaengine_terminate_all(nfc->dma_ecc_ch);
+			dmaengine_terminate_sync(nfc->dma_ecc_ch);
 		ret = -ETIMEDOUT;
 		goto err_unmap_data;
 	}
@@ -949,7 +952,7 @@ static int stm32_fmc2_nfc_xfer(struct nand_chip *chip, const u8 *buf,
 	/* Wait DMA data transfer completion */
 	if (!wait_for_completion_timeout(&nfc->dma_data_complete, timeout)) {
 		dev_err(nfc->dev, "data DMA timeout\n");
-		dmaengine_terminate_all(dma_ch);
+		dmaengine_terminate_sync(dma_ch);
 		ret = -ETIMEDOUT;
 	}
 
@@ -958,7 +961,7 @@ static int stm32_fmc2_nfc_xfer(struct nand_chip *chip, const u8 *buf,
 		if (!wait_for_completion_timeout(&nfc->dma_ecc_complete,
 						 timeout)) {
 			dev_err(nfc->dev, "ECC DMA timeout\n");
-			dmaengine_terminate_all(nfc->dma_ecc_ch);
+			dmaengine_terminate_sync(nfc->dma_ecc_ch);
 			ret = -ETIMEDOUT;
 		}
 	}
-- 
2.34.1


