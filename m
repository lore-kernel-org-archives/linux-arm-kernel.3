Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0764CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 18:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qFrOZCWZCVGlo910sJdTobT/pCI7Lr7PxFOoaUSwWWU=; b=XWG/9gyB5Il88QW0JDyOhlVD6G
	t5P34NCAEQzQ8IuH9FDkzif9r4o5XdTnYYTbqhSCRmoYj89OYnrWYgyyIbA6aGv2bP+d/nlver43F
	+1Mer9v/jCBxnxJ45UMQvPs4mg8xZ9wClmqh6RW0f4Fd3tnjdgA/5lDowJp46Lk7D5l/rlVDQUBQK
	g0ro0AYKWkn7mOvLdSE186PAxQOUXoMZcE6CJ/4aZGzs3MC2EUVPAhKhjs6L38SYzUxHnhJptD3j+
	DMlAazy9DK8fb8j5fi76zKayAec1VHDQ/HXDsNoDMraRBfFVXvOV5BRMfS28KZO/2R+FDoUsFoHfr
	gSlE0MEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux8Ur-0000000AzVU-15fx;
	Fri, 12 Sep 2025 18:27:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux8Uq-0000000AzUv-037w
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 18:27:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6D8CC601F6;
	Fri, 12 Sep 2025 18:27:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9094EC4CEF1;
	Fri, 12 Sep 2025 18:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757701663;
	bh=giny/t9N6iQo9VgTX/KMvXx1csABBtT4GXJJNz+cGzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZxOTH7q1UIMLIqN7+St3a6ke0DPxW51/2hEN6KE2K9Wugc6N3Z+FSUW5XJPuWCxOp
	 0bukNnj+/D5FS5ezcLbAUBEIxXnW3Bm7r8fuHedpMr1n7C7QnyQBGRuRpfRhJEen4+
	 Xnk+7ACAf3zc095OmEqes5RhJhOfW3DgAjHQ9Bb+0qD9DjSsaH0nfRkJLA96Up/eCs
	 HBQI77oq/fYy4JFa6tHBryIAz4AicBcJM31ZcpzelcpQiYONSf5jrFohCzNuP36sLW
	 dKWjvGlLHDe1CR8CgEo3NLWfFNk2zGUfiInh3MwgwKwxot5rKgqleKUsyPEChMO2BR
	 tVNlRhkxykZFA==
Date: Fri, 12 Sep 2025 15:27:40 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>
Subject: Re: [PATCH v2 2/2] perf vendor events arm64 AmpereOne: Fix typos in
 metrics' descriptions
Message-ID: <aMRmHFNWjB74Bwy8@x1>
References: <20250910195214.50814-1-ilkka@os.amperecomputing.com>
 <20250910195214.50814-3-ilkka@os.amperecomputing.com>
 <fc2ee38c-b163-4b7e-9ba2-c2b93d0fc691@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc2ee38c-b163-4b7e-9ba2-c2b93d0fc691@linaro.org>
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

On Thu, Sep 11, 2025 at 09:26:47AM +0100, James Clark wrote:
> On 10/09/2025 8:52 pm, Ilkka Koskinen wrote:
> > While fixing a typo in "l1d_cache_access_prefetches" in AmpereOneX,
> > a few other typos were found in metrics' descriptions too. While AmpereOne
> > doesn't have the metric, it did have the typos in the descriptions.
> > 
> > Signed-off-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>

> Reviewed-by: James Clark <james.clark@linaro.org>

Thanks, applied to perf-tools-next,

- Arnaldo

