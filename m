Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B37B606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 18:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iFjcEYtH;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CdQpb1jj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ETa6PEiQPvx4Sm9llFa3xDCORaPT2KrvUrXEonwMbCs=; b=iFjcEYtHyjPGsz
	stVdvkDey359h41wTH/rC6Fo1WI3GcMt1X+5kxSSf5uDb2j479JFpmuVczTwR87cjuLeK57OSc3u5
	3VPY6L1G+0iC5mamX/nlSXHwZzsox9cy8SfOH4KeoZQDjZq4gp3Oz7tOnEa/VBaIKjL46fqPTCe8L
	QI/bDz5eANwLbCaa4OAGNwR1r/N/TuKsQxccypAsVvwF0H3SqbukfyRo5GWKYOdFUMeBpt5EniAxh
	QGhqrcpFhVZCUR4TeebNJF8CKIlRVPWS2fcBN2LasOlxFKTM5CutH5ZfK4Kjqc1JHSBD2/4RzFmuE
	ueD/1lJUjqj6+VxJ6ZMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLm9K-00000005aHL-2HUc;
	Tue, 27 Oct 2026 18:43:54 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLm96-00000005a7X-0GlA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 18:43:41 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-84e513874f8so114019a34.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 11:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793126619; x=1793731419; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ETa6PEiQPvx4Sm9llFa3xDCORaPT2KrvUrXEonwMbCs=;
        b=CdQpb1jjkgp9VKMfVlwJu0Pw1QfHrNdgLaYMIGKp8lQ64s0VaGUmdEyR22HR7QurWQ
         39xcw+j4zuIvSueZFic877im9r9gsiv0PwYsRF7D1zIs7Y21ez0L/xRtQ9w+1esfFshb
         4lSyxhI7hOISVNpsQmC9+OJ7fLTmpMjRSm/GYpQpPhUdmS87WvSHc49ho+03grHf9G2f
         e3O37e6yFfZHYBi+Se4Q78WyG743/gTKwR/pWHCJIcxikvUkw8/Dpsa2Fc8tCYGJvyNA
         yQGXr7I4h3DO/Mq1Asg4XPCzTPgFPAxMMoNCgCk+l9FKp4rKqnJ6UlVCXV3463ty4kf1
         dXqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793126619; x=1793731419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ETa6PEiQPvx4Sm9llFa3xDCORaPT2KrvUrXEonwMbCs=;
        b=aSSGQU7ULD3dMlzv52FyFO/VlrD/DLXwou9rDleMBp79RhjcQhWG3PiPoCOVcrprkB
         1USfJ5ckXPKWe5dbKzpZhoEXh+BwIt66VzUOI2jdYi4hsdcJRiuHkexTKlYi0wbs/y8B
         XVfuZOjDhZDpChN+dMKdXP+w9BRC9tm3ZOvz5YBbJJCaCuHH0v2q+/jpTBsybEu0uBKd
         WYfOGtdRUyURnAIcFePElJpNmWvRdQtp5dIFeXTumjLwVarjMX5QxQ0zuUdWmJcSocJW
         i8cD29pDS05sMnMd9ag693261TdFmGzxOTCejVjE02vr+lUR658UiH+9aZ5kHP+f4TZH
         pfJQ==
X-Forwarded-Encrypted: i=1; AKwUvByQBOA2vJA9hTFTQWsxz+Sa6gM942ySnx/Xex3NEVIOsfo2Xycw6Zw5BnMhjKwQMLdVHCe6VbZRCLlX/eFupfBC@lists.infradead.org
X-Gm-Message-State: AFq9FYLaLkYkDdmEtl+BzhaVSerHhPSgBNcImJtqjf7+cwvIDwhWdmcs
	apbwmlaMAfzWrUc7X4rH/Gt3o2Pvr7Zl/CveHwTN4pVhyBxWn4j2E34S
X-Gm-Gg: AYBFou1tLLczj1ZHMfvt/SkYfgxGNV4tPLQhIusR/4vYHuzrJeaA5koHJFTvcSoWbdL
	zLTh7Hf6RDiucmYbTUk+6/PDDpHGZ6n340lFCErh7nBaIH+3oHuOLBu5ljn9m0KNeS8pC89Mgba
	uc6ijX5KYfuvaajMi82xMHcNmgr61zQ2eprTgk9pQyeRNVfYZP5Dx9OQcH9leN7ZOUFjOhBzpem
	4XmAL9G8QpBBF0UvxdnUKzzXKEQVVWlLf+rG73U2ixvAl1Q8TesOrSvfbUJ2wP5dnH5IZ/4h1XE
	q/w4LzslrGAX4oNeXvKiws3JaoPyx8Xxx0uX1bC8QzFe/CAuDZOhw2pTlAxkFzlKiD001NUOAIz
	sRo3J1yU53whEI943ouu5UlL/YXuJZVMGoBsbmARDzGye4bDraDPVctkwx0yjNjVamWkMCWkP7y
	+rMhRV+h9i03gSVamBquNUuQjHKq+6jdRKj9BJUiKEreTIi42+qW4DiP6riMfPUwlZJyOREDmSc
	8UA774u+PTSozSgfiNi2PK82zcTBzj0Xn5Pa1G59CP0Lo4lr3JrCu2kCtjE7dz2jIaK/nOvzXud
	webxnsNBT2psDNWPB4igYYydsHkNmkWPDYoOVLjTLu2c+upu6zIGIxILRD+4NEUghU8f8HiNqS6
	9Akk1zHHZ86jBE7VqLmsubgw84ChplB+Z5MG75I4O2O0tMl+GqjVZ35F6TFVpzUescDGp/Zp/Hl
	vUmS0=
X-Received: by 2002:a05:6830:230f:b0:814:57a9:4243 with SMTP id 46e09a7af769-85abdb098e0mr329067a34.17.1793126618937;
        Tue, 27 Oct 2026 11:43:38 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb074fb6sm12488338a34.12.2026.10.27.11.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:43:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 Oct 2026 12:22:27 -0600
Subject: [PATCH v3 2/2] dmaengine: mediatek: uart: synchronize completion
 callbacks
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-submit-mtk-uart-dma-synchronize-v1-v3-2-aad7a6b3c62e@gmail.com>
References: <20261027-submit-mtk-uart-dma-synchronize-v1-v3-0-aad7a6b3c62e@gmail.com>
In-Reply-To: <20261027-submit-mtk-uart-dma-synchronize-v1-v3-0-aad7a6b3c62e@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Zhou Wang <wangzhou1@hisilicon.com>, Longfang Liu <liulongfang@huawei.com>, 
 Andy Shevchenko <andy@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, 
 Taichi Sugaya <sugaya.taichi@socionext.com>, 
 Takao Orito <orito.takao@socionext.com>, 
 =?utf-8?q?Am=C3=A9lie_Delaunay?= <amelie.delaunay@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-tegra@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, Frank Li <Frank.li@oss.nxp.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_114340_135192_77ADD8F3 
X-CRM114-Status: GOOD (  12.25  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Terminating a UART APDMA channel waits for its interrupt handler, but
completion callbacks run in the virt-dma tasklet. A callback already
removed from desc_completed can still be running after termination
returns. With no device_synchronize hook, dmaengine_synchronize() does
not wait for that callback either.

Use vchan_dma_synchronize() as the UART APDMA device_synchronize callback
so clients can wait for completion callbacks before reusing callback
state or freeing DMA buffers. Keep the callback wait separate from
device_terminate_all so it can run without locks acquired by the callback.

Fixes: 9135408c3ace ("dmaengine: mediatek: Add MediaTek UART APDMA support")
Suggested-by: Frank Li <Frank.li@oss.nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/mediatek/mtk-uart-apdma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index f74e9a328588..6bc4f20d8b06 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -514,6 +514,7 @@ static int mtk_uart_apdma_probe(struct platform_device *pdev)
 	mtkd->ddev.device_config = mtk_uart_apdma_slave_config;
 	mtkd->ddev.device_pause = mtk_uart_apdma_device_pause;
 	mtkd->ddev.device_terminate_all = mtk_uart_apdma_terminate_all;
+	mtkd->ddev.device_synchronize = vchan_dma_synchronize;
 	mtkd->ddev.src_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE);
 	mtkd->ddev.dst_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE);
 	mtkd->ddev.directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);

-- 
2.53.0


