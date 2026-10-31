Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D48D606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 12:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=upmwr49e;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WMiNDTuP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uvdMMWuBJgZn2yb+YVIOL/4xZHnwlAFydQfLAoaMsLI=; b=upmwr49eUvHb4U
	8AoYOAy21UKrKsnH+tBkMarQt1ga/7QUwv4dXIEBP15z8kHA4HE/nvxVzEN8b18T5XP1+Q84PLYKk
	BExmM8sU+L6G/Y/TCA1EF/z83Wy5aEQhHV0QWdIFFoYM3g0w73BN/zAS9KFoQ5IfeYcYgGKPLW5x1
	ZZE2LBFE1qdaOU+8jxhjAcSWwyEgUOO+xdSC/gHMPzmL9iGKsSa6HL8xs12PKFMF61wXRLbmNwg4Q
	tT3RFKGjxFNiiHq9PO/TK4q4XVB0M7sxuecolL2bkMAK4WukJHqvyxbgd/mVgOlG/0tuaeBbuO+fl
	8pYfJqTILBsw4QXnrj+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN8Mr-0000000DJrH-3zm5;
	Sat, 31 Oct 2026 12:39:29 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN8Mo-0000000DJqW-3t1Z
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 12:39:28 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so2764033eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 05:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793450366; x=1794055166; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uvdMMWuBJgZn2yb+YVIOL/4xZHnwlAFydQfLAoaMsLI=;
        b=WMiNDTuPqK+uttgkx+CnmDZo0b/wEMmgjmeb0c5A2/eP0TnNs02RdIgYYzqagv75dF
         +DN/agKT0qGRD6IuZa+bFBnJWJ/aD6uxUOeF8jO1yjjUtQTNsNZa/J6j3XD0vy2dpsBx
         AQOC/bpo4tw+rEj8oG/dUVH1texlmarEGE5GsFTXMzmqnjxZsPg837PwSBzShgdTk/hP
         pdcGk24AfblebZhCC9oDkyuW2vX3Wq1TAWAiCgFgEYMQaE2U3m2WbbPb2XvgtmbVOUGa
         0Aa8uPIxUl+oyHfUXLfNcH037X63UJiLvqdA8A5zbn0XnZoTr/X2JPiC2hBx7QPYdkV+
         AOEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793450366; x=1794055166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uvdMMWuBJgZn2yb+YVIOL/4xZHnwlAFydQfLAoaMsLI=;
        b=gef1mhNXjF8j2J1R5BlLnnx0n3sqAbiWdXG+KOo0hFiQRVM3mLTWnLcbE7k37vlwO5
         Q2DukheyDXE+wAWiCurOIVzCEUXMfjfu/NHnFyZojQCOnkI6YEyX21TxnIrOSTSjknZH
         gK46noGrMk2d0yDgwS8Fj6pMzVnxr1COdr37W/uFKEEhZsvZk4NeTMsKGHfUT3B2RflM
         vCe0KHkDkJUk9oiSZAWRblaKCBcS29Zj5RcLGao+pNknCiGxVKfKuWs7auySrzp9O+Iz
         ZtB0KfboLt5sz5biHSFONNlMdTaKkL4xz4aqkM2SkQdrbhvWY8t6k1owBDmoLaR+brs4
         XhpA==
X-Forwarded-Encrypted: i=1; AKwUvBy1znGZYjWwpdj/hXHE8PGEPfRWitR45C0RrXiMYlKjBoZKp7HtdmvUqeCVTbl32wpWTFddoOsCFmc4v831GG08@lists.infradead.org
X-Gm-Message-State: AFq9FYK7hk/wR4KpYdpAszSRdVMsbo0u+7qgy0Uf3w5+VBw0iZ7iJy0f
	LjCkQSjxEutXoRBqBQTWZYR1w24+Aj73f3FP3pa/yjbaoXwYHNhHLf68
X-Gm-Gg: AYBFou0dgrfW3dhyGVtxeNHSVIV2Y9omAQ5j6R/4QobUmlHNAiidaOxmbNsVTqtsc/1
	8RkKeAR/3p8l6l81/W8GkalORZb6aQDI4syvc14lTZv35tCwNJPQVchuksbTXZQ/LD5TvEbj1Wm
	i4VKAwMmvxcMhz45eCAQeuhjpj5pgzq5885Xe0zpsNhkgA0mBD2mcxUpsJQ+cEOgfRZ0YNwDBhz
	/Foxq4S0Q76sz1FsaHU2INQu/Z1/rIkOc9NEKzkdeBvZ8W0lljkughKEGX8gygizwUE4UxdIGee
	lIO5i28ZuG5Hjh58tyWcy32B2QYgOAQ0nkUAF+EvaLJV+VadqD3QYs1rLGBOCzCgAtasmgtgbcM
	gMEmJVk4IMeKFaJnJ3kxvBjOExL5ls8D07Z8tygRnqoMmOP7Cm1CTkHLDc8fZU5ojZBWE8Kr/Ah
	KBnA3vjskP2ThGzVcRQhgYGi9J9b7bmwANf0ynLdYVK2smr4efowXM0FgaIFn0ydd8GvRZ/DPgg
	jlly84s7heRSo7U7zmguLrmLwT7MuWvAVRGONOmOeK3YqhO8Ky6b+YtCkVRCUTpBTX1yVYoiDXm
	0T8R0/hzL4nGLaGwT8E8pbhCTIcRSIXMMsYM+5aQFPW5CFchDflvWznGSS3UtMNdwBdSw5/A5N/
	zxMZiUlsHpczHGH9GjmSrEBy8BtGW2kQ3rUIBP90zoMrDqrKNnp5AaEb1mq64G6LdfXez/NRue0
	7N0ukqHi70OBjsxw==
X-Received: by 2002:a05:7022:b053:10b0:190:da74:2c89 with SMTP id a92af1059eb24-1ac5bda4447mr7716798c88.21.1793450365870;
        Sat, 31 Oct 2026 05:39:25 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854da78sm21566039c88.6.2026.10.31.05.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 05:39:25 -0700 (PDT)
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
Subject: [PATCH 1/5] tty: serial: samsung: fix TX kfifo underflow on flush
Date: Sat, 31 Oct 2026 12:39:07 +0000
Message-Id: <20261031123911.3784690-2-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261031123911.3784690-1-samarth.colleges@gmail.com>
References: <20261031004733.3345841-1-samarth.colleges@gmail.com>
 <20261031123911.3784690-1-samarth.colleges@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_053926_972668_0C2C6252 
X-CRM114-Status: GOOD (  16.77  )
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
calling the driver's flush_buffer() hook. Since samsung_tty does not
implement this hook, an outstanding TX DMA transfer may complete after
the flush and call uart_xmit_advance() using the old transfer's byte
count. This can advance the kfifo tail past its head, causing
kfifo_len() to wrap and the driver to transmit stale buffer contents.
The same issue was addressed in 8250 by commit 9e512eaaf8f4 ("serial:
8250: Fix fifo underflow on flush").

Add a flush_buffer() hook that terminates the outstanding TX DMA
transfer and clears tx_in_progress. Since the TX buffer remains mapped
while the port is open, DMA synchronization is not required before
returning from the hook.

A completion that is already running when the flush occurs may have
calculated its byte count before taking the port lock, so it must skip
the kfifo update if the transfer has since been retired by either
flush_buffer() or stop_tx(), which already advances the kfifo itself.

Fixes: 29bef7990845 ("serial: samsung: add DMA support for TX")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
 drivers/tty/serial/samsung_tty.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 640f85e2d636..2bea7ef078d2 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -317,6 +317,20 @@ static void s3c24xx_serial_stop_tx(struct uart_port *port)
 	ourport->tx_mode = 0;
 }
 
+static void s3c24xx_serial_flush_buffer(struct uart_port *port)
+{
+	struct s3c24xx_uart_port *ourport = to_ourport(port);
+	struct s3c24xx_uart_dma *dma = ourport->dma;
+
+	if (!dma || !dma->tx_chan || ourport->tx_in_progress != S3C24XX_TX_DMA)
+		return;
+
+	/* The kfifo has been reset: the completion must not advance it */
+	dmaengine_terminate_async(dma->tx_chan);
+	async_tx_ack(dma->tx_desc);
+	ourport->tx_in_progress = 0;
+}
+
 static void s3c24xx_serial_start_next_tx(struct s3c24xx_uart_port *ourport);
 
 static void s3c24xx_serial_tx_dma_complete(void *args)
@@ -339,6 +353,12 @@ static void s3c24xx_serial_tx_dma_complete(void *args)
 
 	uart_port_lock_irqsave(port, &flags);
 
+	/* Already retired by stop_tx or flush_buffer */
+	if (ourport->tx_in_progress != S3C24XX_TX_DMA) {
+		uart_port_unlock_irqrestore(port, flags);
+		return;
+	}
+
 	uart_xmit_advance(port, count);
 	ourport->tx_in_progress = 0;
 
@@ -1682,6 +1702,7 @@ static const struct uart_ops s3c64xx_serial_ops = {
 	.get_mctrl	= s3c24xx_serial_get_mctrl,
 	.set_mctrl	= s3c24xx_serial_set_mctrl,
 	.stop_tx	= s3c24xx_serial_stop_tx,
+	.flush_buffer	= s3c24xx_serial_flush_buffer,
 	.start_tx	= s3c24xx_serial_start_tx,
 	.stop_rx	= s3c24xx_serial_stop_rx,
 	.break_ctl	= s3c24xx_serial_break_ctl,
@@ -1703,6 +1724,7 @@ static const struct uart_ops apple_s5l_serial_ops = {
 	.get_mctrl	= s3c24xx_serial_get_mctrl,
 	.set_mctrl	= s3c24xx_serial_set_mctrl,
 	.stop_tx	= s3c24xx_serial_stop_tx,
+	.flush_buffer	= s3c24xx_serial_flush_buffer,
 	.start_tx	= s3c24xx_serial_start_tx,
 	.stop_rx	= s3c24xx_serial_stop_rx,
 	.break_ctl	= s3c24xx_serial_break_ctl,
-- 
2.34.1


