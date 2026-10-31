Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D77606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 15:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kUmCLLix;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q5OGONsz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ApVcgRbUJOCRqk0kM38newz6TbCCt9oxZvC4V9s3//Y=; b=kUmCLLixLX6WWV
	eXOAKBbnk1NKIOXMmMHVzNvDv+Xs0Fz1hty+Hq1mzlyv2dOa2HoK0Q426ae3N+5fo7oLeWP3EaXCP
	Ura0xJWIEhGbXQp1jaYDznso6X1T806AkGyoTwoxJGiO691jlXgmpXR8H2cOaKRuDPvOSFnnFEk6B
	qnwd+8lhMvEeGgqPdO0639VT4per04YeqLk5yJ+sVU8KYG8fWWAVoJ9QtUvdaBYiXLuNQOeVP8ewL
	mOgeSH8CDQ1DHR1vqGeYJGh3dyuhaY7+lvEwMvClAKVRGuP+cWhNzuxaN6zHaA/BXSrRniU0LqLry
	upA34zCCgE/fgw+P+qiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNAzG-0000000DQqK-41MC;
	Sat, 31 Oct 2026 15:27:18 +0000
Received: from mail-pz2-x07.google.com ([2607:f8b0:4864:3b::7])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNAzC-0000000DQpU-3tVO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 15:27:16 +0000
Received: by mail-pz2-x07.google.com with SMTP id 41be03b00d2f7-cc7c286026aso892106a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 08:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793460434; x=1794065234; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ApVcgRbUJOCRqk0kM38newz6TbCCt9oxZvC4V9s3//Y=;
        b=q5OGONszOCFqpqoJ6HqhI8251p+4/JoWbvkdPguReqArMog4qi94Rzd6aaz6RoDwiT
         GnO3dpjsFOF/fyHx2O8UshcU30MIuM9gxu6pHnzxiG3RTGEsoo1MZIC8K7XibdPNhVFw
         YgUL+MjIVMW7S+AHjQEXte3kTPZ0XDhw2xZ0qVuZCCab+cpFOMkQdkPU7CO25uuIdk62
         xp9AbmDFGOYK++kVHMpCddBD/AicmevTo+wUl/tU414EE+gsxpruaP8jd1u3JIl2rthl
         nydaiGQjFBhnndWGDzfjYm+25RVgXk/dwsyRPkFs+FypPHp1padHBqFygMXMLlFqcs52
         XM7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793460434; x=1794065234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ApVcgRbUJOCRqk0kM38newz6TbCCt9oxZvC4V9s3//Y=;
        b=1epYpT2vTwnivrCnMfOZXF8EIxrzANAKiXy8aLjSGLUDJS+4TfJScs4+UnfAdBsxzY
         +wrbwzhsSUrVPvYgn32PuMzD3SXdjZGNpSHsKcS/CeAz7mibq3ch/qhWzMJ01Xg/f7TR
         hSXpN9oiD/1xV9kKJZshIbKZezs28c3Y18hRMXCIzGgAOuqRrz58DxtAHIiNgvodFmqr
         zAbUE+pi5QOYDcbeUVleg91bexJOPGiveCUVKs8BvzwD8WsOnGXeku91nN5PomjDyc85
         sAcFG1fHCzaqrrBKQgSh3ECDYk+tMMvjhHTR4A/mhVizVN5kLWcC3aaE6zIX6DYbg+n+
         sprQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFbH2huMoLF+7Vl1sN+JHrIbLStMZCFDPAsUyrunQt6tbbqForZ1/w4hlvysXjHFcyzsaVkH+tyE1ChAcdXzFE@lists.infradead.org
X-Gm-Message-State: AFq9FYLfBlOJ4cmyTR/n219xK8PDUNwenIJvlJLH2SKYJ4Plb2apGL9h
	8GQG2dQGwCqK9IfxzYUm5sFBuaDuwzZ/JdnESd2YC2+CafulrTBG1e0l
X-Gm-Gg: AYBFou3Yvpyhgwhb4zYR9ZQLxwM6E/mln/lcoEUGjOoaA4KlntkuR/blxGVBDDIgxYU
	6yhZRz8njxnBBHWH8zYPp19Nu5/q2KmeUI1s5xAfgCB8+Ryzsx+BEU4KVloOCn9etujCrqtsZjA
	uuaipHmtc0uVVAVxmaupvAHo7lrxHCARP9jTXrl4IZbSu47HkRBXx49Gnz8QBrH/Pnjc3ydIzeJ
	fcTkAoakfECQGQtQzkWDW/lmgh4FHm9IieCQe4shMNKkK91BoR2/hP2qEkRQPRCi3VmI9LUJ3gt
	1eHqYV8qDyahgd7hMMENH76POLhYoiS0Bj4OAeqtjizKjtyf858M40stafkEvZW3VupQ6Nrd9Yz
	XsqT8Ct9snlP9XIT+s1Xw2RHqgT/7frnQutVkGkyQc1i8gn+B1MvXjPUAAkvcB3AddBy1lmlj2N
	cL32cX4KxErSIPsySWnpXoFSKXIrfuepdEzz4P8puGrLsRGrtR9arX0rHYCpZ7jqSkdGwLjrSfv
	qBQFN7Q9cj3L/ehOwO9AMfwzEqsEsmc/mapsgAeXSkI0HZajdNijUINLNPY85vMftg+S3LDwiDx
	Zm63k2UxEciFPycklqYos4lN2tYpSTs=
X-Received: by 2002:a05:6a21:6b8c:b0:3de:b120:bba0 with SMTP id adf61e73a8af0-3e928cd25a1mr4531768637.36.1793460433856;
        Sat, 31 Oct 2026 08:27:13 -0700 (PDT)
Received: from kei ([222.141.54.22])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb09615125sm1731025a12.1.2026.10.31.08.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 08:27:13 -0700 (PDT)
From: tianci xie <xiex16070@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Samarth Narang <samarth.colleges@gmail.com>,
	linux-serial@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tianci xie <xiex16070@gmail.com>
Subject: [PATCH] tty: serial: samsung: fix TX fifo underflow on flush race
Date: Sat, 31 Oct 2026 23:26:56 +0800
Message-ID: <20261031152656.1422-2-xiex16070@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
In-Reply-To: <20261031152656.1422-1-xiex16070@gmail.com>
References: <2026103122-repurpose-cost-2da7@gregkh>
 <20261031152656.1422-1-xiex16070@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_082714_973981_B86E7265 
X-CRM114-Status: GOOD (  20.28  )
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

uart_flush_buffer() resets the xmit kfifo and then calls ->flush_buffer()
with the port lock held.  Neither s3c64xx_serial_ops nor
apple_s5l_serial_ops implements that callback, and
s3c24xx_serial_tx_dma_complete() computes the transferred byte count from
dma->tx_bytes_requested before it takes the port lock.

A completion that has already sampled that count can therefore run after
a TCOFLUSH has reset the kfifo, and advance the freshly reset kfifo by
the byte count of the discarded transfer.  kfifo_skip_count() does not
clamp, so ->out moves past ->in and kfifo_len() wraps to a huge value.
The driver then keeps transmitting stale buffer contents, and a later
close can wait in tty_wait_until_sent() until it times out.

Handle this the way 8250 does in 9e512eaaf8f4 ("serial: 8250: Fix fifo
underflow on flush"):

 - add s3c24xx_serial_flush_buffer(), which clears the outstanding byte
   count and terminates the TX channel asynchronously.  The port lock is
   held here, so dmaengine_terminate_sync() cannot be used;

 - sample dma->tx_bytes_requested under the port lock, so that a
   completion racing with the flush observes the cleared value and
   advances by zero.

The callback may still run after dmaengine_terminate_async(); for the
fifo it is then a no-op, but it does clear tx_in_progress so that a new
transfer can be started.  As in 8250, this assumes that a terminated
descriptor is retired before the next one is queued.

Reported-by: Samarth Narang <samarth.colleges@gmail.com>
Link: https://lore.kernel.org/all/20261031004733.3345841-1-samarth.colleges@gmail.com/
Fixes: 29bef7990845 ("serial: samsung: add DMA support for TX")
Signed-off-by: tianci xie <xiex16070@gmail.com>
---
 drivers/tty/serial/samsung_tty.c | 40 +++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 640f85e..e955b7e 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -330,7 +330,6 @@ static void s3c24xx_serial_tx_dma_complete(void *args)
 	int count;
 
 	dmaengine_tx_status(dma->tx_chan, dma->tx_cookie, &state);
-	count = dma->tx_bytes_requested - state.residue;
 	async_tx_ack(dma->tx_desc);
 
 	dma_sync_single_for_cpu(dmaengine_get_dma_device(dma->tx_chan),
@@ -339,6 +338,17 @@ static void s3c24xx_serial_tx_dma_complete(void *args)
 
 	uart_port_lock_irqsave(port, &flags);
 
+	/*
+	 * uart_flush_buffer() resets the xmit fifo and then calls
+	 * ->flush_buffer(), which clears tx_bytes_requested.  Sample the byte
+	 * count under the port lock so that a completion which raced with a
+	 * flush cannot advance the already reset fifo past its write index.
+	 */
+	if (dma->tx_bytes_requested)
+		count = dma->tx_bytes_requested - state.residue;
+	else
+		count = 0;
+
 	uart_xmit_advance(port, count);
 	ourport->tx_in_progress = 0;
 
@@ -1162,6 +1172,32 @@ static void s3c24xx_serial_release_dma(struct s3c24xx_uart_port *p)
 	}
 }
 
+/*
+ * Called from uart_flush_buffer() with the port lock held, after the xmit fifo
+ * has already been reset.  A TX DMA transfer still in flight carries data that
+ * no longer exists, so drop its byte count before terminating it: the
+ * completion callback may still run and must not advance the reset fifo.
+ */
+static void s3c24xx_serial_flush_buffer(struct uart_port *port)
+{
+	struct s3c24xx_uart_port *ourport = to_ourport(port);
+	struct s3c24xx_uart_dma *dma = ourport->dma;
+
+	if (!dma || !dma->tx_chan || ourport->tx_in_progress != S3C24XX_TX_DMA)
+		return;
+
+	dma->tx_bytes_requested = 0;
+
+	/*
+	 * dmaengine_terminate_sync() cannot be used here because the port
+	 * lock is held.  The callback may or may not run afterwards; either
+	 * way it is a no-op for the fifo because tx_bytes_requested is zero.
+	 */
+	dmaengine_terminate_async(dma->tx_chan);
+
+	ourport->tx_in_progress = 0;
+}
+
 static void s3c64xx_serial_shutdown(struct uart_port *port)
 {
 	struct s3c24xx_uart_port *ourport = to_ourport(port);
@@ -1684,6 +1720,7 @@ static const struct uart_ops s3c64xx_serial_ops = {
 	.stop_tx	= s3c24xx_serial_stop_tx,
 	.start_tx	= s3c24xx_serial_start_tx,
 	.stop_rx	= s3c24xx_serial_stop_rx,
+	.flush_buffer	= s3c24xx_serial_flush_buffer,
 	.break_ctl	= s3c24xx_serial_break_ctl,
 	.startup	= s3c64xx_serial_startup,
 	.shutdown	= s3c64xx_serial_shutdown,
@@ -1705,6 +1742,7 @@ static const struct uart_ops apple_s5l_serial_ops = {
 	.stop_tx	= s3c24xx_serial_stop_tx,
 	.start_tx	= s3c24xx_serial_start_tx,
 	.stop_rx	= s3c24xx_serial_stop_rx,
+	.flush_buffer	= s3c24xx_serial_flush_buffer,
 	.break_ctl	= s3c24xx_serial_break_ctl,
 	.startup	= apple_s5l_serial_startup,
 	.shutdown	= apple_s5l_serial_shutdown,

