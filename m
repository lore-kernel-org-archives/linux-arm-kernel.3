Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC5F606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 16:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GJVpM+dT;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f0zKzePg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rW+txSD0sfyruz1SXJMLcdacKGqqaqe7nAfUTotQ3Nc=; b=GJVpM+dTAS7v7D
	16VHakpdeyCPTqkwMcsf9F339EKxwZ+XK/ARXQJEUHxXMz24mK4b0ulS4UrzUrJG2tkt/d5SwXBQ2
	hZ0xV/eO0C3XaJcYRCWoeFL8hExUnJ1HDyREcNngNVAz6aLDY1iSAorDrOkuJbA4KFsnsL4X7qwfS
	8JmBhssW+3QGLW/gkAGApiBclF+O7YEv+MasJbUlPDPXZGPx50nRDvFVMQOJcJGqjxUbLGjHMA9Uj
	sR2eWde/7PHATya0/+zZdvcjBk/ylhCPv0eurvDldKlJQpaW41HPr0t4I6IKATQTdzeBsZkpm1UI/
	ZkxoVqhCwxSs2nBvYCoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpMB-0000000C76D-39xA;
	Fri, 30 Oct 2026 16:21:31 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpM6-0000000C6zZ-3Y9S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 16:21:27 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-6e560e00a86so619098eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 09:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793377286; x=1793982086; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rW+txSD0sfyruz1SXJMLcdacKGqqaqe7nAfUTotQ3Nc=;
        b=f0zKzePgkAnVEksZwT09ubY496D/N1BHLuNlNKhEXIJbPSaMObuW6Y+tjS9TMFlyIr
         bIaVHps3y6SpQIBvUgvoYxfipJ9b56mtkp/KXEd9hWV8V7aaJNdkHST4F8CtRd2EZzeW
         ej8S2RlBydyAccrLT56ujORv/EM6XneU627xHl0jqpPQ9UJ1c9wxgDi7cSJ04d4IyXY1
         62YfnkgdCxrsIi75nSjgFhdHy09nPHopjHcun1PbQNU8HixmkxC1xWer6xgYJBq4/Tl1
         RwPDG8156UKxir07lyRkRRSxtnOhc4jlEhbw5tf48cU9LJJiHYnqLKPtUia41OryVNwK
         k0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377286; x=1793982086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rW+txSD0sfyruz1SXJMLcdacKGqqaqe7nAfUTotQ3Nc=;
        b=l11v/zppv95wYp/b6MH5ouTVAzC63bPQd5dTbgmLwycS2wdRkIAbK3wGteAqwtIV3Q
         x6zOWZn6ZNGNSPXLuP2a1UGfU2euL/JSVTRVvXigb3XRztKCwekVebi8mUEPoYe7E/re
         khXXe1G1IPDN9e8oggHHcm4cP6mWZcdleBCNumxpEU9A1yHpm5QYyHdni3El7uliCznI
         NfURC2Q/fwlI0gOImz/x4HwDgOizqkxDMlWOee/GvhJcvuHX44vR8/UZzDf0LYGp/x1K
         8f57bToJtuhrgp7hUulQzIfm5dxSNgkQZGtyzEnoZF14ALiBWuX1ayAEFXKbU4+SEHmT
         9Uzw==
X-Forwarded-Encrypted: i=1; AKwUvBz2UOZPrEQyk2FB1hbyxeDlByFn4Ceo7zvUs47L+RrhsL//IIjRY2UxUcIwgIfbGb6FNNj8qeLt0epy+wO8hm3h@lists.infradead.org
X-Gm-Message-State: AFq9FYKFAHwOFhCdrBOdIywqwB1lzhRu0v3MHtxI7xd67ooBbkU4gfti
	96SpC6BVoQwKhFU9pJBJfYcUyq70P/CrVB7UC2QI87VIXwFba4Me6gTF
X-Gm-Gg: AYBFou0aJlbn73rkd/RNj79QKDFpGhrX/4xz/b75p97xSucC47BvHBRZmVARS84VMrQ
	OlG42VRQ9/5zPjbCH2mubHPy7cv2NO43d3PxldLKuGP+Lq3ofBajL4JVLRxC1ZWBn5/GVubXr2l
	m0eW2NrRqsPhVMBWmUTSjcvEly4B3tyKDmAcIMpklGKo9V4UJ/MrK5ae4Mo+VoHXXguAjTGHaRK
	W3THcrjSfaQammj4blWn2PhsQ+pA/bvxYcWhT84hBYvSPanvG+rmPtZf3uzmtjz81ywPV0i0EzL
	8Ki2XiTvjVmKnKHWFuLFAiced1SFr3ruPH4ZlqHS8qcSmqcIqzjXYtMACt53cnNCCgI32HSZr1L
	+YyGMO0SR/8jlnY3MSVWsleO+JL1gZ1bTPORDkK7MafzsdLCD9pYSbyFbpgwWYoW4O3Y6lEeyl4
	AHdQ3FQvX+o4iIJ4y6GMcagvimvF6iwmrc38VKR1XycX4+J9QZ+lOQvLptWy9VG0Zqi/hb99PfR
	ppKZwRYhh/XbCIWphPhf35YPsaaTsNd1XnOHwI1qFDiurs0k3ZUl32SFNOln57o7Y9usvuhRAU3
	yqcqDVw9tFisyAS/Kmo4f6AwtfCYuTN+btJGprfqM8f0Z5AGhMwUbQm+sJKqX9prFl7gz8QzmAv
	uA+TWpBHWP9esIdZUGbvbVcFTWyzih8nPh6UFXxly6PNF4gSlaJvFN6LTxJzuqNHI5Skh51Gwo/
	6XvoyMZndQfA1F9eJopUDD1CS7zCGjakEctaWU
X-Received: by 2002:a05:6820:162a:b0:709:fa95:9929 with SMTP id 006d021491bc7-714f2552f3fmr1853395eaf.62.1793377285762;
        Fri, 30 Oct 2026 09:21:25 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a92167b03csm322536fac.2.2026.10.30.09.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:21:25 -0700 (PDT)
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
Subject: [PATCH v2 6/6] mtd: rawnand: sh_flctl: use dmaengine_terminate_sync() on DMA timeout
Date: Fri, 30 Oct 2026 16:20:41 +0000
Message-Id: <20261030162041.2998170-7-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030162041.2998170-1-samarth.colleges@gmail.com>
References: <20261030162041.2998170-1-samarth.colleges@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_092126_912244_46EB2F38 
X-CRM114-Status: GOOD (  15.15  )
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

When DMA completion times out in flctl_dma_fifo0_transfer(), the driver
calls dmaengine_terminate_all() before unmapping the buffer. Since this
does not guarantee that the transfer has stopped, the DMA engine may
continue accessing memory after its mapping has been released.

Replace dmaengine_terminate_all() with dmaengine_terminate_sync() to
ensure that DMA has stopped before unmapping the buffer, which is safe
because the function already sleeps while waiting for completion.

Fixes: 83738d87e3a0 ("mtd: sh_flctl: Add DMA capabilty")
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
This issue was identified by a research static analyzer for DMA
lifecycle ordering and has not been validated on hardware.

 drivers/mtd/nand/raw/sh_flctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sh_flctl.c b/drivers/mtd/nand/raw/sh_flctl.c
index 97f733e48..8bf9ae7ce 100644
--- a/drivers/mtd/nand/raw/sh_flctl.c
+++ b/drivers/mtd/nand/raw/sh_flctl.c
@@ -430,7 +430,7 @@ static int flctl_dma_fifo0_transfer(struct sh_flctl *flctl, unsigned long *buf,
 				msecs_to_jiffies(3000));
 
 	if (time_left == 0) {
-		dmaengine_terminate_all(chan);
+		dmaengine_terminate_sync(chan);
 		dev_err(&flctl->pdev->dev, "wait_for_completion_timeout\n");
 		ret = -ETIMEDOUT;
 	}
-- 
2.34.1


