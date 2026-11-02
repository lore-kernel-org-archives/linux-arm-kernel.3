Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A1C606EE92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 19:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I+H6X1XM;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FFRHWD0J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=e5pG2x2D0CE8fAouwsfujGjEJUqfkPlGvTlxhvkEIu4=; b=I+H6X1XMXJFQcM
	vT7FMqzxCYp2x3XvN8WLqMCk4jF19UYlALezOc7nOhm0kXtO5H5E27DzWEET1Bl/1QlQPOE57nvG7
	QfiOohwFVHPtDWZPVlG4RVaokE+VBmMaNXLjYyURiGeGtuy49LvGlDDyZ2XpyjflNrX5DmtaAMu3v
	EM49I6dLSwLkeyg6ucRNxXwAS6/DEwG1pxJkVCREMC6yeLK2hyQUHxr480W2pnvTewVP5xIwZJxnv
	5KO/rJj+Khse0J/SprG7Q45cyDfGwdaXhnIrOisnwRiuBdpIx3zrXJ3ZqOvsAXvbXCHMjSMWdFB/7
	PYPs+0EMj+7c+aS3pZIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNy84-00000000ES2-0DBk;
	Mon, 02 Nov 2026 19:55:40 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNy7x-00000000EKm-1N1N
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 19:55:34 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-48eee44b908so1909895fac.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 11:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793649332; x=1794254132; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e5pG2x2D0CE8fAouwsfujGjEJUqfkPlGvTlxhvkEIu4=;
        b=FFRHWD0JybnhB5dBRj/gm/Fh6sxV6iIxUJ/862nGqPQGEvsCwA11TprCEMEm4WAcJm
         Ri+2YZ5ak0BNnC2ktivIHADtc5BAnDp9/43LnKA1ddqapyikc9qxPiadM6a4TXWZljej
         E32R5utDJrgXjoF3tO8A4TP9gH8WXIuTnaGGF7yA5D86djNgXp56tku6eoEhCPW0hMWZ
         UjVQRRJmxJqyUXejnz5YNVVE8zIqiVace4x/PdhwIQiDUplrZ1tRVxLb6EyCH3KxsDGY
         s8VJf0C6YXjQyFdrKjTlnp9q6Yv9BzQgSUPEOJuzb70gufMMZHNlX7PDOCKPMC6Jzumq
         7zUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649332; x=1794254132;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e5pG2x2D0CE8fAouwsfujGjEJUqfkPlGvTlxhvkEIu4=;
        b=BnAuQ4dK+D2kUZ2ASA1Oewh8cxxagxWiqw875hH+bDMF1wJncHZ2Mq29lyGeHZbOpP
         WbQqKVlaW+seAMJTCd0umtRxELCjBbQuWgqBr5C0OFY06DHUoc9+SY1gUCS4qgj30feb
         Muj8gC8MrsQPqEOVwO4eH2Nci7sHrw0BM+MbSC1ULB0LSV0qevwQ6PFBbrIfWg5kZ8ll
         lrqiM6IsjyUkp4+MybbLU0Xcb7f6yvvZ/HJ6JyPckePPygiDdePHhEdp01gXf+SDQQaY
         //TTT3SULN7UhB/TXgkIJhbK8oqzfj8rRNKBVB21Ho1ELZ/oVKGDwlknQ4lG3DXb8/hi
         FHlA==
X-Forwarded-Encrypted: i=1; AKwUvByfz3jY1J91QLftFk+T33PlC/SA0aPSwi3EipQbqeqkF5IT91N+RtDdT8aOef//J62eWZDb3p7ak6bB3wcY9JGI@lists.infradead.org
X-Gm-Message-State: AFq9FYJbAk9OAU8Aq7XG/lsTIHwchMuzIy4kgkO2wOAIRTgqMMfw/zAC
	sDEZJfK8SmnoNetcoUSWofUISggkEdbWyDs5zJ+hIvbWX5wxdU1NHzGi
X-Gm-Gg: AYBFou2uWcbeNMsOYuRpO0eFaLf3peT4IqFNsJ0RsQW7G8c5uvFI+ecx2npvYcYFeAu
	lH/wtT+tV8ETB1I5u9rdb8hMnm4d5Rb8ZbK1OwqMgZfmywIQLqrHxjgYYTAJJFJxyX8CveAp4SI
	f8VvU0UnVIRGiCtwseMs+IIgzNDqEpO3Ebd4mfVehYxP6q6J3PgV+St6zqI7WlxtGexuCMll+pY
	ku9G9hlR6cS7bDgLamYVf3dJLU7C5q5cP+N3DRSN4Wj/tduFDvHUHhynyiZmpWss/hcOO9VvoHK
	jUyQZeQaC+fCQLjY3uWPn4KSJl17Mrb0+7kMLZJ3bdFj09mgWLqb5E+jk3EdcaazuZWavd8CBeN
	hLveSaZfA7fsa+Ut6VVebywvU2M6OnXMgKvMMMiV/dm8bcwnOoxFCl+BRiaeARmFq1XGJnjj5IG
	pkW+u5TqVnkcbV0socVg0XQvNqQdpzJyySel3Epy/Qxqbc+4xObmY8Js/nJ6svpk2dd+fi2vJNl
	9BQMgNMarNyQ/fODu/ZsDYBzKfJqEM5W6TQM46ZHoYschQ3/t+R/5HKYO/MqrjTI0Fej/vtNQQE
	4SIGVdLhOP5zM+Z9pL+h2iNjGJ+N/QjwgWp/++hUl9IV5V+wMBdrz+18xlsvifJi4x9vmbwlYJV
	UJ1t+r9WWXlVwVa9FHfwIgf2ZZEUeHIXxNexC02DICW+zwm7sUKu3vYkbDXnIOJwOErlW5HI/RS
	gZlHyuBmT3DHy2PpGJJ1jkHJPWq7hdpVNYeGJ5EBw9VeLIL1U0L5U=
X-Received: by 2002:a05:6870:960e:b0:48f:e21d:1a30 with SMTP id 586e51a60fabf-4a9078421f2mr5974885fac.59.1793649332410;
        Mon, 02 Nov 2026 11:55:32 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a921353dcfsm7809249fac.0.2026.11.02.11.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:55:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 12:55:22 -0700
Subject: [PATCH v6 7/8] serial: 8250_dw: discover Allwinner A523 FIFO
 depths through FCC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-submit-h616-uart-fifo-v1-v6-7-25afcb346b0c@gmail.com>
References: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
In-Reply-To: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
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
X-CRM114-CacheID: sfid-20261102_115533_392480_AD46B464 
X-CRM114-Status: GOOD (  19.09  )
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

The A523 UART integration, also used by A527 and T527, has 64-byte FIFOs
on UART0 and 128-byte FIFOs on UART1 through UART7. Each controller reports
its TX/RX FIFO depth in bits 31:8 of the FIFO Clock Control register at
offset 0xf0. The field holds a byte count, not a logarithmic encoding.

Read this field in the sunxi setup callback when platform data does not
provide a fixed FIFO size. A fixed size takes precedence, so H616 retains
its 256-byte configuration without accessing FCC. The probe has already
enabled the clocks and deasserted reset before invoking the callback.
Leave the FIFO clock-control bits untouched.

Validate the depth before generating the RX trigger table or setting the
transmit load. The quarter-full threshold must be positive and the
FIFO-depth-minus-two threshold must fit in the byte-sized table and RX
trigger API. Report an invalid depth and fail probe instead of generating
zero or truncated thresholds. This bound follows the current 8250
table and callback types, not a hardware FIFO-capacity limit; support
for larger thresholds would require widening that interface.

Select this setup for the A523 compatible. Derive the transmit load and
RX threshold table from the discovered depth using the common sunxi
helpers. This handles the different FIFO sizes with one compatible and
one receive-trigger mapping.

Like H616, this integration has Allwinner-specific debug-divisor and
RS485 registers overlapping the generic DesignWare feature probes. Use
the common sunxi PIO setup, BUSY-safe integer divisor programming and
software RS485 handling. Keep the APB clock gate enabled during termios
updates with SKIP_SET_RATE.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 0b0156464af6..0ed50d9515e7 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -18,6 +18,7 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/io.h>
+#include <linux/limits.h>
 #include <linux/lockdep.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -51,6 +52,10 @@
 #define SUNXI_UART_RXTRIG_HALF_DIV	2
 #define SUNXI_UART_RXTRIG_FULL_MARGIN	2
 
+/* Allwinner FIFO Clock Control register */
+#define SUNXI_UART_FCC			0xf0
+#define SUNXI_UART_FCC_FIFO_DEPTH		GENMASK(31, 8)
+
 /* Quirks */
 #define DW_UART_QUIRK_OCTEON		BIT(0)
 #define DW_UART_QUIRK_ARMADA_38X	BIT(1)
@@ -70,6 +75,7 @@
 struct dw8250_platform_data {
 	u8 usr_reg;
 	u32 cpr_value;
+	/* Fixed FIFO depth; zero selects discovery during setup */
 	unsigned int fifo_size;
 	unsigned int quirks;
 	int (*setup)(struct uart_port *p);
@@ -735,6 +741,20 @@ static int dw8250_sunxi_setup(struct uart_port *p)
 	p->type = PORT_16550A;
 	p->flags |= UPF_FIXED_TYPE;
 	p->fifosize = data->pdata->fifo_size;
+	if (!p->fifosize) {
+		u32 fcc = dw8250_readl_ext(p, SUNXI_UART_FCC);
+
+		p->fifosize = FIELD_GET(SUNXI_UART_FCC_FIFO_DEPTH, fcc);
+	}
+	/*
+	 * The byte-sized 8250 RX trigger interface requires positive,
+	 * representable thresholds. Larger thresholds require widening it.
+	 */
+	if (p->fifosize < SUNXI_UART_RXTRIG_QUARTER_DIV ||
+	    p->fifosize - SUNXI_UART_RXTRIG_FULL_MARGIN > U8_MAX)
+		return dev_err_probe(p->dev, -EINVAL,
+				     "invalid FIFO size %u\n", p->fifosize);
+
 	up->capabilities = UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_AFE;
 
 	dw8250_sunxi_setup_rxtrig(p);
@@ -978,6 +998,12 @@ static const struct dw8250_platform_data dw8250_h616_data = {
 	.setup = dw8250_sunxi_setup,
 };
 
+static const struct dw8250_platform_data dw8250_a523_data = {
+	.usr_reg = DW_UART_USR,
+	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
+	.setup = dw8250_sunxi_setup,
+};
+
 static const struct dw8250_platform_data dw8250_octeon_3860_data = {
 	.usr_reg = OCTEON_UART_USR,
 	.quirks = DW_UART_QUIRK_OCTEON,
@@ -1030,6 +1056,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
 	{ .compatible = "allwinner,sun50i-h616-uart", .data = &dw8250_h616_data },
+	{ .compatible = "allwinner,sun55i-a523-uart", .data = &dw8250_a523_data },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },

-- 
2.53.0


