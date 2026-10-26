Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75AD606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 09:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y0N5tsHh;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YtyHNLng
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0WRy0PlXijTVPaZN+8guL59byar3K3OLJbxaZMhuvdo=; b=y0N5tsHhDboG1VadvAk7Je3Ggx
	GQmBtCF56ksnPlQV+mEr7ujH1Ku7lWdY6APOkV/6rl57XfBR5FOlK6ei+8x+zA5Vmbw9eI0ldUYoh
	L1GSjtdUUQ23s2Dlr0zY0jNguJPQ2lGPDRLm+uxcT4W7ut8oQ/9uDo9wpGEJt3cuYDko+rtsDfRWp
	xftpWNeqism2jyoJ8YvZy5XtJC2Jxz+hWFbcMprR/VXo7g1egJwtBI5KS/CXKZy2hhLHHK3XYR6CK
	MwLNqzQpz1/54fm8OXdVk4kwoxsPMtvczi/H+UW+SuDBqxok4CI4gMW0lPlvgZABqh/BObZ0R+fRS
	iAe8tE/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLH5Y-000000024uz-4Ag8;
	Mon, 26 Oct 2026 09:33:56 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLH5W-000000024uc-1PzM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 09:33:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793007235; x=1824543235;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=f84sV62ooKOvjIhQKXtEC/TuKGIbIDblS98potdMs0c=;
  b=YtyHNLng3N7z+phYyQNLde/PjsSeqbLi3mGRAMIiyqp3Ts8INDyaKXEt
   jF7QeaKGf9vDYnqEPGwH3ovOZ6+AAInPyCeWLwEIpDBrZ/ofXoJG0jrn2
   2kbFE27qfrUhzONO0oe3XXSlcGNtP9Oix2YDpv9z2DHC8pDWrpHVQMMQa
   JeI2rCY+X4YkwSpGPWiqyAepT6DgoWKsAXaDVunxgz62pwvtRMU1/BtPT
   dd0H2AQ5o4jQiL3lL2lR594Oqa8a42Sii6IP7n0B7FJZKB3q9iHc1xtny
   KhHcov+iMU0GcB8gp1p8DL2ONFNK46bBSCsyGy2UlabTzoDOiWdyTAMp4
   A==;
X-CSE-ConnectionGUID: PqNeAAbzQcG39tZ6vQkXug==
X-CSE-MsgGUID: 4KCGvytHRcGfuB36qiQOhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1546612"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1546612"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 02:33:53 -0700
X-CSE-ConnectionGUID: fVvhHvtoSG2AkfgtDxVUUQ==
X-CSE-MsgGUID: OqFYijmUSTSItatMUaeiwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4200056"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.93])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 02:31:59 -0700
Date: Mon, 26 Oct 2026 11:31:56 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
	Fabio Estevam <festevam@gmail.com>, Timur Tabi <timur@kernel.org>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 2/5] serial: serialize asynchronous write wakeups with
 the port lock
Message-ID: <at8eDFj2WNaXDaot@ashevche-desk.local>
References: <20261024-submit-serial-8250-dma-cancel-v1-v5-0-9e52968928d2@gmail.com>
 <20261024-submit-serial-8250-dma-cancel-v1-v5-2-9e52968928d2@gmail.com>
 <alpine.DEB.2.21.2610250459200.42255@angie.orcam.me.uk>
 <at4bw-G8czG-G7Wl@ashevche-desk.local>
 <CADvTj4psJcY2T1PG9H8_hJWjz62R7unj3PPgv3FrVquUMFVhGg@mail.gmail.com>
 <at5qKehogAjTa-fA@ashevche-desk.local>
 <CADvTj4qSgE6Rc--mWuqAcc8HTqN9EFOS_JM8Hp8e_=ka_ZLa6w@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADvTj4qSgE6Rc--mWuqAcc8HTqN9EFOS_JM8Hp8e_=ka_ZLa6w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_023354_452761_1F3A0EE0 
X-CRM114-Status: GOOD (  24.37  )
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
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Oct 25, 2026 at 04:11:08PM -0600, James Hilliard wrote:
> On Sun, Oct 25, 2026 at 2:44 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Sun, Oct 25, 2026 at 02:25:46PM -0600, James Hilliard wrote:

...

> > Some people might want to test the stuff. And sending too often you actually
> > will get the opposite results, people will be tired to even start reviewing
> > and/or testing your code as it's changed way too quickly.
> 
> My thought process was that people wouldn't want to be testing code that
> had known bugs flagged in Sashiko reviews.

Sashiko reviews are not visible in my or any other mailbox. To see them I have
to go to some URL and so on, meaning to waste time to see why on the earth the
new version has been sent. It's better before addressing Sashiko comments,
reply to all people involved and to Sashiko's original email, so it will be
visible in the previous version why you issued (actually about to issue) the
next version. And before even issuing it, wait for a while, people might
disagree with Sashiko judgement or your replies on how to address that.

TL;DR: this mailing list is *not* a playground with you and Sashiko, the whole
community is behind it.

> > Settle down first
> > with something, put on the cover letter the answer why not all Sashiko's
> > comments are being addressed (for example, due to amount of patches or the
> > series being focused on a certain issue).
> 
> So, in general I've been always attempting to resolve known Sashiko issues
> in every subsequent re-spin, so that would be a bit tricky since I wouldn't be
> aware of the Sashiko issues until after the series has already been sent.
> 
> Usually the subsequent issues that get flagged are new issues only discovered
> after each new re-spin.
> 
> I do have a bunch of UART/DMA related patches that don't have flagged Sashiko
> issues so it probably makes sense to try and review those first while the larger
> series that have Sashiko flagged issues are still stabilizing.

Yes.

> > > [0] https://github.com/sashiko-dev/sashiko/pull/389

-- 
With Best Regards,
Andy Shevchenko



