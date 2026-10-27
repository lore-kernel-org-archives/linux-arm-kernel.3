Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B79C606A320
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 23:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LMGfYpy0;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g1QBOwYA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oUDm3Xp9Etw97Pip2kF/VAmErAZUiFyUqD481xySoOQ=; b=LMGfYpy0BcH/V6
	QN1ToxfFqcVSF8skv4OHWs8370r36zqMQh6NXLO06vpfV0fah89Hne2j0da5fSdI20KLwwwMAIHln
	YUMApi2IJQ6kbzjOsydyfAa4MkXnCj9N1ExMd8IJGE1GVNV31w54YKt4Vn01IPtQCYPG5INz8xMWg
	mXVLLzQniN0YRkWpJdyjBbF/6iJN5IQy0FTdrLZUWYGzCK5lo63z+QYa3AOBW34n3lGGecUZfcdy1
	FgrvqznXBLSwvAiG4hsW8d2EZPFzXvt3Nv7P2f1j6eQOfxi5anlABAeDer5dOnKiok/DMr332GVzM
	CEgKMrZjyR42yCWlKcOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLqEn-00000005tT0-1FXZ;
	Tue, 27 Oct 2026 23:05:49 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLqEk-00000005tSC-0938
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 23:05:47 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-84d5e56f876so282914a34.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 16:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793142345; x=1793747145; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oUDm3Xp9Etw97Pip2kF/VAmErAZUiFyUqD481xySoOQ=;
        b=g1QBOwYAu+M7z7Zq7XM5RfnHx1K9Au1SI9xq/55ZaXx5vPuKbgcQNHRSrkDQWNYK3/
         7hI3iDWZsKf07U6y8qe1foRXR2lR19MXsU/NPnVU6Lr41y6iAKb6b8Nn+qOmkEX2de9Z
         cBhPuuY2vEgLqdRxWKem0mPRT12hMSaaclGZqxEYxtX9GbNoea5P7t+vlHMHYo65Fnk3
         PTbGyVNhtn74e4Q3kIHH8QrOvYXK1VoMKfF5kdcqT5xqTmYDMtte7Rvzcbhq4Ip4Q8jC
         F3HSXK9VKI8FQkJbbCykeni2beqpX0aVjC217ckt6IUazFsnZ89V8gBD2Di6qw9yNFJg
         oKxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142345; x=1793747145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oUDm3Xp9Etw97Pip2kF/VAmErAZUiFyUqD481xySoOQ=;
        b=pWhWcBBIomi7pKsMA5zQAF+vKwlAycYaroC6q5zU3xyKtxhd17ICa1gNk8YWhuUEbo
         jcau9F6fXhzjYQkavhMHhXQf4TzBH5Gw/QoQtBssQo/tp1Ga50VHrR0CRKxxbH98zpod
         xPhktpgRVa/PoJDsO9egIV7l81JzYWK47ZMPJI9y3RJIwQ5NzNSzaYwne1/JkB2nu2NQ
         p2ndbNSbL6rBRV9o/1lp8H4NNnrtHRNhUIT9/O6xOtc8+SAIhyJYRVpJewY4qhZRbe1P
         8rKqjsf1wbYXXoA7LnYkcU5ElwclBijos8VgXMuIWbz+DPXZnKTB20SZHawj7qXOGxuv
         VQ3A==
X-Forwarded-Encrypted: i=1; AKwUvBxApWbijNWThER0kv5VOGHbn5Fx2ZPQ6OSLqBA2qCxdHivCqgx5oOcWTn42pMn1hxnTYYr/tzp8v0qnSTDPQpI6@lists.infradead.org
X-Gm-Message-State: AFq9FYKSj85if3qEa2k49iPO1w3iujkBbHvnW8sp2I0VBrr7k33KBuuY
	l6/a+M7p1zSXiZX88DgbJsT2cciWbWzvn7uQjczQrYOcUyLLbYa1CoP9Gs7mZ1i2
X-Gm-Gg: AYBFou1S9PHdTZxxsVzO1isbTCTDbDmoYwLf6Oqbh7qMsy2zYcU8TUblzq1AxYYtbGv
	z2vdlqKJuFxZ9o8HgU6husH+1A6EqyHPyiMI2d75u5MT5IjmeHSowXd8ufRll+4pq4359anEgXl
	6S9m2toV3xGqN6zWKCgAjoYiQW5QUdecT2qX50FDLmbJAEhK7lM2IhvaJkWzpncY+/hRQsFzdrP
	aBuFEEfNLeAgdxNLKUJto310j4gu20rTMQRDz9cfSng+DOGq8ZzUAvxxuBPLXijRuXmfYAR5xn4
	TqKSTwOSVs36IJDgA4zv/cE3RDeWOzXcrDfxp/wEE+WPhOjgUy+ur6qZoSR4P0mwclGO6yOZq/Z
	fTpDYxzYT/oRbloFK24ss/VrtfgofL6LbSEUQgs1/MoptZzPOGbfRqpJyPOcBwWMaLLTvGFPQMv
	YE31oh8KTqmWWkXxwFiMtt2Ae+5ifAJyNyO9flWGdpUimvgxQwVbv6lrQDyYQietdqag4okoKQL
	GTiZ2iBwi6b37OWdulRW/IM98QSQJmEp1T1syP53YEnYhWOezy2aPEfeOmQKkFl/kbN0vZRLbnS
	cFUBpXPBdY06UGBUr7opp1LvQC4h95HvszOVyCb62sBhTg9n/Wf8p2BjtAq/nHqkbQKadN7shrA
	83Znuc70M2xIfUijjXK24X1Z/qeQwIu/BkX3eRsSNqdD5Ei3b2E3+habK4AQIqN+KbnM6GVZNN2
	Br0Q==
X-Received: by 2002:a05:6830:4411:b0:829:9992:20f0 with SMTP id 46e09a7af769-85ac0fd0da4mr851500a34.28.1793142344897;
        Tue, 27 Oct 2026 16:05:44 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb0741c9sm12093328a34.10.2026.10.27.16.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:05:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 Oct 2026 17:05:29 -0600
Subject: [PATCH v4 1/5] serial: 8250_dw: select port setup through platform
 data
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-submit-h616-uart-fifo-v1-v4-1-d37e018fd0a6@gmail.com>
References: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
In-Reply-To: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_160546_088339_54EBAF86 
X-CRM114-Status: GOOD (  19.05  )
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
can supply their own setup before the port is registered.

Replace skip_autocfg with the Octeon setup selection. On 64-bit builds,
Octeon continues to skip optional-register probing while retaining its DMA
setup; on 32-bit builds it retains the generic setup. Keep generic setup
for devices without matched platform data as well.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c | 44 +++++++++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 11 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 9cbe076463e0..1351523f0c47 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -64,6 +64,7 @@ struct dw8250_platform_data {
 	u8 usr_reg;
 	u32 cpr_value;
 	unsigned int quirks;
+	void (*setup)(struct uart_port *p);
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
 
+static void dw8250_setup_dma(struct uart_port *p)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+	struct uart_8250_port *up = up_to_u8250p(p);
+
+	/* DMA setup requires a FIFO. */
+	if (!p->fifosize)
+		return;
+
+	data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
+	data->data.dma.txconf.dst_maxburst = p->fifosize / 4;
+	up->dma = &data->data.dma;
+}
+
+static void dw8250_setup(struct uart_port *p)
+{
+	dw8250_setup_port(p);
+	dw8250_setup_dma(p);
+}
+
+static void dw8250_octeon_setup(struct uart_port *p)
+{
+	if (!IS_ENABLED(CONFIG_64BIT))
+		dw8250_setup_port(p);
+	dw8250_setup_dma(p);
+}
+
 static int dw8250_probe(struct platform_device *pdev)
 {
 	struct uart_8250_port uart = {}, *up = &uart;
@@ -765,19 +791,14 @@ static int dw8250_probe(struct platform_device *pdev)
 
 	dw8250_setup_dma_filter(p, data);
 
-	if (!data->skip_autocfg)
-		dw8250_setup_port(p);
+	if (data->pdata && data->pdata->setup)
+		data->pdata->setup(p);
+	else
+		dw8250_setup(p);
 
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
@@ -860,6 +881,7 @@ static const struct dw8250_platform_data dw8250_dw_apb = {
 static const struct dw8250_platform_data dw8250_octeon_3860_data = {
 	.usr_reg = OCTEON_UART_USR,
 	.quirks = DW_UART_QUIRK_OCTEON,
+	.setup = dw8250_octeon_setup,
 };
 
 static const struct dw8250_platform_data dw8250_armada_38x_data = {

-- 
2.53.0


