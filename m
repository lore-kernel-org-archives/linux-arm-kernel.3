Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9A4606A322
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 18:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q2Yn+ChE;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VL9woyin
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EdzVfCnxM9RWe3gkl8fuF1B/Ob/41o49mzScjy2RIHw=; b=q2Yn+ChEuM8WH7
	loU+KtEVr1MaMUyaX+rzApzCf7z+kJC+TzG6s4b42o8v3DApAvZOlJlYAzyfYD9ODYMnwOkkaX94D
	rOWyGTFdRqlQhmYy97zAQVvCXl5KvBkDWQX0VIbTmLyVUgE1hZnIprmtfjYEGbFBoN5c0BziEhnke
	pht3nOiSTPr0jt6QduwHYSCuu6wJ2Xpi+bMgnvReDKRYgC3YNFTRh18xENQQsltGHvAAnaRk3BG5K
	Bm/fufGScnGcQ8HJGz43XTaqZ8ytSmqhcnlfSjOz5+jjBlm3iKR/ztCezv6scHK+qhMFyDCuA+tcE
	0/Tjh7AbRORwCwHh3Otg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKKEA-0000000GnX3-19A6;
	Fri, 23 Oct 2026 18:42:54 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKKE5-0000000GnSu-2EKj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 18:42:50 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-6de2f213b7aso534294eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 11:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792780968; x=1793385768; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EdzVfCnxM9RWe3gkl8fuF1B/Ob/41o49mzScjy2RIHw=;
        b=VL9woyinR9SZ9FGw4q7ZGZx+IxYzM+/85YccGG706N6gs1+gD1AcaIPaPvypccWqij
         gSQSaUrK11rl6FM7c3tDvBwfx+AGnBoSIjfo4chWqutyOsFSPgYrYwzCSD+PaV/KbQEP
         IA7gsq4bCzuByHRMixNOjJbufAxKYP0CmZMzyDECiZ1VYQvkdY4rUNlxqtga7UZmnuBQ
         z9wgFbe659QXOTk2y5c8gneer28i3rlupV/R+g4gRgkppDX1MOrA60osAh+tc5P8FGy1
         y+eYWow/VFO3Zk8M//M20T80V7lfJ9QogX2z9M+ai15DZzxEpnUWm/PnUzxqobcotVx4
         TxqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792780968; x=1793385768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EdzVfCnxM9RWe3gkl8fuF1B/Ob/41o49mzScjy2RIHw=;
        b=koEoh9yASfGG98r7p5cx+Chy49w6S4oOz/ZATMnl2ZaISWrBN7KwZu6p9Gv9BdsiA+
         8MusK9WpUQ4UDpj5qjFaeHBtFfHff0A4VQScQH23TQ9wN2ASribK4rXfQhzYIv6lUX7n
         dCOP0GBOrXoL3tuhUHFWZI/1fC6qHM9gKudEmU2SVeeDvy3smZX5hNAjyBpBNDj8PjSf
         G2WHyxS6C2puyDFCyAMrRmSXaQYKEsIhA7kLnlC4e3dzLMZLYVJD+Dma9680kUmGyuxT
         ctgbiFO+v1j6hgnPSHZ89h4oiRNI+xKWod/7ciWSS2A4wl7oUv3E8+lXS/9UubnPRE+g
         CTBg==
X-Forwarded-Encrypted: i=1; AKwUvBwIsMhB91fTzOWeFHuMifP2dqIWs63bCB4cqvQoPHfX7c1xYn7zvd5h6f7ImrFHGgoyvQTJvV8Bb4SNWYrKBV1E@lists.infradead.org
X-Gm-Message-State: AFq9FYJ48ecgPYj2D25W0+I54Gt9Xu8j1/Aleuh5WEdS7pR3aYvrCNMn
	laBNZtnX7TK2w9q17SQHAwIxLJDMddiLUMBFMxCqunHUIELVOzI11JT4
X-Gm-Gg: AYBFou0uR/nXmr72J9y8vR4jVpbG4UUBi5MpwrdcgKogYg/Cep+4Z8MyzmDaJEz8N3b
	NEFscC0VWqjfExMHq8J3Xl+aKrx69xnft3/khuq5hOM6XTDJbbbod+yoLuq0OUH9UyDKRl18CZd
	5ww5dKl090/qY1Fbu/EBjG/CmUn/tLob5iqkHRfC1nagUrUClSJWVVzGH9vRVT7A1uLW7wuVLqz
	yRIpaoaAPdHT6PdHrrcBURHlQzICHEHhbPtGmYGoA8/RwERMvP/XrQg6DOsP6t6bZh8ppiAuid4
	s7LARTOHoic6JuJfUH1NF936qKLlJPFzsYazMDaEcZFzaxq/ll8GPK0hubofwWoYzuNzJBdY/Pa
	Ff6p7TQhyso3rlDT/MLVOjJYVAMlzp5GrWlB22HRsJr3Bn2u6jl/Awr1RF0mav7rs6M6atpEzzz
	HeXWwJrX0GCQ9e1iRjGGctR9GQug9+G0JeBjyWyUcVtLdqmc7k5fKODL9d9St2ThGQB5LUjGIfT
	wB8IJ+2ni1Ai3Nq69c5aiH0sof834qjjYM0ThksBfL4Ka6hc+4sDuAMU/Fof4k5bTofyN7ORF42
	CcgtNJjJWKJGH2ZCRfQHzCuRIYP7x05yz1hnP5ZcBvyZ+158qYGbIV+IqREpodqmroX62/SurPg
	6FBV4bdOR4dDyrXNEMC7hZ/6b7KLjtBwmGMswWi0xVa2JR5jFlLuacTouAex0kUS3GYLWONdD95
	7UPQ==
X-Received: by 2002:a05:6808:4486:b0:524:884f:d89d with SMTP id 5614622812f47-55c0029724dmr56674b6e.21.1792780968326;
        Fri, 23 Oct 2026 11:42:48 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55bfe199544sm336682b6e.13.2026.10.23.11.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 11:42:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 12:42:38 -0600
Subject: [PATCH v2 4/6] dmaengine: sun6i: track paused virtual channels
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-4-c9e07cc44bf8@gmail.com>
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
X-CRM114-CacheID: sfid-20261023_114249_605945_1B3E636C 
X-CRM114-Status: GOOD (  16.26  )
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

sun6i_dma_tx_status() only returns the cookie state, so a paused but
incomplete transfer is reported as DMA_IN_PROGRESS. The 8250 RX flush
path pauses the channel and calls its completion helper before terminating
it. That helper ignores an in-progress transfer to avoid consuming a new
RX operation. With sun6i it consequently drops the partial buffer and
leaves rx_running set, preventing another receive from being submitted.

Track pause state under the channel-assignment lock and report DMA_PAUSED
for incomplete cookies, including status queries without a residue output.
Flush the hardware pause request before returning. Completed cookies
remain DMA_COMPLETE.

Keep paused channels out of the pending queue and do not start a queued
descriptor when a paused channel's previous descriptor completes. Release
the completed physical channel so other virtual channels can use it, and
clear its hardware pause request before reassignment. The paused virtual
channel retains its queued descriptors until resume.

Resume requeues an unassigned channel only once and schedules the
allocator, so an idle controller does not require an unrelated completion
to resume it. Clear the pause state when terminating the channel.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index a21acb9ecc27..157746c9423d 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -208,6 +208,7 @@ struct sun6i_vchan {
 	u8			port;
 	u8			irq_type;
 	bool			cyclic;
+	bool			paused;
 };
 
 struct sun6i_dma_dev {
@@ -534,13 +535,17 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 		pchan = vchan->phy;
 
 		if (pchan && !pchan->desc) {
-			if (sun6i_dma_start_desc(vchan)) {
+			if (vchan->paused || sun6i_dma_start_desc(vchan)) {
 				/*
 				 * No current txd associated with this channel
 				 */
 				dev_dbg(sdev->slave.dev, "pchan %u: free\n",
 					pchan->idx);
 
+				/* The next owner must not inherit the pause request. */
+				writel(DMA_CHAN_PAUSE_RESUME,
+				       pchan->base + DMA_CHAN_PAUSE);
+
 				/* Mark this channel free */
 				vchan->phy = NULL;
 				pchan->vchan = NULL;
@@ -932,10 +937,12 @@ static int sun6i_dma_pause(struct dma_chan *chan)
 	dev_dbg(dmaengine_chan_dev(chan), "vchan %p: pause\n", &vchan->vc);
 
 	spin_lock_irqsave(&sdev->lock, flags);
+	vchan->paused = true;
 	pchan = vchan->phy;
 	if (pchan) {
 		writel(DMA_CHAN_PAUSE_PAUSE,
 		       pchan->base + DMA_CHAN_PAUSE);
+		readl(pchan->base + DMA_CHAN_PAUSE);
 	} else {
 		list_del_init(&vchan->node);
 	}
@@ -957,12 +964,14 @@ static int sun6i_dma_resume(struct dma_chan *chan)
 	spin_lock(&vchan->vc.lock);
 	pchan = vchan->phy;
 
+	vchan->paused = false;
 	if (pchan) {
 		writel(DMA_CHAN_PAUSE_RESUME,
 		       pchan->base + DMA_CHAN_PAUSE);
-	} else if (!list_empty(&vchan->vc.desc_issued)) {
+	} else if (!list_empty(&vchan->vc.desc_issued) && list_empty(&vchan->node)) {
 		list_add_tail(&vchan->node, &sdev->pending);
 	}
+	tasklet_schedule(&sdev->task);
 
 	spin_unlock(&vchan->vc.lock);
 	spin_unlock_irqrestore(&sdev->lock, flags);
@@ -991,6 +1000,7 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	}
 
 	vchan->cyclic = false;
+	vchan->paused = false;
 	vchan_get_all_descriptors(&vchan->vc, &head);
 
 	if (pchan) {
@@ -1037,6 +1047,8 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
 	spin_lock_irqsave(&sdev->lock, flags);
 	spin_lock(&vchan->vc.lock);
 	ret = dma_cookie_status(chan, cookie, state);
+	if (ret == DMA_IN_PROGRESS && vchan->paused)
+		ret = DMA_PAUSED;
 	if (ret == DMA_COMPLETE || !state)
 		goto out;
 	pchan = vchan->phy;
@@ -1071,7 +1083,7 @@ static void sun6i_dma_issue_pending(struct dma_chan *chan)
 	spin_lock(&vchan->vc.lock);
 
 	if (vchan_issue_pending(&vchan->vc)) {
-		if (!vchan->phy && list_empty(&vchan->node)) {
+		if (!vchan->paused && !vchan->phy && list_empty(&vchan->node)) {
 			list_add_tail(&vchan->node, &sdev->pending);
 			tasklet_schedule(&sdev->task);
 			dev_dbg(dmaengine_chan_dev(chan), "vchan %p: issued\n",

-- 
2.53.0


