Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC42CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 19:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vnt9aRuPCf7TEi3JQtuXlEUwg5QGlievr155515+DA0=; b=2Dz/s+bECuJPLgps6wfqVSM3Ox
	HtRgET3my8taIBTop9uMZoCEyQWuj5n0608JeZ8OppuXfwDmLat4vOup9TNtspwV0sqkPyXoP65xA
	Fpf2uRRjUMxtNV4pHZ9Qp5vDhgBvd5i0xVaa0mlnWHy1rNz61YWJrSJvn8K6aUfjufqKlg8CvgDKY
	tMDmA+mzXR+K2KtEopVaypzTGuuTeFgN+yHHEOp/Mp4IhjefG++EAe8KkWizkKrxfbA3gN4uiLEFu
	Cr/gi5FNTGcsU6gquzKP9I6aCSO67hVtldyHLH61pc3zKV+RtmYT38X14c/MkKhpuegzyTrRtt+bM
	NuX0Je+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urLxj-0000000GdBg-3z3d;
	Wed, 27 Aug 2025 19:37:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urJwV-0000000GJUp-1NjQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 17:28:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 79A0F600BB;
	Wed, 27 Aug 2025 17:28:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9907C4CEEB;
	Wed, 27 Aug 2025 17:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756315694;
	bh=Y+WRbM0Av3TYxIZ0+HcIYsryUVDHh/DopvC0d2C5448=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lG1FAEOTYoYLojqKFHHz395F+UUmtL5cHE5X8Z4OFzNR26pWRILL8Gk7oMudvwEqm
	 WDLDZuHgnrUosXlmhS8Wo+f/d5OtYeGwYlgHLPc6ssMNM4fojaNKuRgz1ZZKlf4VA2
	 r8gvFsczsDNUVe6IThHZXqnMzsf9wcLnfjZb+Oo0KtQLxIZHixXJKSORANrq6semJL
	 Qus9X2Dw3ieJ25im3k/YejPs/hSGHs/8134DAFw5zq+2/qW0uPJs1o4yrz5rEncKpL
	 1M3dMdb85zggOkrS76RvvMyTh+3kOIgIMQkyfPR05acDEHYMyyadMKptw1IeNsgNk5
	 jlk5ZR4hy2rjg==
Date: Wed, 27 Aug 2025 10:28:12 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Ian Rogers <irogers@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	linux-perf-users@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 05/11] tools headers: Sync arm64 headers with the kernel
 source
Message-ID: <aK9ALIkD95ignpzq@google.com>
References: <20250825215904.2594216-1-namhyung@kernel.org>
 <20250825215904.2594216-6-namhyung@kernel.org>
 <20250827081252.GD745921@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250827081252.GD745921@e132581.arm.com>
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

Hi Leo,

On Wed, Aug 27, 2025 at 09:12:52AM +0100, Leo Yan wrote:
> On Mon, Aug 25, 2025 at 02:58:57PM -0700, Namhyung Kim wrote:
> 
> [...]
> 
> > But the following two changes cannot be applied since they introduced
> > new build errors in util/arm-spe.c.  So it still has the warning after
> > this change.
> > 
> >   c8c2647e69bedf80 arm64: Make  _midr_in_range_list() an exported function
> >   e3121298c7fcaf48 arm64: Modify _midr_range() functions to read MIDR/REVIDR internally
> 
> Hi Namhyung,
> 
> Thanks for working on this. It is on our todo list for automatic
> generating MIDR. Sorry for any troubling during the syncing.

No worries, and thanks for your review.  I'm glad you noticed the issue
and have it in you TODO list. :)

> 
> Just a minor comment below.
> 
> [...]
> 
> > +struct target_impl_cpu {
> > +	u64 midr;
> > +	u64 revidr;
> > +	u64 aidr;
> > +};
> > +
> > +bool cpu_errata_set_target_impl(u64 num, void *impl_cpus);
> > +
> 
> Currently, no one uses this API. It seems to me that we don't need to
> sync this code chunk.

Ok, but it'd be easier for me just to have the change anyway.

> 
> Otherwise, other changes LGTM.

Thanks,
Namhyung


