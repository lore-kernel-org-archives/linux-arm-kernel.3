Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE34606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 01:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K86fyMjP;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qGk7yud8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=u6n9A3ZneE8NABlrOWtzgZuqAMh0oDJ8q3EQsuGSkn0=; b=K86fyMjPjRRhfLtaGsvPu6Np58
	LmbhzGnOfWOO+jmkHA2SBWCG4UtcXQeL9rGY93ezqI/zt140bIGsf5PlJ5fik+rk44YzaqOubIizu
	V6MIw/qyenQdEMRxMaYkPiwNPQKAxGYinIYWd5dvkcOWZfmF9YhUxBjV9cbPYaieaPM5sIQKaSBpv
	umIu8+VTNUQWfL8u4FqVgbE4/olFfoETZEF+q7fFNP0RruU2/54J0HuTyD2hpBXjAt+go/jOcOOr5
	FMPYhM1T59E65A2We9q3u6z5OlwHK6CSTSxCDzvEKBn/LOJzZS60/LNRG/j+5f8UK9Ul+w7FC53em
	uRHwgdhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMxcd-0000000ConE-1HmS;
	Sat, 31 Oct 2026 01:11:03 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMxca-0000000Cola-06x8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 01:11:02 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-1931ff67a29so586505c88.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 18:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793409059; x=1794013859; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u6n9A3ZneE8NABlrOWtzgZuqAMh0oDJ8q3EQsuGSkn0=;
        b=qGk7yud8AI+S0vSEs9q55E6yrmH1Ooam3qCEuDrRZFg6EkXlcLpvH4KYZ1mabVWcyy
         RRX1psrKNgYK4bVX39rbACqwcVBa4+d6yIM+GAyIC3JgeaeItEtsasos11o8mk/kt7L8
         cdJhw0SEMrLPj2SaT1gdEktoASf0pf3ibOVPhP3+WMwe2tVvCPUDTH0e9zhSJq2VOHlW
         s2Jn+TFcb25uviRYf+IKfA0eSxNPGpuQx9sx5srZJIegrWOYHLKiICZtRwFEJCH1NAY9
         yDKrMMx6VZoc5DJDlXwQqPAsKAanZZQ2uPtm+1MIeD2G6GGuwYwJm7KFuMfwIDDWchAZ
         tkug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793409059; x=1794013859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u6n9A3ZneE8NABlrOWtzgZuqAMh0oDJ8q3EQsuGSkn0=;
        b=QCTaRwvOVDz930EOxVYD2oNUSMGZfkgMEnsrzkZ/EZzDELsbSOU4YCwf9RrL//9lL1
         GBP/U2zGTxtsCo56FdS+WjTSV7+YG2BMSrPzXI1QBD9F2tOeOGb0QTZNuhoZLsr1x6gO
         mchsy8bKavP92LLyNpF7Jny+PblECflW4XttpAbC7eYqZY9aQOzehfP/6Qz4f8JabhHU
         Aw6oJac52jX4pPPVwbZI/RzHOy0n9Aj+LjFMfklOnCjWNRC4WT3zeJ7s8cLXAmzPGqIo
         xhDbHOKGSnP8whfB0G9D83xELMKAKLfG9xd4+ph9UTwFUu2PuiC7RJ4BtrWUleYfznEz
         PVsw==
X-Forwarded-Encrypted: i=1; AKwUvByWn90uujQ5op62BOSODrqklH4mLJRqEZqdt+9I8XyBNb1H5qSJcnjIbu9g5gtBUVRtSXXtE8ATlY3PlMKgLw8u@lists.infradead.org
X-Gm-Message-State: AFq9FYKW3l6AN6Chy2FcTOJHTkU6q7VXifqHdDtTWWzDtbGG5bpt8pKo
	Gve46W+HMWWEkVirtDbrL+CpW/YrVU+mr/OFl/e97Qw7QxnAxPwb3iY5
X-Gm-Gg: AYBFou1CWAP9uoZA7uYZQs0dX7j4/Iv70ALBfOkzd3xq6HDtkNOnrRz7l5fnNBo3eZI
	GxfFoxkLVBFWyA9EIYfOK3pnYHYbyJ4uh0Y3xvHJIAWEyluAdMaxOiJXxQBLS1hOQcSHQLkTD3l
	acY0YtK86Xdhm/ORQw8Xo2KcjGaw3i3Nob3V23Z9UDEYUwODoVXCNzpTZMgMB7qeBsbHwSw/84p
	1QGZ/Qfc9DBkeQ9dXjllFL3oUxaT4ohBZBiTZ6oAaEC+mfS0HBvpw0AYgpP9K3FycnF2oPCg58C
	R3qQI4uOxWf+vJ/d0FDvCkFQdIFXJQWf4BprUsJPNLS2gFh8L75weDrGlVoC5YCkzH4gBa4nAyD
	/XwfihJa14THl9bO0C8g60PbhW0iUoP0HcT8XutShQzjyOldomjQ8JxUSZRbJPg8TOtxLRB+TlN
	cZB4QfAIQzl1BXDILF6bovxGO0UDvHPQMAtdHGsEyEPY6XDGNC+EiwlVY+4V5JXcsTq7NzXdsbw
	1T6a+xuji6MuuIeHgshi63SoXD4+sHlzO+VXCUrG11/IrtGWkFM6JFe8Az0k4RzK9fYOaKLLp2g
	xsIyv1SQP2YceI9du3r0t16Ek3smGe2oGAU3QXgaVZan+26NG/THmNgH5MHbO69ZmP8W3jK3o7t
	xXuL8jAzvT5c4lVDuSCn8u00hYuaIgKnqRCkBbo0d0W2nKgfB0OEuIPZUJ3ya/XTHrrkXXxL+MJ
	C4wUV0qqpZSNI8COU=
X-Received: by 2002:a05:701b:424e:10b0:1a1:47b2:5512 with SMTP id a92af1059eb24-1ac5b7dfd1cmr5677779c88.26.1793409058894;
        Fri, 30 Oct 2026 18:10:58 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm9900636c88.8.2026.10.30.18.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 18:10:58 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Qii Wang <qii.wang@mediatek.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [RFC PATCH] i2c: mediatek: stop APDMA before releasing DMA buffers on timeout
Date: Sat, 31 Oct 2026 01:10:53 +0000
Message-Id: <20261031011053.3370685-1-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_181100_064418_159F7C8A 
X-CRM114-Status: GOOD (  18.68  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mtk_i2c_do_transfer() unmaps the DMA buffers and releases the DMA-safe
message buffers through i2c_put_dma_safe_msg_buf() immediately after the
completion wait, before checking whether the transfer completed
successfully.

If the wait times out, APDMA reset occurs only later, through
mtk_i2c_init_hw(), with i2c_dump_register() running between buffer
release and the reset.

A completion timeout does not establish that APDMA has stopped accessing
memory. For example, a target may hold SCL low until the adapter times
out and then release it. If APDMA resumes the remaining RX transfer
before it has been stopped, it could write into memory whose DMA mapping
has already been released and whose bounce buffer may have been freed or
reused. With SWIOTLB, a released bounce slot could also be reassigned to
another mapping.

Commit aafced673c06 ("i2c: mediatek: move dma reset before i2c reset")
previously addressed APDMA accesses to DRAM after the transfer buffer
was freed by changing the reset order in mtk_i2c_init_hw(). However, the
reset still occurs after mtk_i2c_do_transfer() has released the DMA
buffers.

Move APDMA shutdown ahead of buffer teardown on timeout and ACK-error
paths. Request an APDMA warm reset and wait for the enable bit to clear
before unmapping and releasing the buffers.

If APDMA cannot be confirmed to have stopped, retain the mappings and
buffers rather than potentially returning memory that the controller can
still access. This intentionally sacrifices memory reclamation on the
failed-stop path to avoid unsafe reuse.

The change is conditional on the APDMA reset and status operations
providing the necessary hardware-retirement guarantee.

Fixes: ce38815d39ea ("I2C: mediatek: Add driver for MediaTek I2C controller")
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
This issue was identified through static analysis and model checking and
the patch has been compile-tested with arm64 defconfig and the driver
enabled, using W=1, without new warnings. It has not been tested on
hardware.

I am submitting this as an RFC because the hardware-retirement guarantee
remains uncertain. I would appreciate clarification on the following
points:

1. APDMA warm-reset semantics. Does writing I2C_DMA_WARM_RST to
   OFFSET_RST abort an outstanding transfer, and does observing
   I2C_DMA_START_EN clear in OFFSET_EN guarantee that APDMA will issue
   no further memory writes, including writes already accepted by the
   interconnect?

2. SoC-specific synchronization. The multi-message apdma_sync path polls
   OFFSET_RST until I2C_DMA_WARM_RST clears and additionally sets
   I2C_DMA_HANDSHAKE_RST. Should the timeout path use the same sequence
   on SoCs requiring APDMA synchronization, rather than relying solely
   on the enable-bit status?

3. Reset ordering. Must the I2C controller be reset before or together
   with APDMA to ensure that no further peripheral requests can reach
   it? Commit 05f6f7271a38 ("i2c: mediatek: Fix apdma and i2c hand-shake
   timeout") appears relevant to this ordering.

4. ACK-error handling. An ACK error may occur before the RX data phase,
   in which case no outstanding RX writes are expected. The proposed
   patch also stops APDMA on this path as a precaution. Is that
   appropriate for the supported controllers?

The DMA-safe message buffers were introduced later by fc66b39fe36a
("i2c: mediatek: Use DMA safe buffers for i2c transactions"). Before
that change, the timeout path could unmap the caller's buffer before the
APDMA reset.

The intent of this RFC is to establish the required ordering between
APDMA retirement and DMA-buffer release. I would appreciate guidance on
the correct hardware shutdown sequence before treating the proposed fix
as complete.

 drivers/i2c/busses/i2c-mt65xx.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 307925fb7..2a8b8bd1d 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -993,6 +993,19 @@ static void i2c_dump_register(struct mtk_i2c *i2c)
 		readl(i2c->pdmabase + OFFSET_RX_4G_MODE));
 }
 
+static int mtk_i2c_stop_dma(struct mtk_i2c *i2c)
+{
+	u32 reg_dma_en;
+	int ret;
+
+	writel(I2C_DMA_WARM_RST, i2c->pdmabase + OFFSET_RST);
+	ret = readl_poll_timeout(i2c->pdmabase + OFFSET_EN, reg_dma_en,
+				 !(reg_dma_en & I2C_DMA_START_EN), 1, 1000);
+	writel(I2C_DMA_CLR_FLAG, i2c->pdmabase + OFFSET_RST);
+
+	return ret;
+}
+
 static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 			       int num, int left_num)
 {
@@ -1201,6 +1214,15 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 	mtk_i2c_writew(i2c, ~(restart_flag | I2C_HS_NACKERR | I2C_ACKERR |
 			    I2C_ARB_LOST | I2C_TRANSAC_COMP), OFFSET_INTR_MASK);
 
+	/* Stop the APDMA before unmap; leak the buffers if it won't stop. */
+	if (ret == 0 || (i2c->irq_stat & (I2C_HS_NACKERR | I2C_ACKERR))) {
+		if (mtk_i2c_stop_dma(i2c)) {
+			dev_err(i2c->dev, "APDMA stop timeout, leaking buffers\n");
+			mtk_i2c_init_hw(i2c);
+			return -ETIMEDOUT;
+		}
+	}
+
 	if (i2c->op == I2C_MASTER_WR) {
 		dma_unmap_single(i2c->dev, wpaddr,
 				 msgs->len, DMA_TO_DEVICE);

base-commit: 83f32c773255720a661aa45d83e36278135f23f5
-- 
2.34.1


