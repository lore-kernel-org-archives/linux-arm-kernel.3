Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE999606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FFSxz/lP;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K4JwazR/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1yQ/0rpQtSurqJ4HUZaAl4IafV/ZYawzEihcKyUkvxo=; b=FFSxz/lP1Bs13l
	Isok9SO4iu+SbmGvJrLXEdY3qFyk/bMbxzIJ3t8ryVydH7mASJIJyuE8GCcLXtDM9nfKPo2ElNPEF
	pUqHIjP4QUQF3pJSheZMcQY+TySwr0+mIccajUWDsR/lOU1h49FSusR78Nil6y2HjjjQDxJWtwYQ7
	hVHRRqcQNCRtAc9A1h2d/HJTtsPxTl1yvzJES/zdYyt9EF2tjzXnFEZDXrMKwRgNTonwMkbvZT3Jv
	4KEBTuZCIs9viQC+WO48ZVVAPh7r3yvqqTZTyb88+aMZZgs05/hC7SPD6z6RX/n3KYGXZtkV26/0d
	MvQShVibeLa3AF5cWTVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNo0p-0000000Fvcu-2Sny;
	Mon, 02 Nov 2026 09:07:31 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNo0l-0000000FvWh-1iZx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 09:07:28 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so35104125e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 01:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793610445; x=1794215245; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1yQ/0rpQtSurqJ4HUZaAl4IafV/ZYawzEihcKyUkvxo=;
        b=K4JwazR/K421Bde9Tp1BT4WdMjogoCrUeeFGGtDwnIShj4JL8FBD045kAJVu1dSelV
         jsl3Z8JFW4gYL2RTEwoE1n7hGdb14DGYEe2H8/DqN8iNjCaNL7BTTWoraB9Mwb2gSWhN
         5sUD+gBtNUwSh/yqMQFS+CIpg0GOpx1vF+pAFlHhRKDS2MwDldl4B0zjoIYan8YOQX7t
         LXlIA1k6ZuMRm3+hxOVzI3dgF3rOf5kiEHaKiK8So+oHEyc/b4WidcyLOf7DhxOfm6PA
         O8v79IEPbcBdklsaEVDdDePrFK2HVGFzDxnUgKUIkS8eUwbrNxFnresD7SJLvMbm9vB7
         dtFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610445; x=1794215245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1yQ/0rpQtSurqJ4HUZaAl4IafV/ZYawzEihcKyUkvxo=;
        b=fiQZ+cgpz2DTmsKzEp1Jw3F5+mkvdR+avxoejPIJ5Tngj9+v3/0+MitZwMb9SLzVIP
         EpjHt/ySkEoMr6/55PuODx9VRnJwBFS8vYv889iibeM//j0D7hyzL5wY6dOccCWFNGTW
         kriHn31fvd1RzaNdyRSHuIJhETsdQkpPcOPreLQWzInmkrpKASY0FqgsWM5hRJa/DVS1
         8CvxVuMVabeeZc5J1NWU9qI2O87VlGtal/xHZ2NWxTKDaL2XwTrMc4DlJALjsqGm2emK
         QNXND305MYSOAoKYhBgNMpS+G1nTwRn1utKFSL7Vemdh1eebP71XQZfHJWe5RPgqHSJ0
         43UA==
X-Forwarded-Encrypted: i=1; AKwUvBzLm2qfYJaZx2FukQJSbPk/MpzHaam1vbsU12BF7yw0PIiAJviOSG33UCoK2/h4fyoAKneqAoUvNwfAb88N4xFS@lists.infradead.org
X-Gm-Message-State: AFq9FYIv3juWo2HtnB9YHG61hSM1VRzDtzua+vtwXse80dDrgdwhq8AA
	qxlAc8r9n/DifsFgjyNGGkw0KZcyY8sGtiCzdPmAFtFyzfXXUx63RCHN
X-Gm-Gg: AYBFou264Ygbo5nqk02NXFrdwO41tGun7/drbipK8d4b098kNRm82VuBTtQgaOf/4YY
	/7Oz0BUCKjabT3XDqn31xAGCfDowfyFtcFxffftsLIdBdeBx+W+E6IK21XII0F7MYE5lWbnZASk
	csjANHGR+c+Pc3/9AdxxlOacTJKjClRilX1xgQ2U2fdgi4gMCOU/ndyf9yAb8LIjwpkasznauP1
	PEHmIplK56rHOWBTLlEyWbMs5xKj0Bcyv04pV4QDIT6dNcpeBq6qdB2ToApLGrF1hDxi+w0dPfZ
	n104akLkTJoh64posPeW/IUNk6YCuSTk8SygFnW2j1ztLDWc3AMLIovK6Voh8Vg6qPkJoPl7of3
	SrYofupN6v+iNc8GuGhK5HMQlY5XWVZV6ghQuXwlIin0xNb0BUh4RNu8QBn/CpmuK0Gf/ctydo0
	A0O9iwP+M27RZ+Ml7qmqceB45XUBZZroStIB1tOU/TtpWzMMVPO2Csnmn6liE7fOvbmkcWY6USm
	taxM9zr1asFlXagkf0rUhPhwVSWkf1wvVI3/dKwaNr5JUopPHHadKlgToNR8j4/Bc4wD4eUWZLa
	nilLLJoskoVZZpC0QVHBUgzspjLrlHFGUvAelEUnqJxe0AEBYh5kM+tG88Cd2TSO60LoK0GNPqV
	oaklbc4rN4GwxkuTAMzFAQdGRWdZCqFScm8wcN50MEUfyW9j754Iet/ZLaaBgUpCOOPgx3Wv1lW
	tWKMMlRLhv/TPM
X-Received: by 2002:a05:600c:c87:b0:4a1:efbe:529c with SMTP id 5b1f17b1804b1-4ac17567fe1mr224765855e9.12.1793610445186;
        Mon, 02 Nov 2026 01:07:25 -0800 (PST)
Received: from cypher.home.roving-it.com ([2001:8b0:fb11:0:3889:86e0:d449:e2e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm417879945e9.3.2026.11.02.01.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:07:24 -0800 (PST)
From: Peter Robinson <pbrobinson@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH 3/9] dmaengine: bcm2835: Support controllers split across several nodes
Date: Mon,  2 Nov 2026 09:06:53 +0000
Message-ID: <20261102090713.896324-4-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102090713.896324-1-pbrobinson@gmail.com>
References: <20261102090713.896324-1-pbrobinson@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_010727_476391_8B3E45A6 
X-CRM114-Status: GOOD (  20.44  )
X-Spam-Score: -2.1 (--)
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

Derive the index of the first channel from the register resource and
only probe the channels it covers, so a controller can be described by
several nodes. Initialise all IRQ slots, as the shared IRQ check scans
the whole array.

Existing device trees start at channel 0 and are unaffected.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/dma/bcm2835-dma.c | 34 +++++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 96a39eb24559f..83ad8815759e8 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -52,12 +52,14 @@ struct bcm2835_dma_cfg {
  * @zero_page: bus address of zero page (to detect transactions copying from
  *	zero page and avoid accessing memory if so)
  * @cfg: SoC specific controller properties
+ * @first_chan: hardware index of the first channel covered by @base
  */
 struct bcm2835_dmadev {
 	struct dma_device ddev;
 	void __iomem *base;
 	dma_addr_t zero_page;
 	const struct bcm2835_dma_cfg *cfg;
+	unsigned int first_chan;
 };
 
 struct bcm2835_dma_cb {
@@ -175,8 +177,8 @@ struct bcm2835_desc {
 #define BCM2835_DMA_DATA_TYPE_S128	16
 
 /* Valid only for channels 0 - 14, 15 has its own base address */
-#define BCM2835_DMA_CHAN(n)	((n) << 8) /* Base address */
-#define BCM2835_DMA_CHANIO(base, n) ((base) + BCM2835_DMA_CHAN(n))
+#define BCM2835_DMA_CHAN_SIZE	0x100
+#define BCM2835_DMA_CHAN(n)	((n) * BCM2835_DMA_CHAN_SIZE) /* Base address */
 
 /* the max dma length for different channels */
 #define MAX_DMA_LEN SZ_1G
@@ -886,7 +888,7 @@ static int bcm2835_dma_chan_init(struct bcm2835_dmadev *d, int chan_id,
 	c->vc.desc_free = bcm2835_dma_desc_free;
 	vchan_init(&c->vc, &d->ddev);
 
-	c->chan_base = BCM2835_DMA_CHANIO(d->base, chan_id);
+	c->chan_base = d->base + BCM2835_DMA_CHAN(chan_id - d->first_chan);
 	c->ch = chan_id;
 	c->irq_number = irq;
 	c->irq_flags = irq_flags;
@@ -960,6 +962,7 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 {
 	const struct bcm2835_dma_cfg *cfg;
 	struct bcm2835_dmadev *od;
+	struct resource *res;
 	void __iomem *base;
 	int rc;
 	int i, j;
@@ -967,6 +970,7 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 	int irq_flags;
 	uint32_t chans_available;
 	char chan_name[BCM2835_DMA_CHAN_NAME_SIZE];
+	unsigned int chan_start, chan_end;
 
 	cfg = of_device_get_match_data(&pdev->dev);
 	if (!cfg)
@@ -987,12 +991,18 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 
 	dma_set_max_seg_size(&pdev->dev, 0x3FFFFFFF);
 
-	base = devm_platform_ioremap_resource(pdev, 0);
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
+	chan_start = (res->start / BCM2835_DMA_CHAN_SIZE) & 0xf;
+	chan_end = min_t(unsigned int,
+			 chan_start + resource_size(res) / BCM2835_DMA_CHAN_SIZE,
+			 BCM2835_DMA_MAX_DMA_CHAN_SUPPORTED + 1);
+
 	od->base = base;
 	od->cfg = cfg;
+	od->first_chan = chan_start;
 
 	dma_cap_set(DMA_SLAVE, od->ddev.cap_mask);
 	dma_cap_set(DMA_PRIVATE, od->ddev.cap_mask);
@@ -1037,12 +1047,13 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 	}
 
 	/* get irqs for each channel that we support */
-	for (i = 0; i <= BCM2835_DMA_MAX_DMA_CHAN_SUPPORTED; i++) {
+	for (i = 0; i <= BCM2835_DMA_MAX_DMA_CHAN_SUPPORTED; i++)
+		irq[i] = -1;
+
+	for (i = chan_start; i < chan_end; i++) {
 		/* skip masked out channels */
-		if (!(chans_available & (1 << i))) {
-			irq[i] = -1;
+		if (!(chans_available & (1 << i)))
 			continue;
-		}
 
 		/* get the named irq */
 		snprintf(chan_name, sizeof(chan_name), "dma%i", i);
@@ -1057,11 +1068,11 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 		 * in case of channel >= 11
 		 * use the 11th interrupt and that is shared
 		 */
-		irq[i] = platform_get_irq(pdev, i < 11 ? i : 11);
+		irq[i] = platform_get_irq(pdev, min(i - chan_start, 11U));
 	}
 
 	/* get irqs for each channel */
-	for (i = 0; i <= BCM2835_DMA_MAX_DMA_CHAN_SUPPORTED; i++) {
+	for (i = chan_start; i < chan_end; i++) {
 		/* skip channels without irq */
 		if (irq[i] < 0)
 			continue;
@@ -1080,7 +1091,8 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 			goto err_no_dma;
 	}
 
-	dev_dbg(&pdev->dev, "Initialized %i DMA channels\n", i);
+	dev_dbg(&pdev->dev, "Initialized DMA channels %u-%u\n", chan_start,
+		chan_end - 1);
 
 	/* Device-tree DMA controller registration */
 	rc = of_dma_controller_register(pdev->dev.of_node,
-- 
2.56.0


