Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9464E606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 18:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eH+oaIUE;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YnYbBkew
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=B1IqYW+doNQQMcUHP4l8j+5MQVcguml9gPI+cwHAG8g=; b=eH+oaIUERjBWhh
	h3U9KhAo9HhNhO35e2k95FPgzbRHHenVgB0X7aoit/17JxKXnIJdlTDBg91ffJPydpE/bAFVzOpQi
	Nugb5jZLhT2UAwwsC9UjGy4Hh1RSQ2vlM45wcFMkW8uDPHMeFduCVsFhdcVTkBwFWtpPdP0dpDvQc
	hn3siMSPbTveroLzuvuOWtjZDy0jaKTdBbDfeRv9KBdu0a85YXHsPqB0UV9BtGPM4qtaAzsWbQIHe
	nwvJhZMaynkjlJfFTtpotAw5lD8Cvj3KnemXAtLlougLWXBb1zcyLvutU5kUkvDyRAPo9JH2d0QO2
	D85Sx179nenPX/i1XLQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKKEd-0000000GnmQ-1qKY;
	Fri, 23 Oct 2026 18:43:23 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKKE7-0000000GnTL-0YvR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 18:42:53 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-4f55a53898cso557229b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 11:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792780970; x=1793385770; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B1IqYW+doNQQMcUHP4l8j+5MQVcguml9gPI+cwHAG8g=;
        b=YnYbBkewf8+2sZQUFrWXKA1smjizDPtb3J6ONmSVirvjcEt6uRkYc8i78X3bd9vWW7
         LbDqLrojDAWkd43q9+UzjvEp5TYY4sLzhOkbd8qDJK+vP7VDoLjQcekWR3CQwfVRXz3p
         GK64DDw99wyRzPLLQFbOkZwijXgKBzRxOija25G1IvDcq0ZS1QCfh7lkGRlQTI1UBLI/
         H4TZ5ntb9Hqy9bXhKts3kxFZdO0dOmSu7D/mEgBsyGF/FtpuV5WbuncxCRx334cQvEOY
         0kjNm8GZQyBu3B464STg81a0oYzs7xI9StnvGvxMx7G5zPjmOseJ2Iskq+2CADeADcsq
         E/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792780970; x=1793385770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B1IqYW+doNQQMcUHP4l8j+5MQVcguml9gPI+cwHAG8g=;
        b=M4quf/qV7IwfH2VJ2DYSXV1li3fbtCJoofpwJ08+N4JGl/RXx0d2FqV4Aqb+4LFmuq
         ERNVAz8+ZssC+zsvuV1VRU6SPV2xni3GcEamAHoAfBZponTzqCb0NlaOE03/tDtPZuWa
         3LWZDVMGwKhpbBjxCe8yadkzMdpe9yafUT4F6kbuAm9l+MZEQF1Yw1gr1e50+X/jockP
         pXVZAIKJ51THfL0BuyqyTLlEOjxpMKvCW3iDywJvLzlQRQm9pBuuDEyQJQnaGyUOdH3v
         aOdSJ+TbHz4yZlw/qVLfRV9WCy6QYLX+q6eQDVWDDpL10Kn6lVtjVDEtpiW0uLyxhLzS
         fbkQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLe6b3H5qiSXYyHdvYKPTptm1vohKd9RRrg2E02RDHmdro+cbuI2GM1UPe9zrlIYrV2Cjy9oLGyJeZU2cI0OjM@lists.infradead.org
X-Gm-Message-State: AFq9FYJZNxMQkjHkSlZz7WGMYW02hKzHSWPuYAcfc0k07IG4u29zU146
	93K3l+Dr8R+KMnMBDkyakucx1OEF4Vq1E+0l4uXTKdB3vQOGj+IQkDwy
X-Gm-Gg: AYBFou3mDzaOBGxnezBnhMgwnl79yIa55+UBJjXkpCsPlzSYv7KL+U+KroEdNqq2cRc
	xSHFq9tI0hRMbkn6MJVV89v99w9HaPMdsiYEL88jI3P6sT6FjfaHE6PQIiNJRRbOIIWNQaPisJ/
	fQx9Clldnx2p+WBCKheCIbnnQIuCi5hG3D7z/1A5Hf4PYfELZRciOzUy9P2A20y8DK6M+ffldOr
	Nbcy9Ual1VbiVPhYCEGUUGPH0n1DbgraxN8YKQvhwkksd6a4awcoO6Jrj1KduA9mDJlrSca9MHb
	obKfX9oDkPlJULspcsOaxzgFdDIN378IgHHBquBkSiS/rxejr3t6yzI6x2JsiQFpOYHuEIoB7Lt
	79KO7zyprOo3a+2ltCc/CYmwbrKg2Itxu2FguGZrTwWz7xSxUcwALAsj+pUf30TYhT99j7dJeTf
	jCRH9LXKJ/PZnRCgOKgLmzTKJTeKoNv/0t73fKMN2ZlP6FBxlymGBEaA3rR6+1D/zomhi4iccPy
	fXT0xKApq7zw1MpdCJle2q+I9or0LTgQMKY1WCjcIRXWz172zdaCzBDIOUHaoLyZtv6vz75K/0V
	dnU4hO76fVvttGamidW18mAo7IC3MD7xjokxPuNZSVPgEebogrBTomHJV3b8MCZn+V4Svb/EO3N
	0P8JEVOkRkDLBpXf+flvvCXyUvJu7R81NF7MhDwokAX1tIlwOwOhzb/LUDbYJj1lGa/6mgVbGkE
	IKiU0=
X-Received: by 2002:a05:6808:4f6b:b0:4f5:eaac:5173 with SMTP id 5614622812f47-55c002c7d48mr52342b6e.57.1792780969992;
        Fri, 23 Oct 2026 11:42:49 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55bfe199544sm336682b6e.13.2026.10.23.11.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 11:42:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 12:42:39 -0600
Subject: [PATCH v2 5/6] dmaengine: sun6i: synchronize callbacks before
 releasing channel resources
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-5-c9e07cc44bf8@gmail.com>
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
X-CRM114-CacheID: sfid-20261023_114251_854137_A0FB38E7 
X-CRM114-Status: GOOD (  15.43  )
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

The driver has no device_synchronize callback. dmaengine_terminate_sync()
therefore returns after stopping the channel without waiting for the
virtual-channel tasklet. That tasklet may already have removed completed
descriptors from the shared list and be executing their callbacks. For
example, serial8250_release_dma() frees the RX buffer and unmaps the TX
buffer immediately after terminate_sync(), while those callbacks can
still access them.

Use vchan_dma_synchronize() for device_synchronize. Channel termination
excludes the interrupt handler and allocator before detaching the channel,
so they cannot schedule another completion for that transfer. Also stop
the channel and synchronize when freeing its resources.

Keep terminated cyclic descriptors on desc_terminated until synchronization
finishes. vchan_complete() may retain that descriptor outside vc.lock.
Ordinary active descriptors have not published a callback and can still be
freed by terminate_all(). This avoids accumulating descriptors on each
8250 partial-RX flush, which uses the atomic termination API.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 157746c9423d..c244ef572492 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -996,12 +996,20 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	if (pchan && pchan->desc) {
 		struct virt_dma_desc *vd = &pchan->desc->vd;
 
-		vchan_terminate_vdesc(vd);
+		/* A cyclic callback may still hold this descriptor outside vc.lock. */
+		if (vchan->cyclic)
+			vchan_terminate_vdesc(vd);
+		else
+			list_add_tail(&vd->node, &head);
 	}
 
 	vchan->cyclic = false;
 	vchan->paused = false;
-	vchan_get_all_descriptors(&vchan->vc, &head);
+	/* Leave terminated cyclic descriptors for the sleepable synchronize. */
+	list_splice_tail_init(&vchan->vc.desc_allocated, &head);
+	list_splice_tail_init(&vchan->vc.desc_submitted, &head);
+	list_splice_tail_init(&vchan->vc.desc_issued, &head);
+	list_splice_tail_init(&vchan->vc.desc_completed, &head);
 
 	if (pchan) {
 		writel(DMA_CHAN_ENABLE_STOP, pchan->base + DMA_CHAN_ENABLE);
@@ -1100,14 +1108,10 @@ static void sun6i_dma_issue_pending(struct dma_chan *chan)
 
 static void sun6i_dma_free_chan_resources(struct dma_chan *chan)
 {
-	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
-	unsigned long flags;
-
-	spin_lock_irqsave(&sdev->lock, flags);
-	list_del_init(&vchan->node);
-	spin_unlock_irqrestore(&sdev->lock, flags);
 
+	sun6i_dma_terminate_all(chan);
+	vchan_dma_synchronize(chan);
 	vchan_free_chan_resources(&vchan->vc);
 }
 
@@ -1480,6 +1484,7 @@ static int sun6i_dma_probe(struct platform_device *pdev)
 	sdc->slave.device_pause			= sun6i_dma_pause;
 	sdc->slave.device_resume		= sun6i_dma_resume;
 	sdc->slave.device_terminate_all		= sun6i_dma_terminate_all;
+	sdc->slave.device_synchronize		= vchan_dma_synchronize;
 	sdc->slave.src_addr_widths		= sdc->cfg->src_addr_widths;
 	sdc->slave.dst_addr_widths		= sdc->cfg->dst_addr_widths;
 	sdc->slave.directions			= BIT(DMA_DEV_TO_MEM) |

-- 
2.53.0


