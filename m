Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9106CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 15:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nUQu+dEvVVUIweExh2U8YzklUrRzlC5vfiONcHH1kqU=; b=LjY6CCVZI5C3HybedY4ZMvjrx7
	x+Z8oHFypkWq/xX8HNoJKiUh5zRuyZAETcJ0OFYOHbqc0ayMqCVr3LV742WFonvV3gdW0sCZfM/qf
	W25NGMd0M3XHL71LWOYVUoI6Pm3QXFgsGu+FgEvXUmyFBmcIRpEp48qS2EubX/AVoKVnkhM30TfzU
	GjejKMi1sw6/wYpk9jcuhlBoiJzvwFcQ/jXua28LiQBGWR1hubFRDJ9Ae97BHCKtbOVrCMRNXNU6+
	GWrpkKUgs8DIBo+3jxHH1m5eM2LOx/jnMq8HntrqZ7P5pmFUscqI6FkMFt9al9bnHAX+jfvZ7VBSK
	2+1xWWeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0Uo-00000008D8y-1foU;
	Tue, 09 Sep 2025 15:43:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvMO-00000006Ibj-1oyX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 10:14:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11D11113E;
	Tue,  9 Sep 2025 03:13:51 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 101DC3F66E;
	Tue,  9 Sep 2025 03:13:59 -0700 (PDT)
Date: Tue, 9 Sep 2025 11:13:57 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	George Wort <George.Wort@arm.com>,
	Graham Woodward <Graham.Woodward@arm.com>,
	Ben Gainey <Ben.Gainey@arm.com>,
	Michael Williams <Michael.Williams@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] perf arm-spe: Improve --itrace options
Message-ID: <20250909101357.GB12516@e132581.arm.com>
References: <20250908-james-perf-spe-period-v1-0-7ccd805af461@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908-james-perf-spe-period-v1-0-7ccd805af461@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_031400_732659_8A19D2F7 
X-CRM114-Status: GOOD (  17.47  )
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

On Mon, Sep 08, 2025 at 01:10:17PM +0100, James Clark wrote:
> Most people also want all the SPE samples (instructions group), not just
> the flagged samples that are put into the various memory groups. These
> should have been shown by default but weren't because the default
> interval type wasn't supported.
> 
> Also when looking at this, it appears that the downsampling was behaving
> in a way that would discard samples from one group but not another.
> Improve that and the warning messages.
> 
> I don't want to put fixes tags on these because it's only changing the
> defaults and the behavior, but I don't think the previous behavior was
> incorrect necessarily, just copied from tracing techs but not ideal for
> SPE.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>

I ran the commands below, and the results are good for me.

  ./perf report
  ./perf report --itrace=i100i
  ./perf report --itrace=i100iM
  ./perf report --itrace=i100ib
  ./perf report --itrace=i100ibM

Tested-by: Leo Yan <leo.yan@arm.com>

