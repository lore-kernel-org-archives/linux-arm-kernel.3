Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EA9606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 01:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Xwf4U/5/;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jgCKXfHs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=xT9iMK/3RSde+zBTAQleC9VvYEhHkZyaWiIqI8wE2FM=; b=Xwf4U/5/p/bMhzotapHF9N0+xW
	T0LUHk7nipsoPBKK59ugZ+6MV7yDZVg7Im01gP93pKSTceYtIeqw995EzW5plXW+C8zQJmMquhG01
	OpmwNQ3kOims7PBLAG0nS7QMK96GjSNT9DH2n3+odyauuQGRwj4k62wFK0U8jBFwXMMAMbQU5eW7/
	MJCl15bsRB27IcqtJRrJpO/Zdcvbb9Y2lAYS4JzKuNDNeJKkYzyfQ58snkg7QFtEHBFVl2XrApeL0
	8Bq5Rp7XyVBGQ/yS9JwSPzdozAm7FiSSZeWwgz4MrjlwV9OQJYB0c0g0XztUR9IyACbV073aZ+Pzi
	gZXbVR7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMxYq-0000000CoNF-1grs;
	Sat, 31 Oct 2026 01:07:08 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMxYn-0000000CoMr-3zav
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 01:07:07 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-3282db206d3so517625eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 18:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793408825; x=1794013625; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xT9iMK/3RSde+zBTAQleC9VvYEhHkZyaWiIqI8wE2FM=;
        b=jgCKXfHs95UORIMFhDOsGeRw6mdXbB6hY4aaglZlzBYVQUdwGySRD//ctZtA6wEMdb
         eFB9LrMS30C+nCJBWINaEnJKOGr8FyyAR1yMull0RtRvBDLbYfsk5TGJ0u1iqCW9pUMj
         wfTFt4udpM+C73mSpDusX+rZZuar7B7xR9+9kQ9gc704qhpraEtjRw7TwYQ4uVw33JH3
         x8gavok2tx9PVKe9jfGRDBpSQXhRISm7hJcRiFWxdKj0Hx8EFovzZVk04GNIFHG0utmz
         t0W7XR3SsPKc25FXJGK0oTnKPQQ6BjQ8kQS3zZR4lTf585X7kxPHY1YQFLxYjK9rIvjP
         QB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793408825; x=1794013625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xT9iMK/3RSde+zBTAQleC9VvYEhHkZyaWiIqI8wE2FM=;
        b=FWleKohyjjpy0prUzuYt/Gjq32ebmlDlVbx9gz0ttUV5cLZ4JuGtQaQtiNE9hJmyeh
         JZgz0ljf/29jxUqePCPo2D3xwi+b4jP9xKLGUYggVd4nX0IH2jr/i3oQD8Ki++byKx8O
         o9egQZTqcmWm3CjCSw+rTqAbZXrI+iJcGUwLpq5A9PltXMOEqsrHrkpXOj+8LcAGWLvc
         jR1xl+t3WNHuhKs2zgX+wwdw+r9VoVW+hMxb1ti/H0470Vlh+cfqDzscWugyohKCAkVG
         LE2A3dVUCbDXaGZduwu56QFOxX+CvP6s5KN+EPy9NjRSg91g6bB8qQlA5nL3xLVDbPkF
         fdtw==
X-Forwarded-Encrypted: i=1; AKwUvBwMHZHH4rg5dTf+OMgYli6ZEx1VOA8DNyEAyb4UIdOzdolBuuUP7e/tYFwZNMLyh0wg9A2aC1DycXJeKNMWca1n@lists.infradead.org
X-Gm-Message-State: AFq9FYJN/DnX+mUqeJkKPSM7KsytmJP2Zll7Z/vMaDgICJ7wxLOpo4rG
	jJvVZ+WwxI2mTHnal6JHJqBWsEtrKO3gyGCW/2U8+xyY/wRXcKopRc+f
X-Gm-Gg: AYBFou3p06ZpQHEinVx+9cn3UnFQHRepIEV0r5bocokSMxYRiE5UxzUpIAlgznBxVEK
	JmHKUF0wBgkP+4ReyW7VV7/AG2iMfKbvyHxpBfSmJfu1yltteHyBgIXhBPSmnjJ9aqSRS55j9Zs
	5XMx+jlH4+To/OdNxZuwrPqWjnQNB0XIkf7HWBCwHl3LPLO11kngx8hncPJiqAF1A92c/QIUnqo
	XG58ufGIHq8pzylB9hDVy/Bc5F7+krqdbA7ofrwT7efGuqv2mOm0B+G9xcQld42SuWYH/T1iizz
	TCdjdcDLisoLmYOmmk4fhmeK/dfzd8/xIoGJQD0UncT3uZ6Fe3GVjgbv4PVdQfNBCoVp+purqa3
	3KVQ06+8mEYV/wK5DTQhXzyK0uhr55MoqKsUM/BbSTXTL7NAXooxJaewhJYlWw2S4c84yqKG/A4
	Qob4pyg+wNhwiQeZ8XbmuXxwbKXykl4zp34amaJPjw4jnNq0ctGzZjWuirZts0XR522a3GISWCi
	vsN0Pa2tiRZ7BQ1KeqzViyznQVmb3HhBI1CqO0W/PhiFSPA82nBrrL0D79IHKBxB4xDcMm7UAU8
	vd4+9II9Eg2F3SATgUrGsXtYZIAl96/A63fC5w0lC8D/30tVS45sjXwskRHU4X8XuPWhuRApMog
	i7dbFDt2A/wHAgPV8dkvqAPHlkT+MT3b6Mgi5KvzYLe2e3qzAiRTjKM3OCYdrezdOznG2I6FIJs
	s6e0rmsOOCY8XAbCFC
X-Received: by 2002:a05:7300:4353:b0:369:fc93:eda5 with SMTP id 5a478bee46e88-36a42434630mr8230258eec.39.1793408824646;
        Fri, 30 Oct 2026 18:07:04 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429018casm9876477eec.14.2026.10.30.18.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 18:07:04 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-i2c@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [PATCH] i2c: stm32f7: synchronize DMA termination before releasing the buffer
Date: Sat, 31 Oct 2026 01:06:58 +0000
Message-Id: <20261031010658.3366395-1-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_180705_999106_6C67F345 
X-CRM114-Status: GOOD (  17.48  )
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

stm32f7_i2c_dma_callback() is used both as the DMA completion callback
and as a cleanup helper by the threaded IRQ handlers for bus errors,
arbitration loss, PEC errors, NACKs, and DMA completion timeouts.

The helper calls dmaengine_terminate_async() and then immediately unmaps
the DMA buffer and releases the DMA-safe message buffer through
i2c_put_dma_safe_msg_buf().

On the error paths, DMA completion has not been established.
dmaengine_terminate_async() only requests termination; it does not
guarantee that the transfer and its callback have finished when the call
returns. The DMAengine API requires synchronization before memory
accessible to the descriptor is released.

Although the driver calls dmaengine_synchronize() from
stm32f7_i2c_xfer_core() and stm32f7_i2c_smbus_xfer(), these calls occur
after the IRQ thread has already unmapped and released the buffer. They
therefore cannot establish retirement before that release.

If the DMA operation retains access after cleanup, a late RX write could
modify freed or reused memory, while a late TX read could access data
belonging to a subsequent owner.

Introduce stm32f7_i2c_dma_abort() for the threaded IRQ error paths. The
helper disables further peripheral DMA requests and calls
dmaengine_terminate_sync() before invoking the common buffer cleanup.
Since these paths execute in threaded IRQ context, synchronous
termination is permitted.

Remove the redundant termination request from the genuine DMA completion
callback, where the descriptor has already completed.

This establishes the intended ordering between DMA termination and
buffer release under the DMAengine synchronous-termination contract.

Fixes: 6aae87fe7f18 ("i2c: stm32f7: unmap DMA mapped buffer")
Fixes: ffdd20555cc6 ("i2c: stm32f7: support i2c_*_dma_safe_msg_buf APIs")
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
The issue was identified using a research static analyzer for DMA
lifecycle ordering and subsequently reviewed against the driver source.
It has not been reproduced on hardware. The patch has been
compile-tested on arm64 with W=1.

The practical exposure with the in-tree DMA providers may be narrower
than the API-level ordering violation suggests. stm32-dma clears the
stream enable bit and polls for it to clear, while stm32-dma3 suspends
and resets the channel. However, neither behavior alone establishes that
a concurrent completion callback has finished. The stm32-dma polling
operation can also time out without propagating a failure through
device_terminate_all().

Consequently, this change primarily corrects the driver's reliance on an
asynchronous termination request as a final-retirement guarantee. A
physical late write would require an outstanding access to survive the
provider's shutdown behavior; that has not been demonstrated.

Remaining concurrency issue: this patch does not resolve a separate,
pre-existing race between genuine DMA completion and threaded IRQ error
handling. If both paths invoke stm32f7_i2c_dma_callback() for the same
transfer, they may both attempt to unmap and release the same buffer.
Establishing a single owner for cleanup would require an additional
change.

 drivers/i2c/busses/i2c-stm32f7.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 6bd281a9e..891b0eebe 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -736,7 +736,6 @@ static void stm32f7_i2c_dma_callback(void *arg)
 	struct stm32f7_i2c_msg *f7_msg = &i2c_dev->f7_msg;
 
 	stm32f7_i2c_disable_dma_req(i2c_dev);
-	dmaengine_terminate_async(dma->chan_using);
 	dma_unmap_single(i2c_dev->dev, dma->dma_buf, dma->dma_len,
 			 dma->dma_data_dir);
 	if (!f7_msg->smbus)
@@ -744,6 +743,16 @@ static void stm32f7_i2c_dma_callback(void *arg)
 	complete(&dma->dma_complete);
 }
 
+/* Threaded IRQ context only: terminate_sync() may sleep. */
+static void stm32f7_i2c_dma_abort(struct stm32f7_i2c_dev *i2c_dev)
+{
+	struct stm32_i2c_dma *dma = i2c_dev->dma;
+
+	stm32f7_i2c_disable_dma_req(i2c_dev);
+	dmaengine_terminate_sync(dma->chan_using);
+	stm32f7_i2c_dma_callback(i2c_dev);
+}
+
 static void stm32f7_i2c_hw_config(struct stm32f7_i2c_dev *i2c_dev)
 {
 	struct stm32f7_i2c_timings *t = &i2c_dev->timing;
@@ -1552,7 +1561,7 @@ static irqreturn_t stm32f7_i2c_handle_isr_errs(struct stm32f7_i2c_dev *i2c_dev,
 
 	/* Disable dma */
 	if (i2c_dev->use_dma)
-		stm32f7_i2c_dma_callback(i2c_dev);
+		stm32f7_i2c_dma_abort(i2c_dev);
 
 	i2c_dev->master_mode = false;
 	complete(&i2c_dev->complete);
@@ -1617,7 +1626,7 @@ static irqreturn_t stm32f7_i2c_isr_event_thread(int irq, void *data)
 			__func__, f7_msg->addr);
 		writel_relaxed(STM32F7_I2C_ICR_NACKCF, base + STM32F7_I2C_ICR);
 		if (i2c_dev->use_dma)
-			stm32f7_i2c_dma_callback(i2c_dev);
+			stm32f7_i2c_dma_abort(i2c_dev);
 		f7_msg->result = -ENXIO;
 	}
 
@@ -1635,7 +1644,7 @@ static irqreturn_t stm32f7_i2c_isr_event_thread(int irq, void *data)
 			ret = wait_for_completion_timeout(&i2c_dev->dma->dma_complete, HZ);
 			if (!ret) {
 				dev_dbg(i2c_dev->dev, "<%s>: Timed out\n", __func__);
-				stm32f7_i2c_dma_callback(i2c_dev);
+				stm32f7_i2c_dma_abort(i2c_dev);
 				f7_msg->result = -ETIMEDOUT;
 			}
 		}

base-commit: 83f32c773255720a661aa45d83e36278135f23f5
-- 
2.34.1


