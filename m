Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E4C606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 07:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=435Ck86J;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aR058ypB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Qd/5lb2CY+C9moNEfnfMYyvO1d2LW0AM03zWz1R1+xE=; b=435Ck86JpepfPvCpaPwKhLxtbJ
	VkepeNK0dtFCWCpokmOIJafeMOPJXDYeJiaB0sHw97BrCyDVGmTOu/0y6iuMeq47WUyu5KSzrw1eq
	FHRIorRNn8pTJOKdqnwsWocj6EEA9j8A860yAqmHjKJBdZYTwX4o+lm/OQygyw0oRHsQCHFJWYSUK
	g5jvq6a3xzdEzM98m9Guq++Zu8pwulfK285aZoghP8n2JnozEi6yhY3xbWcmZQp3wzQcVJQL7v2+X
	GYP5AggTcFgWgrNE6IAVHgaFc52G3HIMQRbTEq6H6DjzoMcXL5Otp/ZV5hcs4UN1TSalyZvPTLbZ4
	yZgUKK5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLbZI-00000003tql-31Wk;
	Tue, 27 Oct 2026 07:26:00 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLbZG-00000003tqP-2ACY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 07:25:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793085959; x=1824621959;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r5hxiYwKE4osvI84HGJH8mSrHPipdV0Nlqi1ddY2Xq4=;
  b=aR058ypBCFeh8Y2hYdevopotXh9BeaO7CAJwb+ox1lvMUr/vnbaIwsOu
   iYk1Gi+w8PzJfMwPu8BguK0Te82XtD9QNoNiOA9N/kMSj5OYONqX6rJmS
   +yM+gI9dMiHM/gbyoq73aAUkB69EfvoJ2vUxzufdQftheGvu3DnPCalJV
   u6a/TB0wwZwIxEgdO73HxmFU0Uta76DGIrXiprRT1bNiXaKFxumpUNL5Q
   zAdb+KYr0p+/z8vjcszZU11mZ0Y+J8Y6Fphr7+cpWinOPVRZFAAyKt6Rr
   w9HtWpTmgjr9SNlzx2PJxrcA0jHg3gFHzREzixO1K/vZUW/1P2WmV+88u
   A==;
X-CSE-ConnectionGUID: 84BYPnYVRA2cbS73pHsM3g==
X-CSE-MsgGUID: 9wuRPuLESXyQtLde6NKr8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1674374"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1674374"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 00:25:58 -0700
X-CSE-ConnectionGUID: Op8EKmWpTe2Dg6J55hx/ZQ==
X-CSE-MsgGUID: PTuUsTGxS7CobRS55FyWEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4431277"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.196])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 00:25:54 -0700
Date: Tue, 27 Oct 2026 09:25:51 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 3/4] serial: 8250_dw: configure the Allwinner H616 UART
Message-ID: <auBR__5g021tMvQR@ashevche-desk.local>
References: <20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com>
 <20261024-submit-h616-uart-fifo-v1-v3-3-286fc1b8c3c1@gmail.com>
 <auBRD7Ny6u_a9X7p@ashevche-desk.local>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auBRD7Ny6u_a9X7p@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_002558_567777_5C8F42BA 
X-CRM114-Status: GOOD (  17.08  )
X-Spam-Score: -4.5 (----)
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
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 09:21:57AM +0200, Andy Shevchenko wrote:
> On Sat, Oct 24, 2026 at 02:22:25PM -0600, James Hilliard wrote:

...

> > +static int dw8250_sunxi_set_rxtrig(struct uart_port *p, unsigned char bytes)
> > +{
> > +	struct uart_8250_port *up = up_to_u8250p(p);
> > +	unsigned int i;
> > +	int ret;
> > +
> > +	/* Use the nearest lower threshold, as the generic 8250 implementation does. */
> > +	for (i = 1; i < UART_FCR_R_TRIG_MAX_STATE; i++)
> > +		if (bytes < dw8250_sunxi_rxtrig_bytes(p, i))
> > +			break;
> 
> Can we provide an array of the possible values and deduplicate this loop?
> 
> drivers/tty/serial/8250/8250.h:
> 
> static inline int serial8250_bytes_to_fcr(unsigned char *rxtrig_bytes, unsigned char bytes)
> {
> 	for (unsigned int i = 1; i < UART_FCR_R_TRIG_MAX_STATE; i++) {
> 		if (bytes < rxtrig_bytes[i])
> 			/* Use the nearest lower value */
> 			return (--i) << UART_FCR_R_TRIG_SHIFT;
>         }
> 
>         return UART_FCR_R_TRIG_11;
> }
> 
> drivers/tty/serial/8250/8250_port.c:
> 
> static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, unsigned char bytes)
> {
>         const struct serial8250_config *conf_type = &uart_config[up->port.type];

>         if (!conf_type->rxtrig_bytes[UART_FCR_R_TRIG_BITS(UART_FCR_R_TRIG_00)])
>                 return -EOPNOTSUPP;

Even this probably should be moved above as well.

> 	return serial8250_bytes_to_fcr(conf_type->rxtrig_bytes, bytes);
> }

> (this split should be done in a separate preparatory change).

-- 
With Best Regards,
Andy Shevchenko



