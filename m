Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49588606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 09:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VrUubbza;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i8DbKOlZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=njqMJnp6/HE68bbK6MSV2Wy4GJh92K9iO3Rz8LAhcKo=; b=VrUubbzam8b0EiSoKDKzGJU+TM
	4+IzNKjol9CQmqCJFwqDRg00AW0sXIJKeVjJ+KjMTmKAI8L2qYMvoByl3m6xN+pVWab705CbWGVD5
	LVq0c8MB3HhPMs3LnLLofAsmeTBUw+WSLdIFWBpZXFULkefIFItcRo5Fb9ngq9uvKh+Fj/3c7U0CO
	k9gq62qlB7DO+SMZeglAeqsPxBMsXcrP7jCF2DBV/KCtIDfiOoH1d8NYWqxO7wuCmyT5qQYtx5B49
	+kbidJq/6Iv6H7BDi/1XccJUyVEmwDI+3UCU5S2uGP38GKhXG4Uzp9UhfGbGKHLPAVfLP+ffWcm/4
	4eN/xTTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMiuL-0000000BF4F-0q5G;
	Fri, 30 Oct 2026 09:28:21 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMiuI-0000000BF3v-1Zxo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 09:28:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793352499; x=1824888499;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=s0MvRPb2Qurw45msDO/DZM5UC5qzvS3+BVl3NGmaV+0=;
  b=i8DbKOlZHI4M6JbCX5LXoMUP3oWhWbdna9BAMwkMrQvUMAzrbFkYSCQ8
   +UISZGV32IA52272SA7CLvIHVVvSAzSjFT6H5TnGHxJ2wX6jngjS1G8C8
   bga0nkTODwAWjqV1RO7PHarux36qBs5BDUENPpAHChgEvsNUutg62pfi/
   2OK6T7gQg6Lgwdw72TiNrEfvuh5UrMv5uPWp8/tpZ7y/7Ix6+u87skHyA
   TBX9Cy90mYTwCH7wH25siD1OmRM7aA3pN/8gaykwjWkRs4BmtAtl+mkaq
   cd9fbfiejgpsn+5KMRmXPcSfKIwnG+WJVuSI3XSquibGoybWymzqEVOL4
   g==;
X-CSE-ConnectionGUID: I96Vu9bFTHqzdc9TjLvfeg==
X-CSE-MsgGUID: uGR7A2acQ9SFJiS9GqY2tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="1989001"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="1989001"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 02:28:18 -0700
X-CSE-ConnectionGUID: 5OZpA/gSQiyytTYeB5Xo7w==
X-CSE-MsgGUID: NN2wxNBBT5GP6Izv2MSDIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5350236"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.32])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 02:28:12 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 30 Oct 2026 11:28:09 +0200 (EET)
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
Subject: Re: [PATCH v5 1/8] serial: 8250_dw: select port setup through platform
 data
In-Reply-To: <20261029-submit-h616-uart-fifo-v1-v5-1-53b433aebbf8@gmail.com>
Message-ID: <30123495-5e2a-4340-baac-abab8d511000@linux.intel.com>
References: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com> <20261029-submit-h616-uart-fifo-v1-v5-1-53b433aebbf8@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-295185156-1793352489=:1187"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_022818_463907_4D6AA6DA 
X-CRM114-Status: GOOD (  21.75  )
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-295185156-1793352489=:1187
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 29 Oct 2026, James Hilliard wrote:

> Select feature discovery and DMA attachment through a platform-data setup
> callback. The generic callback probes the optional registers and attaches
> DMA when a FIFO size is available. Integrations with a fixed configuratio=
n
> can supply their own setup before the port is registered. Allow setup to
> return an error so integrations can reject invalid configuration before
> registration.
>=20
> Replace skip_autocfg with the Octeon setup selection. Octeon is a 64-bit
> platform and continues to skip optional-register probing while retaining
> its DMA setup. Select the DMA setup helper directly for this integration.
> Keep generic setup for devices without matched platform data as well.
>=20
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  drivers/tty/serial/8250/8250_dw.c | 41 ++++++++++++++++++++++++++++-----=
------
>  1 file changed, 30 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/=
8250_dw.c
> index 9cbe076463e0..a546cf2de7b6 100644
> --- a/drivers/tty/serial/8250/8250_dw.c
> +++ b/drivers/tty/serial/8250/8250_dw.c
> @@ -64,6 +64,7 @@ struct dw8250_platform_data {
>  =09u8 usr_reg;
>  =09u32 cpr_value;
>  =09unsigned int quirks;
> +=09int (*setup)(struct uart_port *p);
>  };
> =20
>  struct dw8250_data {
> @@ -76,7 +77,6 @@ struct dw8250_data {
>  =09struct clk=09=09*pclk;
>  =09struct reset_control=09*rst;
> =20
> -=09unsigned int=09=09skip_autocfg:1;
>  =09unsigned int=09=09uart_16550_compatible:1;
>  =09unsigned int=09=09in_idle:1;
> =20
> @@ -596,7 +596,6 @@ static void dw8250_quirks(struct uart_port *p, struct=
 dw8250_data *data)
>  =09=09p->serial_out =3D dw8250_serial_outq;
>  =09=09p->flags =3D UPF_SKIP_TEST | UPF_SHARE_IRQ | UPF_FIXED_TYPE;
>  =09=09p->type =3D PORT_OCTEON;
> -=09=09data->skip_autocfg =3D true;
>  =09}
>  #endif
> =20
> @@ -631,6 +630,28 @@ static void dw8250_shutdown(struct uart_port *port)
>  =09d->no_int_count =3D 0;
>  }
> =20
> +static int dw8250_setup_dma(struct uart_port *p)
> +{
> +=09struct dw8250_data *data =3D to_dw8250_data(p->private_data);
> +=09struct uart_8250_port *up =3D up_to_u8250p(p);
> +
> +=09/* DMA setup requires a FIFO */
> +=09if (!p->fifosize)
> +=09=09return 0;
> +
> +=09data->data.dma.rxconf.src_maxburst =3D p->fifosize / 4;
> +=09data->data.dma.txconf.dst_maxburst =3D p->fifosize / 4;
> +=09up->dma =3D &data->data.dma;
> +
> +=09return 0;
> +}
> +
> +static int dw8250_setup(struct uart_port *p)
> +{
> +=09dw8250_setup_port(p);
> +=09return dw8250_setup_dma(p);
> +}
> +
>  static int dw8250_probe(struct platform_device *pdev)
>  {
>  =09struct uart_8250_port uart =3D {}, *up =3D &uart;
> @@ -765,19 +786,16 @@ static int dw8250_probe(struct platform_device *pde=
v)
> =20
>  =09dw8250_setup_dma_filter(p, data);
> =20
> -=09if (!data->skip_autocfg)
> -=09=09dw8250_setup_port(p);
> +=09if (data->pdata && data->pdata->setup)
> +=09=09err =3D data->pdata->setup(p);
> +=09else
> +=09=09err =3D dw8250_setup(p);
> +=09if (err)
> +=09=09return err;
> =20
>  =09/* Use the BUSY-safe sequence for both integer and fractional divisor=
s. */
>  =09p->set_divisor =3D dw8250_set_divisor;
> =20
> -=09/* If we have a valid fifosize, try hooking up DMA */
> -=09if (p->fifosize) {
> -=09=09data->data.dma.rxconf.src_maxburst =3D p->fifosize / 4;
> -=09=09data->data.dma.txconf.dst_maxburst =3D p->fifosize / 4;
> -=09=09up->dma =3D &data->data.dma;
> -=09}
> -
>  =09data->data.uport =3D serial8250_register_8250_port(up);
>  =09if (IS_ERR(data->data.uport))
>  =09=09return PTR_ERR(data->data.uport);
> @@ -860,6 +878,7 @@ static const struct dw8250_platform_data dw8250_dw_ap=
b =3D {
>  static const struct dw8250_platform_data dw8250_octeon_3860_data =3D {
>  =09.usr_reg =3D OCTEON_UART_USR,
>  =09.quirks =3D DW_UART_QUIRK_OCTEON,
> +=09.setup =3D dw8250_setup_dma,
>  };
> =20
>  static const struct dw8250_platform_data dw8250_armada_38x_data =3D {

Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-295185156-1793352489=:1187--

