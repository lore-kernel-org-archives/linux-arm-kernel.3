Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99070606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 21:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wldqd2RU;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IWO4rfCM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mO8z9Tk1LUkxK1SfW+Zfd2chYfk05ZgjYdVW4ius1x4=; b=wldqd2RUnS9ezK8u6LLIFKPoTO
	+3hR0wiTR3kovsR4xYHRfNd+u5IEpJ7IY3hXMtlwh9+3mvBairIkrdzOW5R0TyMUVGuDA0AFi6TvJ
	/3IsJl++Wyxt5LHRpECRmVWcYERkP13XxwN1cQRxuzIGnvFD1b45DSa1m4/hOqMmp5f0X069MeQiK
	KVqTDbnDwGRJu+9SbcFoWv4IbITSTfwwtGR5oj98FtY+ZA6DxIp1ep2b2nhh1ecbsoTRnxfe0Zp5d
	Fp/Z/Zaji0j7oJcZi+19+qNSd8FEYvmP2vuAVXRwaa2YbQaeLL3k7QBVV+l2cwHHsiW2OWDwmZYzr
	7GPVRSoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLSAR-00000003Hqu-0a3P;
	Mon, 26 Oct 2026 21:23:43 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLSAO-00000003Hps-0qQd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 21:23:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793049821; x=1824585821;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=N88Z46/9ztkXkJPZVADk+jnnVNHd4Cz5qKxwO4LyFUo=;
  b=IWO4rfCMGAYWmK+QkxCcJI+tsFZuyvevdlEkAysA9cuXeLUAvVxMVIbB
   F9/TEJTs1EXgHDRcxSV29EfgcO5ng7/nM+20z0Hh3T6gAsFIzybXDbEbD
   xsJxvRJ+/PTm/4iCfwgcihqzKRnzODpyHuskjmOwU833D5BCBEkihT3EP
   jYErmxKh2IIPgObhcOtpMLRd9MFh2wGrRjkmapvlPJMgiDhidewHZKJJb
   U3NJKfdEkHAlx6ArIrzENgyUFoSsVFOSBckSQ9T80pdNKLHzhHF0J9Hcv
   E2L/3VIEZvXmepbmyKXMk2i75e/teJmm1BuuAySClvQj5RoTkANwm2szw
   g==;
X-CSE-ConnectionGUID: Obvs/PycRCa/nz9j5TEaRQ==
X-CSE-MsgGUID: SnCxtUCJQS6DjVAX4POHGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1750928"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1750928"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 14:23:39 -0700
X-CSE-ConnectionGUID: pGRmoMDKS5a2N1YN8eSJCw==
X-CSE-MsgGUID: A8Mzj4/7QuuLmc+SWALM6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4325371"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.93])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 14:23:32 -0700
Date: Mon, 26 Oct 2026 23:23:29 +0200
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
Message-ID: <at_E0UbhG8MlkIQS@ashevche-desk.local>
References: <at5qKehogAjTa-fA@ashevche-desk.local>
 <CADvTj4qSgE6Rc--mWuqAcc8HTqN9EFOS_JM8Hp8e_=ka_ZLa6w@mail.gmail.com>
 <at8eDFj2WNaXDaot@ashevche-desk.local>
 <CADvTj4oNz-bnSZP+kfau-7wBSWLjLTP5jrr6nLfdCHNPo3pS6w@mail.gmail.com>
 <at-vyZ1sDhYPu0W5@ashevche-desk.local>
 <CADvTj4o_CENc3i92OQEZudOErSKPUptT4t2CCqDaGbseuK0QcQ@mail.gmail.com>
 <2026102631-stove-preview-b534@gregkh>
 <CADvTj4pCnnzx4B28H_1BuY4gm2fh_8HYL9jLpsAoJcWfiUXOHw@mail.gmail.com>
 <2026102657-tubby-tragedy-5f1b@gregkh>
 <CADvTj4oFBznFO9ZxL_8wZtcPaweSSt-a_brVkmQKzqJsBX2P5w@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADvTj4oFBznFO9ZxL_8wZtcPaweSSt-a_brVkmQKzqJsBX2P5w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_142340_282745_3CB74B61 
X-CRM114-Status: GOOD (  39.19  )
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

On Mon, Oct 26, 2026 at 02:49:24PM -0600, James Hilliard wrote:
> On Mon, Oct 26, 2026 at 2:40 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> > On Mon, Oct 26, 2026 at 02:24:58PM -0600, James Hilliard wrote:
> > > On Mon, Oct 26, 2026 at 2:17 PM Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > > On Mon, Oct 26, 2026 at 01:59:06PM -0600, James Hilliard wrote:
> > > > > On Mon, Oct 26, 2026 at 1:53 PM Andy Shevchenko
> > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > On Mon, Oct 26, 2026 at 10:45:54AM -0600, James Hilliard wrote:
> > > > > > > On Mon, Oct 26, 2026 at 3:33 AM Andy Shevchenko
> > > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > > On Sun, Oct 25, 2026 at 04:11:08PM -0600, James Hilliard wrote:
> > > > > > > > > On Sun, Oct 25, 2026 at 2:44 PM Andy Shevchenko
> > > > > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > > > > On Sun, Oct 25, 2026 at 02:25:46PM -0600, James Hilliard wrote:

...

> > > > > > > > > > Some people might want to test the stuff. And sending too often you actually
> > > > > > > > > > will get the opposite results, people will be tired to even start reviewing
> > > > > > > > > > and/or testing your code as it's changed way too quickly.
> > > > > > > > >
> > > > > > > > > My thought process was that people wouldn't want to be testing code that
> > > > > > > > > had known bugs flagged in Sashiko reviews.
> > > > > > > >
> > > > > > > > Sashiko reviews are not visible in my or any other mailbox. To see them I have
> > > > > > > > to go to some URL and so on, meaning to waste time to see why on the earth the
> > > > > > > > new version has been sent.
> > > > > > >
> > > > > > > Maybe the Sashiko reviews are getting caught in spam filtering or something?
> > > > > > > They are showing up for me and on the mailing list[0] so I'm a bit confused why
> > > > > > > you aren't seeing them. You shouldn't have to go to the web interface[1] to look
> > > > > > > up the reviews.
> > > > > > >
> > > > > > > [0] https://lore.kernel.org/all/sashiko-outbox-183574@kernel.org/
> > > > > > >
> > > > > > > [1] https://sashiko.dev/
> > > > > > >
> > > > > > > > It's better before addressing Sashiko comments,
> > > > > > > > reply to all people involved and to Sashiko's original email, so it will be
> > > > > > > > visible in the previous version why you issued (actually about to issue) the
> > > > > > > > next version.
> > > > > > >
> > > > > > > Hmm, maybe it makes sense to enable recipients in the reply_to config[2]?
> > > > > >
> > > > > > It's up to the list owners / subsystem maintainers.
> > > > > >
> > > > > > > [2] https://github.com/sashiko-dev/sashiko/blob/v.0.6.3/projects/linux/mailing_lists.toml#L290
> > > > > > >
> > > > > > > > And before even issuing it, wait for a while, people might
> > > > > > > > disagree with Sashiko judgement or your replies on how to address that.
> > > > > > >
> > > > > > > I was assuming everyone was seeing the Sashiko reviews getting posted to
> > > > > > > the mailing list already. The are ending up in lore so unless someone isn't
> > > > > > > subscribed to the list I'm not sure why they wouldn't be seeing those reviews
> > > > > > > already.
> > > > > >
> > > > > > I assume you already answered your Q. mailing list in this sense doesn't mean
> > > > > > recipients. I think it simply goes to the mailing list without forwarding.
> > > > >
> > > > > Do we want those reviews going to recipients as well as the mailing list?
> > > >
> > > > For serial patches, we decided to only have it go to the submitter and
> > > > the list.
> > >
> > > When it goes to the list is it supposed to go to list subscribers as
> > > well or only to lore?
> >
> > All list subscribers as well, I've watched your interactions just fine
> > :)
> 
> Andy, are you subscribed to the linux-serial list?

I think I don't. That may explain why I don't get Sashiko in my mailbox.

> I'm wondering if some mail is getting dropped, in this particular thread I never
> actually received the review from Maciej W. Rozycki <macro@orcam.me.uk> at
> all and had to manually import the email from lore. I think that's the
> only review
> email that I saw go missing myself.
> 
> That one getting dropped seems especially strange since it had a
> direct reply to me.

-- 
With Best Regards,
Andy Shevchenko



