Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D56606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 09:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PevGMPPy;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MFUqhlNC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-ID:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:
	Reply-To:Content-Transfer-Encoding:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OmlzIQ4gereQGv/7b98RflWM5h/OCWSsbl/T77o569A=; b=PevGMPPyRxpSsT1qItuCe9Jxvc
	wLo3M5NUpCK5nRdcCmbTnXD8VqRZvNtAv9soehVLxXklnbmhaCyd5wY3z/vKQXR08qPVK0XW9bGzT
	rKVgjdshHR4ZdgjoNS+dhx8S6naXs0cB0BL25va0UbjM5WVMOXHjNtHaA52Wu6eSkI0tJIdZVK8ov
	keFoP2pbKI4VvBYlfLcRNNr1DMAq9dkKumbs1IOmz9CPPgAnrRQ1CJOiERuAndKoLLPbDLyS1dQhL
	PLf18Ltj926V9yO3fZG+pVvejRyJTlA1Y9YcOk/JHHC/IuFUZLLx6qs9E/H4zhniEchDiBMCVFNSn
	Y+1ntjcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMiqf-0000000BELi-1lcf;
	Fri, 30 Oct 2026 09:24:33 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMiqZ-0000000BEHY-2BFS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 09:24:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793352268; x=1824888268;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=lOFIXcNCvbGYaeFWZl7MhNswXebfJEME1y4g8ZPVihU=;
  b=MFUqhlNCx3JSXiBdjgbzSYXQVA71/oUuOLui20cwSM9kGaXEoaaLZj4D
   n6F6k8aQJ4WrJyTMOp52ROEQIT/DZAmqt57tA4oqusIc5hTungwV0+x5g
   mW5U8uZGB4HND1cISOKBiC2/PObsFvt/MscANHX2Zfcs8oiaKbJY+azm7
   pvKGB18EwcckCgA0/xRUUg0WnGtrOzv2LkgCnlEHFCoYkuPY7mxvyziFg
   +rxxXECX96yZYTuu0KT4UsiPIcNviJNCQ7yq58eid6r2mxB9RQIMdBF8R
   z6Y+WFlRVyXsJMTw5PTxafZ0V32uCTuP+HljbOhBiosg7C4sLOwPfCWVn
   g==;
X-CSE-ConnectionGUID: NGYW8pPkSo+wsY8jd/Dwuw==
X-CSE-MsgGUID: NvQU1sLARlK4W2YmEtE5zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="1998333"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="1998333"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 02:24:27 -0700
X-CSE-ConnectionGUID: DJlFZSyxQha+0r4S5cq2/g==
X-CSE-MsgGUID: 1zAYwh/kRsmBB8GE0FLiqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5352871"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.32])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 02:24:21 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 30 Oct 2026 11:24:17 +0200 (EET)
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
Subject: Re: [PATCH v5 2/8] serial: 8250: share the RX trigger conversion
 helper
In-Reply-To: <20261029-submit-h616-uart-fifo-v1-v5-2-53b433aebbf8@gmail.com>
Message-ID: <d8f88dfa-f372-f1c7-bdb3-131a26dbff46@linux.intel.com>
References: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com> <20261029-submit-h616-uart-fifo-v1-v5-2-53b433aebbf8@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-108683250-1793352038=:1187"
Content-ID: <ec465114-c4ae-bb9c-a649-969abb886178@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_022427_626784_235555C5 
X-CRM114-Status: GOOD (  21.06  )
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

--8323328-108683250-1793352038=:1187
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <3b749261-4f91-a782-0e99-9be2a9a55095@linux.intel.com>

On Thu, 29 Oct 2026, James Hilliard wrote:

> Extract the receive-trigger threshold search into serial8250_bytes_to_fcr=
()
> so drivers with per-port threshold tables can use the same conversion as
> the generic 8250 implementation. Keep the implementation in 8250_port.c a=
nd
> export it for subdrivers.

To explain why we're doing this, the text could first mention that=20
inability to define these thresholds per driver have been one of the main=
=20
reasons why there has been the temptation to add new port types into=20
uart_config[] (that would be better left as a legacy way of defining=20
things).

> Include the unsupported-table check in the helper and preserve the existi=
ng
> nearest-lower selection and highest-encoding fallback.
>=20
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  drivers/tty/serial/8250/8250.h      |  2 ++
>  drivers/tty/serial/8250/8250_port.c | 21 +++++++++++++--------
>  2 files changed, 15 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/825=
0.h
> index 21ed9c41b751..1600f2e45d76 100644
> --- a/drivers/tty/serial/8250/8250.h
> +++ b/drivers/tty/serial/8250/8250.h
> @@ -73,6 +73,8 @@ struct serial8250_config {
>  =09unsigned int=09flags;
>  };
> =20
> +int serial8250_bytes_to_fcr(const unsigned char *rxtrig_bytes, unsigned =
char bytes);
> +
>  enum uart_port_type {
>  =09/* Internal 8250 only */
>  =09UART_PORT_AIROHA=09=09=3D 124,
> diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/825=
0/8250_port.c
> index 36b2b0a2c05c..fc3987b5a70c 100644
> --- a/drivers/tty/serial/8250/8250_port.c
> +++ b/drivers/tty/serial/8250/8250_port.c
> @@ -3015,22 +3015,27 @@ static int fcr_get_rxtrig_bytes(struct uart_8250_=
port *up)
>  =09return bytes ? bytes : -EOPNOTSUPP;
>  }
> =20
> -static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, unsigned char =
bytes)
> +int serial8250_bytes_to_fcr(const unsigned char *rxtrig_bytes, unsigned =
char bytes)
>  {
> -=09const struct serial8250_config *conf_type =3D &uart_config[up->port.t=
ype];
> -=09int i;
> -
> -=09if (!conf_type->rxtrig_bytes[UART_FCR_R_TRIG_BITS(UART_FCR_R_TRIG_00)=
])
> +=09if (!rxtrig_bytes[UART_FCR_R_TRIG_BITS(UART_FCR_R_TRIG_00)])
>  =09=09return -EOPNOTSUPP;
> =20
> -=09for (i =3D 1; i < UART_FCR_R_TRIG_MAX_STATE; i++) {
> -=09=09if (bytes < conf_type->rxtrig_bytes[i])
> +=09for (unsigned int i =3D 1; i < UART_FCR_R_TRIG_MAX_STATE; i++) {
> +=09=09if (bytes < rxtrig_bytes[i])
>  =09=09=09/* Use the nearest lower value */
> -=09=09=09return (--i) << UART_FCR_R_TRIG_SHIFT;
> +=09=09=09return (i - 1) << UART_FCR_R_TRIG_SHIFT;
>  =09}
> =20
>  =09return UART_FCR_R_TRIG_11;
>  }
> +EXPORT_SYMBOL_GPL(serial8250_bytes_to_fcr);

Put the export to namespace.

With that fixed,

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

> +static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, unsigned char =
bytes)
> +{
> +=09const struct serial8250_config *conf_type =3D &uart_config[up->port.t=
ype];
> +
> +=09return serial8250_bytes_to_fcr(conf_type->rxtrig_bytes, bytes);
> +}
> =20
>  static int do_get_rxtrig(struct tty_port *port)
>  {
>=20
>=20

--=20
 i.
--8323328-108683250-1793352038=:1187--

