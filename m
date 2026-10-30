Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D72606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 15:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ay5z5KO1;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BcspYYx5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=6MjztBnlV5pomChElSlFxYSq9kFZVSiTPi38g4YWVXI=; b=ay5z5KO1lZD8Z/mKi8P0CD9X4g
	9MK2TfLTmiBgOxJ609CueHXAKS2gqLFpsvH1UQQVB/WrwQqj+cOx49ZkzDGOZbb+AdraBeYt3+cM/
	bVlUnptY1NTVAqxl0dh4HMmGOxmhe7t539naBYa+Ctcjs+P3wfyV/g52f5TzhwOy2ksfY3jsNXBnd
	G04lQhCJyQS6tNfTY/XCgbOq8vZllGf+lTuQO1etqGaoImnHRGSoc+7/M9latEBUHTXf92Z+z7Hpk
	R06uB0sobKauARyeKKwdYdZXYwnBAR5CqrEw1OitCnugTmgM7SB/WQ0B8YqH1ocVtnVKs+CJrY/Lw
	aXbRRaDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoNb-0000000BzFc-2tum;
	Fri, 30 Oct 2026 15:18:55 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoNY-0000000BzE2-32wh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 15:18:54 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3ad2b3b1c02so505401a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 08:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793373531; x=1793978331; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6MjztBnlV5pomChElSlFxYSq9kFZVSiTPi38g4YWVXI=;
        b=BcspYYx5XPSMqmuExAjeglVv9Z6VC8a+ZKDGbyKe9YpnG1uKSiZ1iSnfsIQmn80tbi
         YJqcaD3US3CkMXHYqkiGHXw77fhhyOiadF9xAmUxY//fkGv/lnwkviSfc3eqYJnjqkW3
         0NExvtD+FQlboUYY/oZTWuQqvWlAPMzha+s/2UcEpy5s9/eKU3CfZNnpV78S8YvTWIPu
         Vuc2aoKTOTF3q7TJGamCsOBBFTqxf3+ReiRPnX8VxVP9r1hQGJfCeg6zawzBFOFouHWG
         7U3/3nqnMQEorikQxgtgHE2Nu2vHAGjpEyW6b3Kan/rVC+2sNBzptHDJ1cCD7O8Fj9eU
         GT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373531; x=1793978331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6MjztBnlV5pomChElSlFxYSq9kFZVSiTPi38g4YWVXI=;
        b=1tPYGf48ywaBoeWDPb2vQyWqLcv8cYKjE/Cga5flTM6Sr36hxvGcDAKsQPP6lOLf8/
         9zTI42WW3y9fvJ42FxBZIYS7ZpPOmxTU1Pc54wkWvxVTmUIm6zPWHJICwRWMJBxcQ9FA
         rm/F5z1pfTXXkZWIhQzSYCDU2cTbJ/Q3JaXvROfTOpunMPfoxO5eOiiOcH/wz0Ayrf5o
         AE1SuGPjlCgDy3F+y0cd37VXt0E+al93bvlLqI/zsRB4nvFhQOaXX8KtrXSRXhVLuSGH
         vAx+LFW6/ltbnq0OgSal2Tv0Sg8V2D/HlOie/AXvki/Kc3O+GaRvKGBkxslfLSAGLTy0
         Gu7A==
X-Forwarded-Encrypted: i=1; AKwUvBytWQaBKdJYH0nr3KR2FRkG61z08zxfKocOzLfKG1zd520+ArNBbXeKa6y45xTvyAb86G4IqkQvBJ3WDb3SvFs5@lists.infradead.org
X-Gm-Message-State: AFq9FYIr/ZNTGQDBj2Wc/S6Itbl8sqC+BsV9I7TnUXClfF3Y8X8r5Gfz
	jOl8YD5e+6A0i9N85yMU1t6FpfvBVcrOy89Shx+Bjfml7ujzJaxvZWmj
X-Gm-Gg: AYBFou096n8PYPFRL+5l/DDvuS80TFEVug9qx2vmiHspGImPTaL/+JZ0gVz9CBhDxOI
	GI9qZb6RNodresRD9VT40kl04uEyK19fnj+f2VC7BTX2ggWJJfIvwwP8BuRBYxxnLGhLAC3XpsW
	bSz48ULEvfg6N/Dwv9M6qjpxvG5w1vehh1VrasyG95d52KUYyKODLwV6xlce4KDJqUu4LOmyIhK
	uPgoEI3CsuS8eyZ7kf6Iqa2eoqk4+DxsK+Ft6/ziiLdzjb5t62tyJxXmEMOPGrIKk3bOvFQ6k3S
	1BwdmdYfamNwVPjPTCNXIJ0J7NhrBnr0HX1OXl4okLU6UP5O9UWDfLMkEZ3u9puAKSW7lI4vJFu
	NHpV+KaMu379ED4jOHFwi+KVTDbPsZXHjnURoDvOnulVEEeXin73WHeYuNem+jsdX/sVfu24P6H
	klRuA9ctriBvIODiDH9tERU3KQr6yKV8NgcpyFjP1w/h3s1IoZ56lVYoV6wlBD5Z6C0L7DdOa/R
	9SRrEE/vl1deF5TozPqClzpvl1xwwf/ZsVsvdWTW9dL4aLzakr0f7lyxNTnXfJ4g8o5Goohb/ds
	teWW0RuX1Ns9KnDM2PUaKadpiqPGiPQzsPexmSHpYMrQnPT60U1pa5SrRkK5UT27AwMU3IOcJuU
	USwdyTNt+gVrJ9UQ2Y5jZT27vB//nZ86M/FbWuVvzs7QUMVaZ+laoiUEZHxwOcOTGwOVIvN2pyr
	XicQMDobl64I90uCk=
X-Received: by 2002:a17:90a:e7c6:b0:3ac:929e:691 with SMTP id 98e67ed59e1d1-3ae897c8337mr2072805a91.17.1793373531260;
        Fri, 30 Oct 2026 08:18:51 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845aa27esm4299626a91.11.2026.10.30.08.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:18:50 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [PATCH] mtd: rawnand: stm32_fmc2: retire data DMA before unmapping on errors
Date: Fri, 30 Oct 2026 15:18:43 +0000
Message-Id: <20261030151843.2953269-1-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_081852_768102_1FECBE52 
X-CRM114-Status: GOOD (  16.36  )
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
This issue was identified by a research static analyzer for DMA
lifecycle ordering and has not been validated on hardware. The patch has
only been compile-tested on arm64 with W=1.

 drivers/mtd/nand/raw/stm32_fmc2_nand.c |   13 ++++++++-----
  1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index c08d6b1..82d6301 100644
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

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907

