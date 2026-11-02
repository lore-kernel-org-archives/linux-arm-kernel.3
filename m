Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BC5606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T/A+AKYC;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vAxPTQtN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pjQYiZHz51mTKQDhEApm7WTzFAH0CZ0oe9+OyBtnarM=; b=T/A+AKYC77Sc7R
	DSpclGw3mbLSfFG18dVd+9DB3c5PCQmuFIw8eECtbhdSFcw6AAz/bCVxACgYXM8V9/ZoqMKcauWkN
	oIwk3J5eZCk7dSrZWwk8l4IRHf61wNPf1gGZ5r+pZu9ac8Zb5z+mTCigV6lBAWU957uCWyaJPyRad
	U/+w+vJ5ZJYxhVcjSxmYjnpXSsiLkLwbphry/1lCLtytPmoLdvWGeVfsk9GqPMJyuHGp8Cd4sIKVo
	TYklbRRpA2nDwC1g+H8izKxZVnNlYkKPUC4jwWHqVHAqT/MC1Ev0n8ICCod4/e28O40KqPkJeW1kh
	u9o5izR/5evIfQtp1cNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNo0o-0000000FvaN-0LTO;
	Mon, 02 Nov 2026 09:07:30 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNo0j-0000000FvUw-0Z7R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 09:07:27 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a210470b49so21598745e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 01:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793610443; x=1794215243; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pjQYiZHz51mTKQDhEApm7WTzFAH0CZ0oe9+OyBtnarM=;
        b=vAxPTQtNF8a2J/y9w0MofY38qpPINkyN6PupEDWu0wpUaVsusMvl2azqtrfP5HDcMy
         9rV78JVCo01iyFIXVtFU5zjzQn3wWtdDiLeXG0rvpaRJPE2MYHk3g/JfkY65KSgU1kB6
         1KdvZX0lK6XcHgNMcVI1SfqZXaIywqshOClfd31B8afsz7E6s7rpK+Xrcp8b/2hTSBQz
         YHScGNYScl+/dXwMHQm94o5NCxZEE+jbkvrTNeCqAXGm/wYidAQOiEDw24mAVimkiw32
         xRhQftU5dQtNKva5T2/L2WR/BHdxyPPJ5cETRjJni7GgKYUFxTZFEqJjGZvbVgiv6QJ2
         +/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610443; x=1794215243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pjQYiZHz51mTKQDhEApm7WTzFAH0CZ0oe9+OyBtnarM=;
        b=gtyowMxsC991c5R+B//+zSFHXFuPOjjMS5eo8TEjF3w30GHpY+5sCCnhGA2qOO9cfV
         qUIYLk/UWfwSHDuJIPvyn05NR13xP8bDaAJO3qQ7ui5p3XqOBHlwOaVDAlhiK35asJEB
         KisvySqJSt/9k4P74V+bhPTm3rlPWjHdVsqde2zYp7abd8kpW0zAHPtBPBOCjjgvoVoF
         wKhS1nxLNVr+9ZI9lRf4z8gWRFl0TP2IiIePwV7KKl/C4e8T2LdfGK8LrKIVg63IAjJb
         H8o2EVhrA6uppSyIos2kfnREn+ttzy+2QC/JnhvIpvcN8f0VxBgSJ5lnNi0gkngH+3DU
         vuWg==
X-Forwarded-Encrypted: i=1; AKwUvBzVdAYKOc24GaOIGR93+4fnRRs/GP71+YZRecN7wCV/9FiuTMTCcT8sGJ6f0oAF3e0dX6mTYfYxGn1cOEoUO+yg@lists.infradead.org
X-Gm-Message-State: AFq9FYJeU6qu6WKDXCskngczfmL380cM9wlgmli1vGI7J7uZ5PRT9Vo1
	3wsGmjwICM0UCwgCFICEqQgHPX4etLlmsx7Uz7gACSFpuCWBiXrCQWPv
X-Gm-Gg: AYBFou18JG4bekIFFIfZSlp6Qgj5xP7v7L3yqNynYz7k0tORjK4Bj5StG1MLs84P3TG
	O4Ka4Yr2IPGO65mzVuowR/5j4XjugY+ApYAiygNFmlU6F+mKxbwkqqHwB7GlcFokv5WaTNi2rgq
	R4gduTSoz4+wEJq5tMmKuhe1VV9UYxm/yrKxzq5ZcvcC5vL4KocCfg2REfCIPIMA6AJtu3X5FUg
	d3vGlJAiHBOkD5quddZ+HJwbmK6KpVgKOiwtdIYZHwk+PgR0SdKZpKs8xKKjA+8QvaMCHLAOkwA
	OsVVceaXShq0wT8m0DfPd9mR5yGMVOkXgTHAH/wEwPN/GGuX0ZxyRmRfa5O5shm1QB1sZwyYH+9
	fIrawJXN0GR6kuKpB3+i7fzw7mKW8VnxqCRbL22Bq2Or5aTS23SWksFNvDooGw9uwuUgRrdxrEU
	pa0I8opCk5C4qpJG15xCeye0b2pXJ+S5HF8gqxw3ETcjFNZqBjKxtS5pjsiNKqmbkVQxPNnBDb7
	EdHnQTROB7PLe/dMiAQMy5SI/GZCCunyJjrdFavlL+ZRUm4gxMucoZ0AdhI4fjU9FG6Cm0kpn9l
	H0mMlGRscLo+meJrtEu011kmkocYaX6wQdeEtlPdpJcqAcmiNOsPzFfE4gzBaePW0kK/Bz/uzOQ
	J084bXLwSyKIkqygM1Yh74fCCS9y82UsjG/f9fkGzCBm9a5EamCtfZHTEa4Q4U4SP5ZpTTC0qRJ
	N0QSTKHNYXcMbh
X-Received: by 2002:a05:600c:a41:b0:4a0:1c0e:b057 with SMTP id 5b1f17b1804b1-4ac150b2136mr201903515e9.4.1793610442989;
        Mon, 02 Nov 2026 01:07:22 -0800 (PST)
Received: from cypher.home.roving-it.com ([2001:8b0:fb11:0:3889:86e0:d449:e2e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm417879945e9.3.2026.11.02.01.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:07:22 -0800 (PST)
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
Subject: [PATCH 2/9] dmaengine: bcm2835: Refactor control block handling
Date: Mon,  2 Nov 2026 09:06:52 +0000
Message-ID: <20261102090713.896324-3-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102090713.896324-1-pbrobinson@gmail.com>
References: <20261102090713.896324-1-pbrobinson@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_010725_262710_4CB9B80A 
X-CRM114-Status: GOOD (  26.01  )
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

Access control blocks through small helpers and pass struct
bcm2835_chan to the internal chain builders, and add per-compatible
match data holding the DMA mask. This prepares for channels with a
different control block layout.

No functional change.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/dma/bcm2835-dma.c | 185 +++++++++++++++++++++++++++-----------
 1 file changed, 134 insertions(+), 51 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 06d830d368822..96a39eb24559f 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -37,17 +37,27 @@
 #define BCM2835_DMA_MAX_DMA_CHAN_SUPPORTED 14
 #define BCM2835_DMA_CHAN_NAME_SIZE 8
 
+/**
+ * struct bcm2835_dma_cfg - SoC specific controller properties
+ * @dma_mask: addressing capability of the controller
+ */
+struct bcm2835_dma_cfg {
+	u64 dma_mask;
+};
+
 /**
  * struct bcm2835_dmadev - BCM2835 DMA controller
  * @ddev: DMA device
  * @base: base address of register map
  * @zero_page: bus address of zero page (to detect transactions copying from
  *	zero page and avoid accessing memory if so)
+ * @cfg: SoC specific controller properties
  */
 struct bcm2835_dmadev {
 	struct dma_device ddev;
 	void __iomem *base;
 	dma_addr_t zero_page;
+	const struct bcm2835_dma_cfg *cfg;
 };
 
 struct bcm2835_dma_cb {
@@ -172,6 +182,10 @@ struct bcm2835_desc {
 #define MAX_DMA_LEN SZ_1G
 #define MAX_LITE_DMA_LEN (SZ_64K - 4)
 
+static const struct bcm2835_dma_cfg bcm2835_dma_cfg = {
+	.dma_mask = DMA_BIT_MASK(32),
+};
+
 static inline size_t bcm2835_dma_max_frame_length(struct bcm2835_chan *c)
 {
 	/* lite and normal channels have different max frame length */
@@ -201,6 +215,76 @@ static inline struct bcm2835_desc *to_bcm2835_dma_desc(
 	return container_of(t, struct bcm2835_desc, vd.tx);
 }
 
+static void bcm2835_dma_cb_set_src(struct bcm2835_chan *c,
+				   struct bcm2835_cb_entry *e, dma_addr_t addr)
+{
+	e->cb->src = addr;
+}
+
+static void bcm2835_dma_cb_set_dst(struct bcm2835_chan *c,
+				   struct bcm2835_cb_entry *e, dma_addr_t addr)
+{
+	e->cb->dst = addr;
+}
+
+static void bcm2835_dma_cb_init(struct bcm2835_chan *c,
+				struct bcm2835_cb_entry *e, u32 info,
+				dma_addr_t src, dma_addr_t dst)
+{
+	struct bcm2835_dma_cb *cb = e->cb;
+
+	cb->info = info;
+	cb->length = 0;
+	cb->stride = 0;
+	cb->next = 0;
+
+	bcm2835_dma_cb_set_src(c, e, src);
+	bcm2835_dma_cb_set_dst(c, e, dst);
+}
+
+static u32 bcm2835_dma_cb_get_len(struct bcm2835_chan *c,
+				  struct bcm2835_cb_entry *e)
+{
+	return e->cb->length;
+}
+
+static void bcm2835_dma_cb_set_len(struct bcm2835_chan *c,
+				   struct bcm2835_cb_entry *e, u32 len)
+{
+	e->cb->length = len;
+}
+
+static void bcm2835_dma_cb_add_info(struct bcm2835_chan *c,
+				    struct bcm2835_cb_entry *e, u32 info)
+{
+	e->cb->info |= info;
+}
+
+static void bcm2835_dma_cb_set_next(struct bcm2835_chan *c,
+				    struct bcm2835_cb_entry *e,
+				    dma_addr_t next)
+{
+	e->cb->next = next;
+}
+
+/* Memory side address of a control block */
+static dma_addr_t bcm2835_dma_cb_mem_addr(struct bcm2835_chan *c,
+					  struct bcm2835_cb_entry *e,
+					  enum dma_transfer_direction dir)
+{
+	return dir == DMA_DEV_TO_MEM ? e->cb->dst : e->cb->src;
+}
+
+static dma_addr_t bcm2835_dma_get_pos(struct bcm2835_chan *c,
+				      enum dma_transfer_direction dir)
+{
+	void __iomem *base = c->chan_base;
+
+	if (dir == DMA_DEV_TO_MEM)
+		return readl(base + BCM2835_DMA_DEST_AD);
+	return readl(base + BCM2835_DMA_SOURCE_AD);
+}
+
 static void bcm2835_dma_free_cb_chain(struct bcm2835_desc *desc)
 {
 	size_t i;
@@ -220,16 +304,18 @@ static void bcm2835_dma_desc_free(struct virt_dma_desc *vd)
 
 static void bcm2835_dma_create_cb_set_length(
 	struct bcm2835_chan *chan,
-	struct bcm2835_dma_cb *control_block,
+	struct bcm2835_cb_entry *cb_entry,
 	size_t len,
 	size_t period_len,
 	size_t *total_len,
 	u32 finalextrainfo)
 {
 	size_t max_len = bcm2835_dma_max_frame_length(chan);
+	u32 cb_len;
 
 	/* set the length taking lite-channel limitations into account */
-	control_block->length = min_t(u32, len, max_len);
+	cb_len = min_t(u32, len, max_len);
+	bcm2835_dma_cb_set_len(chan, cb_entry, cb_len);
 
 	/* finished if we have no period_length */
 	if (!period_len)
@@ -244,26 +330,26 @@ static void bcm2835_dma_create_cb_set_length(
 	 */
 
 	/* have we filled in period_length yet? */
-	if (*total_len + control_block->length < period_len) {
+	if (*total_len + cb_len < period_len) {
 		/* update number of bytes in this period so far */
-		*total_len += control_block->length;
+		*total_len += cb_len;
 		return;
 	}
 
 	/* calculate the length that remains to reach period_length */
-	control_block->length = period_len - *total_len;
+	bcm2835_dma_cb_set_len(chan, cb_entry, period_len - *total_len);
 
 	/* reset total_length for next period */
 	*total_len = 0;
 
 	/* add extrainfo bits in info */
-	control_block->info |= finalextrainfo;
+	bcm2835_dma_cb_add_info(chan, cb_entry, finalextrainfo);
 }
 
 /**
  * bcm2835_dma_create_cb_chain - create a control block and fills data in
  *
- * @chan:           the @dma_chan for which we run this
+ * @c:              the channel for which we run this
  * @direction:      the direction in which we transfer
  * @cyclic:         it is a cyclic transfer
  * @info:           the default info bits to apply per controlblock
@@ -281,17 +367,16 @@ static void bcm2835_dma_create_cb_set_length(
  * @gfp:            the GFP flag to use for allocation
  */
 static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
-	struct dma_chan *chan, enum dma_transfer_direction direction,
+	struct bcm2835_chan *c, enum dma_transfer_direction direction,
 	bool cyclic, u32 info, u32 finalextrainfo, size_t frames,
 	dma_addr_t src, dma_addr_t dst, size_t buf_len,
 	size_t period_len, gfp_t gfp)
 {
-	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	size_t len = buf_len, total_len;
 	size_t frame;
 	struct bcm2835_desc *d;
 	struct bcm2835_cb_entry *cb_entry;
-	struct bcm2835_dma_cb *control_block;
+	u32 cb_len;
 
 	if (!frames)
 		return NULL;
@@ -317,40 +402,38 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 			goto error_cb;
 
 		/* fill in the control block */
-		control_block = cb_entry->cb;
-		control_block->info = info;
-		control_block->src = src;
-		control_block->dst = dst;
-		control_block->stride = 0;
-		control_block->next = 0;
+		bcm2835_dma_cb_init(c, cb_entry, info, src, dst);
+
 		/* set up length in control_block if requested */
 		if (buf_len) {
 			/* calculate length honoring period_length */
 			bcm2835_dma_create_cb_set_length(
-				c, control_block,
+				c, cb_entry,
 				len, period_len, &total_len,
 				cyclic ? finalextrainfo : 0);
-
-			/* calculate new remaining length */
-			len -= control_block->length;
 		}
+		cb_len = bcm2835_dma_cb_get_len(c, cb_entry);
+
+		/* calculate new remaining length */
+		len -= cb_len;
 
 		/* link this the last controlblock */
 		if (frame)
-			d->cb_list[frame - 1].cb->next = cb_entry->paddr;
+			bcm2835_dma_cb_set_next(c, &d->cb_list[frame - 1],
+						cb_entry->paddr);
 
 		/* update src and dst and length */
 		if (src && (info & BCM2835_DMA_S_INC))
-			src += control_block->length;
+			src += cb_len;
 		if (dst && (info & BCM2835_DMA_D_INC))
-			dst += control_block->length;
+			dst += cb_len;
 
 		/* Length of total transfer */
-		d->size += control_block->length;
+		d->size += cb_len;
 	}
 
 	/* the last frame requires extra flags */
-	d->cb_list[d->frames - 1].cb->info |= finalextrainfo;
+	bcm2835_dma_cb_add_info(c, &d->cb_list[d->frames - 1], finalextrainfo);
 
 	/* detect a size mismatch */
 	if (buf_len && (d->size != buf_len))
@@ -364,14 +447,13 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 }
 
 static void bcm2835_dma_fill_cb_chain_with_sg(
-	struct dma_chan *chan,
+	struct bcm2835_chan *c,
 	enum dma_transfer_direction direction,
 	struct bcm2835_cb_entry *cb,
 	struct scatterlist *sgl,
 	unsigned int sg_len)
 {
-	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
-	size_t len, max_len;
+	size_t len, max_len, cb_len;
 	unsigned int i;
 	dma_addr_t addr;
 	struct scatterlist *sgent;
@@ -380,12 +462,13 @@ static void bcm2835_dma_fill_cb_chain_with_sg(
 	for_each_sg(sgl, sgent, sg_len, i) {
 		for (addr = sg_dma_address(sgent), len = sg_dma_len(sgent);
 		     len > 0;
-		     addr += cb->cb->length, len -= cb->cb->length, cb++) {
+		     addr += cb_len, len -= cb_len, cb++) {
 			if (direction == DMA_DEV_TO_MEM)
-				cb->cb->dst = addr;
+				bcm2835_dma_cb_set_dst(c, cb, addr);
 			else
-				cb->cb->src = addr;
-			cb->cb->length = min(len, max_len);
+				bcm2835_dma_cb_set_src(c, cb, addr);
+			cb_len = min(len, max_len);
+			bcm2835_dma_cb_set_len(c, cb, cb_len);
 		}
 	}
 }
@@ -524,14 +607,9 @@ static size_t bcm2835_dma_desc_size_pos(struct bcm2835_desc *d, dma_addr_t addr)
 	size_t size;
 
 	for (size = i = 0; i < d->frames; i++) {
-		struct bcm2835_dma_cb *control_block = d->cb_list[i].cb;
-		size_t this_size = control_block->length;
-		dma_addr_t dma;
-
-		if (d->dir == DMA_DEV_TO_MEM)
-			dma = control_block->dst;
-		else
-			dma = control_block->src;
+		struct bcm2835_cb_entry *e = &d->cb_list[i];
+		size_t this_size = bcm2835_dma_cb_get_len(d->c, e);
+		dma_addr_t dma = bcm2835_dma_cb_mem_addr(d->c, e, d->dir);
 
 		if (size)
 			size += this_size;
@@ -563,10 +641,8 @@ static enum dma_status bcm2835_dma_tx_status(struct dma_chan *chan,
 		struct bcm2835_desc *d = c->desc;
 		dma_addr_t pos;
 
-		if (d->dir == DMA_MEM_TO_DEV)
-			pos = readl(c->chan_base + BCM2835_DMA_SOURCE_AD);
-		else if (d->dir == DMA_DEV_TO_MEM)
-			pos = readl(c->chan_base + BCM2835_DMA_DEST_AD);
+		if (is_slave_direction(d->dir))
+			pos = bcm2835_dma_get_pos(c, d->dir);
 		else
 			pos = 0;
 
@@ -611,7 +687,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_memcpy(
 	frames = bcm2835_dma_frames_for_length(len, max_len);
 
 	/* allocate the CB chain - this also fills in the pointers */
-	d = bcm2835_dma_create_cb_chain(chan, DMA_MEM_TO_MEM, false,
+	d = bcm2835_dma_create_cb_chain(c, DMA_MEM_TO_MEM, false,
 					info, extra, frames,
 					src, dst, len, 0, GFP_KERNEL);
 	if (!d)
@@ -658,7 +734,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 	frames = sg_nents_for_dma(sgl, sg_len, bcm2835_dma_max_frame_length(c));
 
 	/* allocate the CB chain */
-	d = bcm2835_dma_create_cb_chain(chan, direction, false,
+	d = bcm2835_dma_create_cb_chain(c, direction, false,
 					info, extra,
 					frames, src, dst, 0, 0,
 					GFP_NOWAIT);
@@ -666,7 +742,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 		return NULL;
 
 	/* fill in frames with scatterlist pointers */
-	bcm2835_dma_fill_cb_chain_with_sg(chan, direction, d->cb_list,
+	bcm2835_dma_fill_cb_chain_with_sg(c, direction, d->cb_list,
 					  sgl, sg_len);
 
 	return vchan_tx_prep(&c->vc, &d->vd, flags);
@@ -745,7 +821,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 	 * note that we need to use GFP_NOWAIT, as the ALSA i2s dmaengine
 	 * implementation calls prep_dma_cyclic with interrupts disabled.
 	 */
-	d = bcm2835_dma_create_cb_chain(chan, direction, true,
+	d = bcm2835_dma_create_cb_chain(c, direction, true,
 					info, extra,
 					frames, src, dst, buf_len,
 					period_len, GFP_NOWAIT);
@@ -753,7 +829,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 		return NULL;
 
 	/* wrap around into a loop */
-	d->cb_list[d->frames - 1].cb->next = d->cb_list[0].paddr;
+	bcm2835_dma_cb_set_next(c, &d->cb_list[d->frames - 1],
+				d->cb_list[0].paddr);
 
 	return vchan_tx_prep(&c->vc, &d->vd, flags);
 }
@@ -837,7 +914,7 @@ static void bcm2835_dma_free(struct bcm2835_dmadev *od)
 }
 
 static const struct of_device_id bcm2835_dma_of_match[] = {
-	{ .compatible = "brcm,bcm2835-dma", },
+	{ .compatible = "brcm,bcm2835-dma", .data = &bcm2835_dma_cfg },
 	{},
 };
 MODULE_DEVICE_TABLE(of, bcm2835_dma_of_match);
@@ -881,6 +958,7 @@ static const struct dev_pm_ops bcm2835_dma_pm_ops = {
 
 static int bcm2835_dma_probe(struct platform_device *pdev)
 {
+	const struct bcm2835_dma_cfg *cfg;
 	struct bcm2835_dmadev *od;
 	void __iomem *base;
 	int rc;
@@ -890,10 +968,14 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 	uint32_t chans_available;
 	char chan_name[BCM2835_DMA_CHAN_NAME_SIZE];
 
+	cfg = of_device_get_match_data(&pdev->dev);
+	if (!cfg)
+		return -EINVAL;
+
 	if (!pdev->dev.dma_mask)
 		pdev->dev.dma_mask = &pdev->dev.coherent_dma_mask;
 
-	rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+	rc = dma_set_mask_and_coherent(&pdev->dev, cfg->dma_mask);
 	if (rc) {
 		dev_err(&pdev->dev, "Unable to set DMA mask\n");
 		return rc;
@@ -910,6 +992,7 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 		return PTR_ERR(base);
 
 	od->base = base;
+	od->cfg = cfg;
 
 	dma_cap_set(DMA_SLAVE, od->ddev.cap_mask);
 	dma_cap_set(DMA_PRIVATE, od->ddev.cap_mask);
-- 
2.56.0


