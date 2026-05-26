Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2641FCD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 00:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UYSzyCnRfkbGvYmjVFNQOma+CAUK4X7j6Q3neoMpKbY=; b=N4KrMSlFXDMIcIreORyLd3RCex
	z2uuDDJ+QInu6mLGOmKDEEpzGnzZ6aQadvLNjnxpNWgTF+AkJbZWGJaztk5kYYClV+HnTluKzTU/b
	S/baF0sCLbfx+DK9i+mD2oDLOi9psAg+B5vyjO9NOIEK15fwCMg6Ddi0laV1F4iy1jCDKLzQMutGO
	T32BrUxB3uY250b2OU1RvGpC4C8PMvhCnAsXwaLVkV9Q52ZCZKRRj+QD9ry+Xzwj4V8UtA4UvQ8zq
	nXAFNefdNg9DZjRDTWo0gTlPi0bagXaZYGEVV3sWSwC7TysLDRY0Byx4hTux6lUCDQDAYXQqJivg9
	rbbPlF+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRfmN-00000000iJl-0B8P;
	Tue, 26 May 2026 00:36:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRfmL-00000000iJL-0NBr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 00:36:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8721C60018;
	Tue, 26 May 2026 00:36:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AFB01F000E9;
	Tue, 26 May 2026 00:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779755776;
	bh=UYSzyCnRfkbGvYmjVFNQOma+CAUK4X7j6Q3neoMpKbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P0jpn/jL3qQEM0a9SLXlroUwzMVDhs5N/pHt121fHBqplnElvGyIULUz33iYLlYDu
	 B0Hm+UOeLshaQS70MoaorFeFnvcgfA0VRNlPxQlJTpVc7zwwqy+0VqTn3D3A8ua0UU
	 Mu2g97UozyCYowT6b/10mSmic4dsbJnJV4qnw0cQVHdiMNrAvkCGoCHhjqrCi8VzH3
	 1n4smKPZdrVQHbRC/fp9mHP1GDGpV41olMU3IjDzNWmpFsciGjnwvldGim4BkJwOOY
	 OvU3qseA8mFYI4xiAgCDK7LmBON8YUJZO5Rve+8VzPDGaijx43RRo69x04XEXZKwNs
	 NjhXvJNvzGN/Q==
Date: Mon, 25 May 2026 19:36:13 -0500
From: Namhyung Kim <namhyung@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: acme@kernel.org, adrian.hunter@intel.com, alice.mei.rogers@gmail.com,
	dapeng1.mi@linux.intel.com, james.clark@linaro.org,
	leo.yan@linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	mingo@redhat.com, peterz@infradead.org, tmricht@linux.ibm.com
Subject: Re: [PATCH v9 05/23] perf util: Sort includes and add missed
 explicit dependencies
Message-ID: <ahTq_Wb-S9o3OV0o@google.com>
References: <20260428071903.1886173-1-irogers@google.com>
 <20260522220435.2378363-1-irogers@google.com>
 <20260522220435.2378363-6-irogers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260522220435.2378363-6-irogers@google.com>
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

On Fri, May 22, 2026 at 03:04:16PM -0700, Ian Rogers wrote:
> Fix missing includes found while cleaning the evsel/evlist header
> files. Sort the remaining header files for consistency with the rest
> of the code.
> 
> Signed-off-by: Ian Rogers <irogers@google.com>

Acked-by: Namhyung Kim <namhyung@kernel.org>

Thanks,
Namhyung

> ---
>  tools/perf/util/bpf_off_cpu.c       | 30 +++++-----
>  tools/perf/util/bpf_trace_augment.c |  8 +--
>  tools/perf/util/evlist.c            | 91 +++++++++++++++--------------
>  tools/perf/util/evsel.c             | 75 ++++++++++++------------
>  tools/perf/util/map.h               |  9 ++-
>  tools/perf/util/perf_api_probe.c    | 18 +++---
>  tools/perf/util/s390-sample-raw.c   | 19 +++---
>  tools/perf/util/stat-shadow.c       | 20 ++++---
>  tools/perf/util/stat.c              | 16 +++--
>  9 files changed, 152 insertions(+), 134 deletions(-)

