Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D7D606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 13:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vbBRDHJ8;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k9Z6kVe5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+eTq2RouSMP57iyX/xKgxw3blvHVYyiPPERedc75Hk0=; b=vbBRDHJ8ZLvDBFspKrFrSxMJht
	2CrJ4yVxlYlji4te1tA8DLOQFdukpE+SRBhs/u613d9TEiM/P7UgveVpWwqmoahjMuvN+xwSV0dRj
	MpbhjjrDFDZhVRouS9WUqGzTV1mrsE25UYDmh9mkIPvCIxnUIxcAuBumk59A5qb1mmac/T8YXBXyy
	P4P8HHGoYQHZ1bdmPpcg8l3B1SCk6Z1czhBWCIvsdP6msaz6CxpT7CELiALy+bEkMsr+7bEfDZJE9
	NImk/cYteDBkeOUdEt4XobEDRSwwyKc+gzAZ13X2bpHkU+yCZsC6gj/XUm8oo+X2aCxp5nz2wu5cc
	RVxgHdZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKbeh-00000000DJg-0qGS;
	Sat, 24 Oct 2026 13:19:27 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKbef-00000000DJM-1CnM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 13:19:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792847965; x=1824383965;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=CYtQ0z2b8nAxy7Z61dsDKTufFY11coH1fY1mN0AgzEU=;
  b=k9Z6kVe5v3fCaXp1PnEgbOYAlDnojYw1nphzXMVzl3i6lwwBcYsXpr2O
   qziejhRpyIPau5jfJS4NDclJ15fM7pqcWYLcJSXql+Bhqx9AObp+aZBkZ
   dUQrUg/9LNoxgT296OeuTBaFQQfNCt1wKSW1dMhRFDjGb8H8BORe6HmXf
   X4imVQmkLMcoEP5tl1RWLILQaAu7buXHThm41H/WAs6QudveKYT0i6LNW
   GfiFDtoKDFbBkVxLwBqzQl19lFIN5ErJLTGQeIHW6v3Gs44nJ2AA8ugd9
   UftL5FdWwJZpQ11cbe/k0257DHZ5tlyVx5GDcyzlTup4Nag5EaCDKthPl
   w==;
X-CSE-ConnectionGUID: qcNHfxazQrWDwuRiuiBaaw==
X-CSE-MsgGUID: b53iEOp+SzqmsM2DRbQx8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1485037"
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="1485037"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 06:19:24 -0700
X-CSE-ConnectionGUID: mClJgBpfQtCb9H9Y4xRoUg==
X-CSE-MsgGUID: J3izvhnITo6KSugqa4/SpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="5714256"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.221])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 06:19:20 -0700
Date: Sat, 24 Oct 2026 16:19:18 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: James Hilliard <james.hilliard1@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/3] serial: 8250_dw: configure the Allwinner H616 UART
Message-ID: <atywVnHU5NsP_gOP@ashevche-desk.local>
References: <20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com>
 <20261023-submit-h616-uart-fifo-v1-v1-2-e4a3bae2eba8@gmail.com>
 <atseYvQUYvpMFEIM@ashevche-desk.local>
 <CADvTj4pRW9q6VyQ=nLi8q0mMF8LgccfO4eqAeqgzzgOkDno1dw@mail.gmail.com>
 <CAGb2v65LVm1GV2kV4bVO8YJd16tkubHOvXUtbJ3uuBw2O3TBsA@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v65LVm1GV2kV4bVO8YJd16tkubHOvXUtbJ3uuBw2O3TBsA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_061925_384997_530785D7 
X-CRM114-Status: GOOD (  19.43  )
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

On Sat, Oct 24, 2026 at 10:10:33PM +0900, Chen-Yu Tsai wrote:
> On Sat, Oct 24, 2026 at 12:12 AM James Hilliard
> <james.hilliard1@gmail.com> wrote:
> > On Fri, Oct 23, 2026 at 2:44 AM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Fri, Oct 23, 2026 at 01:33:50AM -0600, James Hilliard wrote:

...

> > > >       /* Internal 8250 only */
> > > >       UART_PORT_AIROHA                = 124,
> > > >       UART_PORT_AIROHA_HS             = 125,
> > > > +     UART_PORT_DW_APB_256    = 126,
> > >
> > > Why? Besides the poorly chosen name, what prevents us from modifying the
> > > corresponding parameters at probe time by leaving the one of the existing
> > > types?
> >
> > The new type was primarily a way to reuse the core's FIFO configuration
> > table, including the RX trigger mapping. H616 uses thresholds of 1, 64,
> > 128 and 254 bytes, whereas PORT_16550A maps the same FCR bits to 1, 4, 8
> > and 14 bytes. Overriding only fifosize and tx_loadsz would leave
> > rx_trig_bytes reporting and selecting the wrong thresholds.
> >
> > The core already has get_rxtrig/set_rxtrig callbacks, though. I'll rework
> > this to retain PORT_16550A, supply the H616 FIFO parameters during setup,
> > and use those callbacks for the correct trigger mapping.
> 
> Please consider just taking the FIFO size from the DT. On some chips
> not every UART has the same size FIFO, so we already need to deal with
> it.
> 
> Also, FIFO size is a standard UART DT property, though somehow not included
> for dw-uart.

FWIW, it supports all standard properties for UART.
Check what uart_read_port_properties() does.


-- 
With Best Regards,
Andy Shevchenko



