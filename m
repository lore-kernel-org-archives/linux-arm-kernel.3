Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC110606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 09:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u/hBG56L;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AfEtjfps
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PCRyiewkbGG036lTwBa+174OovhhVRwZfC2vW3ZeNTQ=; b=u/hBG56LFDtPlF7HA6DOMTr73z
	2NMTgW+3RRR8DjyOFBmuDFB2sLrLa1rUOqliUHvueMgh1F6prsknkNMgdJ1MyK0u+zOIvMo9HlyE9
	UReWUp1UCoCjUDDgSc2kXjAD1Yy/p+W7DhC4O7rxXO9K2+KxpXhCGqSArVGba18bxHqdDwf7Izp6o
	72Ts83oAivEAOJvJMBX9Kola0yxOS1cEfq2wtztYTKKECpuNcjso2ziUo0uRzV7h2P9ak0rIRObgD
	fthW61sNWdhyFM9EO1ESuTF3915bQlhhr5ajsMtd1jP/1qw+zZPu4GNAjQmxEuZ4RQAWFdvz3UWbQ
	VfmvveMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMizO-0000000BFZR-2sIv;
	Fri, 30 Oct 2026 09:33:34 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMizM-0000000BFZ2-0Wnq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 09:33:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793352813; x=1824888813;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=qrpI44bWZaGg8MfD8DnU+yqorhMutYP7dQKRrMv1F3w=;
  b=AfEtjfpsPFEeHj3+IH4nrkQjTw9A/y9sWIs1Hns4LtrXVFwycHGoMnan
   osV1IfzN3M3Qrc9cNmBczpPpXrMV91PgzxSuqmL/wH1FFdoHWnN8dmPGX
   kWcd6bGOWzo9Wt8/BbY8T7zILJOaNdVnTTJMwX1S6RPyM2TY7JAOfLysI
   7NM4ksKry7W6VYY8JHFCtsaBxjAEumv4wwDUHRuEQnqfuj/ZUPo6V1m0U
   96G3ltUu//uqA3o0LUXFWsW6FR2/fUpw83Bg9xx0iH/gkIKFp5+B3a/Gj
   qtfbcqbsraM8o8hrq6BFu18UW/c+a1AK8qmyf5+c5lwgM86uwNLAh1z7u
   A==;
X-CSE-ConnectionGUID: At8uxaX1Qo+jmgtKbbILLg==
X-CSE-MsgGUID: eNQw9U8gRAK4SzoJx9RrPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="1999325"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="1999325"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 02:33:31 -0700
X-CSE-ConnectionGUID: qDHB30c7T6+C24I5cmm90w==
X-CSE-MsgGUID: v4Xg4+SIQQa629rjFUEQMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5926976"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.247])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 02:33:25 -0700
Date: Fri, 30 Oct 2026 11:33:23 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Raul E Rangel <rrangel@chromium.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Tony Lindgren <tony@atomide.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Timur Tabi <timur@kernel.org>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v8 4/6] serial: 8250: drain canceled TX DMA before
 reusing its buffer
Message-ID: <auRkY2h-NJvFszQE@ashevche-desk.local>
References: <20261029-submit-serial-8250-dma-cancel-v1-v8-0-3fd56ba352ed@gmail.com>
 <20261029-submit-serial-8250-dma-cancel-v1-v8-4-3fd56ba352ed@gmail.com>
 <auNV7Vco5O3vVwRH@ashevche-desk.local>
 <CADvTj4oi6dFzWkjFXie1U49A70Y7Mb=4exga-=2SmG7fN2pLrA@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADvTj4oi6dFzWkjFXie1U49A70Y7Mb=4exga-=2SmG7fN2pLrA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_023332_215042_C2137835 
X-CRM114-Status: GOOD (  15.81  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 11:15:23AM -0600, James Hilliard wrote:
> On Thu, Oct 29, 2026 at 8:19 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Oct 29, 2026 at 01:37:00AM -0600, James Hilliard wrote:

...

> > > -     bool                    shutting_down;
> > > +     bool                    shutting_down:1;
> > > +     bool                    tx_terminating:1;
> > > +     bool                    tx_flushed:1;
> >
> > What is the meaning of bool XXX:1? Have you checked with `pahole` the result?
> 
> These are one-bit boolean fields, intended to pack the state flags
> into one byte.
> 
> I've now compared layout probes using the kernel type definitions and
> saved build flags, changing only those bitfields to ordinary bools.
> For the complete v8 structure, including the RX flags, pahole reports:
> 
>                             Bitfields   Plain bool
>     ARM32 / Clang               212         220
>     ARM64 / GCC                 368         376
>     ARM64 / GCC / PREEMPT_RT     368         376
> 
> The sizes are in bytes. All six flags share one byte in the packed
> version. This saves eight bytes in each checked configuration.

Thanks for checking!

> The packing is a layout choice, not an atomicity mechanism; updates
> still require the UART port lock. Given the measured saving, I'd keep
> it unless there is another concern with using bool bitfields here.

I'm just worrying that bool bitfields are implementation defined and
might have some side-effects. But I see elsewhere in the kernel similar
approach, so I guess so far it didn't trigger any suspicious behaviour.

-- 
With Best Regards,
Andy Shevchenko



