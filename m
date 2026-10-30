Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10895606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 10:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1lshpKdV;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JNJHQQiO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kkuv7O8q4cZvOapU+GF7kcHYvW6qtmGdZ3sS6JlSXTM=; b=1lshpKdV5I5mUKlIicYWyAMVA1
	sXIej4C+YMV6mQJlPvXLPNOZEBBnj4xQ/MUpNGynsXwOAHgM0WVWO1a5FU5HwPAsHBajnkSjVGT9b
	c96trObWn0YJaP8ffoGv+9hvgaxzWa5ryhBdoO9QKu7yh3W7h68tu5yVuuvu8cKaj3nCSYQvmq0Pq
	7FnLhiAFVqjW+KnNmpqQpJ5h2lqAglRafmRcaxxtJfpOU7oXsVcqdPlE7Xr56/fNaCni9zSVx3H6f
	J1EzX3fEk1kw1CUpqnUsKOAJQj38teUm45OZkfuyZDClX/4XG/20FtAm0wi5cBZFYnQSRGnItB8tH
	0pFFc0lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjeV-0000000BMuf-2cBx;
	Fri, 30 Oct 2026 10:16:03 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjeS-0000000BMuG-1VBC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 10:16:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793355360; x=1824891360;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=R+nXYiYx7BRcU9Txb0qgGufnwiu0QV9je3piyvExs5Y=;
  b=JNJHQQiOJZKhBltWPxUDqpj9Qj1Mb0wkeZZG11/KVY9EhFgMP/fsgZHO
   dqw22CiuFm+m/V5Gb4rgI5ZHfOcF4SSq8t2ZQ/VD8GctH2kheq9Z1tH+C
   prOBdFlqcigAsLCZNd8Ub97LsQT3GjHz7DI47Aq/QlZqgIttWidHHYdEP
   7Mnww578anwx31XzGj7p4CQILCBExdhxWBmNE2tTynxfX1hQjUgsmb4XK
   SClUXvkMrU/yY7lYNB8w64g8xXAfvxTpy3xr6Labnh1Dc7HMyZ0/EW6uK
   Ihmspk+xTzkUH/McNhEFyuC5RGERP+wT4XLIfNdb6shkN95jmCrPCmXX/
   Q==;
X-CSE-ConnectionGUID: mYVYos74TACBOnGY0w4rcA==
X-CSE-MsgGUID: MczVPKnsQw+VwpUBxlHBdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2116786"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2116786"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 03:15:59 -0700
X-CSE-ConnectionGUID: rt5aEbZaTLaQ3qY9NGwQOQ==
X-CSE-MsgGUID: 9YaRD7l3S2mTmC0XfSnmRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5305192"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.32])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 03:15:54 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 30 Oct 2026 12:15:51 +0200 (EET)
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
Message-ID: <3d7af02e-4196-bb82-9579-467e88879021@linux.intel.com>
References: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com> <20261029-submit-h616-uart-fifo-v1-v5-7-53b433aebbf8@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_031600_442576_7EAE8A0E 
X-CRM114-Status: GOOD (  28.68  )
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

One additional comment.

What is the reason for this "byte-sized" limit? Is it Allwinner specific 
or perhaps the use of unsigned char in 8250 driver to store them?

In the DW databook the CPR given fifosizes go all the way up to 2k. I'm 
not sure how large actual UARTs make them but applying the FCR formulas 
one could get > U8_MAX thresholds.

If it's just 8250 drivers type limitation, I think the comment should 
make that obvious the type could be changed as needed.

-- 
 i.

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


