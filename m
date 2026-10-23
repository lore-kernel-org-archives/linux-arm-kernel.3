Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD87A606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 18:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ObsGqgN5;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WeWVJpkO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PqNMKX2JAKOcdDMHgbj/E/YCDonhqS9mo8xwaEZBKXY=; b=ObsGqgN5BICtlx
	v+pjKEZrFMFJt5Kkncbd1nzpuGmcY4nVVltmJ4AnZ1xP98omaOH3uSjskBJ+5slQALLaH8rt6ap9A
	WGSn7gkuXoLN1Z9/VIzk53mwO+wGzoTFa35b86Ng85DxQyfpf7Aeb6+MIFCh26fdISt+RdswBp4NR
	Vvawy2eYZrXsQDm7oyuHVUaN2dHQnjq4x1Vnt2Bqge2W7dLYhQo5A5IWnbkicbNTF7woPslB/UNQi
	DyErPAB/8EAN//WiUAE12MpCORB4ZVg/9OpjRwamjZhrxKT0M5XWSPSPmYv/lSzu5ufDEsXxQEVVB
	/X6aV0iMq/9wOEND0H/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKKEd-0000000GnmV-2QQA;
	Fri, 23 Oct 2026 18:43:23 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKKE8-0000000GnTY-28ey
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 18:42:53 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-7f432ac553fso1217863a34.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 11:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792780971; x=1793385771; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PqNMKX2JAKOcdDMHgbj/E/YCDonhqS9mo8xwaEZBKXY=;
        b=WeWVJpkOaMKpwXjf0Ps9eVq1/2v5uF+JBa2KhzxxNr/0RfDUha9fXTj+ERYVsUSuxS
         Z+mLUV8tfqLsnk30qoEIn5hbmYl6jm7hDAUaici6uMQuhp5f114zReytC9X4v9FKL2np
         oTO/6UeZJBcWf3Qwn/VC+F6dASYTwMGVUR7u1saEwZuGpMXmKDr0LAdoOa1GqMpHQ0Sb
         IZi3hOklPFXj3JDY0hHTWKGXF7XxJX9Zdzz0DAjlEQhR9UZfAP0QawBGGEEWVhw7TF2S
         34E2Tf9PhSqH1TvnU/nWVVPXwU9N0oxd+C3bs/soGDD+/Sv6nvlCHFoobLij1hUe5DIw
         vIqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792780971; x=1793385771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PqNMKX2JAKOcdDMHgbj/E/YCDonhqS9mo8xwaEZBKXY=;
        b=T0KdAf+jBchYC70xbAEyYlwNpKjO2u6OEo0S/gub2teAkJ+rBTin6GV1PcBp/5qlGV
         l0AkWQY+cZQjL7OjK+xuK8F5CfonosC4/co5fz1CiryiX96II0Y1roPiNfb528BcCni9
         djfMfZNbUz5neC5p/JBm6+raf1EM4Lyab+bZ1fxX+yEF+UmLdfQGlN6dvNIvSvU3H++d
         +W+sdqklnXfJc008wUYW1MR4pSKatsmYir9y5KaHEvm6rGAMxaRe1DqB3JWrizbVu6r1
         WgxPZtkoh/EMPqL2ClgpVnsm1KNqW9Qj4DpTaFJmOzJNQQJjm4ZJNoD26NBiE+wKB/9q
         RR0g==
X-Forwarded-Encrypted: i=1; AKwUvBxBmvY5LB4fx535K1hDdbNG4rx4ksef9jMEQ4XdK6S7fyKD0q3xowiBaGnwq6vy98RmU9Gl0r016mL/UdePZ53b@lists.infradead.org
X-Gm-Message-State: AFq9FYKcDLPLw0zrGFZKG0GJbHk4h3PVCbwkWzDlc7bDHCD/rS9ict+Q
	2JDqWZWd+OLKBKPP5Y/Lt5vzEWgQfAyHBpKuHr0mTEGnCWsMHS+W+vgT
X-Gm-Gg: AYBFou2cs/cJdVw3ySGYtAkkKpp1VbCklWYODCKodnig+5icinIh5w/PcB16Tqe8CqV
	SocK1hCElxh2xer7kt8eJ0S16fENJZOw4I6nFgfJuEKK0lwUoqNsgyB6oLyMd+lj5rrw8EioY/7
	8Mh1Q/1BtoIajBp0JdQC1sVLolj1hMWfoUsXu/MKpLaEkSsr6A6RQWpDWJT7pGo1joF98/8rRct
	torCXAHu/9CJ0m7meLBteOpDv+FJh0tKCg3uha9NnFMokk/bbVTAJql7l4+Bue2453UCj2XYFn5
	X6rHHAE18uhMGtA9kPrsNkUE7Pdyv5yay8T9SZ4FjrqfAA8BMJcpeQKLIREl1KkT7B96XGXLdZk
	ZodFK8YX4ero+1e6tmNtc8gCK6bDpW/cOov4HFqmAlVY1+DHdAGQo3ouTYzc+AtgSOzKKfKffZC
	oEVpXRemsBsaKIlKMsJB/03eIBMuKCqKyF8rAJItXvUWlLHmVybC83jvzWZVlCtgEA0qtFfDtQR
	8Nkfctzf2g4iVkUD/46BSehVhxXjioIWMkLOTK0ABHl+XvNneqDn6pqFs2iGxrQnOdUpnBQKxF2
	o2sxANRyAifUK3MqsUjae/4T8PIJBWX2/+2qHxIjR7eOOh/LXeDAjWyTKFMfdxbN0oIH59k+c2/
	HaI0ruu/HcesxPdskypcwTQ51Bmd4qZN6EHSVYCPELadf9XCz70m5sNp0Jm+C+31k7WsGJ6wfWA
	luazZFpJIy3dREurtG+2FfURE=
X-Received: by 2002:a05:6808:1911:b0:50a:6fcf:d287 with SMTP id 5614622812f47-55c00232f05mr72486b6e.37.1792780971361;
        Fri, 23 Oct 2026 11:42:51 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55bfe199544sm336682b6e.13.2026.10.23.11.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 11:42:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 12:42:40 -0600
Subject: [PATCH v2 6/6] dmaengine: sun6i: keep cyclic state with the
 prepared descriptor
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-6-c9e07cc44bf8@gmail.com>
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com>
In-Reply-To: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com>
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
X-CRM114-CacheID: sfid-20261023_114252_563724_8E488EEA 
X-CRM114-Status: GOOD (  15.05  )
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

Preparing a cyclic transfer sets vchan->cyclic before the descriptor is
submitted. A finite transfer on that channel can then select package
interrupts and take the cyclic callback path instead of completing its
cookie. Merely preparing an unrelated future transfer must not change
the active transfer or the meaning of queued descriptors.

Store the flag in sun6i_desc and consult the active descriptor when
selecting interrupts, completing a transfer and terminating it. Finite
descriptors retain their zero-initialized flag. This also makes callback
retirement depend on the descriptor whose lifetime is being ended.

The shared state was identified during the H616 cyclic UART RX review.

Fixes: a90e173f3faf ("dmaengine: sun6i: Add cyclic capability")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index c244ef572492..c9a72cfe3f44 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -191,6 +191,7 @@ struct sun6i_desc {
 	struct virt_dma_desc	vd;
 	dma_addr_t		p_lli;
 	struct sun6i_dma_lli	*v_lli;
+	bool			cyclic;
 };
 
 struct sun6i_pchan {
@@ -207,7 +208,6 @@ struct sun6i_vchan {
 	struct sun6i_pchan	*phy;
 	u8			port;
 	u8			irq_type;
-	bool			cyclic;
 	bool			paused;
 };
 
@@ -504,7 +504,7 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 			     (DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
 			     (irq_offset * DMA_IRQ_CHAN_WIDTH));
 
-	vchan->irq_type = vchan->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
+	vchan->irq_type = pchan->desc->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
 
 	irq_val = sun6i_read_irq_en(sdev, irq_reg);
 	irq_val &= ~((DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
@@ -607,7 +607,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 			desc = pchan->desc;
 			if (vchan && desc && (status & vchan->irq_type)) {
 				spin_lock(&vchan->vc.lock);
-				if (vchan->cyclic) {
+				if (desc->cyclic) {
 					vchan_cyclic_callback(&desc->vd);
 				} else {
 					/* Completion transfers ownership to virt-dma. */
@@ -908,7 +908,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
 
 	prev->p_lli_next = txd->p_lli;		/* cyclic list */
 
-	vchan->cyclic = true;
+	txd->cyclic = true;
 
 	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
 
@@ -997,13 +997,12 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 		struct virt_dma_desc *vd = &pchan->desc->vd;
 
 		/* A cyclic callback may still hold this descriptor outside vc.lock. */
-		if (vchan->cyclic)
+		if (pchan->desc->cyclic)
 			vchan_terminate_vdesc(vd);
 		else
 			list_add_tail(&vd->node, &head);
 	}
 
-	vchan->cyclic = false;
 	vchan->paused = false;
 	/* Leave terminated cyclic descriptors for the sleepable synchronize. */
 	list_splice_tail_init(&vchan->vc.desc_allocated, &head);

-- 
2.53.0


