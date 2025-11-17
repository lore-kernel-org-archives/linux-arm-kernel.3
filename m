Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA94CCEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 07:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sy5M9BW0zFBfl9eLOJAPcz6IGBWtZ9VyU8IBvCBTtu0=; b=PI2TKCAKt8BPUBgkiApyDOBbDk
	7IhxBHczW8yA2K/NOesHUBuMf8dMhsEYMlmrt/jjvJbKrhIwCuGtrnp7qfTse7CFvCKztMp4GoAFl
	46kKoFK2OjTQYwYZ8bHZm0cUkQX2qJXGu0CvzNjTzFOaaz91Y59JNep9d9/tW2RyNN03I1lonTKGI
	rdWLP/AbR9DAZ5ljN4TgKI1FJSLWp4sXTtdt6aK/X0VTRRahDqWNiPLFGMcG7bOaB9lcPQJB4u6Nj
	wREWSVkC3JW5w/9gNt21Rx6oqg2XBsOQwyyspJ5EqS46QdM4Yvuh5Edlee9kdurfFxbydf3pyABzI
	kFPnjPQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKtXx-0000000FbW5-30PE;
	Mon, 17 Nov 2025 07:21:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKtXs-0000000FbVV-0JKM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 07:21:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F1E484346C;
	Mon, 17 Nov 2025 07:21:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56D81C4CEF5;
	Mon, 17 Nov 2025 07:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763364062;
	bh=tx1EQAISjX9lGOb14ffit3i4ZUagycgBEd3Frvd4LA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L/6t8s7ziwKgH/pXRNhCOmPQK1hCu7lViGR+DFoD9xGgsaltHb47bQlfXXSNY4rbh
	 Hct0jnvPwIDvk0E/k4mfphGHMuXr/Y3a09eL6ImGIsFjs2zkjiTQblLKB/ihG4UveG
	 LFeghF1Y63MLEasIkrWa4SSuYCkNZ24Go0zLbllbfWHqYHleP0D0Mu5F0emANXGJVm
	 BQk444MEv/bNN+4MbDGvxs1L2xzkkEbduHHAyV6Pt7NghN3Pt4/PHZIEAkiBAgmmrL
	 nyQmd34ehjZJfbfChKb2DUaYtBrPdqlKJLcKLQsmWflAs+Wr2AEkBeT5MYaRnH9dbN
	 pJtk9woIA8vsA==
Date: Sun, 16 Nov 2025 23:20:59 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: Leo Yan <leo.yan@arm.com>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Ian Rogers <irogers@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/25] perf arm_spe: Extend operations
Message-ID: <aRrM2y4O_3aaa2Ee@google.com>
References: <20251112-perf_support_arm_spev1-3-v3-0-e63c9829f9d9@arm.com>
 <CAP-5=fXiiWRDPzONNNZQZc4QOBQoz=kRnJq77on5r4w9aDx-XA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fXiiWRDPzONNNZQZc4QOBQoz=kRnJq77on5r4w9aDx-XA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_232104_137217_F38366AA 
X-CRM114-Status: GOOD (  18.35  )
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

Hello,

On Thu, Nov 13, 2025 at 09:01:47AM -0800, Ian Rogers wrote:
> On Wed, Nov 12, 2025 at 10:24 AM Leo Yan <leo.yan@arm.com> wrote:
> >
> > This series enhances tooling to support new operations:
> >
> >   - Support for MTE tag since Arm SPE v1.3;
> >   - Support for Advanced SIMD extension and SVE operations;
> >   - Support memcpy, memset and GCS operations;
> >   - Support extended operations for atomic, Acquire/Release and
> >     Exclusive instructions.
> >   - Enhance the data source for associated info, like floating-point,
> >     conditional, data processing, etc.
> >
> > This series is divided into three parts:
> >
> >   Patches 01 ~ 06: Support raw dump for new operations;
> >   Patches 07 ~ 17: Export the operation info into records, so that the
> >                    information can be later consumed by samples.
> >   Patches 18 ~ 25: Set the operation info into sample's data source and
> >                    SIMD flag, and updated the document.
> >
> > This patch series is tested on FVP for native parsing and x86_64 for
> > cross parsing.
> >
> > Signed-off-by: Leo Yan <leo.yan@arm.com>
> 
> Reviewed-by: Ian Rogers <irogers@google.com>

Can I get some comments from ARM folks?  I think I can merge part 1 and
2 before changing the kernel interface.

Thanks,
Namhyung


