Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D75DEBFD2D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 09:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aikbBTSlcWrHqYPryBshGeFtmbhoC4scRNgJuALnKYw=; b=mfp+9gqNT4Myl0DDJUjsdwSsTd
	XvJjEvwrs5/WdpOqTCIuuacZPjxogIvBE2Li9+Cn1KKSu+hJCK6fXALVdLlyAhA8c1DK7JuLOO2ba
	EfpWsHUXMNPrQ5B39+RwctrZek2nNZwcVEN7IBluSNX4f4Q+K4o1ue10hSrfj5icGdP7vsyUFlqp+
	QvxfqbgjjzwClkKp7faUqN4AvCKQsCLWjRmag8gJjEyDdVkjutAsBC09midejrqApKL535vDHxnrd
	AQeiNx+f+uOI9FZT1O1SizlTNSyaqEpEJB4AkLkjbpFLVEc5e+MOYQD6bVBAdEyePWBSlwziNf6d+
	QqGFfQZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCDxg-0000000FOXq-3ZR4;
	Mon, 13 Apr 2026 09:52:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCDxe-0000000FOXE-2uiA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 09:52:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA7241684;
	Mon, 13 Apr 2026 02:51:58 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE8B03F93E;
	Mon, 13 Apr 2026 02:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776073924; bh=JG9jZqoBzqnJwy6iOUhHxZ1WPwalVtEYtkB525yIRcM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hxiZD6cEtMd+rnOziYfMFlmMO5AUT5tKQL1rmi+HS7I1jJ4jByZXvnMUBmd0scMWa
	 SnHuVM15fmW+vdAOUaifwSaKtILDYe1V8CklDjfYK+y8A8ibVmzycZYnYHN4867zr0
	 MVPahyfUqkNOXgN2GGTomb4R021uLcQ+CUeFGsPQ=
Date: Mon, 13 Apr 2026 10:52:01 +0100
From: Leo Yan <leo.yan@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: James Clark <james.clark@linaro.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Al Grant <al.grant@arm.com>, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] perf arm_spe: Print remaining IMPDEF event numbers
Message-ID: <20260413095201.GB356832@e132581.arm.com>
References: <20260407-james-spe-impdef-decode-v2-0-55d3ef997c48@linaro.org>
 <20260407-james-spe-impdef-decode-v2-6-55d3ef997c48@linaro.org>
 <3e7645cf-28cb-4021-89e6-e467e9555ff4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3e7645cf-28cb-4021-89e6-e467e9555ff4@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_025206_870069_D472FF71 
X-CRM114-Status: GOOD (  16.70  )
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

Hi Jie,

On Sat, Apr 11, 2026 at 09:08:18AM +0800, Jie Gan wrote:

[...]

> > +	/*
> > +	 * Print remaining IMPDEF bits that weren't printed above as raw
> > +	 * "IMPDEF:1,2,3,4" etc.
> > +	 */
> > +	if (payload) {
> > +		int i;
> > +
> > +		arm_spe_pkt_out_string(&err, &buf, &buf_len, " IMPDEF:");
> > +		for_each_set_bit(i, &payload, 64) {
> 
> for_each_set_bit(i, &payload, 64) passes &payload where payload is u64. The
> macro expands to find_next_bit(const unsigned long *addr, ...). On a 32-bit
> host unsigned long is 32 bits wide, so only the low 32 bits of payload would
> be scanned; bits 32–63 would be silently ignored.

I think this is incorrect.

Even though unsigned long / long is 32 bits on 32-bit CPU, this should
be handled by the BITS_PER_LONG macro.  The FIND_NEXT_BIT() macro can
fetch consecutive long values when the size > BITS_PER_LONG.

> While perf is almost
> always built on a 64-bit host today, the tools/ tree is explicitly portable
> and the compiler will emit a -Wpointer-arith / -Wincompatible-pointer-types
> warning on a 32-bit build.

I agree we should fix building issue on 32-bit target.

Thanks,
Leo

