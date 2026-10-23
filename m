Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6994660A2617
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 23:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RrvmjB6w;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oGHvkAJa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YfW4t08Q03X/zUbnd8o9mtH6qAgwrZpASG2xurECUh0=; b=RrvmjB6wW9URrt
	CFuqMDujc+JJSF9ZMu4JbZ+qZj0O4Lpr3Q7SmM6sl2oIPTR844vuJQolhlkfR7qQwqDDC3MlYkV0v
	EMpVDXOvAFVr+mcddo6EIClKm64iImNeTruHCMvJckzpW87mACvryTlk6DzBIN9YER3oR1A84T1P7
	S9pc7y5G3yop/7Wv7JdPFJ4KqjuJfeTtHYVLHuKw2dMMa9kbsBcslq5S5BakeiPsIxw+htKFu1lZi
	KNQaARD/8nJUo+pdDUqZ4kuaq95oth5SrPxYJ7424/yf8VAH1TiEp+3tR6MumAWzLl5aVDU8wNPll
	zSOcEGPRmrgFbZfX/q9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKOqN-0000000HBL5-2zWV;
	Fri, 23 Oct 2026 23:38:39 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKOqL-0000000HBIr-0qQY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 23:38:38 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-48e9476e26aso563377fac.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 16:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792798716; x=1793403516; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YfW4t08Q03X/zUbnd8o9mtH6qAgwrZpASG2xurECUh0=;
        b=oGHvkAJaU+Z0Bcqhpz5iln5pAWBwQwysuTbXiDyK8JSBk3YC3TnTwjI8Cxly3ImVzj
         ET3kYFixXWWRlVm2qvMDO9U7EJqiFCU/sey7M8noPO++YmYR6WVvVY8wD1u9NRQcjxT4
         p4Lnmze26psFCqzotJZ4GoSFGICC0EKjwKeAgdahhz4N/HFH1XzT1wgVIr6SWwW+OvmT
         dNd+MMWK9nm/6gHuSKuO3iI1n2CYWFv/WCmm5y8ypLXRWdd613U6dXXBS0m+EnyVVomg
         6bHZYRIcveX7n7glcB+rANf7EQZ4smWuq5UjPrLKVTb2ajooZavRwoU50hLlvMS3QVpn
         T1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792798716; x=1793403516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YfW4t08Q03X/zUbnd8o9mtH6qAgwrZpASG2xurECUh0=;
        b=BEV4SoKGWaP+3mGRNedNKTtLPQNuh50jaGjEUShsz8BiNzcFhXFpa6YD+Ex8jE6ZGv
         R/l1plMa2rO22399+e0zH96e8UNZjnojnxOj/JZjr1XSJ8+yqjI9UB4BNMhyKjf1MqFL
         wy12Q8dDkMCXcl5oDsFY9p4I9KfOct/8iUIZyfwxSUtBIkPpuiZ62YdROVl5uCxeF7ud
         tdJ4U34mdec2bphyutA9fEcEWKmHOPwY343ZofhLhQtvpqBHwhhF5QTI4iRFS3N86QIN
         kFcUi9mTNPcfbrx0aGbRhz6i7S3cnKyv+gVuCf5CHkONnvbu9Rj5XoMICnbwSAl9KLhH
         evwA==
X-Forwarded-Encrypted: i=1; AKwUvBzJlFod3RthvUXytFtFkvx7v4S8fK0pgzxyYLe5x19NdcswdKnQ2lwBU6h2uTe+d5Na1uWcWZg6CiGbGnyoLu2K@lists.infradead.org
X-Gm-Message-State: AFq9FYKQv3yKWqJa1caEtpQo5aKPQGZheSj7xQGMMEKQzPSAHgPAIU17
	y9MWc1mUGmpGNZKe005lYQNU/PBumB0BdLzL9vBAp0PATxJvnyAqXpB3UVZNOfsp
X-Gm-Gg: AYBFou3bVBPwLN0d/BaQwxq/7JKA2uUabqJKdb8m4fx+MN5kOqjUB8vcaKdjQLRBzmc
	dLl35xp0jQLzywpX0aP+tUKdJR9fxfZ2BeK+7ypYR7NOsOW+DWLlYh76aw1leYahjn99Tktxbqh
	kizsos0eJEDs4og8aQDgj3P1A48JH1AphZNbYXhchM8qPWufzw8Qkw7DblH+nur/4czheVMyeHz
	htUt+rhU2mZE1rwXflB8Z+zGcVfsje+QbkaTtuLVfaCESqgLNd6BrD1j0eudpDnr48eZdwyuXZ6
	qvKraBqvcwr/y4Ptz/R3SWZa3XG79KEO34ZX1YppZAA2LvE099ShtkP4LGGapwPLGhm/tBwrSvx
	u/ZEyY3wwL+6eFpiF7b1HIs3pkS7/Ls+rtNI5G/4y6Iyj9ltKSdquB4DwC05As9+b+7O+VhA9iK
	O1oJZPBNMUDQ+qCCgOV1jLXRS1+Y9+KvVTnUOPn+oJr2KyIH9GISIvB1JW7MXqNCUS1f5Gya/fq
	Sw9teNBKkvw+hnF4WhG3l/DoAL5NZTq1cOFZ3AOi6Y9VdAbJ5C6lvH7YtaNA7QfOrs5JGtnuUH/
	rZBo03Vp5qIsKA6Dtz1BbU9BHn4SwRwdntnG3zIeOoeDfZlZkR0Fjyl7ZslTtzX/gtOPvKhTx/2
	xA/D1c4EqW1ePRlJ3kSwlsa2MLMUle4IddQlOlvNKP/KPpDvn7XQw+awe9h/erXsFAAoG1zqMBU
	w7tYZb
X-Received: by 2002:a05:6871:878b:b0:4a7:443a:e6cd with SMTP id 586e51a60fabf-4a83f1d782amr611734fac.6.1792798716050;
        Fri, 23 Oct 2026 16:38:36 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a843225d69sm284345fac.15.2026.10.23.16.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:38:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 17:38:22 -0600
Subject: [PATCH v3 3/9] dmaengine: sun6i: take the device lock before the
 virtual channel lock
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-3-ef1acb0be768@gmail.com>
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
X-CRM114-CacheID: sfid-20261023_163837_298374_4FAC6246 
X-CRM114-Status: GOOD (  12.92  )
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

The pending queue is protected by sdev->lock, while virt-dma uses vc.lock
for descriptor lists and cookies. issue_pending() and resume() currently
take the device lock inside the virtual-channel lock when queueing work.

Take sdev->lock first in both paths, and inspect the physical-channel
assignment after acquiring the locks. This establishes the nesting order
needed to keep allocation and descriptor startup in one critical section.
virt-dma preparation, submission and callback processing continue to use
vc.lock independently.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 3a6525dd3d32..435d7daa1c0f 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -952,23 +952,24 @@ static int sun6i_dma_resume(struct dma_chan *chan)
 {
 	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
-	struct sun6i_pchan *pchan = vchan->phy;
+	struct sun6i_pchan *pchan;
 	unsigned long flags;
 
 	dev_dbg(dmaengine_chan_dev(chan), "vchan %p: resume\n", &vchan->vc);
 
-	spin_lock_irqsave(&vchan->vc.lock, flags);
+	spin_lock_irqsave(&sdev->lock, flags);
+	spin_lock(&vchan->vc.lock);
+	pchan = vchan->phy;
 
 	if (pchan) {
 		writel(DMA_CHAN_PAUSE_RESUME,
 		       pchan->base + DMA_CHAN_PAUSE);
 	} else if (!list_empty(&vchan->vc.desc_issued)) {
-		spin_lock(&sdev->lock);
 		list_add_tail(&vchan->node, &sdev->pending);
-		spin_unlock(&sdev->lock);
 	}
 
-	spin_unlock_irqrestore(&vchan->vc.lock, flags);
+	spin_unlock(&vchan->vc.lock);
+	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	return 0;
 }
@@ -1057,25 +1058,23 @@ static void sun6i_dma_issue_pending(struct dma_chan *chan)
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
 	unsigned long flags;
 
-	spin_lock_irqsave(&vchan->vc.lock, flags);
+	spin_lock_irqsave(&sdev->lock, flags);
+	spin_lock(&vchan->vc.lock);
 
 	if (vchan_issue_pending(&vchan->vc)) {
-		spin_lock(&sdev->lock);
-
 		if (!vchan->phy && list_empty(&vchan->node)) {
 			list_add_tail(&vchan->node, &sdev->pending);
 			tasklet_schedule(&sdev->task);
 			dev_dbg(dmaengine_chan_dev(chan), "vchan %p: issued\n",
 				&vchan->vc);
 		}
-
-		spin_unlock(&sdev->lock);
 	} else {
 		dev_dbg(dmaengine_chan_dev(chan), "vchan %p: nothing to issue\n",
 			&vchan->vc);
 	}
 
-	spin_unlock_irqrestore(&vchan->vc.lock, flags);
+	spin_unlock(&vchan->vc.lock);
+	spin_unlock_irqrestore(&sdev->lock, flags);
 }
 
 static void sun6i_dma_free_chan_resources(struct dma_chan *chan)

-- 
2.53.0


