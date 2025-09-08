Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82018CAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 17:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fdcfAjivuhmexx1p6Y/99vRI059zLGTWwE6ntQss+MQ=; b=ViAa4BW0Q2a/X1RfzErajcE2Tq
	D4+mm5bGDZn6tohgDw10KoMF0UHtFcZ+TiRHucFLBuwNWHa4rl7J+RdSwmFgjR+ixcwuJJ9wxdTDJ
	x/wahb9msBZxNYBgqPf2hgys6mBYKr3uXG84BzdYdKhHjHRVTuFPhdfKqoXy2cKHPT4OMtnI6emy2
	hRqCxpysqPthO+OdXHZRuKu3rblztWBks51jtOqIGu18MEgbkn4JsKe8ywZ5VomUDkWajV48olD/T
	vo2Xx0//rToF1KgGasDxfYsbCxhHwBwlQNjEVAU5XQT5owW3JaW2RslAuKgfPNKGiIHu/qVF7Q7Jp
	jtzUIbcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfM6-000000011Pm-2SGT;
	Mon, 08 Sep 2025 17:08:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvbJB-0000000H8Oy-1ERU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 12:49:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 131D31692;
	Mon,  8 Sep 2025 05:49:12 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 72A663F694;
	Mon,  8 Sep 2025 05:49:16 -0700 (PDT)
Date: Mon, 8 Sep 2025 13:49:13 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, broonie@kernel.org,
	oliver.upton@linux.dev, anshuman.khandual@arm.com, robh@kernel.org,
	james.morse@arm.com, mark.rutland@arm.com, joey.gouly@arm.com,
	ahmed.genidi@arm.com, kevin.brodsky@arm.com,
	scott@os.amperecomputing.com, mbenes@suse.cz,
	james.clark@linaro.org, frederic@kernel.org, rafael@kernel.org,
	pavel@kernel.org, ryan.roberts@arm.com, suzuki.poulose@arm.com,
	maz@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v4 0/5] initialize SCTRL2_ELx
Message-ID: <aL7QySSGoI5p0B70@e133380.arm.com>
References: <20250821172408.2101870-1-yeoreum.yun@arm.com>
 <aLW5OIgv8/bvvY9E@e133380.arm.com>
 <aLXjVNCbT6YeWlSS@e129823.arm.com>
 <aLgd0/7peYBA4z87@e133380.arm.com>
 <aLgvzKeEPn325aRO@e129823.arm.com>
 <aL630WeBwWoUGTBp@e133380.arm.com>
 <aL68enBTkmsjJGPy@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aL68enBTkmsjJGPy@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_054921_374780_5ECBF611 
X-CRM114-Status: GOOD (  28.82  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

On Mon, Sep 08, 2025 at 12:22:34PM +0100, Yeoreum Yun wrote:
> Hi,
> 
> > [...]
> >
> > > > > > Have you tested all the code paths, or are there some things that have
> > > > > > not been tested?
> > > > >
> > > > > I've tested for pKVM, nested and nhve and crash path
> > > > > (I do my best what can I do for modified path).
> > > >
> > > > Was that just confirming that the kernel boots / does not crash?
> > >
> > > Not only that, since the my last mistake, I've check it with debugger
> > > too -- set the SCTLR2_ELx as I expected.
> > >
> > > >
> > > > What about CPU suspend/resume and hotplug?
> > >
> > > Of course It's done both enter/exit idle and hotplug with related kselftest test.
> >
> > Were you able to step through these paths, too?
> 
> Yes. with debugger and some trick with:
>   asm volatile("b ." ::: "memory");
> 
> checking a cpu idle (by not loading any work) without any load and
> checking cpu-hotplug with kselftest's cpu-on-off-test.sh.
> 
> So, by hitting the "b .", I've stepped in and confirm the SCTLR2_ELx set
> as it intended.

OK, that sounds reasonable comprehensive.

[...]

> > Looking again through this series, I realised that the requirements for
> > this feature are not documented in booting.rst.
> >
> > Does the following patch look good to you?  If so, feel free to append
> > it to the series (with your Reviewed-by, if you're happy with the
> > changes).
> >
> > It's probably worth double-checking the bit numbers etc.  I wrote this
> > some weeks ago and then forgot about it.
> 
> I've missed this and Thanks for your efforts.
> The bits you documented have no problem as far as I checked.
> Let me include this too in next series.
> 
> (I'm still checking your suggestion to use .ifc. as soon as finish
> this. I'll repost it according to your suggestion)
> 
> 
> Thanks!

OK, I'll take another look when you repost.

Cheers
---Dave

