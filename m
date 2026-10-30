Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0CB606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 16:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q2DxZeRJ;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VjNsZqVi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=P3sMZdQ8vNG+NMmxWGi58o4c8YdyyCQhTB94DmlU1wU=; b=q2DxZeRJavAW/f
	ShCPOuXImTRgVNgiaK2E3FDOXP/NpkTD5MErfn/NxhMY2jkUkXAKKsm5IkOomgo9ebFzXPTXzxFrP
	7oMgIQAmfzrciNp9RJt4Dx85NTiHO7CUq7SRdKklZePOAFBDWtNTyGWoc6qgRIcbTkIb7wiWO/zDH
	M2UVNaqMEF3bhQ4TLQiAFIhJoju9HXFXfuuhOnXH02uOOoV4g3wybS9fpJQ6nW6YtsZJsg0NKHav2
	j6nN5ajat6uIW0DGS0RE8PEedlRWyUdLiUVRY7k63dTko8pXhijbLuabotuD/kI5rnzhP9VK4waUr
	cHPrOVahmRN0xtdYhTXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpMB-0000000C75q-2jjw;
	Fri, 30 Oct 2026 16:21:31 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpM2-0000000C6ui-0UsB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 16:21:24 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-4a755bbe158so623426fac.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 09:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793377280; x=1793982080; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P3sMZdQ8vNG+NMmxWGi58o4c8YdyyCQhTB94DmlU1wU=;
        b=VjNsZqViQ8tzc5ANBtDjq1xrXEkHulgCnvbvb0THnpuenDvRkL/rr4Kkx6HWJbLc/r
         f2fP7JgYjdd3W2U4WRDWYPSDm/3um8yVIaXDHSpJfi1m6dnAE7ue6EZQjNtDMzpwViZ1
         Q+V+UnWqZ8ffF+5uVpNHHSWYHXYrwEScGc9c93onFpcx88pwbcftMAPUeB2pn3pp7b3H
         9dg47P5syQgwCr5y24XVTXMS5El03cy5dD7UBbi5ydrJ77rUh3I3VLcRJt8P4IrxoDNA
         AiVk2s7L+AjzZVg8gfgHcxykUpLW8vWI3wekpYlX0kS+cDLALsKPOIFrisF9d2oOhLKv
         dN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377280; x=1793982080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P3sMZdQ8vNG+NMmxWGi58o4c8YdyyCQhTB94DmlU1wU=;
        b=EaCYpoV6KKU6RVltvZw5ptbt1z40AePQhG/qA4U/dHDATrTMntJ36AN3fTOElpjiZo
         Ghm74ou65oHEb6NJN6WwAWUanmccta3C0K4OwipzJO9Ns58KvLJ9qAh8zKmU5/Hn4uBz
         Kyd1/48sxRikebDgOsqG+bs8RuZX+UBUqA+UU4yeg+UrlS/3jpKU9IwDnC5pDStKTN9p
         qV2NNE+KehuifqhOBKEKHqri6i7dI4rbs7ZY4WD/phJJju0QDPbPbo0hDYePXvoB/gTm
         gohyjILech3qiBUWki3O48KGJ+c0EMQq0nGEOxxDDhUsdIi2NvYBg8gda3la5SpD5ABO
         K4aw==
X-Forwarded-Encrypted: i=1; AKwUvBxEaTv8jQaZknpGTi0lIV9OdW7cDO6ocCRBqJlJqDkzuoTWUPz5dICh3pmNTLgpj9+aDjUaKJccPyAHlRqQxSad@lists.infradead.org
X-Gm-Message-State: AFq9FYIvwmcKxBO/R3YqmzeSRGMBWPbU8n3j7Wp7Nw74cf3P6IVICeLS
	FzM9HX1yzWueZino3FZDd4FzI9JOpH9y5GiPtKuSv2Ij0nzmvuIp2pc2
X-Gm-Gg: AYBFou0GVGXXOfWD+mUikMuaOYDgeU6J7RprfazKVb4ku9l5bFqV7fOJkTXIuM5G4f4
	eVC3OpTUHv1I/2kvUmwEJuUX0ULpwkmCLxaTsnMLdCUjndIei+HzFpPIMJPPQjvK+UUeGCPMyii
	0v3Wrc5InfFZp3M0YO1jjId8O/Lbrb/AIc9IzYlakaGZ0gs0rk18cWqo13LbtZSFYqBEnfqT3Af
	425tFK5FpVpfr7tWBVjKXzy4nCM9fWOisDFRwInNpoNun+GOBID2MvzEUIrIK++gRamlhHaeZ+C
	MxMbjXPLZDXhYPfU9s2TglZ7htgC4plbnvcrPUzqODW+U7cUrinIbrdUbNsyjCSYBFXRAR+vQ+H
	d9c8BpVsbocKcetd8WW84yUplQIh34ESrk/0zU8j4tdYibCfO5q2DPitpizvUtmjnDUxMrJOr3d
	tL3BzJy/QZtwgIX4zwgXGWIUuS/wcGto7SL/Hwc7kvEGk5MuowkL2BuS+DTQoTxR5Jtj/LCDe8y
	xFIPICZK6No7NKTg7Xb5aJDGu4Lvr4JiOWK63SD8/2g7dEo7h3pRnra1tjx1BLaZk+Haw8xVIrl
	Un7Gx6T7yItyHrlIYCHrmP4h1zcHJEychp50je11AX8xlUFeHGy5khrmjUw6LoaCx4fGKY6rOqr
	Vhh74UmoW9jf1wG/Tr0c3MZYzSpcstiEHGmr451vh11A1HlPaPCO+2OjH8BNtXY3F5mXqj0ZngT
	Ut6PdQPKcP81LpD/xApL4SptzhZuUGDBsSeyyK
X-Received: by 2002:a05:6870:c191:b0:4a6:d831:cbb1 with SMTP id 586e51a60fabf-4a90767d2f9mr1286539fac.10.1793377280468;
        Fri, 30 Oct 2026 09:21:20 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a92167b03csm322536fac.2.2026.10.30.09.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:21:19 -0700 (PDT)
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
Subject: [PATCH v2 5/6] mtd: rawnand: marvell: stop DMA before unmapping on timeout
Date: Fri, 30 Oct 2026 16:20:40 +0000
Message-Id: <20261030162041.2998170-6-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030162041.2998170-1-samarth.colleges@gmail.com>
References: <20261030162041.2998170-1-samarth.colleges@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_092122_505986_5785346F 
X-CRM114-Status: GOOD (  13.31  )
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

When marvell_nfc_wait_cmdd() times out in marvell_nfc_xfer_data_dma(),
the driver unmaps the DMA buffer before calling
dmaengine_terminate_all(), which does not guarantee that the transfer
has stopped. As a result, the DMA engine may continue accessing the
buffer after its mapping has been released.

Use dmaengine_terminate_sync() before unmapping the buffer on the
timeout path, while preserving the existing status logging before
termination so that it reflects the timed-out transfer.

Fixes: 02f26ecf8c77 ("mtd: nand: add reworked Marvell NAND controller driver")
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
This issue was identified by a research static analyzer for DMA
lifecycle ordering and has not been validated on hardware.

 drivers/mtd/nand/raw/marvell_nand.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 38b7eb5b9..a342a48e2 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -900,14 +900,15 @@ static int marvell_nfc_xfer_data_dma(struct marvell_nfc *nfc,
 
 	dma_async_issue_pending(nfc->dma_chan);
 	ret = marvell_nfc_wait_cmdd(nfc->selected_chip);
-	dma_unmap_sg(nfc->dma_chan->device->dev, &sg, 1, direction);
-	marvell_nfc_disable_dma(nfc);
 	if (ret) {
 		dev_err(nfc->dev, "Timeout waiting for DMA (status: %d)\n",
 			dmaengine_tx_status(nfc->dma_chan, cookie, NULL));
-		dmaengine_terminate_all(nfc->dma_chan);
-		return -ETIMEDOUT;
+		dmaengine_terminate_sync(nfc->dma_chan);
 	}
+	dma_unmap_sg(nfc->dma_chan->device->dev, &sg, 1, direction);
+	marvell_nfc_disable_dma(nfc);
+	if (ret)
+		return -ETIMEDOUT;
 
 	return 0;
 }
-- 
2.34.1


