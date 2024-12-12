Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B1BE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 19:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tsmQEjelOWTu4zHhJ9JMIWHspLWzKh9SaLKDSUjvTEU=; b=janBBTes7DCC85/SLC9tYWcZST
	e7f3VcBxHSYRSmEGF08Jzo5Zp8ltTI3gOoB8e6+nV+ULS5kjPH5/L1Akv96LAy62kGj6sbdwK9T42
	PXfMDXk8fMgEVGtoAcju3lnT6BH9uu5WI99363iEqiXVMmzSKcXuRjgxfHJvdiBY6DLAXfxSm5Pxi
	a071tUTUJ+dN5QZde4FHs43iJKc0gKRj1uphdfZrEdTF5Le1bDzFWeV+/qFCVX4kJ8gwmu02ctPuo
	/jJtCWFa9FaSMTqMRM9hTtSzm2XF7XfAoyIdMeJt7xBGRaewsGceEuAe/NBby/rS9Sz27mmEA3NpL
	AbqBalGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLovP-00000001ega-1lNx;
	Thu, 12 Dec 2024 19:32:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLoJ8-00000001VlS-3BmQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:53:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D89495C6053;
	Thu, 12 Dec 2024 18:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A9BFC4CECE;
	Thu, 12 Dec 2024 18:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734029586;
	bh=BHxnz/ZuGaoyXkYzRJJYhHFoUf9bxqFSTCwoEoQ6K8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nbk2RazCjVg+911bJxS46cCaMPd92Ibstc7Fba+ayEhk/EST0iwWhAA1i0j1Cnlxp
	 poorKNvy8ZHIKNd3YTyYtCSAkxZ4rjnt0KknlXd2scRVIZ2MAhj9fKfFxhkH5e0kmZ
	 TWnX7hvb8/A0cF+VwJ0ftHaIJfdDOFstHSTj5/FTQmAssePc9fk3dDBH8VFmAH3dLv
	 GBjkB0dCPB1fH7qRhfzkpmnQKF905SpRIyk/YdxyRAEawsaOR5UofNDnPEmCZ9MjpG
	 n8yAyRETlalnbsmrqNKIHU+xRyLip3AF86mfo1cQ+w3drhcQkUXObwrzMN8nZRAoOB
	 e7jd8MIQevuCQ==
Date: Thu, 12 Dec 2024 15:53:03 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf vendor events arm64: Update N2/V2 events from source
Message-ID: <Z1sxD-lvXnFKVy3q@x1>
References: <20241120143739.243728-1-james.clark@linaro.org>
 <CAP-5=fWeJYf4mbSKSonwNhc5smw6_OktRBG2bCObcQiDjy2iAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fWeJYf4mbSKSonwNhc5smw6_OktRBG2bCObcQiDjy2iAQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_105306_838545_32E7FEED 
X-CRM114-Status: GOOD (  16.03  )
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

On Wed, Nov 20, 2024 at 10:31:55AM -0800, Ian Rogers wrote:
> On Wed, Nov 20, 2024 at 6:38 AM James Clark <james.clark@linaro.org> wrote:
> >
> > Update using the new data [1] for these changes:
> >
> >   * Scale some metrics like dtlb_walk_ratio to percent so they display
> >     better with Perf's 2 dp precision
> >   * Description typos, grammar and clarifications
> >   * Unnecessary metric formula brackets seem to have been removed in the
> >     source but this is not a functional change
> >   * New sve_all_percentage metric
> >
> > The following command was used to generate this commit:
> >
> > $ telemetry-solution/tools/perf_json_generator/generate.py \
> >   tools/perf/ --telemetry-files \
> >   telemetry-solution/data/pmu/cpu/neoverse/neoverse-v2.json:neoverse-n2-v2
> >
> > [1]: https://gitlab.arm.com/telemetry-solution/telemetry-solution/-/blob/main/data/pmu/cpu/neoverse/neoverse-v2.json
> >
> > Signed-off-by: James Clark <james.clark@linaro.org>
> 
> Reviewed-by: Ian Rogers <irogers@google.com>

Thanks, applied to perf-tools-next,

- Arnaldo

