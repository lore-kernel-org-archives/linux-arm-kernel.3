Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A688606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 14:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0atlhWcA;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MkUaMxyS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hG/4IjfT07Q6Afx12UtU9nDqugWqc6o8tThzxSfg8ek=; b=0atlhWcA9W8cK0rIEL9IOUZfhJ
	O/RZ1T4IeKQdFqNFqYW/eel6mfNkU7uMMHbe8/hvKcxcOZQmDv/qAQhWyAS1IAQy+PCJq+s85FlQu
	aXsSsF4dyi6tVxaHt/RsEp04fb0WZ0qqCVjbgUVRdkp5rHjAstqsxZcelxYFqhUjDdGoksqeuIMPY
	i+imMNNaUz9hdhQgYVhOzXRWy05AgYCO4huoZIbWci7MnEgnckHevrgVYeq1GKwbXkKv9vxgKqlcr
	Z6JL1XeCAQq3584++lHB8nJOEr6hsv9qflU6pqn6uhUBZQNq3bdIUYxHNALrSHTwMlJ0b8ZqLljtK
	nCnaUsaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKzXP-000000018Ph-0YaE;
	Sun, 25 Oct 2026 14:49:31 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKzXL-000000018OT-3PpF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 14:49:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792939768; x=1824475768;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=wuyAVWzNlf4WMUq3kPSPErfH5dgjJuFGGL+u8KZMwqg=;
  b=MkUaMxySR2suoVa3rkS8W95PAJ01yJNkC/b5K9H5aG7xVH+LWHuNkw9m
   gi359rOCFC3yIXhAO8/lgNjOXvsVgXipgifldnRW4XywtorB7h4BTyp16
   /Ow2ILlF6EuAyWJwEu0l6taFmZD9B2cCwr9ehD7ATeP7C/SvXW7kUvDd0
   pwJhxamCcrPDzt3iME9vgGAtHcCZCCNC2lyvnoo/YhdHpC4zknpRksf2H
   rM7XZh4s86Yc/gTQgxz2PWgUyAHojpxr5+rgwuM2zXO+ivXZmrvv2JGoH
   +RLoj2HegLYMVYkykViwi0KwHFPfARrCb1urNWfS4SDnUB9xVqTqH5zz2
   Q==;
X-CSE-ConnectionGUID: Eqzu/QFbQIK0/LJPdbFyoQ==
X-CSE-MsgGUID: KW7quABWS36UAnAW328oKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1524421"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1524421"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 07:49:11 -0700
X-CSE-ConnectionGUID: eYmjATg5S1KYkRpA6TtrFQ==
X-CSE-MsgGUID: PrP7FVEiS6+DW/v+rR1Cow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4147140"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.10])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 07:49:06 -0700
Date: Sun, 25 Oct 2026 16:49:04 +0200
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
Message-ID: <at4WnVkovotMBmFe@ashevche-desk.local>
References: <20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com>
 <20261023-submit-h616-uart-fifo-v1-v1-2-e4a3bae2eba8@gmail.com>
 <atseYvQUYvpMFEIM@ashevche-desk.local>
 <CADvTj4pRW9q6VyQ=nLi8q0mMF8LgccfO4eqAeqgzzgOkDno1dw@mail.gmail.com>
 <CAGb2v65LVm1GV2kV4bVO8YJd16tkubHOvXUtbJ3uuBw2O3TBsA@mail.gmail.com>
 <atywVnHU5NsP_gOP@ashevche-desk.local>
 <CAGb2v64P2rM0VnFh0NfNhi+3_xGPYkxt2j+2hmBMu5ZvugHRow@mail.gmail.com>
 <aty37_xHO-QRa7hQ@ashevche-desk.local>
 <CAGb2v66jqrrix903k2OT-z0kV-9XWm6LpXmHQsCyLL5P6uXD7Q@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v66jqrrix903k2OT-z0kV-9XWm6LpXmHQsCyLL5P6uXD7Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_074927_865405_DDEACDCA 
X-CRM114-Status: GOOD (  22.38  )
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
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 24, 2026 at 11:10:40PM +0900, Chen-Yu Tsai wrote:
> On Sat, Oct 24, 2026 at 10:51 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Sat, Oct 24, 2026 at 10:41:55PM +0900, Chen-Yu Tsai wrote:
> > > On Sat, Oct 24, 2026 at 10:19 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Sat, Oct 24, 2026 at 10:10:33PM +0900, Chen-Yu Tsai wrote:

...

> > > Ah, that's nice. I hacked up something [1] in the past to get it to
> > > work, but that was probably before you added the helper. I never got
> > > around to splitting up the commits and sending it out.
> >
> > Hmm... The helper is in the kernel for the past 2.5 years.
> > Maybe you rebased it and it lost original dates?
> 
> I had been carrying the changes locally without committing them. I only
> committed them recently to back them up remotely. So yeah, the dates are
> not accurate.
> 
> > But if it's not working, we need to address that, I believe it should work out
> > of the box, because the same function is used across dozen of serial drivers.
> 
> The new helper probably works fine. I can rework my code to use the values
> given by the helpers and give it a try sometime next week.

Would be nice, but I assume there is no hurry.

> > It might be an issue in 8250_dw.c, but I can't tell for sure.
> >
> > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git/commit/?id=e7e0741fa04f349ad9f94a4059e32467a30ef5d9

-- 
With Best Regards,
Andy Shevchenko



