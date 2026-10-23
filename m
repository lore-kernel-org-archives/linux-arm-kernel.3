Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B97B606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 23:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dAtyQssu;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Bk0MnhrR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zkFWZrZqrOF0fJWX5siiys4KdKUOKCNqH6flFHqQFIY=; b=dAtyQssuf0QbdW
	/0q7jWJL9u/slleGkfIvV8kpbOHL/cw1dYHBs1tO7hoP8hqh04beHl6mspI72wjOvFouP9zJ3SvbW
	xLTrQ5qJwHdir3QGl+Rvz4NP6NSO7M2rVU/F7Iydgp9qKUjjieRS2/738NiGAs38ByB0MTjRctA08
	Pc7mtBgzQg+h4aNLH8pqYRCzfBsIVxQO/r8UWSJYv63XQ65R3AN6o2jBNhpVU8pQutOnLqNeJo8P2
	+DAZrkhNUaVv3YawQGTF+Cm39ovLfOU2XTdkAupeD5ZLiSRpmcuHhIYV4PcSy1ahUc4lW4F3pEEYs
	OAs+pzi+j3GzIgmtmxkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKOqd-0000000HBXF-1C7u;
	Fri, 23 Oct 2026 23:38:55 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKOqP-0000000HBNZ-3YXG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 23:38:42 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-6deb848ddd7so997898eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 16:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792798721; x=1793403521; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zkFWZrZqrOF0fJWX5siiys4KdKUOKCNqH6flFHqQFIY=;
        b=Bk0MnhrRQZ+wDWvzDBGtnsCLjGZUfY+UvUsvNO93PX3Z3e6NQLPE387Mprwxoo5TKW
         WcasSYsnCT9yN7tWKU5Sp3Ld/xOgjUZ8/+LEg1NYR4aWxEOAW0j4iVBqgwAdHZcTqEnJ
         L3VV4Sjo0Halph8g9qcHSV8zvcmRJ/OIjMGWuH2I+0lLhKqsZXmUNhSPzuWJCic80qUV
         RYG1jrFYw+j2U2IUG2OlJ8j3Y3gxQdeS25abbqu4y5i7w25mHQ8073I8Cs2Swoa2QhN2
         sQkAzEtw6xCROBubabnIEz6zcyX/ZhKQoFwbVwfQZvdqDKD7BhmASQxdc6WUZxuD4Vg/
         C23A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792798721; x=1793403521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zkFWZrZqrOF0fJWX5siiys4KdKUOKCNqH6flFHqQFIY=;
        b=zdG2ir53qqVRCAt803DCSpPEe5hb19UEVBAHVDXd91q2jn2jEwMT50ZcuEFW2OfsfR
         PvS4loD5metfPbWESzIAkEpoTgTF4Pfj/YlMuAuKEMhV0LZ+cETa/pyySpuNCFQWbyIX
         LkkUnQSpJM7IMxDeeUYOu/aTnIzzJBeld2i9/DWOXwfr+p1SiR9ukwemRVyO6I3pteQQ
         /+3ig/gxwm3A2vR8xUE39pvIFrp6pgxQzLi3Hvb3WYFa0SVONlxaL1h1/erfm/xY6s3/
         N2qf4qxOCpXUIXSEsYnLJczKaqOTNBMUvwMJuHJQG2w9IbVeS5+K74J6KNV+lFqNNYL5
         gqyQ==
X-Forwarded-Encrypted: i=1; AKwUvBxqa79QIZq4Hq+qLhfc0LqpMXZ+u1ENUMHFEwol7cn2Q2Q99x+4aqMrpOlKoLT4FmFSrMrchTciBSyhYBiz597P@lists.infradead.org
X-Gm-Message-State: AFq9FYK5MrPoigILHAgpmCempMQxRJEYbxKTOiWOobr9njJigSEWMiJe
	V1juqQeA4tUNndV3GahRO6m1oik9nXmG6I/BjXEPjIPr+zA6b2+n6wBc
X-Gm-Gg: AYBFou04mchoDkyqqDuoB0cZ3FvH4w3WVruVQLkDwdRQCXFlxedRiFEuPegiVc6+OfM
	ioOJ5CVThvTH1Zukm1vrV4IGw2es1G3VBWsgigkjL+kDKo9gbhZHRhtX/mlJii9KSJagCGrQ85e
	cRu4h5I6SL147FlhIpZLD0LhATwBaSpbmYNAjLFxqXPL2PnAQH9n5AmlUyIZs07o1+tQFw7m96H
	rrep6hvo5C70NPPuf8YhBu5ArvrlcyWyf1zEjpwez+KuVvQYTL6ZrXGePyNNz6bL/kwwdmz0CcR
	scSFkqPSV4XxtoLlx3hKPn8LE0CD4WBLSCer3m6CGGPNeO4W7o5o3//b7phNYV8xTCixPQ4iewP
	itbDBcsZ3QjrbvLY99V/CDA0XaC/q5uZfXXWxEoSfT2La70QtwQaF7RUbXzT55JtJnFPTLRS0LY
	EfhJF21o3nzuS83qfupHwLu2syCrQk9LWQte6G3vFHu1WmdNFe7sdnX52Tb/5/FGVMJpO7B4Ylh
	aLJnUEu5kxT+9Z4nJR/W2ixqjmOKgK2jgJYorwbqSpnchaq/GegA7NzdmHiMEQN5D9FneTSdQS4
	qxp3r1St4SdzbSEf23tLPuUVb+kIm06OK3R2NhKvVFf2y6Nlnd4s+DpsSQai01sv7nxA2/FXXp6
	UJG2yAUjXXKVeTGZHdPGBcJGhxMj3zeUi7hGeL4UITRm7DgJLqMvDMuqTfPPQRR9Yk/pk56WmTn
	Z4rao=
X-Received: by 2002:a05:6820:7093:10b0:70b:8379:c145 with SMTP id 006d021491bc7-70ba0da0506mr162964eaf.28.1792798720713;
        Fri, 23 Oct 2026 16:38:40 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a843225d69sm284345fac.15.2026.10.23.16.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:38:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 17:38:25 -0600
Subject: [PATCH v3 6/9] dmaengine: sun6i: retire interrupt state before
 reusing physical channels
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-6-ef1acb0be768@gmail.com>
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com>
In-Reply-To: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, 
 Maxime Ripard <mripard@kernel.org>, Jens Kuske <jenskuske@gmail.com>, 
 Jean-Francois Moine <moinejf@free.fr>
Cc: Hongling Zeng <zenghongling@kylinos.cn>, 
 Chengfeng Ye <cyeaa@connect.ust.hk>, 
 Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_163841_897425_DC8D2B4F 
X-CRM114-Status: GOOD (  12.51  )
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Termination stops a physical channel and drops its owner without masking
or clearing its interrupt state. A completion latched by the old transfer
can therefore be delivered to a descriptor installed after reassignment.

Mask and acknowledge the stopped channel's interrupts before releasing
its ownership, and clear pending status before starting a new descriptor.
Keep these register updates under the same device lock used to sample and
acknowledge interrupts in the handler.

Schedule the allocator after termination so pending virtual channels can
use the released physical channel even when no further interrupt occurs.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 900bb629ba3b..dab17b3863fc 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -501,6 +501,11 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 	irq_reg = pchan->idx / sdev->cfg->num_channels_per_reg;
 	irq_offset = pchan->idx % sdev->cfg->num_channels_per_reg;
 
+	/* Do not deliver a previous transfer's interrupt to this descriptor. */
+	sun6i_write_irq_stat(sdev, irq_reg,
+			     (DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
+			     (irq_offset * DMA_IRQ_CHAN_WIDTH));
+
 	vchan->irq_type = vchan->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
 
 	irq_val = sun6i_read_irq_en(sdev, irq_reg);
@@ -973,6 +978,7 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
 	struct sun6i_pchan *pchan;
+	u32 irq_reg, irq_shift, irq_mask;
 	unsigned long flags;
 	LIST_HEAD(head);
 
@@ -994,6 +1000,14 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 		writel(DMA_CHAN_ENABLE_STOP, pchan->base + DMA_CHAN_ENABLE);
 		writel(DMA_CHAN_PAUSE_RESUME, pchan->base + DMA_CHAN_PAUSE);
 
+		irq_reg = pchan->idx / sdev->cfg->num_channels_per_reg;
+		irq_shift = (pchan->idx % sdev->cfg->num_channels_per_reg) *
+			    DMA_IRQ_CHAN_WIDTH;
+		irq_mask = (DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) << irq_shift;
+		sun6i_write_irq_en(sdev, irq_reg,
+				   sun6i_read_irq_en(sdev, irq_reg) & ~irq_mask);
+		sun6i_write_irq_stat(sdev, irq_reg, irq_mask);
+
 		vchan->phy = NULL;
 		pchan->vchan = NULL;
 		pchan->desc = NULL;
@@ -1003,6 +1017,8 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	vchan_dma_desc_free_list(&vchan->vc, &head);
+	if (!atomic_read(&sdev->tasklet_shutdown))
+		tasklet_schedule(&sdev->task);
 
 	return 0;
 }

-- 
2.53.0


