Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AED5F46441
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 09:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nHA/OikB9mHENGIkC6zWuD9jluXzoLuW2dPM8A9N6VQ=; b=SZVWI16HlRbLz1zFPeVXEe+avv
	vrguWRdTJyll44yPsgv4sCO0mzONgrYPRHvYdAmailArolkLtrQAsYLGJICDNsYV2lgwiaWAXbvoj
	felzDk4vP0hD6fSAtnzjvlHg/OWruFeYgtYeHnQ6yRceMPTb/aik6AunkgB7b4QpGpS3EoJCqvUmy
	i45/zZTO9O3LeJ1yDsBs+chhSJn69ntZjxWmhmGbpnnu2EchtXcWeNJWlbMBWcAsjordhNgidPAi8
	uPUxSRUAjt5jdRTVPIShD3VZvMVGGfnw79IxfbZDpD8CF8g3vO6yflKBLENw6Ewx1jeoYIZTplU4i
	QOcBRebQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24bd-00000003hx2-0SMl;
	Mon, 16 Mar 2026 09:51:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24bY-00000003hw5-27xC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 09:51:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56F521477;
	Mon, 16 Mar 2026 02:51:11 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C15B33F778;
	Mon, 16 Mar 2026 02:51:15 -0700 (PDT)
Date: Mon, 16 Mar 2026 09:51:10 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Oliver Upton <oupton@kernel.org>,
	Shameer Kolothum <skolothumtho@nvidia.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-perf-users@vger.kernel.org
Subject: Re: REQUEST: Syncing tools/arch/arm64/include/asm/cputype.h with the
 kernel sources
Message-ID: <abfSjoaZYrSqmIdA@J2N7QTR9R3>
References: <aba3Z0aelph_gQ6c@x1>
 <20260316094344.GA8048@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316094344.GA8048@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_025122_627013_524129EC 
X-CRM114-Status: GOOD (  25.62  )
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

On Mon, Mar 16, 2026 at 09:43:44AM +0000, Leo Yan wrote:
> Hi Arnaldo,
> 
> [ + Mark ]
> 
> On Sun, Mar 15, 2026 at 10:43:03AM -0300, Arnaldo Carvalho de Melo wrote:
> > Hi,
> > 
> > 	Can someone please address this perf build warning:
> > 
> >   make: Entering directory '/home/acme/git/perf-tools/tools/perf'
> >   BUILD:   Doing 'make -j32' parallel build
> > Warning: Kernel ABI header differences:
> >   diff -u tools/arch/arm64/include/asm/cputype.h arch/arm64/include/asm/cputype.h
> > 
> > I tried updating that header and got the problems below.
> > 
> > I just merged perf-tools with upstream, will push to tmp.perf-tools at:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools.git tmp.perf-tools
> > 
> > Thanks in advance,
> 
> Sorry that this issue has come up again.
> 
> A quick summary:
> 
> The plan was to extract the CPU ID definitions from cputype.h so that
> kernel and userspace can share the same definitions.  This would avoid
> keep syncing cputype.h between the kernel and userspace [1].
> 
> James worked on this a bit, and later Mark wanted to try a different
> implementation.  However, we haven't posted formal patches yet.
> 
> To avoid extra burden on perf maintainers, I suggest removing the
> cputype.h check in check-headers.sh.  In the short term, Arm developers
> will take responsibility for keeping it up to date.  In the long term,
> once the CPU ID refactoring is completed, we can do a proper cleanup of
> cputype.h.
> 
> James, Mark, is this reasonable?
> 
> [1] https://lore.kernel.org/linux-perf-users/aFJ8bQh_30JMzF_-@J2N7QTR9R3/

Removing the check sounds good to me; that's one of the options I
suggested in [1]:

| The simple solution for now is to *NOT* update the userspace header,
| and to stop warning that this has diverged from the kernel header. 

I think it's fine if we need to manually update that header when
teaching the perf tool about specific CPUs.

Are you happy to spin a patch to remove the check?

Mark.

