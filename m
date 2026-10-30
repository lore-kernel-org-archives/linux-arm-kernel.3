Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D55606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 10:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TnviMHTY;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=X+w4kQtA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vbB1PXZ8iofBpMV+/vOpPqAHgjVf96svSHPsdRMK9m8=; b=TnviMHTY9XW5zyDMY/g19tzLUo
	iPJS60QHJKl+BkznsOY/C99tN1hdx7mTLvybpwhXO2pJp8g8nGmaL83HONHixG6LiuwCI1tRZL8TO
	IiIHzac15XjSuyV4s0uO9ZGl4W2JbJzP2nL34pMaWRD7gDULVwMUBVSNzwHcaF/LJgKLSBL+nuyrn
	nN3EyTuvFhtwTxfzZdzyLp/F2/5ZC7lcUecgxiE/UQvMSh+tmv91VPRkSkfHIxc7GrD94WlppcJwK
	x9z+CVsKXlV+zTktq92B70ytuK4EUYKxQ1pDB9UKL530LRC4RUDB2tEOxC8njl02U/6pQR8AN2LhK
	KCZhOREg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjPq-0000000BLAT-27IW;
	Fri, 30 Oct 2026 10:00:54 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjPn-0000000BL9Z-2Tue
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 10:00:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793354452; x=1824890452;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=HaKzP3810qJc116puiQADiUuz5O1FIDoNR4g6mlq8v8=;
  b=X+w4kQtAHzwUmUe9+PBTLaadCKAB6MctNGUe1PLHbgfZ7ym8YRw9cZVy
   1/96bt8pQkJqeK+WQEx83EnKwZYd3mA1D58vvMoLv837sLzzdJgr5HUo5
   rlQAcWzvwQdqvDa5EBjcAk1HL53pHSgWOMJoMBeeQ3Be1hRXoFZWiNObd
   wwRFqZUc4JUDEp23Y6fFh7AKcmlrYKkGcQT9FS/wKszqIc0CErz/n/yie
   4Tz/fBA0fSwm1SueJohHZaGWXmFIBY09EMr6uC990nqnDCe3lUiaPFS5C
   kwk4NNb4DCEMUdd/xeopsqh+NUq7ejsPze+ky1a2GMGh/EhKeTyjhfuk1
   Q==;
X-CSE-ConnectionGUID: BZQsn8z+S4ujIzQvTJ472Q==
X-CSE-MsgGUID: hTijJ5uLTkuudxq/PcxwMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2001667"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2001667"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 03:00:48 -0700
X-CSE-ConnectionGUID: 9X1qCIjjSt+PfUy51gRjaw==
X-CSE-MsgGUID: FummiFHNSVWXyiswHYi6ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5521270"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.32])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 03:00:44 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 30 Oct 2026 12:00:41 +0200 (EET)
To: James Hilliard <james.hilliard1@gmail.com>
cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
    Jernej Skrabec <jernej.skrabec@gmail.com>, 
    Samuel Holland <samuel@sholland.org>, LKML <linux-kernel@vger.kernel.org>, 
    linux-serial <linux-serial@vger.kernel.org>, devicetree@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v5 7/8] serial: 8250_dw: discover Allwinner A523 FIFO
 depths through FCC
In-Reply-To: <20261029-submit-h616-uart-fifo-v1-v5-7-53b433aebbf8@gmail.com>
Message-ID: <6499d93e-c6e3-7bfe-b717-a2e032137e1a@linux.intel.com>
References: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com> <20261029-submit-h616-uart-fifo-v1-v5-7-53b433aebbf8@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_030051_678923_0A36A050 
X-CRM114-Status: GOOD (  27.63  )
X-Spam-Score: -4.2 (----)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 29 Oct 2026, James Hilliard wrote:

> The A523 UART integration, also used by A527 and T527, has 64-byte FIFOs
> on UART0 and 128-byte FIFOs on UART1 through UART7. Each controller reports
> its TX/RX FIFO depth in bits 31:8 of the FIFO Clock Control register at
> offset 0xf0. The field holds a byte count, not a logarithmic encoding.
> 
> Read this field in the sunxi setup callback when platform data does not
> provide a fixed FIFO size. A fixed size takes precedence, so H616 retains
> its 256-byte configuration without accessing FCC. The probe has already
> enabled the clocks and deasserted reset before invoking the callback.
> Leave the FIFO clock-control bits untouched.
> 
> Validate the depth before generating the RX trigger table or setting the
> transmit load. The quarter-full threshold must be positive and the
> FIFO-depth-minus-two threshold must fit in the byte-sized table and RX
> trigger API. Report an invalid depth and fail probe instead of generating
> zero or truncated thresholds.
> 
> Select this setup for the A523 compatible. Derive the transmit load and
> RX threshold table from the discovered depth using the common sunxi
> helpers. This handles the different FIFO sizes with one compatible and
> one receive-trigger mapping.
> 
> Like H616, this integration has Allwinner-specific debug-divisor and
> RS485 registers overlapping the generic DesignWare feature probes. Use
> the common sunxi PIO setup, BUSY-safe integer divisor programming and
> software RS485 handling. Keep the APB clock gate enabled during termios
> updates with SKIP_SET_RATE.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  drivers/tty/serial/8250/8250_dw.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
> index 3bc6735fc253..2ab91f479fc6 100644
> --- a/drivers/tty/serial/8250/8250_dw.c
> +++ b/drivers/tty/serial/8250/8250_dw.c
> @@ -17,6 +17,7 @@
>  #include <linux/device.h>
>  #include <linux/err.h>
>  #include <linux/io.h>
> +#include <linux/limits.h>
>  #include <linux/lockdep.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> @@ -45,6 +46,10 @@
>  #define RZN1_UART_xDMACR_8_WORD_BURST	(2 << 1)
>  #define RZN1_UART_xDMACR_BLK_SZ(x)	((x) << 3)
>  
> +/* Allwinner FIFO Clock Control register */
> +#define SUNXI_UART_FCC			0xf0
> +#define SUNXI_UART_FCC_FIFO_DEPTH		GENMASK(31, 8)
> +
>  /* Quirks */
>  #define DW_UART_QUIRK_OCTEON		BIT(0)
>  #define DW_UART_QUIRK_ARMADA_38X	BIT(1)
> @@ -64,6 +69,7 @@
>  struct dw8250_platform_data {
>  	u8 usr_reg;
>  	u32 cpr_value;
> +	/* Fixed sunxi FIFO depth; zero selects discovery through FCC */

Please generalize the wording by removing sunxi, it might true today but 
as more drivers start to use it, then the comment gets obsoleted by the 
code additions.

>  	unsigned int fifo_size;
>  	unsigned int quirks;
>  	int (*setup)(struct uart_port *p);
> @@ -729,6 +735,16 @@ static int dw8250_sunxi_setup(struct uart_port *p)
>  	p->type = PORT_16550A;
>  	p->flags |= UPF_FIXED_TYPE;
>  	p->fifosize = data->pdata->fifo_size;
> +	if (!p->fifosize) {
> +		u32 fcc = dw8250_readl_ext(p, SUNXI_UART_FCC);
> +
> +		p->fifosize = FIELD_GET(SUNXI_UART_FCC_FIFO_DEPTH, fcc);
> +	}
> +	/* The RX trigger table must contain positive, byte-sized thresholds */
> +	if (p->fifosize < 4 || p->fifosize - 2 > U8_MAX)

As is, these checks are hard to understand / connect to why.

It would make this more obvious if you'd name those literals so they'd 
connect to the FCR side code (naming should be done already in the FCR 
patch, obviously).

> +		return dev_err_probe(p->dev, -EINVAL,
> +				     "invalid FIFO size %u\n", p->fifosize);
> +
>  	up->capabilities = UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_AFE;
>  
>  	dw8250_sunxi_setup_rxtrig(p);
> @@ -972,6 +988,12 @@ static const struct dw8250_platform_data dw8250_h616_data = {
>  	.setup = dw8250_sunxi_setup,
>  };
>  
> +static const struct dw8250_platform_data dw8250_a523_data = {
> +	.usr_reg = DW_UART_USR,
> +	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
> +	.setup = dw8250_sunxi_setup,
> +};
> +
>  static const struct dw8250_platform_data dw8250_octeon_3860_data = {
>  	.usr_reg = OCTEON_UART_USR,
>  	.quirks = DW_UART_QUIRK_OCTEON,
> @@ -1024,6 +1046,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
>  static const struct of_device_id dw8250_of_match[] = {
>  	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
>  	{ .compatible = "allwinner,sun50i-h616-uart", .data = &dw8250_h616_data },
> +	{ .compatible = "allwinner,sun55i-a523-uart", .data = &dw8250_a523_data },
>  	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
>  	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
>  	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },
> 
> 

-- 
 i.

