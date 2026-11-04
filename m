Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510B0606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 06:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dGuYwINa;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=suNbsxl7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=lYAY31DLg1K8Ctq3iMNb+HOdz/jkumjLa2+Nxs3EUCs=; b=dGuYwINaojLakFflcyDHmGsYvM
	ER6QhmsAObsqCFlxE6ovpAy+2oGryQkdlZcit3uFgk3T5RCjQqc8JfzPCg3rSYPT97TgBApg3BPUG
	cfvQIf8WdZIpvYW2ICejdmVFCOqhMZVOEbMiGjjPWvWocNNWpwtCTnDc/At/pbcFezrw8lbOBFn9H
	fS3c2RhmshV0+QItc/TzKzVL6fXFuNGS2izHVAchGLQkXq6VJmYJTrAQKylu+OgeaUbycOdY0x3Rk
	SXRmx4Citf8NBHSH1Pb8J3kT2hBDy42kRCi7Dg1AZLg4hoZUmAa3UXzg6hancDnW1ny5somvBME3A
	5OL4v+/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOURg-00000004Pcf-3b62;
	Wed, 04 Nov 2026 06:26:04 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOURe-00000004PcF-2utb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 06:26:04 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-55e0090c580so138772b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 22:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793773561; x=1794378361; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lYAY31DLg1K8Ctq3iMNb+HOdz/jkumjLa2+Nxs3EUCs=;
        b=suNbsxl7AZjqJuofW/sJl5HblzpHTUd3X0ygHeVzITsUNaonlLG7a8cU7YuqV1P5/j
         HyO9gZMThsozwVaat3eZdhaIgNn5VjNv9+69MZyyqWljIDInfJj8MxhEigYvIrHP7eov
         344vORe1EL+1BB9lFxlkjHt2LdalFfysAfmJZKe8m7/a40j/Mkd0bAXi8BMUc7FZKPRu
         ByPf8MU6r5KqwoxM8Mp1iYZNV4fYgkeCfbETYBaoudnu8dCVyl3j9sMLLp7moXQlM7iH
         DT8dlJ7bd0/JW3Iorn3BphLkJ7zmjKOoz3LOKBHbdnAdtD/pnm/mvJHzLgX93z0iLMHp
         ZnfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793773561; x=1794378361;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lYAY31DLg1K8Ctq3iMNb+HOdz/jkumjLa2+Nxs3EUCs=;
        b=15MXTp/6/vCp4VCihWkfYfvrGXZNq46KuVriaoNSEqq8FrlRDEoIoW01j3WkRKGoOB
         Kca306i5uUXd84C1Kigre7AuLFr6QZJLWvuuOfwgDNGLCcb6bVbqsM7pOWDQXuKRWtBT
         2A9psBPETqbHXQBV9yWzRJv5g0B8HSTvkvRvbEnhx0ZDQHF/RtgJIb4XaTY7iFOdcQ/m
         kdZgLT4dqxPbw2+0+9fL+Xc0VPT0fqEQYrTeuKRQXQGDhelV8NzJFL7Kg1umbZ5twJRn
         v2/dXO5mNHIXqjdsESb0aYBsrBTNMO499RgVZUlgJi08LszST1rVvN99nmCu8srYIqm4
         EZag==
X-Forwarded-Encrypted: i=1; AKwUvBydG6X1rqZ6RkUchyk0Hw6goTwMC4oS1HzcBEDtnxy6nKzobZsvYxg4UIj4UUJ13vWIScF59gO/VBpO5z41oN6t@lists.infradead.org
X-Gm-Message-State: APuU4Z9d25nJCraDd/qRb1EdYWzMfODMVCpNz0eGkdqyP1G4hHg80vX5
	ypRV/ia31JTdcWZ9GdeySLIGQpJknFjXJgKB3CMPcp0R0TDLL1Nwll2j
X-Gm-Gg: AYBFou2oVH7UNvHdQeqxPhf0bzRHrPPjSGu3KW+75g9vTxRyUvR4qZeGxma/feutJf5
	tEq/jaaCYvDeKWfxQRKO3+WORqYL367xYhDYdyoOni740YAgI+Zjy5RErjv7sFKq9gk2qbQ8BuG
	1RriKXLrzafSr2P55rd2ag1zFnNM9s/vBTGpNCLcMvGrujFIksz5jAHZkWVVipRW8Dc7CqotAN/
	FQNFdbjtCor7d8ruqgCYr53OEXdpQVj2r8M+IgJoBcuLzAOcI8A2eDU0Al/lm/PU1qmzFakk9Vm
	kgmVe/ioLvztkT88hNR/seoNgylacu7MB9pp9Q6BVTj7wmTqEChq5A/Uca4ZzVuwFl3JGDIEAoq
	DQSvqM34ZTHqxWFQuDBpn+2DJsGRH7Hhpq/fisDg6ryhAuRrXeeqSiNnP+3cIXS4+xkRqnyJIkG
	pI0eMBIZpYNsYlxgvAfkthQ23eXXvUbRb90eO/eFoKZ7cYEYP+/c34VT/Hv+zfU1GQZtbcBCTY8
	pYB3rsKJMSGfsG6P/ATqjC/BEr1NaiD803ivrWkqnmcAojVMFwjODWpqBkPXOSysfYu6oCfqo2r
	Ye9kwSU8okmfGtXnBw9qfHa3MNBS1R90qaysYSw7QTVAY/U93H2HzEo6O4yFDonmmT/rGydc2Gb
	39gJ6ZO15rdzxkvmwNwxpZX0NbpDL03oYuVOMndgTFqVNKLr40CeKJiXoVYWuRp/yRVhTLCnOjI
	Yh5BtFNLpEPcwgeX2VF40XJRyqzVfs29VPavddbTXeR+0HAExZmb8E
X-Received: by 2002:a05:6808:4fcc:b0:4e7:c6f2:75a6 with SMTP id 5614622812f47-5640deafdb6mr12232306b6e.68.1793773561572;
        Tue, 03 Nov 2026 22:26:01 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9ef58b1sm956795b6e.3.2026.11.03.22.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 22:26:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 23:25:58 -0700
Subject: [PATCH] dmaengine: sun4i: retain cyclic descriptors until
 callbacks drain
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-submit-sun4i-dma-callback-lifetime-v1-v1-1-4c5a0653104f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQ7CIBCF4as0s3YSBg1Gr2JcAB10FNAANiZN7
 16qq5dv878ZKhfhCudhhsKTVHnlDtoN4O823xhl7AattCFSe6wfl6T1yQfBMVn0NkZn/ROjBG6
 SGCdCZ+iklVHuaAL01rtwkO/v53L9u4ce7NsWh2VZAXMhtUGJAAAA
X-Change-ID: 20261103-submit-sun4i-dma-callback-lifetime-v1-b6192060b76f
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
 Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_222602_756109_19AB1150 
X-CRM114-Status: GOOD (  21.79  )
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

A cyclic IRQ queues a virt-dma tasklet with a pointer to the active
descriptor. sun4i_dma_terminate_all() frees it without clearing the queued
cyclic callback or waiting for one which has already started. The tasklet
can subsequently access the freed descriptor. There is no
device_synchronize callback to let clients drain these callbacks before
releasing their own resources either.

Serialize both half-transfer and end-transfer IRQ handling with termination
under the virtual-channel lock. Recheck the physical-channel association
after acquiring that lock so an IRQ which looked up the channel before
termination cannot use its detached transfer state.

Move terminated cyclic descriptors to the virt-dma terminated list. This
clears any pending cyclic callback. Retain them until a new synchronize
callback has waited for the IRQ handler and drained the tasklet. Drain
callbacks before freeing channel resources as well. Termination itself
remains usable from atomic context and from a completion callback.

Keep freeing other collected descriptors immediately: an in-flight
non-cyclic callback owns its descriptor on the tasklet's private list.

Fixes: b096c1377d1e ("dmaengine: sun4i: Add support for the DMA engine on sun[457]i SoCs")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun4i-dma.c | 46 +++++++++++++++++++++++++++++++++++-----------
 1 file changed, 35 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/sun4i-dma.c b/drivers/dma/sun4i-dma.c
index 225e4a53502b..b92cd9c8676e 100644
--- a/drivers/dma/sun4i-dma.c
+++ b/drivers/dma/sun4i-dma.c
@@ -293,10 +293,20 @@ static int convert_buswidth(enum dma_slave_buswidth addr_width)
 	return (addr_width >> 1);
 }
 
+static void sun4i_dma_synchronize(struct dma_chan *chan)
+{
+	struct sun4i_dma_dev *priv = to_sun4i_dma_dev(chan->device);
+	struct sun4i_dma_vchan *vchan = to_sun4i_dma_vchan(chan);
+
+	synchronize_irq(priv->irq);
+	vchan_synchronize(&vchan->vc);
+}
+
 static void sun4i_dma_free_chan_resources(struct dma_chan *chan)
 {
 	struct sun4i_dma_vchan *vchan = to_sun4i_dma_vchan(chan);
 
+	sun4i_dma_synchronize(chan);
 	vchan_free_chan_resources(&vchan->vc);
 }
 
@@ -322,7 +332,7 @@ static struct sun4i_dma_pchan *find_and_use_pchan(struct sun4i_dma_dev *priv,
 	spin_lock_irqsave(&priv->lock, flags);
 	for_each_clear_bit_from(i, priv->pchans_used, max) {
 		pchan = &pchans[i];
-		pchan->vchan = vchan;
+		WRITE_ONCE(pchan->vchan, vchan);
 		set_bit(i, priv->pchans_used);
 		break;
 	}
@@ -339,7 +349,7 @@ static void release_pchan(struct sun4i_dma_dev *priv,
 
 	spin_lock_irqsave(&priv->lock, flags);
 
-	pchan->vchan = NULL;
+	WRITE_ONCE(pchan->vchan, NULL);
 	clear_bit(nr, priv->pchans_used);
 
 	spin_unlock_irqrestore(&priv->lock, flags);
@@ -970,13 +980,13 @@ static int sun4i_dma_terminate_all(struct dma_chan *chan)
 {
 	struct sun4i_dma_dev *priv = to_sun4i_dma_dev(chan->device);
 	struct sun4i_dma_vchan *vchan = to_sun4i_dma_vchan(chan);
-	struct sun4i_dma_pchan *pchan = vchan->pchan;
+	struct sun4i_dma_pchan *pchan;
+	struct virt_dma_desc *vd, *tmp;
 	LIST_HEAD(head);
 	unsigned long flags;
 
 	spin_lock_irqsave(&vchan->vc.lock, flags);
-	vchan_get_all_descriptors(&vchan->vc, &head);
-	spin_unlock_irqrestore(&vchan->vc.lock, flags);
+	pchan = vchan->pchan;
 
 	/*
 	 * Clearing the configuration register will halt the pchan. Interrupts
@@ -991,10 +1001,20 @@ static int sun4i_dma_terminate_all(struct dma_chan *chan)
 		release_pchan(priv, pchan);
 	}
 
-	spin_lock_irqsave(&vchan->vc.lock, flags);
 	/* Clear these so the vchan is usable again */
 	vchan->processing = NULL;
 	vchan->pchan = NULL;
+	vchan->contract = NULL;
+
+	/* A tasklet may already be using the active cyclic descriptor. */
+	vchan_get_all_descriptors(&vchan->vc, &head);
+	list_for_each_entry_safe(vd, tmp, &head, node) {
+		if (!to_sun4i_dma_contract(vd)->is_cyclic)
+			continue;
+
+		list_del(&vd->node);
+		vchan_terminate_vdesc(vd);
+	}
 	spin_unlock_irqrestore(&vchan->vc.lock, flags);
 
 	vchan_dma_desc_free_list(&vchan->vc, &head);
@@ -1128,9 +1148,15 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
 
 	for_each_set_bit(bit, &pendirq, 32) {
 		pchan = &pchans[bit >> 1];
-		vchan = pchan->vchan;
+		vchan = READ_ONCE(pchan->vchan);
 		if (!vchan) /* a terminated channel may still interrupt */
 			continue;
+
+		spin_lock(&vchan->vc.lock);
+		if (vchan->pchan != pchan || !vchan->processing) {
+			spin_unlock(&vchan->vc.lock);
+			continue;
+		}
 		contract = vchan->contract;
 
 		/*
@@ -1138,8 +1164,6 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
 		 * interrupt (odd bit)
 		 */
 		if (bit & 1) {
-			spin_lock(&vchan->vc.lock);
-
 			/*
 			 * Move the promise into the completed list now that
 			 * we're done with it
@@ -1173,8 +1197,6 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
 				disableirqs |= BIT(bit);
 				release_pchan(priv, pchan);
 			}
-
-			spin_unlock(&vchan->vc.lock);
 		} else {
 			/* Half done interrupt */
 			if (contract->is_cyclic)
@@ -1182,6 +1204,7 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
 			else
 				disableirqs |= BIT(bit);
 		}
+		spin_unlock(&vchan->vc.lock);
 	}
 
 	/* Disable the IRQs for events we handled */
@@ -1276,6 +1299,7 @@ static int sun4i_dma_probe(struct platform_device *pdev)
 	priv->slave.device_prep_dma_cyclic	= sun4i_dma_prep_dma_cyclic;
 	priv->slave.device_config		= sun4i_dma_config;
 	priv->slave.device_terminate_all	= sun4i_dma_terminate_all;
+	priv->slave.device_synchronize	= sun4i_dma_synchronize;
 	priv->slave.copy_align			= 2;
 	priv->slave.src_addr_widths		= BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
 						  BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261103-submit-sun4i-dma-callback-lifetime-v1-b6192060b76f

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


