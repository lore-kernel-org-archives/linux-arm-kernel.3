Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428E0E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 21:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CZhEpp/15CogVUuMYCEmUGcZLT8qrsf/MAXBt/TIZFQ=; b=ufl5y/OQxfaJ17CBPONodl9Lhy
	Be3f31iwFnAq0OwrgRlEdpL5EI6S0r/y+IbRq2yI4mGsCmDprD3tXjuJFKIyguKMcHKfCysUi//lK
	0t9Dy9GPsMVpO5DKiXegm9IFflMYdQOoFxSJGmpJ2Pvxc6HpNPH0dfFwsjJjtVemcktWR4/NxQibr
	lzOIWW5GVg0L452VCDbw0sQukSTCko07q0UgBVKIt2AbGzchMJ+hAH2BU+jZYTcS0/HvFb9+IlJi0
	keJE3YK0av46gdO0T1kWWJkpL3SEVZriFNCtFEnbbfbgkCU3xuUVCeFqe+o611H5nbIEbShSwcQtv
	OyFZAfgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXo4J-00000009lUB-0iKY;
	Tue, 14 Jan 2025 21:03:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXo35-00000009lPj-1htr
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Jan 2025 21:02:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CZhEpp/15CogVUuMYCEmUGcZLT8qrsf/MAXBt/TIZFQ=; b=aK6OpQAGvjEtodrxqkjYq6kKPE
	bYeqlLh8jxg7fmZ4MREjxrZ8Yn7ojZVk7BBBnbz4EiH/tyvSDShR87jwUsvdoYMs6CPT3mlYDq6vK
	zyh7Ck5CLpVl4mR6+Qq0rmW4QR/O1pn7TUQ6lvBY1qkeBiSZUu6NC9GzzEE849IevFeGenkM2Sey5
	d+m1HDzytsq4n9GJqpv1mAIYx8ddzMNQgrEfP4D/PChUCxTM47fV997GQ5EGI9VD3ukj3SPqdY6Y7
	i8u8m2tFVPVc9l0oiD1+U3velidk8p35K8x6xp0d2CgVd55r0WeY8llL20L3BfmgB0Y8WFdv1r3GC
	7DPaYnzA==;
Received: from mgamail.intel.com ([192.198.163.15])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXo31-0000000AdJQ-0yQa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 21:02:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736888523; x=1768424523;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oRhBJSFplA4girqQpFmXn2lpdwxmXMmYVYqFN7a/EOQ=;
  b=WrHw+SA32DtODvL+FmZLtS9+O789qIx+ArnDjKS1w7SH8epbFDgUoBxa
   iXTSK21MylH7isOPFG0EdE2veQ4io+aeXqYlCpc6z9ajjVm5AaKbTMpLF
   Ke/GJ7Ew19SiotYvsBxawk2FYvzTlJ9/32J3ij4CFytvas2t95dJuE4u1
   8A06MDXIk43KLJcDhJRjT8ocdpQyoVRX3HZJdJ2qSP+5tB3XuxVTMFOcm
   zz+pIR81pRNbTQx7/Y1twBR72k7hkRc321H9I1HfTAM76sVcG6Y+IcRYk
   XgBvwFRsPoGxH/Jdlszou7Da86wRXf2HNo0ocEBu+vJiwD6zYfNJcgjlF
   w==;
X-CSE-ConnectionGUID: M7sAl7ZGRYyJtjKwqq0khw==
X-CSE-MsgGUID: Oa3FUkiJS9ecAFGKEFEBtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="37361513"
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; 
   d="scan'208";a="37361513"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 13:01:56 -0800
X-CSE-ConnectionGUID: ACZNSe65S3uCWIbFc7+OPw==
X-CSE-MsgGUID: wlw/x9/7TbyWokH9SCrAzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109548224"
Received: from tassilo.jf.intel.com (HELO tassilo) ([10.54.38.190])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 13:01:55 -0800
Date: Tue, 14 Jan 2025 13:01:53 -0800
From: Andi Kleen <ak@linux.intel.com>
To: Ian Rogers <irogers@google.com>
Cc: Tavian Barnes <tavianator@tavianator.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>,
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Veronika Molnarova <vmolnaro@redhat.com>,
	Michael Petlan <mpetlan@redhat.com>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org
Subject: Re: [PATCH v1] perf sample: Make user_regs and intr_regs optional
Message-ID: <Z4bQwTL5VK6jGDZz@tassilo>
References: <20250113194345.1537821-1-irogers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113194345.1537821-1-irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_210203_937019_02950E05 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
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

On Mon, Jan 13, 2025 at 11:43:45AM -0800, Ian Rogers wrote:
> The struct dump_regs contains 512 bytes of cache_regs, meaning the two
> values in perf_sample contribute 1088 bytes of its total 1384 bytes
> size. Initializing this much memory has a cost reported by Tavian
> Barnes <tavianator@tavianator.com> as about 2.5% when running `perf
> script --itrace=i0`:
> https://lore.kernel.org/lkml/d841b97b3ad2ca8bcab07e4293375fb7c32dfce7.1736618095.git.tavianator@tavianator.com/
> 
> Adrian Hunter <adrian.hunter@intel.com> replied that the zero
> initialization was necessary and couldn't simply be removed.

A much easier fix is to keep a global/heap allocate perf event
around that has these parts zeroed and only override the fields
needed and clear them afterwards.

(similar strategy as a slab constructor in the kernel)

-Andi

