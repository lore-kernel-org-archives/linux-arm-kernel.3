Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78BC606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h+PrlFnF;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K4DxrWhc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=O8CeOuouE1l4YFK8LvbewNNu8BgTQOxG6QIZFhL+bA8=; b=h+PrlFnFB0kvqa
	zHrO/WbSs/O2aOM/AafjCrgqBbB8VloB9XK79CooZuKlprCr/pLVhWfv+om0CleZzgoVRCm28C9BA
	gLOG0a0auZ057vGwrGOVo5IwLTIpST6l0XNtOxf+UkODcaknUvq+Xv8TNLU4UgtBKTQ1NKk8H3+r8
	e9kFOdiVJEjNkUbX5mXTrctSL8OKvS8YCafNiAdl+JrvfuN28JQZjUhBiFZfjxnrdkbJMjUFajaU/
	vYC8A3dQI6eKyHsXLJXBf5GCaahAjHkY3e/279vxk/+vliX3JXVcA6dfw6iYv8raIfLDumzSW24Sl
	Nzkba53ItkGudiEhINsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNo0s-0000000Fvi1-2jgr;
	Mon, 02 Nov 2026 09:07:34 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNo0o-0000000FvZ4-06kz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 09:07:31 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a215e64962so24753605e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 01:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793610448; x=1794215248; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O8CeOuouE1l4YFK8LvbewNNu8BgTQOxG6QIZFhL+bA8=;
        b=K4DxrWhccBYLGGMeTyKfnVWJAQf5y/va1V2gUnoBm+Djv97mX2LqmOBScx/wUTJvE5
         T4BHUGg1Z9CI0kegbpcdtNMkgTT+fyRSoYs83gdKGU7Ei1m8LWjwxjuAPpipEElVb1QB
         B1rBIWMQc7YAgY/68ya/zg67oQEVLyBjQU+mICiLdCEKLNM+fMXRCLA2zW/N28knpiL2
         DdmR9KLDVZWwVQ5yuTq3xw4UOoYACsQ1M45RgGjwNoBUWX1b0we6L4T6GBso8Y1QKVPS
         l3KS0NVLksPZpbGtVhGbq5Y2aZtgBJzkgO7+OwVBEHPe1Ul4w2ILqCNBOFnQ9cMqAhKC
         Chcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610448; x=1794215248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O8CeOuouE1l4YFK8LvbewNNu8BgTQOxG6QIZFhL+bA8=;
        b=t/EOgU476VT0qj/psfht7iah5kiU7kxEdPsmbV5urDIQABvpmON3MXrczolnSuT7o0
         v5CL9hOPf8NYDV3oeiD2obTcKaJKeO60lqoACGQV0xIXH3kq7LqJCn5Dhy21bNUEt6Ki
         GYQCl1aFYieE7v84xk9NVFaG09xWOO/PAKrN6PmY38TtjwntOsxTrr2B4KoPQdPBv2Ko
         LomMaLY8WDT1oKU59eeEEx6yqcQcoYTym1+IWWRUFkhKSYmqBTRdQGRIEfVk6k9inJKK
         RQQYkB4q0rL0TprPKY1YiVdCladn5qj/hzSzjqDLaltHIcypjZObCiWc3OzevPA4nZKR
         zXfw==
X-Forwarded-Encrypted: i=1; AKwUvByhdLSiMDlwpB/Gox5f9T4Yiedl5AEw6Vj8pThU6rV+CGp68o8Ah3TJUIUTUnBBmHRG/REEgEtQ0NzztvO7Ev7l@lists.infradead.org
X-Gm-Message-State: AFq9FYINqJKk6AGdyyJ3+r4E7ZVLMk6UHoWOhnaXDkU3DFjCCHx+0ReX
	zCiy+LNB0NomQfR4KtmzLIw054d4GjA2GGJsqUOpKEa/yrwddl/EiTuG
X-Gm-Gg: AYBFou1XTxpSAZgDgw/0zmgxPzFiQxLxrb7mgGv7CK0FdpFR0Nh4tfZ1pdWcfw3GgAk
	6gkTQ0gK3aA2demjw/9jC6bDfFztlbOTpjEw3YJd4C1HtN0G6fumM9JLbsEmKMXK4uZAZq9Ivkq
	iadWRJOBfHfa4HljYTVXdLlIbhT7JrStFQYyNLPLlMhAcwfNBoNZv/mPzgxDedot4ZEHtLbnuzJ
	Xh29HSmeIBE7/wfifBFkG2FcHGeSJGFI9Lh7w7Jz8e8lpPWZZZrS8LJ+hRaS+GNAOtckc976Ly4
	su/ReCaprUGeIDdYGrkaPO11tiCyudvXbXISLZEKKRLzrFlWISR2KAnXhFjKWn52CK8vbxnnfyQ
	4mzi+86BaQ6vvXbT9Suoc/9w6K9V7Q2rcIJOlYmHxjPhsEi4r+DFD9IkbI6eSF1RR55LJx8DYHO
	tvXX7c22M1MihE8lq6Zlx64KGjcK23hUxjTa0I0wcyD7Rtgr3MA55qKiMw9JdPglyl5UjZjGYgq
	7U1yYC+v+LeMz+lU61Is8CL3iFVs/Gozjf3QxaUWajL4Io4RGAaJJX78sPBq0lYnMpF45rV93/m
	BW0UHtQQfZKpwoG/7k9yj3EHPSjadz0SzYuiwedrlDEt0aA4WWvGtGNZZiVPhBry1CIpa8Itb2e
	j8cll9I12kcdNOnBzuJI6mWxUIj2UWQRtza4fiVaUmxQ0R7rH1hd5uUFOl82XNDO873CoMVA428
	Gp/BeVir/juvzU
X-Received: by 2002:a05:600c:3f06:b0:4a1:e672:5721 with SMTP id 5b1f17b1804b1-4ac181e75c2mr220479815e9.13.1793610447989;
        Mon, 02 Nov 2026 01:07:27 -0800 (PST)
Received: from cypher.home.roving-it.com ([2001:8b0:fb11:0:3889:86e0:d449:e2e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm417879945e9.3.2026.11.02.01.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:07:27 -0800 (PST)
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
Subject: [PATCH 5/9] dmaengine: bcm2835: Add BCM2712 support
Date: Mon,  2 Nov 2026 09:06:55 +0000
Message-ID: <20261102090713.896324-6-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102090713.896324-1-pbrobinson@gmail.com>
References: <20261102090713.896324-1-pbrobinson@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_010730_165413_4648D37F 
X-CRM114-Status: GOOD (  16.39  )
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

BCM2712 legacy layout channels carry address bits [39:32] in the
STRIDE field and use 32-byte units for control block pointers.
Channels 6-11 are DMA4 engines. Peripherals are seen at 0x10_7c000000.
Add the brcm,bcm2712-dma compatible with a 40-bit DMA mask.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/dma/bcm2835-dma.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 35f8c47dea89f..f06609b04a098 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -44,11 +44,14 @@
  * @chan_40bit_mask: channels implementing the BCM2711 40-bit register layout
  * @periph_offset: offset at which channels with extended addressing see the
  *	legacy 0x7c000000 - 0x7fffffff peripheral window
+ * @ext_addr: legacy layout channels carry address bits [39:32] in the STRIDE
+ *	field and control block pointers are stored right-shifted by 5
  */
 struct bcm2835_dma_cfg {
 	u64 dma_mask;
 	u32 chan_40bit_mask;
 	u64 periph_offset;
+	bool ext_addr;
 };
 
 /**
@@ -212,6 +215,10 @@ struct bcm2835_desc {
 #define MAX_DMA_LEN SZ_1G
 #define MAX_LITE_DMA_LEN (SZ_64K - 4)
 
+/* BCM2712 legacy layout channels: address bits [39:32] in the STRIDE field */
+#define BCM2712_DMA_STRIDE_SRC_HI	GENMASK(7, 0)
+#define BCM2712_DMA_STRIDE_DST_HI	GENMASK(15, 8)
+
 /* Legacy peripheral bus window used by DMA clients for FIFO addresses */
 #define BCM2835_DMA_PERIPH_BASE		0x7c000000
 #define BCM2835_DMA_PERIPH_END		0x80000000
@@ -271,6 +278,13 @@ static const struct bcm2835_dma_cfg bcm2711_dma_cfg = {
 	.periph_offset = 0x400000000ULL,
 };
 
+static const struct bcm2835_dma_cfg bcm2712_dma_cfg = {
+	.dma_mask = DMA_BIT_MASK(40),
+	.chan_40bit_mask = GENMASK(11, 6),
+	.periph_offset = 0x1000000000ULL,
+	.ext_addr = true,
+};
+
 static inline size_t bcm2835_dma_max_frame_length(struct bcm2835_chan *c)
 {
 	/* lite and normal channels have different max frame length */
@@ -349,6 +363,9 @@ static void bcm2835_dma_cb_set_src(struct bcm2835_chan *c,
 	}
 
 	e->cb->src = lower_32_bits(addr);
+	if (c->ext_addr)
+		FIELD_MODIFY(BCM2712_DMA_STRIDE_SRC_HI, &e->cb->stride,
+			     upper_32_bits(addr));
 }
 
 static void bcm2835_dma_cb_set_dst(struct bcm2835_chan *c,
@@ -362,6 +379,9 @@ static void bcm2835_dma_cb_set_dst(struct bcm2835_chan *c,
 	}
 
 	e->cb->dst = lower_32_bits(addr);
+	if (c->ext_addr)
+		FIELD_MODIFY(BCM2712_DMA_STRIDE_DST_HI, &e->cb->stride,
+			     upper_32_bits(addr));
 }
 
 static void bcm2835_dma_cb_init(struct bcm2835_chan *c,
@@ -1127,7 +1147,7 @@ static int bcm2835_dma_chan_init(struct bcm2835_dmadev *d, int chan_id,
 		 BCM2835_DMA_DEBUG_LITE)
 		c->is_lite_channel = true;
 
-	c->ext_addr = c->is_40bit_channel;
+	c->ext_addr = c->is_40bit_channel || d->cfg->ext_addr;
 	if (c->ext_addr)
 		c->periph_offset = d->cfg->periph_offset;
 
@@ -1151,6 +1171,7 @@ static void bcm2835_dma_free(struct bcm2835_dmadev *od)
 static const struct of_device_id bcm2835_dma_of_match[] = {
 	{ .compatible = "brcm,bcm2835-dma", .data = &bcm2835_dma_cfg },
 	{ .compatible = "brcm,bcm2711-dma", .data = &bcm2711_dma_cfg },
+	{ .compatible = "brcm,bcm2712-dma", .data = &bcm2712_dma_cfg },
 	{},
 };
 MODULE_DEVICE_TABLE(of, bcm2835_dma_of_match);
-- 
2.56.0


