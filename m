Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C62606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 23:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=flyyv4jy;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VSgd9lNA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GUQ9hlCoo6Dy1AIQut5SiYH7FfRIMv35mZmA2VeNSQQ=; b=flyyv4jywfomAc
	koQg92sr6baPgjXiAQOjb0fRY0iJeU9b01fBTnMSh3EJXlxCtcZVdqaL7r02UY9o7RlVHH6HaTYzS
	fogb6GvGGr4It+Dwr+Joriz2S0T/kwshWFPni4nMoT1g6+1autPEYG2GxdnmxD1NZHDRCh9Nn+7pl
	Pjbjqo5Y63ViynDtLf0NwTw5YOiL+FTe2fyD58wUdnaoMdGlDI5mYpkPuEv+NBNT/pPOJeyle5d8m
	rAPXXws6REVLrlCSpN+T1J4vgtym4L/XMYzO0aLRE8I9A2H+0X0rEFyX7KXkJfwLJSyEPo8Ku+qnA
	sL6XpDkuQTPfQz/Y0Tgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKOqc-0000000HBWb-47x9;
	Fri, 23 Oct 2026 23:38:54 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKOqM-0000000HBJz-3cWw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 23:38:40 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-499f20c7054so779775fac.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 16:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792798718; x=1793403518; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GUQ9hlCoo6Dy1AIQut5SiYH7FfRIMv35mZmA2VeNSQQ=;
        b=VSgd9lNAqfg7J+U8eLEP9FKJUulj5aaS9w6RSTBBwEyj6ddAlM6B42NlkjSw/0t/Ra
         8oUjgJ3TBtaHNRoFYJV1rWtSILSLqSrRi+YX4KR22dMlh6Nc2TLvL7DtbonnKN/J0o1m
         5pyBVkfEwHvwIYibjJ00cIegYrZaUwHqwXCo5wuVDNURGLCWCbixLTXsMvMxmk7D4l0F
         RGrTl0JKlqZochjhjS1TwEk8MBnD+AWmoM35i4IvTBRMZupNumD3Ejrbh5DjuRF59CQA
         Pyy4BkzDBniHdJ5sxgexP7ce+L97M1Kgac+ADH7VU1pxCZjlSlaJhA9pnuOmKgHfK9IA
         fQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792798718; x=1793403518;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GUQ9hlCoo6Dy1AIQut5SiYH7FfRIMv35mZmA2VeNSQQ=;
        b=BA2j/usNJiZXBVFq1g4xX9aj4CDJ60/B1UFw5SGIIrq8OR7RYWU3iGN+0IhPi0EjVi
         S2pr+2Yj4z5mhwxk0gOR/S3H31W24q3xHKUa5tvwYR2CXQLX+LTg6+89UEBvSeOCIODP
         4MbZfrNe2x9qWifDi03tSGQ+bKSccWnxH1dzFHUM4SArGVJ8/VS/TO0EUATCWIuOd1jJ
         lup7chfeYvfYcbcrSaxRVHTCYuL83Ylpw8qD9nhgJpnDN1TeHay/jLqJwTg+NDdw8CwA
         kEDBvLaLjHsW3nhjg5FsHBhXIVvwBgDRzi746JJyBKEm1D5AuNYsPR/eA2EJB+u/BsxR
         6oEg==
X-Forwarded-Encrypted: i=1; AKwUvBzUZxQl827pAWPX/462HMdZnfoT/DeTw80GfpL9nacsM2dc77otIXkX6HiBN5u2pQwU11ydzNCYtZchwfu1LvNy@lists.infradead.org
X-Gm-Message-State: AFq9FYKcjAFOieGMEABw8iIXVoqBIsc9P9pWWugnJXn/cCNtcSFAS4lh
	vR1Qe67vN/BaN1XTO/SlUYsJ/j+LVm7dc6+12qOWxK80vQ+Hql8YGw/1
X-Gm-Gg: AYBFou2d87Q15vtBSjaw8vqAw71f5cGSglkavY7B66aigVOl+j6FcAUJ8Wjm7Xyk4OF
	bbhAkkA86A4OArXWHA71sAuXZgfcQESQWPetF62dX+ZdFKDdZF3Upi/Yg9sOt8muZQHg5sMxnE7
	h0IsIDRU++iXbIzRxy9BBc9+EhohcVsq6opWKhqKT8BTSZte/1iPwF68hWYpxGc14yBnpfxr9fX
	9PDrHVhrljLPOHcwdHK6aX0YtuUd9TEEiZNayeV02NEO95H48SnDFz2BaRPgnJousv86fRPIlGr
	cCTKOMw41NJLsZ8UufIujfOlBwFnxauLXQRlkuFF7HUk1b5YeUKyKEgqffAkmNvW6dLRo4OiATh
	BawhEGMcgcwbv8Xp+OB5v19IbBNG5/uXB3n8AayDvVRJo51rUaGBPzC9e73zJUe96xNCrMxplQU
	pmfF7/8ZBkKthUyVotP8NnpuCT4q+myUa7u+HiD6iI002rNwWZ5qHlJCxz4Vn2qxd6l7tQ2b/CW
	lxDxBBRzQvpntBQeTLIXhsiIAlQSu7TMy9LWMch3cG4CU8m7zwiFW20LpeS1C8BJRxtGVtt4Ow0
	w7D8GAnn2IYMPWOknM5wecJncN7cf82IEWyGVjqFwFYXOxBTemE8WGLK0BBApXofj3CgTt8XbKS
	o9ZnS7lGfOvpBp2Rb4mUv7+1wqhYNHOgfrGzOdNjzneTgvkyifQf7QIBXylTRV4JsmQrkgrFZng
	BgGy8=
X-Received: by 2002:a05:6871:4715:b0:4a2:c175:d339 with SMTP id 586e51a60fabf-4a83f58e426mr639235fac.39.1792798717749;
        Fri, 23 Oct 2026 16:38:37 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a843225d69sm284345fac.15.2026.10.23.16.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:38:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 17:38:23 -0600
Subject: [PATCH v3 4/9] dmaengine: sun6i: serialize physical channel
 ownership
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-4-ef1acb0be768@gmail.com>
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
 James Hilliard <james.hilliard1@gmail.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_163838_933665_5AC6DDE1 
X-CRM114-Status: GOOD (  20.21  )
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

The allocator changes vchan->phy and pchan->vchan under sdev->lock, but
termination reads the physical channel before taking either lock. The IRQ
handler also takes an unprotected owner snapshot. Termination can miss a
new assignment or detach an owner while an interrupt is about to complete
its descriptor. A sampled IRQ can also be applied after reassignment.

Protect physical-channel ownership with sdev->lock across allocation,
interrupt handling, pause, termination and residue queries. Read and
acknowledge IRQ status under that lock, and allocate and start each pending
channel in the same critical section. This also serializes updates to the
shared interrupt-enable registers.

Nest vc.lock inside the device lock when accessing descriptor lists or
updating cookies, including cyclic notifications. virt-dma takes vc.lock
independently when preparing, submitting and completing descriptors, so
the device lock does not replace it. Client callbacks run outside both
locks in the virtual-channel tasklet.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260706065650.34B131F00A3A@smtp.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 67 ++++++++++++++++++++++++-------------------------
 1 file changed, 33 insertions(+), 34 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 435d7daa1c0f..d3a63c866645 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -217,6 +217,10 @@ struct sun6i_dma_dev {
 	struct clk		*clk;
 	struct clk		*clk_mbus;
 	int			irq;
+	/*
+	 * Physical channels, pending list and registers; nests outside vc.lock.
+	 * virt-dma also takes vc.lock independently for its lists and cookies.
+	 */
 	spinlock_t		lock;
 	struct reset_control	*rstc;
 	struct tasklet_struct	task;
@@ -524,11 +528,11 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 	struct sun6i_dma_dev *sdev = from_tasklet(sdev, t, task);
 	struct sun6i_vchan *vchan;
 	struct sun6i_pchan *pchan;
-	unsigned int pchan_alloc = 0;
 	unsigned int pchan_idx;
 
+	spin_lock_irq(&sdev->lock);
 	list_for_each_entry(vchan, &sdev->slave.channels, vc.chan.device_node) {
-		spin_lock_irq(&vchan->vc.lock);
+		spin_lock(&vchan->vc.lock);
 
 		pchan = vchan->phy;
 
@@ -545,10 +549,9 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 				pchan->vchan = NULL;
 			}
 		}
-		spin_unlock_irq(&vchan->vc.lock);
+		spin_unlock(&vchan->vc.lock);
 	}
 
-	spin_lock_irq(&sdev->lock);
 	for (pchan_idx = 0; pchan_idx < sdev->num_pchans; pchan_idx++) {
 		pchan = &sdev->pchans[pchan_idx];
 
@@ -557,31 +560,20 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 
 		vchan = list_first_entry(&sdev->pending,
 					 struct sun6i_vchan, node);
+		spin_lock(&vchan->vc.lock);
 
 		/* Remove from pending channels */
 		list_del_init(&vchan->node);
-		pchan_alloc |= BIT(pchan_idx);
 
 		/* Mark this channel allocated */
 		pchan->vchan = vchan;
 		vchan->phy = pchan;
 		dev_dbg(sdev->slave.dev, "pchan %u: alloc vchan %p\n",
 			pchan->idx, &vchan->vc);
+		sun6i_dma_start_desc(vchan);
+		spin_unlock(&vchan->vc.lock);
 	}
 	spin_unlock_irq(&sdev->lock);
-
-	for (pchan_idx = 0; pchan_idx < sdev->num_pchans; pchan_idx++) {
-		if (!(pchan_alloc & BIT(pchan_idx)))
-			continue;
-
-		pchan = sdev->pchans + pchan_idx;
-		vchan = pchan->vchan;
-		if (vchan) {
-			spin_lock_irq(&vchan->vc.lock);
-			sun6i_dma_start_desc(vchan);
-			spin_unlock_irq(&vchan->vc.lock);
-		}
-	}
 }
 
 static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
@@ -590,9 +582,11 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 	u32 channels_per_reg = sdev->cfg->num_channels_per_reg;
 	struct sun6i_vchan *vchan;
 	struct sun6i_pchan *pchan;
+	unsigned long flags;
 	int i, j, ret = IRQ_NONE;
 	u32 status;
 
+	spin_lock_irqsave(&sdev->lock, flags);
 	for (i = 0; i < DIV_ROUND_UP(sdev->num_pchans, channels_per_reg); i++) {
 		status = sun6i_read_irq_stat(sdev, i);
 		if (!status)
@@ -608,14 +602,14 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 			pchan = sdev->pchans + i * channels_per_reg + j;
 			vchan = pchan->vchan;
 			if (vchan && (status & vchan->irq_type)) {
+				spin_lock(&vchan->vc.lock);
 				if (vchan->cyclic) {
 					vchan_cyclic_callback(&pchan->desc->vd);
 				} else {
-					spin_lock(&vchan->vc.lock);
 					vchan_cookie_complete(&pchan->desc->vd);
 					pchan->done = pchan->desc;
-					spin_unlock(&vchan->vc.lock);
 				}
+				spin_unlock(&vchan->vc.lock);
 			}
 
 			status = status >> DMA_IRQ_CHAN_WIDTH;
@@ -625,6 +619,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 			tasklet_schedule(&sdev->task);
 		ret = IRQ_HANDLED;
 	}
+	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	return ret;
 }
@@ -931,19 +926,20 @@ static int sun6i_dma_pause(struct dma_chan *chan)
 {
 	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
-	struct sun6i_pchan *pchan = vchan->phy;
+	struct sun6i_pchan *pchan;
 	unsigned long flags;
 
 	dev_dbg(dmaengine_chan_dev(chan), "vchan %p: pause\n", &vchan->vc);
 
+	spin_lock_irqsave(&sdev->lock, flags);
+	pchan = vchan->phy;
 	if (pchan) {
 		writel(DMA_CHAN_PAUSE_PAUSE,
 		       pchan->base + DMA_CHAN_PAUSE);
 	} else {
-		spin_lock_irqsave(&sdev->lock, flags);
 		list_del_init(&vchan->node);
-		spin_unlock_irqrestore(&sdev->lock, flags);
 	}
+	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	return 0;
 }
@@ -978,15 +974,14 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 {
 	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
-	struct sun6i_pchan *pchan = vchan->phy;
+	struct sun6i_pchan *pchan;
 	unsigned long flags;
 	LIST_HEAD(head);
 
 	spin_lock_irqsave(&sdev->lock, flags);
+	spin_lock(&vchan->vc.lock);
+	pchan = vchan->phy;
 	list_del_init(&vchan->node);
-	spin_unlock_irqrestore(&sdev->lock, flags);
-
-	spin_lock_irqsave(&vchan->vc.lock, flags);
 
 	if (pchan && pchan->desc && pchan->desc != pchan->done) {
 		struct virt_dma_desc *vd = &pchan->desc->vd;
@@ -1007,7 +1002,8 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 		pchan->done = NULL;
 	}
 
-	spin_unlock_irqrestore(&vchan->vc.lock, flags);
+	spin_unlock(&vchan->vc.lock);
+	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	vchan_dma_desc_free_list(&vchan->vc, &head);
 
@@ -1018,8 +1014,9 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
 					   dma_cookie_t cookie,
 					   struct dma_tx_state *state)
 {
+	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
-	struct sun6i_pchan *pchan = vchan->phy;
+	struct sun6i_pchan *pchan;
 	struct sun6i_dma_lli *lli;
 	struct virt_dma_desc *vd;
 	struct sun6i_desc *txd;
@@ -1027,11 +1024,12 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
 	unsigned long flags;
 	size_t bytes = 0;
 
+	spin_lock_irqsave(&sdev->lock, flags);
+	spin_lock(&vchan->vc.lock);
 	ret = dma_cookie_status(chan, cookie, state);
 	if (ret == DMA_COMPLETE || !state)
-		return ret;
-
-	spin_lock_irqsave(&vchan->vc.lock, flags);
+		goto out;
+	pchan = vchan->phy;
 
 	vd = vchan_find_desc(&vchan->vc, cookie);
 	txd = to_sun6i_desc(&vd->tx);
@@ -1045,9 +1043,10 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
 		bytes = sun6i_get_chan_size(pchan);
 	}
 
-	spin_unlock_irqrestore(&vchan->vc.lock, flags);
-
 	dma_set_residue(state, bytes);
+out:
+	spin_unlock(&vchan->vc.lock);
+	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	return ret;
 }

-- 
2.53.0


