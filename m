Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D895D608508C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 19:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AoIHKfsF;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EoIywQ9D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=U5hO5zwt5yc5AR2FI7Ugtcs42sAA+kCKb2Q1p1ofynk=; b=AoIHKfsFftyArK
	o476Gn1mFyBktD/WiqPrM79QizFnVNKj6qJzrF2LlEV5lP9k/tFKcRCAsk5etUi8AsBJ6gtOW0IoD
	2HA12qH0zjQKTVrt3QKMSAhaGQIdQs/wMg4cvLNuRG3nyrWvXEwS+9V66ZV/+YIRmURIHl3tw3d3X
	qMqwVU/m9iv4a4rgUYNIaD+0iLEuRiV6RFjZL9JMdk6bp+EBeqNhnZGmZlwUrFuCCjukNaaNA0u2F
	EEXvpUvUZPyzzN88PE3gSS4RbVuXWrlSe+2OTYX1OoKOzOj5ikfSi92x11tmFAjs10hJ0+Ju5imQ7
	lx+quSTF6VB+fPED5aRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNy7v-00000000EIf-2WcC;
	Mon, 02 Nov 2026 19:55:31 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNy7q-00000000EGR-3YNU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 19:55:28 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-48e94879f02so959788fac.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 11:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793649326; x=1794254126; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U5hO5zwt5yc5AR2FI7Ugtcs42sAA+kCKb2Q1p1ofynk=;
        b=EoIywQ9DQEkvit2qZJcrUnFQgOQzW+HBwVTMOc1Wuv7lUTcnv8ZC2lNKuN9a2ZW55F
         T21ROri8XA36uUuOa7FiVG7hX0OXTLdTzoIBr/OfYzPRcrd0uzsrAk4eur1q5M1HtPCS
         5bQgvjfiaiSFlkdfLepnypboV4WLSsg32m8r4TpHvth/vXe6A/xi9lUadQZUyTFJfDQT
         2Rz79am1aocQ9X/PoqRwP746u3f7udzbpaEjmgxSWzZzi97m3uoP7nVDaGcZ8jk3M5qe
         PaUxmx40dTJbaSN57KJVBIYMMGtrS1HrQnJlbE7COKPf2Uw2k3WpFIYFiEZaX1LPO9sr
         WXFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649326; x=1794254126;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U5hO5zwt5yc5AR2FI7Ugtcs42sAA+kCKb2Q1p1ofynk=;
        b=mLA0LIAcLQ41MfxrnKwHXBiMg+1P10gNqJh5BTV+SuAkL/4+F7bWP3ohrDT+DBc2pV
         fMIw/CDV+7EH1p2wyVZFcKtgOgdyzcLoSC3/ti/aHMeAmMbTKV+NZFsBs7NUNGhAkcez
         H1OmPv0NL2QhyTvLdHU82FTCwMsw+nT5fX3OZ5no724lyMCQSLnwttLEPMaynwn33Iwx
         aeBcq2mTQIve82r/gF+UECNwOfaJRTQ17uYXD31pkBTcouOFJShsaaWBSsgTEIynHG17
         vKWmpkGxp0oxb315c8Jug8FlG1IfcEuElbxMoMmn8NTZsFKTBVrITVLNQZknYSJaQ1NW
         PktQ==
X-Forwarded-Encrypted: i=1; AKwUvBwnBx+Lv+YJbMa/xHMg/V+5RocwYt/2w/7fNqiL4HTQ72WBv1vlMxOdA4a0spu4rnNnRNs3pnQKsbQfHcIF2HRp@lists.infradead.org
X-Gm-Message-State: APuU4Z+KfHJDED0XVrmqrq7J6AiXbETwaO7H7XCvB9II1vwbN5fgvPis
	lr13wPpo7BMBEGYk0J4yTo/uKDTVTxAvMsdUChicSSpfZNlz9SGGn1Z1
X-Gm-Gg: AYBFou2ie91J8SAdy2BXH0UWt2kPr2FhB3suu6fEbXkCR4Xm4fgG7sP8yfuTVoY0l08
	l59xX/UmvAH/ydDm47w0ZqEeg2DqTMThgshrUDHy+GMQSzsvtEry0Ax9ROCbwg+mdR1F0mdMIkY
	1SxKoBn+Bc4e4vWf4ZhPfdCMMm31hqJOzkHcsxqlDNbps6Wz049/KD3s+twy9zs6PUZ6tAOKFUo
	MKjjLn5yUbeOHNMnbgPAhCpbcIbwskfKGOvG6CUUWPYXTF1vNMjgSrIknohEjUxPEy6VT5YNlpL
	g3996mfZLvcrvFYvCTs453i59PliJTMgogquJaXs7kezmZHppcF+5b4E/so2thSGtinbGXpNeO6
	9rK9IUwcAJq9zDgM7ZFMUB66jvjAfoDOJug5z0DtUG/64hRrgVo1oyEU9p2PUwhChcfYo3HNR3J
	SW81uYXkDiTODjnZn9kX6HoOsTeQ+dudmHg7dqJ7YaVIdBlC+HewbRam3ZtrQ0KkQpXZ5TgiqHX
	5++6oDh8dtFXwkOuJUQiO7AvbpM21qEvpin7kJSDvd9J0Xqf9C+FZ7HRIMWL1DJJbcsDOeBVB+Y
	l5xLNe6V5Yxp8uGynfQKrANsIR3kKcu27msKm99Kf72/20XObqfJ6CjIskMhxWy+ea2vprjGjij
	urTjb7v8VGOgPMhY9faiTMpp++IQAL8MGrlA51tAwTNUwJYIVdExwfLT/1+DdCenl1YypfjicwJ
	gX53BJ0OLNLOjJgjEYZkRmyEpV6rVEJjpPt6SV4uLnANQz0gnDFlE=
X-Received: by 2002:a05:6870:ac96:b0:48f:e21e:1e7b with SMTP id 586e51a60fabf-4a9077e817fmr6538976fac.59.1793649325629;
        Mon, 02 Nov 2026 11:55:25 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a921353dcfsm7809249fac.0.2026.11.02.11.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:55:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 12:55:16 -0700
Subject: [PATCH v6 1/8] serial: 8250_dw: select port setup through platform
 data
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261102-submit-h616-uart-fifo-v1-v6-1-25afcb346b0c@gmail.com>
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
X-CRM114-CacheID: sfid-20261102_115526_897284_8DFD42CB 
X-CRM114-Status: GOOD (  19.67  )
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
platform and continues to skip optional-register probing while retaining
its DMA setup. Select the DMA setup helper directly for this integration.
Keep generic setup for devices without matched platform data as well.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
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


