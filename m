Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B324F606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 12:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aQQnQ/4G;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MC8V9Sux
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=maS1TlQtTNtCaHJfozZuk+FUqQKZG+g+AwgR3S2V5EU=; b=aQQnQ/4GSkOyT5
	wTPUbTKhvDPREhLKAyXyBypyp2qTYXzVC9tQC+nOlwpMc+V1EzRrm7T16pzzaMd243flio1PyQ28C
	Z0+buCNBdWKmjjHRwTaQih1zU/y1fDaPVdv17ibcyGwXe/Tt198hhzaMuf7XTSV7VGeDzRi7gXz7U
	vF8BwbD0sBga70uf7EQJM0Q+qzGPawM6URMRLtCm4KG0zyX98tTfEkAYvDWa7DYxX5jm7b5gNNUnr
	KBFxwZzBS9FyY229qGeqBxrBilBA7QLpMYyuTG4E0L7xHnFU0NvO6G0fOvoWuFLwnDmtg4Q1cTqSU
	UmSQt7VVPDNxd3rgKOmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN8Lg-0000000DJdk-1gXi;
	Sat, 31 Oct 2026 12:38:16 +0000
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN8LW-0000000DJZB-0QoL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 12:38:07 +0000
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-14394530ec6so2073444c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 05:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793450285; x=1794055085; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=maS1TlQtTNtCaHJfozZuk+FUqQKZG+g+AwgR3S2V5EU=;
        b=MC8V9SuxjIJuUoMKSqgzpJDFcV50euVIqdmupQkC6zi2lWBVhlXVUoisy1zquVEHAu
         gwDG8YTuesQjD6k/coo6cALDBTIXA3C/UpVXVah1cwoDfVMJbIiKFjiHrG3qVQ7QqXGT
         L1jX5fR3CSP+OOJj/qRDljewGUxR/HMNHpIphX8ZoFxm7HOwtpC3VHAQ+4PJOJ5vL0lI
         q7Lq0eUu/Bvsx2/aEKePCPJPKkfpvnT73ZHyUxvzfeWv2OBkvkvbcDFThaohmFjxtBaz
         dP9t0RKGjWZ649Uv91T/KDHRu0WklQ0HM0ozR1a4r41q/yuut5jETL1wCq9o+CpniFje
         ZqQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793450285; x=1794055085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=maS1TlQtTNtCaHJfozZuk+FUqQKZG+g+AwgR3S2V5EU=;
        b=UCOPGsTHaftdIL2L+gjysjXCpp5vn2E27LNz9xOjcTsmwi0rGmJht31jO3Mni21k+C
         8CUjtYE7XmHHoopbdFAqWfGjBI1CHfT9k7yR5xVaOgTjBNxLJ69yjOL19X8MTd0A5pNa
         60+wr5bx/d3uwccjxejTuPXxYW/RnJPoaRFj8kZVhMHipcXHOsUT9KBhKxRcOgfVHzuU
         pOMjt/ggfnT+uxduJ6lmlLTaFr3Vrgj2vKGNt/t+f40ngSh9DW0+yDlcHrfv72eAjOLX
         3Y2GIsSEtN1XiIYlOyJFsWzwjS5Z00fshmsblEaczCgLbtx7DHxasmcnIoaO4Pvo5oPQ
         69BA==
X-Forwarded-Encrypted: i=1; AKwUvByBQRs9Lvijb3yo+kntL6WKkNDCQYG12NILZByPSGuszBZpPlf9X3AHpBBxotFgK2Ska4xVmaj1yY5wCbWu3okY@lists.infradead.org
X-Gm-Message-State: AFq9FYJa9DZZRNYoKnha9Bc5YYJpUgMQM2DbxwSsWzrzNr7hLem0F2at
	MMCQbXUgGWzNeQe9f+L3ZJo3HsVBjdi/Wo/oqhrs87Wa1a8Q528613uX
X-Gm-Gg: AYBFou1s06g1StsQZZyoegsVmdcP2HkaOYeJRi1AfX4N4mSpwxq0NiIdVyFgLJmgIu+
	uJYSKxJBjhVr+PEpy1TfUwECugGWeTPt7vke4BPZPoBDwlFiJOulWDNqYokTOAN4Lxa8t6783t9
	9ZlBV0jgk6MfpZNqAMIR8rQEMjesmmX7wdIdqlKqtDJ6s86xM22ZScs2TlWO871Ze73YSzdfeTC
	9MhebDDc0FIoekJn/aKw1zfEOfTrtlpj//oTnhk/wCFe+B9u9hcsblzHGcY0cZUvv+mlkzVamen
	BzT92roQ0MARonzDmTlSYq1cuDIzpEc0XedllkknppLruQ30BkiVPdZQlNLYG0PT91EKzIeBC6E
	6ooKWJIa5wyzeGPLD86+n5HyJYzR+ZgLKm1gsGkHpGutghFk9eB2VNWlk/n8R2pL9gtq8X5D+T0
	9MLFyXDwwsx67PeDKJILPhVA59Al5BmzURp8WZ7mbXstgcSkXbiPaqnkDwbDBAVj02RunhAMe+G
	U/COye+otafwhqhvjynCd1v81U0FaQ+taqQdfXhelSQ4ZtNUmITHJFT7cHTgGMX+Fgs5lnMlbKA
	jwbeQ28Vv4ZWtgwFQG/pv8sdBYCI1Jax9K8mnW1bvhderrL8yaOoAz6iOuxNdzVDLofZZdvjDnq
	FDZdHWicxC6yk9tY7f1hkcFoYZ8LVyyx1ZazvRg6PXDxf0SZBT5cCpHZgxd9G9ZN2XK+tuHoqGG
	M74wDPvyE5OTy6H0Hi6V9FSav7fxaaMb51wjk=
X-Received: by 2002:a05:7022:3a03:b0:152:9e88:daaa with SMTP id a92af1059eb24-1ac5f181628mr8313206c88.36.1793450284992;
        Sat, 31 Oct 2026 05:38:04 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1a13652csm17300763c88.17.2026.10.31.05.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 05:38:04 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Samarth Narang <samarth.colleges@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-serial@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] tty: serial: fsl_lpuart: don't unmap TX buffer before DMA has stopped
Date: Sat, 31 Oct 2026 12:37:49 +0000
Message-Id: <20261031123749.3783352-3-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261031123749.3783352-1-samarth.colleges@gmail.com>
References: <20261031005425.3351240-1-samarth.colleges@gmail.com>
 <20261031123749.3783352-1-samarth.colleges@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_053806_170715_5C6EA919 
X-CRM114-Status: GOOD (  20.70  )
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

lpuart_flush_buffer() unmaps the TX scatterlist before calling
dmaengine_terminate_async(), allowing eDMA to continue reading from the
buffer after its mapping has been released. Reversing these operations
would not be sufficient, since asynchronous termination does not
guarantee that DMA has stopped and dmaengine_synchronize() is required
before releasing memory accessed by the descriptor.

The issue can be triggered through TCFLSH(TCOFLUSH), hangup, or close
while TX DMA is active. On systems using SWIOTLB, outstanding DMA reads
may access a bounce slot that has already been reassigned to another
device, potentially transmitting its contents over the serial line.

Since flush_buffer() runs under the port lock and cannot sleep, request
termination there while keeping the scatterlist mapped and
dma_tx_in_progress set to prevent reuse. Defer unmapping to a work item
that first calls dmaengine_synchronize(), have the TX completion
callback ignore flushed transfers, and ensure that shutdown and suspend
wait for the work to finish before resetting the TX DMA state.

Fixes: 6250cc30c4c4 ("tty: serial: fsl_lpuart: Use scatter/gather DMA for Tx")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
 drivers/tty/serial/fsl_lpuart.c | 53 +++++++++++++++++++++++++++++----
 1 file changed, 47 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/fsl_lpuart.c b/drivers/tty/serial/fsl_lpuart.c
index c8575c965203..8343351199eb 100644
--- a/drivers/tty/serial/fsl_lpuart.c
+++ b/drivers/tty/serial/fsl_lpuart.c
@@ -26,6 +26,7 @@
 #include <linux/serial_core.h>
 #include <linux/slab.h>
 #include <linux/tty_flip.h>
+#include <linux/workqueue.h>
 
 /* All registers are 8-bit width */
 #define UARTBDH			0x00
@@ -280,6 +281,8 @@ struct lpuart_port {
 	unsigned int		dma_tx_bytes;
 	unsigned int		dma_rx_bytes;
 	bool			dma_tx_in_progress;
+	bool			dma_tx_flushing;
+	struct work_struct	dma_tx_flush_work;
 	unsigned int		dma_rx_timeout;
 	struct timer_list	lpuart_timer;
 	struct scatterlist	rx_sgl, tx_sgl[2];
@@ -530,7 +533,7 @@ static void lpuart_dma_tx_complete(void *arg)
 	unsigned long flags;
 
 	uart_port_lock_irqsave(&sport->port, &flags);
-	if (!sport->dma_tx_in_progress) {
+	if (!sport->dma_tx_in_progress || sport->dma_tx_flushing) {
 		uart_port_unlock_irqrestore(&sport->port, flags);
 		return;
 	}
@@ -558,6 +561,36 @@ static void lpuart_dma_tx_complete(void *arg)
 	uart_port_unlock_irqrestore(&sport->port, flags);
 }
 
+/*
+ * flush_buffer runs under the port lock and can only request termination.
+ * Unmap the TX scatterlist here, once the terminated transfer and its
+ * completion callback are known to have finished.
+ */
+static void lpuart_dma_tx_flush_work(struct work_struct *work)
+{
+	struct lpuart_port *sport = container_of(work, struct lpuart_port,
+						 dma_tx_flush_work);
+	struct dma_chan *chan = sport->dma_tx_chan;
+	unsigned long flags;
+
+	dmaengine_synchronize(chan);
+
+	uart_port_lock_irqsave(&sport->port, &flags);
+	if (sport->dma_tx_flushing) {
+		dma_unmap_sg(dmaengine_get_dma_device(chan), &sport->tx_sgl[0],
+			     sport->dma_tx_nents, DMA_TO_DEVICE);
+		sport->dma_tx_flushing = false;
+		sport->dma_tx_in_progress = false;
+	}
+	/* As in the TX callback: no restart while shutdown waits on dma_wait */
+	if (!waitqueue_active(&sport->dma_wait) &&
+	    !lpuart_stopped_or_empty(&sport->port))
+		lpuart_dma_tx(sport);
+	uart_port_unlock_irqrestore(&sport->port, flags);
+
+	wake_up(&sport->dma_wait);
+}
+
 static dma_addr_t lpuart_dma_datareg_addr(struct lpuart_port *sport)
 {
 	switch (sport->port.iotype) {
@@ -605,12 +638,16 @@ static void lpuart_flush_buffer(struct uart_port *port)
 	u32 fifo;
 
 	if (sport->lpuart_dma_tx_use) {
-		if (sport->dma_tx_in_progress) {
-			dma_unmap_sg(dmaengine_get_dma_device(chan), &sport->tx_sgl[0],
-				sport->dma_tx_nents, DMA_TO_DEVICE);
-			sport->dma_tx_in_progress = false;
-		}
 		dmaengine_terminate_async(chan);
+		/*
+		 * The transfer may still be reading the TX scatterlist: keep it
+		 * mapped (and dma_tx_in_progress set) until the flush work has
+		 * synchronized the channel.
+		 */
+		if (sport->dma_tx_in_progress && !sport->dma_tx_flushing) {
+			sport->dma_tx_flushing = true;
+			schedule_work(&sport->dma_tx_flush_work);
+		}
 	}
 
 	if (lpuart_is_32(sport)) {
@@ -1760,6 +1797,8 @@ static void lpuart_tx_dma_startup(struct lpuart_port *sport)
 		goto err;
 
 	init_waitqueue_head(&sport->dma_wait);
+	INIT_WORK(&sport->dma_tx_flush_work, lpuart_dma_tx_flush_work);
+	sport->dma_tx_flushing = false;
 	sport->lpuart_dma_tx_use = true;
 	if (lpuart_is_32(sport)) {
 		uartbaud = lpuart32_read(&sport->port, UARTBAUD);
@@ -1926,6 +1965,7 @@ static void lpuart_dma_shutdown(struct lpuart_port *sport)
 	}
 
 	if (sport->lpuart_dma_tx_use) {
+		flush_work(&sport->dma_tx_flush_work);
 		if (wait_event_interruptible_timeout(sport->dma_wait,
 			!sport->dma_tx_in_progress, msecs_to_jiffies(300)) <= 0) {
 			sport->dma_tx_in_progress = false;
@@ -3179,6 +3219,7 @@ static int lpuart_suspend(struct device *dev)
 				writeb(temp, sport->port.membase + UARTCR5);
 			}
 			uart_port_unlock_irqrestore(&sport->port, flags);
+			flush_work(&sport->dma_tx_flush_work);
 			sport->dma_tx_in_progress = false;
 			dmaengine_terminate_sync(sport->dma_tx_chan);
 		}
-- 
2.34.1


