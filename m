Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DAE4C7EE24
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 19:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gruKTDJuV6Sj97RPdJFhZZrpf4LrmQdVNrpM5u2t0XU=; b=sQ8IfZ07PiFlNP11DlZtIlHcfR
	5+OTvdz829WE8OHm1HG5prrGCchmp922fqV9pjgphefYakmXOmRIVUQV67B3ehJnzDbiHOF/0pdTo
	Lzi8tAPUcVxM44JjrO1wnep/QgrkVSK4VsgHpVMF9dWo65R0fn6AmP6HIwn++GE6YpuDyY7bwRm0Q
	g6hHfKOddTOiwS2x6OE1hYQ1y5tvqr6Zx1tPmuebp1YU68h6FSd+YNqCircv7KFpGaDNGXZ6wUlaY
	amzRi1V8pBOiPu9j1F2Lb6g9XwQGU7ZYlaDhAan9iurT23HG+2uA7SAvxgwKJuke//Pq+644PwYEO
	jTPL9gEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSLHA-0000000E8ce-08uN;
	Thu, 19 Jun 2025 19:50:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSI3a-0000000DcGf-2H7Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 16:24:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D349C113E;
	Thu, 19 Jun 2025 09:23:44 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 70F503F66E;
	Thu, 19 Jun 2025 09:24:04 -0700 (PDT)
Date: Thu, 19 Jun 2025 17:24:02 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: [PATCH 02/12] drivers/perf: arm_spe: Expose events capability
Message-ID: <20250619162402.GI794930@e132581.arm.com>
References: <20250613-arm_spe_support_hitm_overhead_v1_public-v1-0-6faecf0a8775@arm.com>
 <20250613-arm_spe_support_hitm_overhead_v1_public-v1-2-6faecf0a8775@arm.com>
 <3431e6e3-a80b-4ce0-94c4-56739a5ed2d9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3431e6e3-a80b-4ce0-94c4-56739a5ed2d9@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_092406_627078_6FF4E2B3 
X-CRM114-Status: UNSURE (   9.43  )
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

On Thu, Jun 19, 2025 at 12:32:16PM +0100, James Clark wrote:

[...]

> > @@ -165,6 +168,7 @@ static struct attribute *arm_spe_pmu_cap_attr[] = {
> >   	SPE_CAP_EXT_ATTR_ENTRY(ernd, SPE_PMU_CAP_ERND),
> >   	SPE_CAP_EXT_ATTR_ENTRY(count_size, SPE_PMU_CAP_CNT_SZ),
> >   	SPE_CAP_EXT_ATTR_ENTRY(min_interval, SPE_PMU_CAP_MIN_IVAL),
> > +	SPE_CAP_EXT_ATTR_ENTRY(events, SPE_PMU_CAP_EVENTS),
> 
> Would "event_filters" be a better name? Technically an SPE version can
> support a filter but the event itself might not be implemented.

Good point!  Will update in next spin.

Thanks,
Leo

