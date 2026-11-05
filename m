Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95ED5606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 20:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qJziyXg0;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yB0wKrgv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mY44dbM5nzrkV+ospj+zR69jcUle+qy1oJf0Y3qvlKo=; b=qJziyXg0dwL+ty
	CvWx8K0qCPCnSMn9vQR1wdoL1YiQEpy3ijSKi3uSzqPJ3DHCXlaVmfCCUhWC2l6CFROV4Eb5GPrPW
	DOUH+U9MRHyCuhNYidnAzO3iEdQsYqciANkFkIXcwsb615+GhC1ns1+6xFBHRztVWroxlJ7Rfc7T8
	WDlliSpSFpzlrhHfPf2C3kB2/ywM2Wa7I5JF9mEwDMSC2Dq3QokncCyq/wWagJ2uFjrd3ZXQI62y8
	sjrUWUoGub6YrWWY0bft3RiDYNp/bp98l26RM/a3x+Bkv2RZKCwJ05hIejhAAqWpGu+43j4WE0FXc
	QGyq/gQ0PHrnJ2GNRFZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4Rw-0000000AcxP-3ppM;
	Thu, 05 Nov 2026 20:52:44 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4Rh-0000000Achl-34vj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 20:52:34 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-8253bc5a613so8382a34.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 12:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793911948; x=1794516748; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mY44dbM5nzrkV+ospj+zR69jcUle+qy1oJf0Y3qvlKo=;
        b=yB0wKrgvPpiqAZQVMdHl8hUlpWf9gSd5DgUUTUh0h8R6mLWJaNf3BozjQwDdycEStV
         qJTFDxQjx7FsJdZ/YmzW9XRDLfpGMdgAXjrQ5uVMDa7/P4nJzIdz0YvdOsVfj3tM/riB
         wvw/l24YxQRgAZ9AG3b/KjkF17YIJCjtMWiTQeB7+OzpHqtx2ZOXO8SqBv/aJ3wO8wfA
         0rSSmhEm09BdIZOnpVZ8JkD53hq5tB7Wa+6thxMBltYzeGAtkboro7oIPNANzYsZPQN7
         iGc2mBkD0yYNrI1Z786QeE0qJhRJMyqZkI+1NLiwKZFbBqeTz+DKaFCvmJA2YQC/h5LS
         2H/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911948; x=1794516748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mY44dbM5nzrkV+ospj+zR69jcUle+qy1oJf0Y3qvlKo=;
        b=S52sX2cplafDLEfSbk0k939jFyFLZTgnJG6MkoduXZ8P6vQAn1GqF6j4W11zT/+QJI
         nQ0nF+0K9kCKxpKGtYQzr+YMmRmhj01pZZwxm3eT/ml654Ea+WKgPitzgKQ+eNJTgUrz
         VhoW9TmIRltUsxdtusBCYOzm2uAohcCVORQT8zWesnDvM33dMRFXc33LzaNxWMtXkCDZ
         1T4X5y6aXyEcZjsEKLePOdrH81BFPbcb6yfjn7cEBudIzVhOo2yYW5626xvr6+NJAsN5
         dQFqvVJZqTmI5YdKdsJO3TJmI3YTvryvu6iJ8p46WSMwznsK57kaeQJa3zBHZhqDtkdb
         H4jg==
X-Forwarded-Encrypted: i=1; AKwUvBwomD6CkeHpDjVW5Uaa9SXpfKXg+QnoLQcsRYJoYhr3C4rzi8FTDd6S6vbQ2eZGgmzFVqjbggOgpWh7ZVWZeE30@lists.infradead.org
X-Gm-Message-State: APuU4Z8Y7+8n7gBSLAiehnmm6OJ+hYpL9/GmscY4QAaHA075NIa90gkG
	HrlTFk/vZ8k3SmiIWervaFOa0PhoIB66LYaptWHACAiPItcM2sbHU8dT
X-Gm-Gg: AYBFou0xuOgXAj5DzQJ5SBcDrfMRjgPxXla83VODUCkrFsZXKjbBUV9m8RwSj/VGAAn
	Kk3tjqakeEitsUKHXjpDmCqtf/dwMKUPiHPvV4L9ETTARVWSVf12nOPDx25KtBLZzwUJXB8iayL
	tWp/mWK7HqDrH+yUiNYpNO2qb2cJ8qRTe3kZYtpxI7zyfFIzKL6JK1z+Jms/Zx3NB+ZEk7LZh3l
	AJCgPrc8LZnF3rj9OCc+I/X5QN5XGD8TeEekammAWVSM+KkM5gHu9rxpHN6xgWB0tzTXu/YY6Ea
	baqnMwVDVHIMeKuHkVR3jSbPf0Wk0zgbWh39aYqVZVgHLGckrJh2Iw8goRFAGUjaqzj26EvB0h+
	f3rDsN6RqYwQ6lkxE9Lp6yfzP/9RXubeXsucrn7pTgGgvq/6rW7Hp+h1JLXaWiPM1MybsLIPVg6
	TGaE8aT9sCvt5b3cQYDZEItN++5tM/lyL9qELK5gwqv8cQo3xAAm1NMrqLzIReiAsDR3A1fQrJT
	U2EJz+Rsux7j0I1KdOXLG33DdT8F7SAR23r3ehk75AINe00FzBFLBYG++K99lJFnvBku9g0YRj+
	V3UqPL/kbmhjnA0zYJ9vhMOSmpCuAsYIegcYSBV93LIJRLUC2xnLG3I33V+Sjw84aLChMyIa/Va
	ah/F7pZELfcQAsvzjjoO2byWPvX7rps0CvaoKRH0yMH+3449qXCEX0NWH6QAIyWCfKMjV/ZzgQk
	bSjiI+cQclOKDL0kp7wXDbTdfEAdoaCeUOdaGWYL6o5Nt1kFYQL1w=
X-Received: by 2002:a05:6830:82ee:b0:830:43b8:72db with SMTP id 46e09a7af769-85f1d0fdec6mr511917a34.24.1793911948501;
        Thu, 05 Nov 2026 12:52:28 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbb298fsm292276a34.6.2026.11.05.12.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:52:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 13:52:09 -0700
Subject: [PATCH v8 08/11] serial: 8250_dw: configure the Allwinner H616
 UART
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-submit-h616-uart-fifo-v1-v8-8-14024d2b184b@gmail.com>
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
X-CRM114-CacheID: sfid-20261105_125230_805106_893AA794 
X-CRM114-Status: GOOD (  16.89  )
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

H616 has 256-byte transmit and receive FIFOs, but its optional DesignWare
component parameter register reads as zero. Generic 16550 probing leaves
the port using the 16-byte FIFO configuration and its trigger-level table.

Keep PORT_16550A and supply the fixed FIFO depth through platform data.
The 8250 core derives the transmit load from that depth. Use the shared
DesignWare receive-trigger setup to describe the 1, 64, 128 and 254-byte
thresholds, with the normal half-full FCR setting selecting 128 bytes.

Advertise automatic flow control so CRTSCTS enables MCR.AFCE, matching the
DesignWare termios path for hardware CTS handling.

Select this configuration through the platform setup callback. H616
has debug-divisor and RS485 control registers overlapping the optional
DesignWare feature probes. Use the fixed configuration with BUSY-safe
integer divisor programming and software RS485 handling.

Keep the UART clock enabled during termios changes with SKIP_SET_RATE.
Its clock is a gate on the shared APB2 source rather than an independent
baud-rate generator.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/tty/serial/8250/8250_dw.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 613907b8a40f..a55f60330a51 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -63,6 +63,7 @@
 struct dw8250_platform_data {
 	u8 usr_reg;
 	u32 cpr_value;
+	unsigned int fifo_size;
 	unsigned int quirks;
 	int (*setup)(struct uart_port *p);
 };
@@ -657,6 +658,31 @@ static int dw8250_setup(struct uart_port *p)
 	return dw8250_setup_dma(p);
 }
 
+static int dw8250_sunxi_setup(struct uart_port *p)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+	struct uart_8250_port *up = up_to_u8250p(p);
+	int ret;
+
+	p->type = PORT_16550A;
+	p->flags |= UPF_FIXED_TYPE;
+	p->fifosize = data->pdata->fifo_size;
+
+	up->capabilities = UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_AFE;
+
+	ret = dw8250_setup_rxtrig(p);
+	if (ret)
+		return ret;
+
+	/* Use software RS485 with the Allwinner register layout */
+	p->rs485_config = serial8250_em485_config;
+	p->rs485_supported = serial8250_em485_supported;
+	up->rs485_start_tx = serial8250_em485_start_tx;
+	up->rs485_stop_tx = serial8250_em485_stop_tx;
+
+	return 0;
+}
+
 static int dw8250_probe(struct platform_device *pdev)
 {
 	struct uart_8250_port uart = {}, *up = &uart;
@@ -880,6 +906,13 @@ static const struct dw8250_platform_data dw8250_dw_apb = {
 	.usr_reg = DW_UART_USR,
 };
 
+static const struct dw8250_platform_data dw8250_h616_data = {
+	.usr_reg = DW_UART_USR,
+	.fifo_size = 256,
+	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
+	.setup = dw8250_sunxi_setup,
+};
+
 static const struct dw8250_platform_data dw8250_octeon_3860_data = {
 	.usr_reg = OCTEON_UART_USR,
 	.quirks = DW_UART_QUIRK_OCTEON,
@@ -931,6 +964,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
 
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
+	{ .compatible = "allwinner,sun50i-h616-uart", .data = &dw8250_h616_data },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },

-- 
2.53.0


