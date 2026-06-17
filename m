Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A73FCD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 15:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OZcu6J22JEAVs/Zi6g1rLZU5OC8qsXyWQym9lQnzDyQ=; b=f6OnTk3y03FGJBwJXR9Evgb5al
	SSmhKQ4xlRUWPzNqJ8/KPELwez/WxnDE5cgQ4gE9CBlwNIRTAbOLNQIAaTD5IJCgHregqPlUTjDyV
	iO5idXV0SutExLMeakJluHn4SfR9F8ymIaynwjqDUtLTRN4kyOiREZq4tKlAGQ1IoMfbDATRFwKGR
	nkgC9Wy30r5DfGBUilv6gForHIqZQ4O+LAQ/OCe3NK76rlvNaKMOqhSKBMos8c9WTL2HcUZUu8BF4
	qGAnJglaiRdCE4EMvbPoF5PsEi5SwGzTiG+uGEilM7BF7HqMQJjzZlsP84yezLOUNFtteS17eonHb
	+8Y1s1Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZrsa-0000000HWw3-3r2h;
	Wed, 17 Jun 2026 15:08:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZrsY-0000000HWv8-0FAM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 15:08:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 940982D91;
	Wed, 17 Jun 2026 08:08:26 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D2D0D3F915;
	Wed, 17 Jun 2026 08:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781708911; bh=dn8rVySMl5MW0er6iW4qyJ7r/M1hv8iOh+kv6XTqsmU=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=i8u3J2So2vHEgBZlM0Fh7RJphmc4hwc2GkvJ64vcDSZZaSq1pTWigp2bJEe1KfADf
	 n5o38uvZwbS2AaSgfzzZ87r1azmrenbDMGChAY/7i4JkMERUxPV7in0caviw7l4FES
	 PAg4dUihLTf7Cby53Zcjhz0RupmHhyxG+geHkzFI=
Date: Wed, 17 Jun 2026 16:08:28 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>,
	linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
	linux-perf-users@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@arm.com>, Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paschalis Mpeis <paschalis.mpeis@arm.com>,
	Amir Ayupov <aaupov@fb.com>
Subject: Re: [PATCH v9 9/9] perf test: Add Arm CoreSight callchain test
Message-ID: <20260617150828.GE31870@e132581.arm.com>
References: <20260616-b4-arm_cs_callchain_support_v1-v9-0-f8fad931c413@arm.com>
 <20260616-b4-arm_cs_callchain_support_v1-v9-9-f8fad931c413@arm.com>
 <6855d77f-d2f4-4dab-8481-a8c586e4872b@linaro.org>
 <20260617123322.GD31870@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617123322.GD31870@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_080834_368323_F0046345 
X-CRM114-Status: GOOD (  16.17  )
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

On Wed, Jun 17, 2026 at 01:33:22PM +0100, Coresight ML wrote:
> On Wed, Jun 17, 2026 at 11:03:07AM +0100, James Clark wrote:
> 
> [...]
> 
> > > +	# It is safe to use 'i3i' with a three-instruction interval, since the
> > > +	# workload is compiled with -O0.
> > > +	perf script --itrace=g16i3il64 -i "$data" > "$script"
> > 
> > Is there a reason we don't generate callstacks on branch samples and use
> > --itrace=g16bl64? That removes the magic number 3 and reduces the output
> > file size and test runtime a bit.
> 
> I checked Intel-PT which does not generate callchain and branch stack for
> branch samples. I just keep cs-etm aligned.
> 
> I can add callstack / branch stack for branch samples.

Tried a bit for this.

The branch stack is skipped due the check:

  if (is_bts_event(attr)) {
          perf_sample__fprintf_bts(sample, evsel, thread, al, addr_al, machine, fp);
          return;
  }

For the callstack attached to branch samples, the output seems not
directive:

  callchain_test    4372 [003] 75596.459422:          1 branches:
            aaaaabdb0794 print+0x8 (/home/kernel/leoy/test_cs_callchain/callchain_test)
            aaaaabdb0798 print+0xc (/home/kernel/leoy/test_cs_callchain/callchain_test)
            aaaaabdb07b0 foo+0xc (/home/kernel/leoy/test_cs_callchain/callchain_test)
            aaaaabdb07c8 main+0xc (/home/kernel/leoy/test_cs_callchain/callchain_test)
            ffff9a10225c __libc_start_call_main+0x7c (/usr/lib/aarch64-linux-gnu/libc.so.6)
            ffff9a10233c call_init+0x9c (inlined)
            ffff9a10233c __libc_start_main_impl+0x9c (inlined)
            aaaaabdb0670 _start+0x30 (/home/kernel/leoy/test_cs_callchain/callchain_test)
            ffff9a2206a0 __libc_early_init+0x100 (/usr/lib/aarch64-linux-gnu/libc.so.6)
 =>     aaaaabdb0768 do_svc+0x0 (/home/kernel/leoy/test_cs_callchain/callchain_test)

It is hard to digest the log as it separates branch from address
(aaaaabdb0794 print+0x8) and to address (aaaaabdb0768 do_svc+0x0),
and put the callchain in the middle of from and to ranges.

Given this is not enabled by other hardware trace (e.g., Intel-PT),
and we need to change the common code to make it better, I'd first
enable callchain/branch stack for instruction samples. Let's see if
further requirement after get this done.

Thanks,
Leo

