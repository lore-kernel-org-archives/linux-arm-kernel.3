Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EA96082BE1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 21:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EXsNL3rm;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sUuv7EWF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AaGB+sHBwtYVccxB8PUJWA10dOr1SqV2RJG8RV3nZJ8=; b=EXsNL3rm9wM9ut
	KGJNY9WqhdTRoPNWghMp+2nUtWAZ0bWWgV5fOvfMhmG5b0i7Lz+qmCO1Lr8BrdPEm92hU7TJfa7mL
	mibIlvqDPZPWODY0ZvSsezr6gfVMzk6E98x898x2+h2z8KJ+LAWqCaJwwbrkmaaA0RPybxe6952GZ
	PLSOHcRXm+fYFhXEPTCaKA4S4esuNbD6oacjoLihVOAgkf5sVpM86jEB3Bcfx1GYAJCpu1YH1lYQz
	/CFE5s3CzDaTLbZcD+vm9oKB7yD0Iijda7FSYxVRLkkCt+MWjgxVrx796QhPqVQwQr3LL6rRcHmEQ
	9XXw+uyIN+Rc8HkS12mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMEl-00000003jPY-2SFo;
	Tue, 03 Nov 2026 21:40:11 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMEh-00000003jNI-14W9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 21:40:08 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-84a248254f4so19474a34.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 13:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742006; x=1794346806; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AaGB+sHBwtYVccxB8PUJWA10dOr1SqV2RJG8RV3nZJ8=;
        b=sUuv7EWFwpQ1yo3tY1Sd7aSke4yDfa3fpO+4Qn0dBd5HaUilqQo1+fEgN0Lew6fysI
         hz+PxqBGgqAKhm/7Bq6tC/b2KR68Wd76bMmQei9s+6E9YLRyfBN8SeV0mwoH9RK8IgSI
         cHZencSnuuLxLLr82BHckd473blYNJFJT8/4CuNloX1sjzCs3ebFimZQ0hy+Qrv2Sxdu
         YlvjKijgFv0t8oag5C52sd05uXPpTRVLn8kkRK+rV/PrvMeYCT5cjRi/zAa9UuyPVAqE
         o4Ko91jPD0YS2AUSyxbV7dhqP01EVhC4e8elrkTZJnevTrad/XDul30rJPdLOuhnboFL
         6vfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742006; x=1794346806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AaGB+sHBwtYVccxB8PUJWA10dOr1SqV2RJG8RV3nZJ8=;
        b=kXXFtBoeAJ+jEfVmt7pzGsasxJr2NkeVzlZxw0uRMiZKEqAwH8UFxf4ISuOa+LBCuT
         PyzjhYskOIxieSK9KJqqhtAQChf051d4Whzd2uTKEHrNxEsmUeuiErW4CduQGeiebfec
         JdFahS7cHutNXGq2KmrfyJK6YenK2Jj/bvRWFhNnBKk+zsVpceTcuPLTGIptvYOrs0SN
         /a/LQ6P0zQHAGWOQM34H/w2afvtzzM/SuUrjGBD8EzD4EVXWRPam2+UEsg4uV3/fgsKr
         MPEwVgsTlRLnY9nCC1hGN6r27/V1R6qqYvY/O6rXup3LZsJ8OynO4xIXZBzZ7a36mPnn
         0IIg==
X-Forwarded-Encrypted: i=1; AKwUvBxlzaDmeeuTzXRT7nbPE8vzED0rFfQLU9U6jA40p50zo9dDybGXbavlrzKhawYTiwmJi+r85Stp65G1qlatDD5a@lists.infradead.org
X-Gm-Message-State: APuU4Z9sFEsj7BWX3d+AvuS/HUQhtnYe4LamGaJbptfrt2t6IZ9lIxAS
	grhaTnEP+qB7TmIBMc6cPWDi6ovDEOee4vDwZxmM+cfQllDJEcz2bZCO
X-Gm-Gg: AYBFou2qawdl800rxlmlNee7yTZIULrd2ygZ++WxP+8OgfZKL4+90gcf2H1q2jyijQX
	6HEkifNFQBxhffRa+qt7VN/wvpcfE6qi43wt7Q3KpktCllV0BO98Mla5SLHRbrDJA7i7Xg97kF9
	lQjSybM2po+rX1KqhCh578I918OroQiAslKPHlQw/9c1Ap4XPs+gxr3OGx7UhvUCjD4Hw3JWY2V
	iW4BVuyRZVGzUJ3XtDI3F/aKVyCVnopi4N093wHnG3xCZwHjxCgRdOshSh6kJruRNYxO9srsRcJ
	mJMN3so2+HgClDHLw60P5iWvr+O06eNITJQ8CS+LOYGuCIsALAj5ecx4bBTp269ZUMmehdN/0Ph
	hYds1747JlOn5hn3Vg9GZnGqkolJOOKOy/Fomx09cIDhAOOCjM1V+BJD/y0JE4vsFvWxuN1RIou
	anJuUiv61EF4lW13iXKUqrYUdEVuH9RlmVrynVGS+FpG3Ry2SAXHP4k/dBNEkZY0FVLwMUrejFG
	BZZ0/1Ark8w57v8SgoU5Dm/PmQiJdMySH1D+eJSUva/eN4+NJcBvn0YaPZ8elp47eY7X6maVKO4
	s7+2d8u2ajAW+ESN9VUd4BtdWcYsoKT1WU/79ePtV0Ygs8VAmdnvyQgBaJiqq50nALxZWbc+v5c
	Hmn74y41d4e4gD1K2etg7gV8dsa/dO9+e61CzFCaGINPZITnjf++0NQtme75tTfNE7MoNRkANFX
	tCWLfT7Uh4rXC9O4fG4nXdKo8wwgACOcOr9K+393dtd4/lTCJnbwR8
X-Received: by 2002:a05:6808:1a0f:b0:4cb:26a3:a0dc with SMTP id 5614622812f47-5640deea675mr10671861b6e.20.1793742005972;
        Tue, 03 Nov 2026 13:40:05 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm27060b6e.11.2026.11.03.13.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:40:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 14:39:54 -0700
Subject: [PATCH v7 01/12] serial: 8250_dw: select port setup through
 platform data
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261103-submit-h616-uart-fifo-v1-v7-1-c9e248d685c1@gmail.com>
References: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
In-Reply-To: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
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
X-CRM114-CacheID: sfid-20261103_134007_302172_1884A89B 
X-CRM114-Status: GOOD (  19.29  )
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
 drivers/tty/serial/8250/8250_dw.c | 41 ++++++++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 11 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 9cbe076463e0..a546cf2de7b6 100644
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
 
@@ -631,6 +630,28 @@ static void dw8250_shutdown(struct uart_port *port)
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
+	dw8250_setup_port(p);
+	return dw8250_setup_dma(p);
+}
+
 static int dw8250_probe(struct platform_device *pdev)
 {
 	struct uart_8250_port uart = {}, *up = &uart;
@@ -765,19 +786,16 @@ static int dw8250_probe(struct platform_device *pdev)
 
 	dw8250_setup_dma_filter(p, data);
 
-	if (!data->skip_autocfg)
-		dw8250_setup_port(p);
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
@@ -860,6 +878,7 @@ static const struct dw8250_platform_data dw8250_dw_apb = {
 static const struct dw8250_platform_data dw8250_octeon_3860_data = {
 	.usr_reg = OCTEON_UART_USR,
 	.quirks = DW_UART_QUIRK_OCTEON,
+	.setup = dw8250_setup_dma,
 };
 
 static const struct dw8250_platform_data dw8250_armada_38x_data = {

-- 
2.53.0


