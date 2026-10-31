Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA3D606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 12:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ovw0DSkx;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RtX3kqk+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9lYqqX+robUheapeipscKVQntLqlVNgi48T6H+L8K2Q=; b=Ovw0DSkxxCDl5u
	FdwjK/rtyvHNyCWijLeOqrW0x08Bo/D94oKvuGP4EDScCG/0e23Syepk+6pUDsC2AASyIk9ze3HYZ
	lLxmLBNwbaS2iBJGBp9wKjaKl+4i6r9AKjQYuVkziV+WOeRJDPt8IJ+ZKPeU8Yjo020aS5B3J8iNP
	icGHzbW7J6a7CzT/LV2tKklsXcHeBr+2cWpszegauh9CgIAqrFr6SIwK3dwipvHBrmMxbYMX4nagb
	dETcNjyPgrL6MnR5zRQKdGuDwFxBUpD21W0RAC+R8xFWguv9i5f6cFdQTCTdksfDpeBueg8IkQLay
	TcQdwp+Nx8+EoNZHqGdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN8NE-0000000DK2s-1Ry8;
	Sat, 31 Oct 2026 12:39:52 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN8N6-0000000DJyf-48If
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 12:39:46 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so2301730eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 05:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793450384; x=1794055184; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9lYqqX+robUheapeipscKVQntLqlVNgi48T6H+L8K2Q=;
        b=RtX3kqk+zt/SkJg6HkUgBwUz/dtyybK1s7RG7mbD83hlYqrRyndTrNgrlpRxyjTg5d
         3MQdg7s54xuIY6bETL1UgYqNySxeKPqAs/Jjy4TXGa+nR9L6UBmd7lA/kL3kwLpu+DVY
         m8vSBUExXyFZw9ICr1T2002X3J/hjO4mntOMSvQLPwwoYsyDqe/TEWBRT56RRSjcLCjv
         EA4zIDJt2iHrCNsBcsUWsWy8me5EZr7bsDYAseDaOoUea7LYRHA94OdRf8ldcwcMZSZx
         KUXNJi4AaGfCnImx6C3vDebycMYpb9fFQct9wZvSbv6AHoJZuRaDnrLWtjgKr/95pWf0
         vAbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793450384; x=1794055184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9lYqqX+robUheapeipscKVQntLqlVNgi48T6H+L8K2Q=;
        b=eVLH91CuE/JtfMrRwVPaBrEkajPxnaky4lGnqlft9xeTiuz95Rho5peYwulOjuAj9i
         jj8S8glpoKYsw/8xNlVsxJxUXxm1MugkQVC507r68Xpb+UcgMdzaJWdtCCWSgs4kxm4I
         DYI8OR7S+BYcZIw8VldTeoXG/nUU5BJglohETn3Ue7Is5NwERLd0qwOSJKMbImeWcAZh
         gbMpfO3iYQiWAXTTZh5XBa9Zocbi70jd337kq91CfuPK0oSJcXOiHg4uzU9LFZtZoXhy
         jCplo10/P/pTeqX8T+dADswIhohEYYOffjp4lLmZdkkXhniY+jZbC/qojOWXt1aJoCQK
         laJw==
X-Forwarded-Encrypted: i=1; AKwUvByiL1EmOESY1PktrlgUVtxJNwjK8eCLapAto6TzeHGz/+Nc0DbnDxTYaUMZJitx4QXgiAc7cErqKUTmdmjDehUT@lists.infradead.org
X-Gm-Message-State: AFq9FYLrb0K3vgHBJNJUgOHkZUkDmuERTgtjtBp3HfTVfXBma2Ruh3QQ
	cyjQKGPF+lvyqs7ACHykymbpEnXhpJpyGDWSPC9bsdeZq9O47pFm6vTE
X-Gm-Gg: AYBFou1Ka0b1rF7foiXfWFh+Fnur8xOhLJ8sAP5R1xEBqCsGXThPxp4J1b+4NNsVrLy
	pW3yiWr2WReo+PHfNEiuLVfknxi52W+PDKsGu4wlF9EHrCOUVRIMH7+ntTfQzteu28xcuR/EYQw
	0nDc98bEkjvm9V5+tHeaTu25vVUBQLP7OlUw+nEa39/ASwP+6GDfPvp8XumMzpaxRXV+QPFXYgi
	cpQTYpP40mr588+0IYPkEWAYOcS7GrOMSmshZaDsbHMV/rqvtl7XrhCsYYOjpMlZGV54FqDx1jP
	tH+PZLbPCZuDoYwCZ/huPYyZaZrbXvrLLQGOlisaOChbOMoj3mvsW1wooXBjuVaVDW2FQO2bSe0
	KZmHhegphFeMmfLQDXX6KbmuaP1DNJ/F2ujoCeVOSVK6LfBKssUIvx7EFQVIRxqmy2JaBteTKK5
	TyMLqg917YGqTSYnOeWEECG73TtnmXnodns5mA1Xyirimg5IKxL5fTXNB1cobLddsp0IQU6cWoG
	5A+q9CPU3ivanP+QxC9rZM97xVUD7mILyuXGUFju2YCtcL/6uvITY9QQ6ajDzeZw2tdq1UZqRpH
	8yXnHbRmrUJ1Il+xdKeXsE2/P1REhQv+U/CfetRjvBqxUmsQTpYTL4f3AMiP4vTMTJG7LM7B86S
	xfrLwYjsjIdH29gNkzH/UopVeWnZI3rfwQVy6dDQ7/lgTF1CFprLBYjwDWp8la33NSr7oawyL4s
	2I4KyHPg0QfDGvBA==
X-Received: by 2002:a05:7022:ef07:b0:188:ea93:6cf9 with SMTP id a92af1059eb24-1ac5eea1fe9mr8982380c88.43.1793450383881;
        Sat, 31 Oct 2026 05:39:43 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854da78sm21566039c88.6.2026.10.31.05.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 05:39:43 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Samarth Narang <samarth.colleges@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	linux-serial@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] tty: serial: msm: fix TX kfifo underflow on flush
Date: Sat, 31 Oct 2026 12:39:10 +0000
Message-Id: <20261031123911.3784690-5-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261031123911.3784690-1-samarth.colleges@gmail.com>
References: <20261031004733.3345841-1-samarth.colleges@gmail.com>
 <20261031123911.3784690-1-samarth.colleges@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_053945_028277_BFAA0326 
X-CRM114-Status: GOOD (  20.09  )
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

uart_flush_buffer() resets the transmit kfifo under the port lock before
calling the driver's flush_buffer() hook. Since msm_serial does not
implement this hook, an outstanding TX DMA transfer may complete after
the flush and call uart_xmit_advance() using the flushed transfer's byte
count. The existing check for a stopped transfer relies on tx_sg, which
the flush does not clear, so it does not catch this case. The kfifo tail
then advances past its head, causing kfifo_len() to wrap and the driver
to transmit stale buffer contents. The same issue was fixed in 8250 by
commit 9e512eaaf8f4 ("serial: 8250: Fix fifo underflow on flush").

Since the TX buffer is mapped separately for each transfer and the flush
hook runs under the port lock, the driver cannot synchronously terminate
DMA and safely unmap the buffer from that context. Instead, leave the
outstanding transfer running and mark it as flushed, allowing the
completion callback to unmap the buffer without advancing the kfifo.
Clear the flag when preparing the next transfer. This avoids the kfifo
underflow, although the data already queued for DMA before the flush may
still be transmitted.

Fixes: 3a878c430fd6 ("tty: serial: msm: Add TX DMA support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
 drivers/tty/serial/msm_serial.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
index bfa44b01c3e9..a9eca971e9ff 100644
--- a/drivers/tty/serial/msm_serial.c
+++ b/drivers/tty/serial/msm_serial.c
@@ -185,6 +185,7 @@ struct msm_port {
 	bool			break_detected;
 	struct msm_dma		tx_dma;
 	struct msm_dma		rx_dma;
+	bool			tx_dma_flushed;
 };
 
 static inline struct msm_port *to_msm_port(struct uart_port *up)
@@ -428,6 +429,19 @@ static void msm_stop_tx(struct uart_port *port)
 	msm_write(port, msm_port->imr, MSM_UART_IMR);
 }
 
+static void msm_flush_buffer(struct uart_port *port)
+{
+	struct msm_port *msm_port = to_msm_port(port);
+
+	/*
+	 * The kfifo has been reset. Let the running transfer finish, so that
+	 * its buffer is unmapped only once it has stopped, but do not advance
+	 * the kfifo for it.
+	 */
+	if (sg_dma_len(&msm_port->tx_dma.tx_sg))
+		msm_port->tx_dma_flushed = true;
+}
+
 static void msm_start_tx(struct uart_port *port)
 {
 	struct msm_port *msm_port = to_msm_port(port);
@@ -479,7 +493,8 @@ static void msm_complete_tx_dma(void *args)
 	}
 
 	count = sg_dma_len(&dma->tx_sg) - state.residue;
-	uart_xmit_advance(port, count);
+	if (!msm_port->tx_dma_flushed)
+		uart_xmit_advance(port, count);
 	sg_init_table(&dma->tx_sg, 1);
 
 	/* Restore "Tx FIFO below watermark" interrupt */
@@ -503,6 +518,7 @@ static int msm_handle_tx_dma(struct msm_port *msm_port, unsigned int count)
 	int ret;
 	u32 val;
 
+	msm_port->tx_dma_flushed = false;
 	sg_init_table(&dma->tx_sg, 1);
 	kfifo_dma_out_prepare(&tport->xmit_fifo, &dma->tx_sg, 1, count);
 
@@ -1549,6 +1565,7 @@ static const struct uart_ops msm_uart_pops = {
 	.set_mctrl = msm_set_mctrl,
 	.get_mctrl = msm_get_mctrl,
 	.stop_tx = msm_stop_tx,
+	.flush_buffer = msm_flush_buffer,
 	.start_tx = msm_start_tx,
 	.stop_rx = msm_stop_rx,
 	.enable_ms = msm_enable_ms,
-- 
2.34.1


