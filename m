Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1472C606D809
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 20:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qy4pA9JK;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nkUUFb9A
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/lE1h7vRI/sW6l31u0lxhMtA1G4uNToUgbvAzqOb6yc=; b=qy4pA9JKmFU+9C
	iTOtIs+cpzZfqDh8InriujPRv72cvJjPtKuxHahUziK/lsVJq7r0HrzbP7JFJY0bmwWVGkB/v6M2t
	bKXhK4stfM9182XJ4YpG2oFqBUlJmdFl2hWWr682Z7y+yIiH4BvDHJmTSlZrzwDh+JYiOLjJUcEBe
	ZeiL0d5f+CLQVl+d2HDo43X3LxX+Ora1mCF3ldHOumysHzSq9bh4xLIDCDZcyQ2kqX2NpPEHkoRzu
	NIKY0r4Hg3D6K1ytEHFA4FMYVa+hDrtxg12acF6tR/kZTRtJhKc4kdohuuCgxPVZx1+JAGT2DdLQW
	WA44UY5fqHXcAfnUFfbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4RV-0000000Acax-3lf5;
	Thu, 05 Nov 2026 20:52:17 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4RT-0000000AcZp-1Imt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 20:52:16 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-833e671ee9fso16658a34.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 12:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793911934; x=1794516734; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/lE1h7vRI/sW6l31u0lxhMtA1G4uNToUgbvAzqOb6yc=;
        b=nkUUFb9A/vJBdPk3Sl3gtNNEEIJV/PBYMc5I8Ckkua2uBhURY3/Ge3TueGPPOw7LJE
         Pngg6Vb04jAGEwRx6gSo2fKsMHWT0TYLCg231RZw7mBPVfQ9dKNGHfGKlGfPYpwZ8ZMs
         qHaqmQE55JBoFZyqrYi2nuWTHwuPILiU91nnQk6ZfsDVSEAuxdTbbCoLtTlzTHMHMB/A
         l5ATEWnGRD4BXO3wVRmVLFcLGnFHmjs37tRYvzN7PtbQxqtA6AsokiCjjXJ3h5KBkitb
         XgubSTWGLHI1oB8SqjQ0CDvVyuLklIVCHy+DPOCb1c//yjPYZG7uvIFVHDxbRqEB9yZ5
         dwXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911934; x=1794516734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/lE1h7vRI/sW6l31u0lxhMtA1G4uNToUgbvAzqOb6yc=;
        b=pIbg8iLdD3I7zHVC+li1QkOH+djnNBNH8zrNVc7z5ENLYtALF/sqOehqjA0U13o2+b
         6BtqBCY0SKqROgCol2NxKTdkw6JWvJCSsyyxtBdAYjHy0/bMTJ2Zm3pEsrGaBJfckIw3
         loMoW7xrN9ojNNv312pcdJsR/wMYxR9khntYt5zo/Q0ipV13ieJP7XqNr1sxxrwCFe64
         pYnob/cJfDj5RCM4kYpoVja++/LYSsJ1hPv16XY64DK/de64nzbttpbLtpsA/tj3Hy9u
         cnDL85aBfG4ZncyUgPwCAKi5dwWejDHcSDmyQSaFdmLMp1S8BPNkV+ZvkD1nFkhI5TYa
         v4pQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhqfVTEv1+gYuGSU1X5Ek4JmlIhTr6dZNXzPU0pENNGtMFiI/VVEmDRZA9ls+/00SAmm1G04w52PXW0k9Mrt2t@lists.infradead.org
X-Gm-Message-State: APuU4Z898rvWrSEC4I+eS/XxHulUqHtP4EGcUJTjt2VlDnPUSvc0zwC7
	g/ENfL2fEcCF+r73UIa+asBfwZMA7UjCAYDQzV4pF6uwxsbPOL6eE8j9
X-Gm-Gg: AYBFou3Em86T1l7KXMB/0t7fM7N+dPC90JIiKwdI0NqbmeYmme8kZDcDM0GvbYnJ6/S
	3qYND+0a9zKihIpv3zTikbuXUiXk5cgsNoeEE08T+xixvv8iu1Tlb4IRQIrNKjMJbHBiGzB1BFs
	whObcRaEP7B9yvcJlLm4U+mNM/v+7XNZifKUF1zZwHU7+k8a72VLw6WRloTH/p4SiJPHseieLW5
	T02tgV3s1HQwshyZoRx/1fGA4wTChzPENtLrKDI9U4Lfhyk1G/nEV2qZSpbETlRQPxCRyl34wi0
	lDC2kwprclZ91P7gkisUOHO8NmYAyn0sqdEuwFDgyZssLsbu88FbMDpo7kSaliG1JLPlkpdM6qC
	3JhT3AQNXuCWAXRSQ2jRl9tQgvzSx4VUSlRhg7HT0TtNaJNUJ2bLOOUnPwGCo/79f7rkLYaYUW6
	TzCW7bFgThLpEpf0iC+MRGPmK+8gk6Sr5pOhsOIBxwhLHtCwiNe6bbEqWzI+0WpAYQyuS2c26tF
	lXh4Y7FQjEMsCecTMmeGHMWeXfHMiIrOx39et7iBZTjRnTT1kNqTHjRavVtwvZsJEC5Jcv4YQBI
	ybSYHijK2/x9pI6+JWwa+C8yfyMY0sE+apJCfS+r6feySjwqPvvN2tvBRA1HYrdnuVaSXiB0bZp
	tVrYGs7KKXpHxXETe85CdcEwrBnY8FxF+N/DGSL68WsbbqiI7dVhUiDGpvihpabAsPuFyt0fBEX
	rVbcZvWiL7wYOSWBQxUx+3GQuCwJ6lC2EB6oPo8I7FwbnZkYGfkSQXiM3UivvegxHM4SFJGmOQ
X-Received: by 2002:a05:6830:2e12:b0:843:cf07:7a99 with SMTP id 46e09a7af769-85f1d14ff4dmr511092a34.31.1793911934069;
        Thu, 05 Nov 2026 12:52:14 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbb298fsm292276a34.6.2026.11.05.12.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:52:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 13:52:02 -0700
Subject: [PATCH v8 01/11] serial: 8250_dw: allow port setup to report
 errors
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-submit-h616-uart-fifo-v1-v8-1-14024d2b184b@gmail.com>
References: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
In-Reply-To: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_125215_362050_59C419C1 
X-CRM114-Status: GOOD (  18.43  )
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

Return a status from dw8250_setup_port() and propagate failures through
the DW and LPSS probe paths before registering the UART. Use the existing
LPSS cleanup path to release board resources and IRQ vectors on failure.

Keep the current setup behavior by returning zero on both successful
paths. This separates error propagation from the configuration validation
that will use it.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c    | 7 +++++--
 drivers/tty/serial/8250/8250_dwlib.c | 6 ++++--
 drivers/tty/serial/8250/8250_dwlib.h | 2 +-
 drivers/tty/serial/8250/8250_lpss.c  | 4 +++-
 4 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 9cbe076463e0..80b2b673b422 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -765,8 +765,11 @@ static int dw8250_probe(struct platform_device *pdev)
 
 	dw8250_setup_dma_filter(p, data);
 
-	if (!data->skip_autocfg)
-		dw8250_setup_port(p);
+	if (!data->skip_autocfg) {
+		err = dw8250_setup_port(p);
+		if (err)
+			return err;
+	}
 
 	/* Use the BUSY-safe sequence for both integer and fractional divisors. */
 	p->set_divisor = dw8250_set_divisor;
diff --git a/drivers/tty/serial/8250/8250_dwlib.c b/drivers/tty/serial/8250/8250_dwlib.c
index 91b3607b64e6..4a06dec6e263 100644
--- a/drivers/tty/serial/8250/8250_dwlib.c
+++ b/drivers/tty/serial/8250/8250_dwlib.c
@@ -208,7 +208,7 @@ static const struct serial_rs485 dw8250_rs485_supported = {
 		 SER_RS485_ADDR_DEST,
 };
 
-void dw8250_setup_port(struct uart_port *p)
+int dw8250_setup_port(struct uart_port *p)
 {
 	struct dw8250_port_data *pd = p->private_data;
 	struct uart_8250_port *up = up_to_u8250p(p);
@@ -250,7 +250,7 @@ void dw8250_setup_port(struct uart_port *p)
 		dev_dbg(p->dev, "CPR is not available, using 0x%08x instead\n", reg);
 	}
 	if (!reg)
-		return;
+		return 0;
 
 	/* Select the type based on FIFO */
 	if (reg & DW_UART_CPR_FIFO_MODE) {
@@ -270,5 +270,7 @@ void dw8250_setup_port(struct uart_port *p)
 		pd->srbr = DW_UART_SRBR_0;
 	else
 		pd->srbr = UART_RX;
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(dw8250_setup_port);
diff --git a/drivers/tty/serial/8250/8250_dwlib.h b/drivers/tty/serial/8250/8250_dwlib.h
index 7191cabfb086..4d32651956ab 100644
--- a/drivers/tty/serial/8250/8250_dwlib.h
+++ b/drivers/tty/serial/8250/8250_dwlib.h
@@ -100,7 +100,7 @@ struct dw8250_port_data {
 unsigned int dw8250_get_divisor_dlf(struct uart_port *p, unsigned int baud, unsigned int *frac);
 void dw8250_set_divisor_dlf(struct uart_port *p, unsigned int quot_frac);
 void dw8250_do_set_termios(struct uart_port *p, struct ktermios *termios, const struct ktermios *old);
-void dw8250_setup_port(struct uart_port *p);
+int dw8250_setup_port(struct uart_port *p);
 
 static inline u32 dw8250_readl_ext(struct uart_port *p, int offset)
 {
diff --git a/drivers/tty/serial/8250/8250_lpss.c b/drivers/tty/serial/8250/8250_lpss.c
index f1b4b975571a..7ace0515038e 100644
--- a/drivers/tty/serial/8250/8250_lpss.c
+++ b/drivers/tty/serial/8250/8250_lpss.c
@@ -350,7 +350,9 @@ static int lpss8250_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	if (ret)
 		return ret;
 
-	dw8250_setup_port(&uart.port);
+	ret = dw8250_setup_port(&uart.port);
+	if (ret)
+		goto err_exit;
 
 	ret = lpss8250_dma_setup(lpss, &uart);
 	if (ret)

-- 
2.53.0


