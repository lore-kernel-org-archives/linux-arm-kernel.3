Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB87E606D824
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 20:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xGdYwCVi;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uCzAEf67
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gFXtfo2QF4UuPe88KiYuo+dmf8LupFBJ/LFbUjyQRiE=; b=xGdYwCViBglxBm
	wkbmVt9ucKq/e1i0sWwx7av6txBh7VLKqiTisowFmrIuREwFI29Nkecx1FwCpz9uQ3BV4HZcbPelk
	Mkt/o7n8Hl4FUEAA17PL6LFFL2as+oInGOcC2ee6ztDE1MVwAVNJzSExuTGl5ZzEpBn33K8w60USy
	K32HkhoqTy09KdYoouecfaNz4RVCoTYuP2E+3jCdCTNwM9f9qZLKrgHpjaRrG9d2SbRNLoEeSAMUD
	8EPQI/43qbURNUcvpSs7kylqr52WdC4h8BX06+sJGiB7vCY57tOf52n0/oVveCEyj74l6xhwhKLCu
	r5cLfN9GBtFUHhR3fARQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4Ra-0000000Acdt-0YRF;
	Thu, 05 Nov 2026 20:52:22 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4RV-0000000Acac-1noq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 20:52:18 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-843b6f8e2c7so4858a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 12:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793911936; x=1794516736; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gFXtfo2QF4UuPe88KiYuo+dmf8LupFBJ/LFbUjyQRiE=;
        b=uCzAEf67NaZoQiLZEwEPgzULsaaZwhIJqi1C/wVTgiGW1XsZ9Rx+LYmQF1oWB2c+/O
         dwluZyZhXK3xdoyg3ljoTCBmVZrJtHw6nsKYTFTs0qVUNIIWouTxne2RGkse8zgSlpYn
         +3hKO+L5G3aPwN0R4rOVZv4wWK4ktm2q9sogKJsLbg1TbIwS9kWMlv/pzDlEjpr5GEpL
         1PNJzjcnJZRgoMnMnpJv475stsfzPrFoaSun0+TEabmfArv2cfFq6RRqQ4GKejZZ9+zk
         l6zTBUmPA4e1xz2Yc+4mivwef3Xru7/Qz3B4Z1LFxxD8lHkKkY/Ye7iQ7oAMAfLD+4m1
         6oVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911936; x=1794516736;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gFXtfo2QF4UuPe88KiYuo+dmf8LupFBJ/LFbUjyQRiE=;
        b=lggn9qOJM+Hv92W9Pe8NuT28UseV5oqVj7tRaPGEfWNz/cyuds5dzvIVuJYFRka3j9
         Wx+mR8aoJcQsqYi6NkHjZa7t2FYzi9B5pX1kNUs/S3CZKRi8jNJEfds/7/lSfKd7Fqts
         07MmoOYvLqTvBLrvrSd1Uaq84eFt0SkGwER+VU4tlQiX3060h7FLboa+RGNTBerAKLTe
         2C2ja11R+U4N3ixSjzCPwG4z1NBWX/X5GZm3an2DvGujYNCFIhCE36sOjlWws/o7BrxA
         1NYrVlRoAA7lMfqBk24/7OXrhxy8pJo8xAdKP0CBvrS3zbtHVDfhoxXjoO5WjPLov+Pj
         Fkhw==
X-Forwarded-Encrypted: i=1; AKwUvBwMRuRiLCSb95AebFbtaAapsBdSKmEvLvyAYm7vh7Ipic773DuU3RCjrZJYwjCQGlif9Rakbz10ZYj5lkRmGW04@lists.infradead.org
X-Gm-Message-State: APuU4Z+xV2DtCklpsT4mPZtjqiS9xatmCJtOBISjHXkSacdqzdhkOmlF
	fqmOElGkgZOUJvlUg75X4vtSSGzFpGqJqy5T/00eXhJLsZn9ny+L+B6t
X-Gm-Gg: AYBFou23ZoAmS2JKqmB37D3zHasZD5mulUfr522b+bgNkZz002hT70YDSSPJYO8eCXC
	kqilJLz+N0+V48MjZCy9nmP6u4hAe2tjesCm1NFH9SFgXNJVehoI1IJY7eZEq82ouYM2DWdcrue
	XcgR+frTxRwltUsO5zpwisTniIpLfiLCjYD6te2HAs/VmjbEZXbglccoA4FPIFh6En8PpC4Sudw
	7sfRc9L6cC3Y6ugR95aDpiGvvFAC0jp9KBIUNSHJPE9vtcUg2VNBx4aXFwP5jf00uecI5ffYFO0
	z/Q66Dqe8nKXZ7Ku7NrJ6Fp/p1MQqOmwaZ2gdRNBkjNgy0LnhtGzVpzHxYbp5UT/QtHEvYBf3wk
	+bi41pDsaGUK96jZd9vPq+uAxsVVRMCbiuLbLRF6NA/AqbPr0pKYdgLZZO6b22JeuqXEq40k8q3
	f/dGrSTSX6dzF7Ogdp83DCDL8LRu87KYLD28HfG4TT2CQZfHbmJS27c9nA/Am4hvaq/OJnpQ+ll
	gClnl4HzXiDmTkpmGgAFwr8odWzlch5v9OYPkXvlmgTiIKY9WKAJEzR7pAh7ORd76peO/HeCO+s
	0mtL3+D93jGYohU9JK+4YldkjB9W8bAarRZ9bS93SqJQRn6QkiUcIMF1e0EuRX5/fNBOfxUHVfz
	wtRJpQkuzlM3ABj70DrjXyCZlStXyB3B4z3WD/FCzaAyn4SlDqHP2mEwk0qVdLxvRDLLPK+KZ5A
	b6b/YPp/2ttcuQDN9+vTjxH50sZ6sM/ZR6s8rb5Ovk0/EJwV2N+Q0=
X-Received: by 2002:a05:6830:3e03:b0:85e:f25a:7d26 with SMTP id 46e09a7af769-85f1cdfaf90mr603385a34.1.1793911936207;
        Thu, 05 Nov 2026 12:52:16 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbb298fsm292276a34.6.2026.11.05.12.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:52:14 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 13:52:03 -0700
Subject: [PATCH v8 02/11] serial: 8250_dw: select port setup through
 platform data
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261105-submit-h616-uart-fifo-v1-v8-2-14024d2b184b@gmail.com>
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
X-CRM114-CacheID: sfid-20261105_125217_499727_3476DE73 
X-CRM114-Status: GOOD (  18.85  )
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

Select feature discovery and DMA attachment through a platform-data setup
callback. The generic callback probes the optional registers and attaches
DMA when a FIFO size is available. Integrations with a fixed configuration
can supply their own setup before the port is registered. Allow setup to
return an error so integrations can reject invalid configuration before
registration.

Replace skip_autocfg with the Octeon setup selection. Octeon is a 64-bit
platform and continues to skip optional-register probing while preserving
its existing conditional DMA attachment. Select the DMA setup helper
directly for this integration. Keep generic setup for devices without
matched platform data as well.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/tty/serial/8250/8250_dw.c | 49 ++++++++++++++++++++++++++++-----------
 1 file changed, 35 insertions(+), 14 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 80b2b673b422..613907b8a40f 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -64,6 +64,7 @@ struct dw8250_platform_data {
 	u8 usr_reg;
 	u32 cpr_value;
 	unsigned int quirks;
+	int (*setup)(struct uart_port *p);
 };
 
 struct dw8250_data {
@@ -76,7 +77,6 @@ struct dw8250_data {
 	struct clk		*pclk;
 	struct reset_control	*rst;
 
-	unsigned int		skip_autocfg:1;
 	unsigned int		uart_16550_compatible:1;
 	unsigned int		in_idle:1;
 
@@ -596,7 +596,6 @@ static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
 		p->serial_out = dw8250_serial_outq;
 		p->flags = UPF_SKIP_TEST | UPF_SHARE_IRQ | UPF_FIXED_TYPE;
 		p->type = PORT_OCTEON;
-		data->skip_autocfg = true;
 	}
 #endif
 
@@ -631,6 +630,33 @@ static void dw8250_shutdown(struct uart_port *port)
 	d->no_int_count = 0;
 }
 
+static int dw8250_setup_dma(struct uart_port *p)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+	struct uart_8250_port *up = up_to_u8250p(p);
+
+	/* DMA setup requires a FIFO */
+	if (!p->fifosize)
+		return 0;
+
+	data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
+	data->data.dma.txconf.dst_maxburst = p->fifosize / 4;
+	up->dma = &data->data.dma;
+
+	return 0;
+}
+
+static int dw8250_setup(struct uart_port *p)
+{
+	int ret;
+
+	ret = dw8250_setup_port(p);
+	if (ret)
+		return ret;
+
+	return dw8250_setup_dma(p);
+}
+
 static int dw8250_probe(struct platform_device *pdev)
 {
 	struct uart_8250_port uart = {}, *up = &uart;
@@ -765,22 +791,16 @@ static int dw8250_probe(struct platform_device *pdev)
 
 	dw8250_setup_dma_filter(p, data);
 
-	if (!data->skip_autocfg) {
-		err = dw8250_setup_port(p);
-		if (err)
-			return err;
-	}
+	if (data->pdata && data->pdata->setup)
+		err = data->pdata->setup(p);
+	else
+		err = dw8250_setup(p);
+	if (err)
+		return err;
 
 	/* Use the BUSY-safe sequence for both integer and fractional divisors. */
 	p->set_divisor = dw8250_set_divisor;
 
-	/* If we have a valid fifosize, try hooking up DMA */
-	if (p->fifosize) {
-		data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
-		data->data.dma.txconf.dst_maxburst = p->fifosize / 4;
-		up->dma = &data->data.dma;
-	}
-
 	data->data.uport = serial8250_register_8250_port(up);
 	if (IS_ERR(data->data.uport))
 		return PTR_ERR(data->data.uport);
@@ -863,6 +883,7 @@ static const struct dw8250_platform_data dw8250_dw_apb = {
 static const struct dw8250_platform_data dw8250_octeon_3860_data = {
 	.usr_reg = OCTEON_UART_USR,
 	.quirks = DW_UART_QUIRK_OCTEON,
+	.setup = dw8250_setup_dma,
 };
 
 static const struct dw8250_platform_data dw8250_armada_38x_data = {

-- 
2.53.0


