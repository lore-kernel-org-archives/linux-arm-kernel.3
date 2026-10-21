Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8C4606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 21:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dGDbcd5w;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BvdSkBr2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/7ngeHbVYERGvM2jFGnKfOGGvB7UaeEskne35/Ksbe4=; b=dGDbcd5wxfXD/GdQFik295TKMG
	/vaZl6XI6/ukKfKycLnThh30MJ8eWaEN2O0tWXR+dil3ndKaMW9aEgvvgZ1S2PmAHcfNEqRKTuV7b
	0a74t1Ov4sRAktzeK6OTVIS9f8Qrdl1Ddh3RdxcWwkJ305oFXOqHv6Zg5GRJD5SGa/VLGm3D+0QRu
	yXwV5iYNwOg+mwxK6lgSgNczLmFrYdYj8CFUsb0ioDfgdmpakBd4EMVzD/YLvq0kgCrDg2Z6g9XdC
	RGyOXTQi9QgZmS8JmA9BkvTKDHFsDX/dLYT5FcJPQxysxvNkYQ61g/dnxbkUi56cXp83Y3NzLBVd8
	Yetg0YfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJdco-0000000CuR0-1E8p;
	Wed, 21 Oct 2026 21:13:30 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJdcl-0000000CuPh-0FQ3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 21:13:28 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-81ba09a5d23so1117067a34.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 14:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792617206; x=1793222006; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/7ngeHbVYERGvM2jFGnKfOGGvB7UaeEskne35/Ksbe4=;
        b=BvdSkBr23U4XfKaAmsWFtOR2QK+WPXhc4zElp3mf2HdobNMlreOT4oBlxkWTjZ0Eex
         09bAA07dd6nHfcupVORO/vD505/jfIvisQSZh2wABZIe4T7CUUkkUHiTnumJ2ZCcejbh
         9aSV0MITxZI4V4W7UKP0wZQf5EB61q3Q89byR4L8fDPxNPRSP+VUDpLCtzlHbQWT0Zbq
         nCGUdT4QWpkikPqag4xZ2gQwV5TK1m/oaRE6oEkI2w4xoKYKvA0LLMuerOyPdUcsBqaF
         SP2ics74PsnOAgmimdSyrNXCbqlFWKFrTpgBZnu6MZB4iYBwKjN9ot0ybVAMiy2pRQfo
         3KBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792617206; x=1793222006;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/7ngeHbVYERGvM2jFGnKfOGGvB7UaeEskne35/Ksbe4=;
        b=LYZ0zK7B413kZQma6wnBqJ4k4cg4tJiz03NDNGCSO9DGVhnRbfelbMSRQ4MHWCQ1dA
         Ta54zDd+f5cAb8Ip3m0iPqzIMA43uzrAjtCgW7iYbqyC26qMhMEq//uKK+DpL4jfWIsu
         8J70+RIvJ4D/Z333Zov0C/sMA3eJnG/uucCs+Hp51JYFoYcPEgYVEW8cSWYBEWWac6fi
         0IiXUdLUXWEh1hry2IYjg/vckmRPoIowKcD46qdDaR516BQyEiei3o6TaCtiTJJZ/Wu3
         MvUz5/TeuPbaHHj+zK8WOCWPXRRx2furr2koSyMwZItBIhBSU6/0WlD2Zv9QpcaSfNb1
         /3CQ==
X-Forwarded-Encrypted: i=1; AKwUvByEj/NbRJcoG4oGAlq3QG6ChRRXH4JXj/1DyslWg/vlHxU3UnQbJwxTAe/HM/vQ5Ds3BHug/nEGtZpLJIqlK5UR@lists.infradead.org
X-Gm-Message-State: AFq9FYKXY6of0f65fJH5Nf4TlAgczN3Zg1T6KeBOLVKm4t6AvngaMaDt
	OqZAqw8HG602jg/wZhR1JpveobD0f5AsMk1+Ik83kwA2e/RlG64CikGk
X-Gm-Gg: AYBFou397gEVBH1n/POkVW2qfDHEkgr3kuGA+51UGKsONEEbXd64o/n6gq9CmM6Ifrg
	K8mxiMc/m0t5+Dihf5xjdJgwelvPt3ApBPC0fzZJx0PdvCUryKD10iyd8I+kJSfzUy6O+5a2Vbz
	cAG2Yyqv3wmZJDEXwR5YY0pKKYTUYTf2tgGaoG4Uwb86A17BWgooBgEulWCxnSkm5aznV4B7inS
	zph7XI2eWWRbXVgM/SqL35A+JxcUcuXJ/HiMGLc7f31gkfZFZn4fxYiyN/TqdA8FrdhTruofIyw
	wOBiCfmJ8eIMgk3IVk45TGtg3BCfQlob11ECufBsxvDl0xbQi+8RhnbMloo3g32s0/BJv7RmTNI
	7/eQO0eswrRVP/tPhOVBE81jKXRJ+NCdMJOEedK1CkQwRj+wm7bbsD9J6HcRzvGt711ZJ5b+hjh
	/TFjg9DtS8O/Bc4exKdT3+G22fp61wxxgPS5kSVwPJsdweCXp5j+4wd/44wGtyAmxGrn/Wf5NCl
	lGk3ENk5s/avbGHL9zXMp5m0m7w90mL/asXEgPQ83/RT4UGHDFwJufbWg7pa3LnJU2Sqtf2D/Te
	0LfYF6PThaGJO3EAnzu6Bz5JMQxJJ/AYl/7hiRQvwCHYv9DJCysGEQAhcW/Tv/PG0qHf1iwsxfh
	PPxjbkqmTDJWq2a1mTQeUhtC+I27VtUDOZP7a0n4xDHNX4D6/iiLv7XFtwLLZpKIo+hNGLfWiB8
	KPu/U=
X-Received: by 2002:a05:6830:3495:b0:806:9a8d:4b9b with SMTP id 46e09a7af769-84d0890bfcemr2646685a34.15.1792617206105;
        Wed, 21 Oct 2026 14:13:26 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84cbcdd9d82sm3219421a34.10.2026.10.21.14.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:13:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 21 Oct 2026 15:13:24 -0600
Subject: [PATCH] dmaengine: mediatek: uart: synchronize completion
 callbacks
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-submit-mtk-uart-dma-synchronize-v1-v1-1-4f7718cfef41@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNwQ6CMAyA4VchO9u4DVHiqxgP26hQzQrZBlEJ7
 +4mx79pv64iYiCM4lqtIuBCkUbOoQ6VcIPhHoG63EJLfVZSK4iz9ZTApxfMJiTovIH4YTeEkem
 LsChQTevaWta2uZxEhqaAD3r/n9zue2fliS4VuWxYExFsMJkpo2wi98R43O+27QdSLGkzqAAAA
 A==
X-Change-ID: 20261021-submit-mtk-uart-dma-synchronize-v1-158c8303b574
To: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Long Cheng <long.cheng@mediatek.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_141327_110833_66FB4BB3 
X-CRM114-Status: GOOD (  12.13  )
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

Implement the hook using vchan_synchronize(). This lets clients finish
asynchronous cancellation before reusing callback state or freeing DMA
buffers. Keep the callback wait out of device_terminate_all so it can be
performed without locks acquired by the callback.

Fixes: 9135408c3ace ("dmaengine: mediatek: Add MediaTek UART APDMA support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/mediatek/mtk-uart-apdma.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index f74e9a328588..7583c287da5d 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -440,6 +440,13 @@ static int mtk_uart_apdma_terminate_all(struct dma_chan *chan)
 	return 0;
 }
 
+static void mtk_uart_apdma_synchronize(struct dma_chan *chan)
+{
+	struct mtk_chan *c = to_mtk_uart_apdma_chan(chan);
+
+	vchan_synchronize(&c->vc);
+}
+
 static int mtk_uart_apdma_device_pause(struct dma_chan *chan)
 {
 	struct mtk_chan *c = to_mtk_uart_apdma_chan(chan);
@@ -514,6 +521,7 @@ static int mtk_uart_apdma_probe(struct platform_device *pdev)
 	mtkd->ddev.device_config = mtk_uart_apdma_slave_config;
 	mtkd->ddev.device_pause = mtk_uart_apdma_device_pause;
 	mtkd->ddev.device_terminate_all = mtk_uart_apdma_terminate_all;
+	mtkd->ddev.device_synchronize = mtk_uart_apdma_synchronize;
 	mtkd->ddev.src_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE);
 	mtkd->ddev.dst_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE);
 	mtkd->ddev.directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20261021-submit-mtk-uart-dma-synchronize-v1-158c8303b574

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


