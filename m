Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D5BD116F5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 10:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AigTY7YHBfN6vgkzuQZA/EXjGm2wTYxbOCJv9+KEmGM=; b=UH273TFtgqb/uhXUyB+TQ5aoEr
	NZ1GfNlVLZc/m4kuBuh3g2cCfxuL02iQ2Pz9pXywCqSM54iJ24uSsN673z3O4nTTlaEQQBgQxNx7q
	m9MXaCQ0mK56gIowO2wicOJAk+sf19yl70xxognVbCPtbb3Rcauufqk+LtyFOJzgO4rRSoPwk/N6s
	P96QgZoiYce68L7Fsr7RsJUnYVCndrSZJ2Z96vbmaKBZdsvehJRUXzsp94wTQEZfBr3RoaNH69Y9g
	+gQE+WrdCvrmtjXQ3HZqzlR2K2AwATGbbGsLHx/D1bjJOQGnlMLriOVJIKDm1sJJNqk3iVvHWheXY
	xdtcpoIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOZJC-0000000GO9u-0Rl0;
	Thu, 27 Nov 2025 10:33:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOZJ8-0000000GO8R-2Fit
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 10:33:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F4131477;
	Thu, 27 Nov 2025 02:32:53 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 603373F6A8;
	Thu, 27 Nov 2025 02:33:00 -0800 (PST)
Date: Thu, 27 Nov 2025 10:32:58 +0000
From: Leo Yan <leo.yan@arm.com>
To: Al Grant <Al.Grant@arm.com>
Cc: James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	"coresight@lists.linaro.org" <coresight@lists.linaro.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v7 13/13] coresight: docs: Document etm4x timestamp
 interval option
Message-ID: <20251127103258.GQ724103@e132581.arm.com>
References: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org>
 <20251126-james-cs-syncfreq-v7-13-7fae5e0e5e16@linaro.org>
 <20251126140154.GK724103@e132581.arm.com>
 <CAJ9a7VgcAiw_h=OTxOK0Vcv=9WFCbdb-+RzDKYhigZZhepM7xg@mail.gmail.com>
 <20251126144437.GL724103@e132581.arm.com>
 <5096f4ba-913a-477f-bfe7-f2a6bb563d30@linaro.org>
 <GV1PR08MB1093237396B35459656FF82CA86DEA@GV1PR08MB10932.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <GV1PR08MB1093237396B35459656FF82CA86DEA@GV1PR08MB10932.eurprd08.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_023302_692928_8240EA73 
X-CRM114-Status: GOOD (  31.80  )
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

On Wed, Nov 26, 2025 at 03:36:58PM +0000, Al Grant wrote:

[...]

> > >> As far as I recall when this command line parameter was a bool then:
> > >> perf -e cs_etm/timestamp/ <program>
> > >> is sufficient to turn on timestamping.
> > >
> > > Hmm... with the latest perf, we must assign value to `timestamp`,
> > > otherwise perf will report error:
> > >
> > >    # /mnt/build/perf record -e cs_etm/timestamp/ -C 0 -- taskset -c 0 ls
> > >    event syntax error: 'cs_etm/timestamp/'
> > >                         \___ Bad event or PMU
> > >
> > >    Unable to find PMU or event on a PMU of 'cs_etm'
> > >
> > >    event syntax error: 'cs_etm/timestamp/'
> > >                         \___ no value assigned for term
> > >
> > >    event syntax error: 'cs_etm/timestamp/'
> > >                         \___ no value assigned for term
> > >    Run 'perf list' for a list of valid events
> > >
> > >
> > 
> > That's unfortunate and not what I expected. And I don't think it makes sense to
> > remove that validation from Perf. The test uses "timestamp=1"
> > so I didn't notice.
> > 
> > Can we accept that people are most likely using the defaults so timestamps are
> > already on and they wouldn't be using it? The only real use case of that at the
> > moment is to do timestamp=0 and that doesn't fail.
> > 
> > Although it's not the default for per-thread mode and I did find the OpenCSD
> > HOWTO.md uses it as an example. timestamps make less sense in per-thread
> > mode as you don't need to correlate between CPUs or watch for context
> > switches.
> 
> Timestamps have a more specialised use in per-thread mode, they are
> as you say less essential for switching in the right context to decode
> the trace, and less relevant to BOLT/AutoFDO style usage where the
> trace is collapsed into a heat-map profile.
> 
> But trace can also be used to get a detailed timeline of CPU activity -
> a non-invasive timeline that can trace even through interrupt-disabled
> kernel code. And for that, having a global constant-frequency timebase
> becomes more useful, both in its own right, and to line up traces
> from each CPU with other CPUs and system-level traces.
> It's also the only way we have to indirectly observe CPU frequency
> adjustments. (Intel's Processor Trace, which is generally similar to
> ETM/ETE, has specific packets that trace CPU frequency changes.)

Just clarify a bit to make sure us on the same page.

This series does not break timestamp functionality, it just changes the
PMU format 'timestamp' from 1-bit to 4-bits for counter support.  The
updated 'timestamp' format still supports per-thread mode and CPU wise
trace modes.

The only difference is now users need to specify 'cs_etm/timestamp=1/'
rather than 'cs_etm/timestamp/' when enabling timestamp.  Given PMU
format is not an ABI, it is fine for me for the updated format.

To avoid confusion for users, a well-written document is deserved —
which is exactly this patch for.  And perf log would be helpful.  I
think we are well prepared for the change.

Thanks,
Leo

