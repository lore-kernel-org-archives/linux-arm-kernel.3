Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C693606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 14:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LkJkFHzC;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UC8+Z8WN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=MpIBWf7/b2ks94p+dnClhdfP917IQaGrC6d3ELQJeOU=; b=LkJkFHzCyzJ9dew8/JnORn2e8A
	4yF5Z/WbmS6DYqU6GqHJtt5wIUDZq3hQfuZXGaDpJHeAcTJCAGYc4wCvdLtrditCLGP9xnT/Am4Iq
	Vr7okTNGaKQ1dSuGteuFZk95ZmRFIM/coRC2A/2RLG5oPkyp7BzrL6IpP8NoCgp2V2zxSZB6ipTr/
	jy3gBq2o6rHRyBRvd7I9mSt+njHjbhRqj4P0PfSWaUgg/36WC3//E8B79IAK1aoSyVr2IzZTr+IkT
	ZfVCsfLEIn3lBs/BVQfoHTao0LyZf9/fRaA89rBaRnxPm1MrqI4f3m9WD14/zZAlGwuoRy91WDulQ
	24iAYzvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLiYK-000000055DI-2UO3;
	Tue, 27 Oct 2026 14:53:28 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLiYI-000000055Ck-04tK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 14:53:27 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso4008a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 07:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793112804; x=1793717604; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MpIBWf7/b2ks94p+dnClhdfP917IQaGrC6d3ELQJeOU=;
        b=UC8+Z8WN4WBbUj4X9cPMWcY8XYYaT/iRvS4/ugzpdP2rbqLeYED80u1YZ6zxZDs1Wk
         2MUTTIQaiOL+R081LQ+AqcMf6VcYVnzM5S+lykorogB5tCuOGNEfiyc3ig6aPCKj/QAs
         wNH+/GqUG/eXfx0+0B71oa/MGbCX5qD5eKj+0yL2T56Vs/ZBUtNs1GAS3V49VfMdybfm
         W8Z1/xedhHxdGAJvXQ6AijmDV38B3OPJD1tkxzmYPQvtEbUKADhith1VYKk6J6CU5LPw
         U0hsQGHmaHgZy86w2hudXGdD3A5OMIqZSeTmsvNLb+i/YyjQ4a1D5uAB0ccwbpGdSQZR
         eTCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793112804; x=1793717604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MpIBWf7/b2ks94p+dnClhdfP917IQaGrC6d3ELQJeOU=;
        b=iXjO3zuk8tbsfvPL3kmlG5TcJ1XC7/p9j46hKpIbv3BdeKeTqGg2SzrpE/iatuDfln
         bUP7juU8zX3ijAHu35mRn2laH2vB/BRadagIKE5mPPE2fjmk8VTPD8be8WjEBRdyTsR4
         ho/20XVuo0STqi1uaCaAFKeZZhi9skl4Z+pUqkcqQWOnwut6Fgt2y8pWYCTThgqj24Vz
         ghpP/EMSalGwFFh88GX6N9sU7MYx2quVtUF0BnQzTlFAje4ZgJtxrFsuRAduN6MbjNUX
         sD+Yl0TE7y8N6It/b7bj3vOhdsbDY5Pe9SQxAAT6lC6+s/UySqpzNqQO1mL3EigtvydK
         2X5Q==
X-Forwarded-Encrypted: i=1; AKwUvByY/+TEG+e6V8313sqjI9igiaTDApMLurvEPS+iM642mc1tyBAdnYmIGgheltuhmCKqQ1PnHmJef5AA3Z7vrz13@lists.infradead.org
X-Gm-Message-State: AFq9FYKfWogrjKGqENgdddULh6h834TooNXeYjiLf72QK3MQppsJJELL
	u9zfQssuqHM+1IAwWpulNAOjWx/fPLr81zl/a+x4DGTjspHX0ib6fB7g
X-Gm-Gg: AYBFou3gVkeBj3WZdvZaMvcIyvIX/xw/EwuEjKD2jXdJLYaNdLZuZ3H0EwzRtzTGl82
	PG5gBjR5sk7oa/a/2wuN3KANd/y5GBBXGHDdkpFxykOuHYQt9ZKZdTR7S51xApGjIFD/BwYvBdW
	q096SP7T0i+eKm/s1rY7KUfoSIdSVtGa9GIeHaZgoBFj27oYHbC5CqxojSe4Z1iyLRlhQn+1v7N
	4hl2rfm/vVwz89yFOxzAI/CxvkwVCApL4T4UN7EtEZa+hTrXINPlnFEo7xrPYYil+2aN4oExaKr
	ZlUpRBUMuBhvRGzBv7n1P4kAKKucBRjdK9DGXHSbouFs6vIC7BDHvlp7FWXGvwWLgWQ2xhcxdgZ
	gjgTGqqRsNQ4WK2C82y8gHCMfEdp5CS6LE4jIj3bqz2ZY1+aw5V8K0e/e3RkESu7iLP3Y4+Cfeu
	0rCS1Idb2omv/3Eq9HSVCdDMIzrZ6HqSd+me5zSv6aI8Wa67WFiDGBBnoKqhhcQ/jmNjq0aN1lD
	S4wptJy9swQ/pM+dTCCak/aUDdMto8VFhZ0zCqdyP808HGzItQlww==
X-Received: by 2002:a17:90a:b896:b0:3ab:b39f:41c8 with SMTP id 98e67ed59e1d1-3adead4dce8mr5470253a91.46.1793112804486;
        Tue, 27 Oct 2026 07:53:24 -0700 (PDT)
Received: from lgs.. ([101.76.249.61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40614d7dsm4093349a91.3.2026.10.27.07.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 07:53:23 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: exynos4-is: fix DMA memory double free
Date: Tue, 27 Oct 2026 22:53:13 +0800
Message-ID: <20261027145313.136305-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_075326_059424_ECC98F83 
X-CRM114-Status: GOOD (  11.48  )
X-Spam-Score: -1.8 (-)
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
	FREEMAIL_FROM,FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

fimc_is_alloc_cpu_memory() frees the coherent DMA buffer when its
DMA address does not satisfy the firmware alignment requirement,
but leaves is->memory.vaddr non-NULL.

Because firmware loading is asynchronous, this error path may run
after probe has returned successfully. A later remove can then
attempt to free the same DMA allocation again.

Set is->memory.vaddr to NULL after freeing the buffer so the
existing NULL check in fimc_is_free_cpu_memory() skips the
already-freed allocation.

This issue was found by our static analysis tool under development.

Fixes: db47622c13ae ("media: platform: exynos4-is: remove all references to physical addresses")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/samsung/exynos4-is/fimc-is.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is.c b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
index b7d9bfedd590..9fdc352abfe4 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-is.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
@@ -346,6 +346,7 @@ static int fimc_is_alloc_cpu_memory(struct fimc_is *is)
 			(u32)is->memory.addr);
 		dma_free_coherent(dev, is->memory.size, is->memory.vaddr,
 				  is->memory.addr);
+		is->memory.vaddr = NULL;
 		return -EIO;
 	}
 
-- 
2.43.0


