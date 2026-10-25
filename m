Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9106606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 15:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PToMHrtR;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L/X34Br4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=g9Cjhr9HIGyxWaiefhej0MIXutOky0k6Ipx1aCyOOYw=; b=PToMHrtRhNqvNa0IfNYzXfHfWR
	88aw7kF+PCCnrtvPtnQILLPX8KDiCCR2nUZS2+ni7WHmgwKY1cwvnH0WYKa/z3Mv+81wB+qV90meU
	9crTqBoLNwC5rEQMEWXhzt+d7sYG/wncMHAZTOAaeVO3OCoUfygb/I2iIwhv7Ah3A1nCifXc4ntaV
	lR1UMrK+x+Ci4gK/12aEJKS2GYkM+BHU083wFZt6hEhAzTW48w3Si0kh5urXWP7r2bwQdRX0bDcNT
	uk835NvnDJ5s+xyAXQMfuhuKuENvWy5U/LqC33ZDcvhmyeLYGqLmpGojCuQMCs+h3NPEfXnrL0Wkl
	RVyKjmOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKzrK-000000019p5-2DPq;
	Sun, 25 Oct 2026 15:10:06 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKzrI-000000019oi-32LH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 15:10:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792941005; x=1824477005;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sA5QKtn9sanR6lQV8toNGWBsgGwYIwudn1w2NIqY2pw=;
  b=L/X34Br4RtJ9g88daUhCVMis2U/0g//FIMZ/h2VtkikoxoqaY8SGICED
   FiLhh2ZYNg5/6TYjziAsn0npDxM22e3aZwpkG+N6AYwj7Y2Lk9H63lqAo
   jTIEMAX1h3cEhh5KzdYllq+FzE7cqr208SK3J3E35G83Ou2eyXoKq32tK
   I8QVASIS3z/mBsdIjTJhWwDiMHJc4enA7evYT6VKDrVMrmGUhbd8LhlsT
   4A3lGmh77f1Y3purCXBqBhwZAhSCR93AqR3Bmk+koWMhLMiHVdC1ofGI9
   xY4o9uZkUBt50Vpm8jweqzHCwA992Qlx6FjLQ5xiakH7HCjYYWSwlIh2g
   A==;
X-CSE-ConnectionGUID: IU3HcT6SSU6RmjPjhF1KlQ==
X-CSE-MsgGUID: ppiV53yhQGG0yH0359um5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1514229"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1514229"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 08:10:04 -0700
X-CSE-ConnectionGUID: m5yKUqx3Syu8lkGMnczCnA==
X-CSE-MsgGUID: IKd3c9pGR1yxq5RGFZfCAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4150612"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.10])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 08:09:57 -0700
Date: Sun, 25 Oct 2026 17:09:55 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: James Hilliard <james.hilliard1@gmail.com>,
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
Message-ID: <at4bw-G8czG-G7Wl@ashevche-desk.local>
References: <20261024-submit-serial-8250-dma-cancel-v1-v5-0-9e52968928d2@gmail.com>
 <20261024-submit-serial-8250-dma-cancel-v1-v5-2-9e52968928d2@gmail.com>
 <alpine.DEB.2.21.2610250459200.42255@angie.orcam.me.uk>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2610250459200.42255@angie.orcam.me.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_081004_796310_8B3387AC 
X-CRM114-Status: GOOD (  10.68  )
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

On Sun, Oct 25, 2026 at 05:10:03AM +0000, Maciej W. Rozycki wrote:
> On Sat, 24 Oct 2026, James Hilliard wrote:
> 
> > uart_write_wakeup() expects the UART port lock to be held. Several worker,
> > DMA completion and interrupt paths call it without that lock, including
> > indirect calls from uart_handle_cts_change() and the transmit helpers.
> 
>  Fair enough, and thank you for the cleanup and spotting the issue in the 
> first place, however...

He already issues a v6. I think the tactics against AI contributions should be
to not answer for a week or so until there will be a quiescent week. At least
that's what I learn from this patch storm.

-- 
With Best Regards,
Andy Shevchenko



