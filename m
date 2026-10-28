Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A61606A324
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 08:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mUgGgDoi;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bCXmIkJM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tOHeyNRvmbXusJKMq6HVQABJtMt41LHGwmGBsrUeMzk=; b=mUgGgDoisbwUAcvp+AG6nQFTWb
	Pl3ohEk6cLrkkHYMHi5r2c0wyWD3SdxwXbdUgjgxfBti13PR+E5s4+Cn5JZSeB4p+Stx9U1o9sBLs
	UWlbDfz9RZzciLBltD0+dfEWxUieQdUGYa9FrX31CIbnoanIN4ZaX4CJkuC6Itav8ka7DB31jNWN9
	AgF+euuj4dOLaWJFW3oU1kxcHjJ+dAodEZ7M15kSMz10qWl7bpni/74kN1l5LuhvnkKbs9C8C/HY6
	Ni5fxcIYirErAdcaz8iryZxsp26OqxyrzmrTuIzKwD9E6D3I1myyHsFRgcPpfMrjIowump4jShG9u
	QejvU1MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLz35-00000006Yer-2sWU;
	Wed, 28 Oct 2026 08:30:19 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLz33-00000006YeV-2fYj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 08:30:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793176218; x=1824712218;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=+VrEP1WtzBFvz1LUMzocRw+T/DgCiiZIdHezI1jy7fM=;
  b=bCXmIkJMQiIId3QfgKx+Qq+JUqIQPhcBl6MWMbZEm70kwKCDrryUmJfF
   vRJGfLVD7GDRY8W2jiJH/xFv2v+4nOjj5h7WaOlxLuyqpvfQL3AxAR5+k
   Ox5t415SVvZfwJ3sSGKSJvVOAIqLQeFs5JvX62EdDh41cXW0nHffMjVOu
   lOoKQ4DLMNIqVmMDOlxGF04YZSM5yQ40wTSQZ1/+ZmroD2GE2yCv5pzVF
   9zRGWPTmvprvqbwCw+zwwPMS6s+YeXB/gMD5WY6RSJ1qp9WZ/6yT8hO0u
   WXEDl5YSYwgr/5veVNF2e0Q4JAxJ0fP95euBo8yF55/gdB3/XfzQuOh52
   g==;
X-CSE-ConnectionGUID: HUgapPIbQCuzunP/PnO2MQ==
X-CSE-MsgGUID: R0dXbY3HTlOvnTULpGugWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1911569"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1911569"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 01:30:16 -0700
X-CSE-ConnectionGUID: DUrcjuXNSSKkOJTwbdT4hg==
X-CSE-MsgGUID: JUePD06ET02YdR9Jmycmmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="6600853"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.156])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 01:30:10 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 28 Oct 2026 10:30:07 +0200 (EET)
To: James Hilliard <james.hilliard1@gmail.com>
cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
    Samuel Holland <samuel@sholland.org>, LKML <linux-kernel@vger.kernel.org>, 
    linux-serial <linux-serial@vger.kernel.org>, devicetree@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v4 2/5] serial: 8250: share the RX trigger conversion
 helper
In-Reply-To: <20261027-submit-h616-uart-fifo-v1-v4-2-d37e018fd0a6@gmail.com>
Message-ID: <805ee11d-c385-f509-456a-35205d8963b4@linux.intel.com>
References: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com> <20261027-submit-h616-uart-fifo-v1-v4-2-d37e018fd0a6@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_013017_763296_D1D9CB9F 
X-CRM114-Status: GOOD (  23.42  )
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

On Tue, 27 Oct 2026, James Hilliard wrote:

> Extract the receive-trigger threshold search into serial8250_bytes_to_fcr()
> so drivers with per-port threshold tables can use the same conversion as
> the generic 8250 implementation.
> 
> Include the unsupported-table check in the helper and preserve the existing
> nearest-lower selection and highest-encoding fallback.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  drivers/tty/serial/8250/8250.h      | 16 ++++++++++++++++
>  drivers/tty/serial/8250/8250_port.c | 12 +-----------
>  2 files changed, 17 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
> index 21ed9c41b751..195ed58a2231 100644
> --- a/drivers/tty/serial/8250/8250.h
> +++ b/drivers/tty/serial/8250/8250.h
> @@ -8,6 +8,7 @@
>   */
>  
>  #include <linux/bits.h>
> +#include <linux/errno.h>
>  #include <linux/serial_8250.h>
>  #include <linux/serial_core.h>
>  #include <linux/dmaengine.h>
> @@ -73,6 +74,21 @@ struct serial8250_config {
>  	unsigned int	flags;
>  };
>  
> +static inline int serial8250_bytes_to_fcr(const unsigned char *rxtrig_bytes,

This looks way to complicated to be inline function so I think it should 
be kept in 8250_port and exported from there.

> +					  unsigned char bytes)
> +{
> +	if (!rxtrig_bytes[UART_FCR_R_TRIG_BITS(UART_FCR_R_TRIG_00)])
> +		return -EOPNOTSUPP;
> +
> +	for (unsigned int i = 1; i < UART_FCR_R_TRIG_MAX_STATE; i++) {
> +		if (bytes < rxtrig_bytes[i])
> +			/* Use the nearest lower value */
> +			return (i - 1) << UART_FCR_R_TRIG_SHIFT;
> +	}
> +
> +	return UART_FCR_R_TRIG_11;
> +}
> +
>  enum uart_port_type {
>  	/* Internal 8250 only */
>  	UART_PORT_AIROHA		= 124,
> diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
> index 36b2b0a2c05c..c332963dc2ed 100644
> --- a/drivers/tty/serial/8250/8250_port.c
> +++ b/drivers/tty/serial/8250/8250_port.c
> @@ -3018,18 +3018,8 @@ static int fcr_get_rxtrig_bytes(struct uart_8250_port *up)
>  static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, unsigned char bytes)
>  {
>  	const struct serial8250_config *conf_type = &uart_config[up->port.type];
> -	int i;
>  
> -	if (!conf_type->rxtrig_bytes[UART_FCR_R_TRIG_BITS(UART_FCR_R_TRIG_00)])
> -		return -EOPNOTSUPP;
> -
> -	for (i = 1; i < UART_FCR_R_TRIG_MAX_STATE; i++) {
> -		if (bytes < conf_type->rxtrig_bytes[i])
> -			/* Use the nearest lower value */
> -			return (--i) << UART_FCR_R_TRIG_SHIFT;
> -	}
> -
> -	return UART_FCR_R_TRIG_11;
> +	return serial8250_bytes_to_fcr(conf_type->rxtrig_bytes, bytes);
>  }
>  
>  static int do_get_rxtrig(struct tty_port *port)
> 
> 

-- 
 i.


