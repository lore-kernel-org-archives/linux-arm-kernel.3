Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8096BE6FE24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 18:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bSj5pxqUkGPtDBBaQFh8SBVDFBTrS+7/HjDU0XwkQPs=; b=TuzIMPDJs7ExS3W3oQCPOtrisc
	mIaGi1R2ylomeiXwG5nZ+VCQ2vCpL6J7b8ZpCrELRyOyJ9C5wgoUlvSgbVoAtWjVu0cY/+jJczpSi
	SVhXoA/hj/G3dqCMBEJxi3ESYeRjYq5Ld2ELlnFwPgvK7NCCmiDq4rLUQDTgAjW7tOIctubogMbin
	67UAL3BAvsZrsWc8iKFNXI3hpXrcCaMxpQs1UFdGGZa4ODXaedk6axQawxNmcmclCmNfScuXGncvv
	h9DW+5k2yty1dZu002cR1N+tMrPeHUSwJlNplB0NSLCs/I8mKyQuSYA9S5kl01n/ctEbP6C+4ORk2
	eQO/PKOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY6ql-0000000Fvyt-0W4p;
	Tue, 23 Dec 2025 18:11:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY6qk-0000000Fvyk-19yB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 18:11:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 49FF260142;
	Tue, 23 Dec 2025 18:11:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FBFEC113D0;
	Tue, 23 Dec 2025 18:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766513469;
	bh=vCKrrF1o0/Sy5zt04haiRM3dM3kVeJ9oxBI9ruG+/lQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nm7dP9K37WQ91NFZL+iwUFWhCmuzJSPvFZeTgq7f8lpN19LuwUdZomDaO+GfjfH5h
	 cqX2BUZ/VXsg4XDxwrxuM0rNfDKlO/95CvnGRErQ/JKirXVWOxjBBQa8VTZP+KzwVy
	 PT0WbsNxeKg4QZGXfl02aiw1mhCATHIL6Z4oKwy0P75pLnN6xkkZqatLqvMHYEJpZe
	 +F2jDS/Y+o6L0uhU2sdiIGaY7zjiK2AtG+k1z2wlQHueKKlWk2mp6fYzEV+iBORpOU
	 xy+IYZynIulenhDOcdnOj2dSwbGclzmwm5Q9J8CSBDXsuZK2kBHUtg/ZiJnMAO88Vm
	 cIbgRs2WxgBuw==
Date: Tue, 23 Dec 2025 10:11:06 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Ian Rogers <irogers@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 08/11] tools headers: Sync arm64 headers with kernel
 sources
Message-ID: <aUrbOlBwdLFTMjH1@google.com>
References: <20251222225716.3565649-1-namhyung@kernel.org>
 <20251222225716.3565649-8-namhyung@kernel.org>
 <20251223153648.GG9788@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251223153648.GG9788@e132581.arm.com>
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

On Tue, Dec 23, 2025 at 03:36:48PM +0000, Leo Yan wrote:
> Hi Namhyung,
> 
> On Mon, Dec 22, 2025 at 02:57:13PM -0800, Namhyung Kim wrote:
> 
> [...]
> 
> >  #define NVIDIA_CPU_PART_DENVER		0x003
> >  #define NVIDIA_CPU_PART_CARMEL		0x004
> > +#define NVIDIA_CPU_PART_OLYMPUS		0x010
> 
> Just remind, this is duplicated with patch [1], so you may decide
> which one to pick for merging.

Oh, thanks for the reminder.  I've missed it.  I think it's small enough
to merge to perf-tools tree.  I'll drop this part.

> 
> Otherwise, LGTM:
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>

Thanks,
Namhyung


