Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83038606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 16:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vlmor/WL;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FdonKK5b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iaMtQnbofJSAxTx/DkcM6OMXQPU8wWZ6SE6xw52uqKs=; b=Vlmor/WLSk5wGS
	Swxh/MB9zr5PbXd4pingS6qg1v5jiENpus+bxVXuy6c8bGGauqAVlrX9fx+y0cRBxa1caQ5/0rXTl
	ZshVHAIyy6ckmJIaAape5Ltg4Y+t7iq6rycQ/s/vLLRv7UWF+jdA/l8s+FUEK1Sx/hoZ4TaYmUtnH
	Ov15GDzyZ+PyNSu9yfi/c5gnnxdcUEKefRT3xPrc6yC0ohlSyYbCeE02u9pkW3d2RbatujaHriQvS
	PWP8ZmqNzYBjd+xczUK9KNiIdCiC9adhxrbg8OT3b6NI8WTbpCAdKu1VpQmT9piztzunZ2tWO3BzY
	SUXHBD3wVIcvNOH8askg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpLh-0000000C6eI-38Ja;
	Fri, 30 Oct 2026 16:21:01 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpLc-0000000C6bw-36ft
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 16:20:58 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-43bf9548df4so915761fac.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 09:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793377255; x=1793982055; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iaMtQnbofJSAxTx/DkcM6OMXQPU8wWZ6SE6xw52uqKs=;
        b=FdonKK5bwPuI8rKBH7LPAjhtcKE3C6seYoWxah2xyaAc4Ju9EkXLxo2pu//cVQBY6W
         Z4kFX0qrPl9q4MnshGMqNx03269KPCrOgZFlGtjZe3/jTeFsG3oBwXJyCnz/oOELZ5UY
         S5bqoQOcHgYL5DW751CpMs1TYgHP2ik3rWmd7fZ6H6aTiH4rN2RxLVjqBNV2yEcpIM23
         9/lgHBOJTsNHRTp4eKmdwl1NhhhbEqmPzg3AV+nv6/XJ9KuIkxtjwCUhpuCrR18fuXao
         k63SDBz7a+MPpRbHmHahVl6BH1GZJ3c3Ax/q8DPQ4K5lsWabWiR8unTlam4niD1rw+XF
         eJfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377255; x=1793982055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iaMtQnbofJSAxTx/DkcM6OMXQPU8wWZ6SE6xw52uqKs=;
        b=wuZcPxL6doFa6UfZdOX65iu3spYl4Qwl7+tBc2uxsLCxkNZxTV/te1JHzr5nULGbHU
         4xPOLW2AamN4g27JQrIJKu+s6kZLaEBqxz1uUtfIlvDAbtAGzNKJy9BjadkTJ0cV0reV
         UbeGw44k0fN4yjIHoJ7tMnLMu/8XputtDtkt+cOIunZbIn8nzjMctro8XjogdC6/TPig
         ln9kLfaolJtKLCV86haM5njPgtNTrubrtpoG+gV1slEIX0hfgGJpes9Qe6wfE7NyL//h
         KThqDnxhqBqj3N1DiWF1S6V/oMYaOWo7bvxOCRZH+pe4cJhEaaPR1+A1i78/a6RutzuL
         jL1Q==
X-Forwarded-Encrypted: i=1; AKwUvBzAjVO+HjEaYx14utwA6HcftyaG5/iQVS2oVjlkt7/drWZdZgYHWDFgaknSasmP6Ab93cp36/GdL+KNkqulEb2P@lists.infradead.org
X-Gm-Message-State: AFq9FYIQ4HqeCoYpe3m9kiGHPBcJBENzC1ogKoSjcyraVKfG8LCBpw1Z
	M5AK1c9mUkUpqKmUi9SZQMG6WH6WLjuhyOz7iQQUcVBp60IqQcdhpKjV
X-Gm-Gg: AYBFou0GneQN9GY3wE41J9bHmgVBXovMx/af3CUVlqx0XKco1Qc5WTpNkoehCy+TieZ
	bsVmK6fNL4llc6/6gdq7Mrw1FT19g+urJ2cSjs7fMljBeoctDoHe5VTrB/hsyKzan0bIJfZ/ou9
	SjEegem9wXtIF4gG7bdhZKle5bP7iCxQQWzX90pl7ZWJYIf++8bSXG6O/+lmhRX0NKHUoNUS2qI
	TC/UJEfSn/iEuulO5fCDNKtin2Xo/awt5Q1JltC6rIreG2vTnJ+IgBaErsavSI5EqOA1PZTdBmn
	eRrQvDjVlAOejpe7tDiVENoe5Aauw9x2mSSiijMoymIEg9jduJvtXBwFPloSfgdykFOcMrHQknI
	0QPIaE/R/RfZirslDxAdVwRSto2W/eLdbWxRQOuK44RWkg8R8hVFT91WYGtlMyTyY8Dwc92Ibu5
	vMIv5csfwsIAxClHgtNeMrjMsFlQA4FDaqlpOnGThaefn4CLS3F+OQ6lPdoLLQVzTFbrenYJAI4
	4RDU9XwoEAGIUjcplSOtLIJLT7sKHm1VFkfKZnGp40AkhUcyK3xMxprq9n9cbXjQs/RmzI/VFNN
	eq0kzdLlogsrFYX6pIPsnKW3biDq2b1atHdXdOu+qviD7rzDStgwxq688Fb1QmonOVv2FGRK8es
	gD9xphOHvILBaBrhjLcuTtsMU2V9ciffUcLX+0FJCNWdSm3mxmJUfUmN1jz07rxTPKUMC29pEPL
	qA9pjrIH26VUUosJU=
X-Received: by 2002:a05:6871:a1e7:b0:49e:334f:312d with SMTP id 586e51a60fabf-4a90764b81amr1805240fac.16.1793377254766;
        Fri, 30 Oct 2026 09:20:54 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a92167b03csm322536fac.2.2026.10.30.09.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:20:54 -0700 (PDT)
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
Subject: [PATCH v2 1/6] mtd: rawnand: gpmi: terminate the DMA chain on completion timeout
Date: Fri, 30 Oct 2026 16:20:36 +0000
Message-Id: <20261030162041.2998170-2-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030162041.2998170-1-samarth.colleges@gmail.com>
References: <20261030162041.2998170-1-samarth.colleges@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_092056_788092_0CD2DBC6 
X-CRM114-Status: GOOD (  11.63  )
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

When DMA completion times out in gpmi_nfc_exec_op(), the driver unmaps
the operation's buffers and returns -ETIMEDOUT without stopping the APBH
DMA channel. Since mxs-dma leaves the channel in DMA_IN_PROGRESS, the
pending descriptor chain may resume after the timeout, while a
subsequent operation can append new descriptors to the stale chain and
cause the old DATA_IN transfer to execute again against an unmapped
buffer.

This can result in DMA writes to memory that has already been released,
including buffers freed after ONFI parameter page detection in
nand_onfi_detect().

Terminate the channel with dmaengine_terminate_sync() before unmapping
so that outstanding transfers are stopped and subsequent operations
begin with a fresh descriptor chain.

Fixes: ef347c0cfd61 ("mtd: rawnand: gpmi: Implement exec_op")
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 527165ccc..86163a552 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -2659,6 +2659,7 @@ static int gpmi_nfc_exec_op(struct nand_chip *chip,
 	if (!to) {
 		dev_err(this->dev, "DMA timeout, last DMA\n");
 		gpmi_dump_info(this);
+		dmaengine_terminate_sync(get_dma_chan(this));
 		ret = -ETIMEDOUT;
 		goto unmap;
 	}
-- 
2.34.1


