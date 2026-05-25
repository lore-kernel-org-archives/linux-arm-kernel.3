Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A503CD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 20:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vKMrNHjeXL1DWvgeu+GECwrasTsPYGvFygFpV8a+a+U=; b=uHmG56oCjvk8ri+rri4ZpdCLYp
	So82NxXFHFd2yqb6MWME5/dwbhhHf881Rqy5T9HCivF8ONgFyf4j76wq9UaLiXdrDRlPSfZV+4iM4
	BIjPwq6vTTukyoKbhXlliIyGGc9ju/0rF6u/12wvuwB4MKND3BUmnw6khX2nawDXEVI08Md8wa4oJ
	f0qCs3/k//5SPNg9TQrW/jVEVjS/rV1IvCEjdoylq/s/zy80WBRM/2nV9OOm9FV6t53oJwVtYGqv2
	imBFFqkkmeWGMyPfnUGu9vqRa9fCD4PUiNU7NtYZOKAygRQfKawWIka+mBxn7bnoBJr14Fl+FZog3
	h1sqV1vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRbgy-00000000OF7-1fDQ;
	Mon, 25 May 2026 20:14:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRbgw-00000000OEt-2kiz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 20:14:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B28F560008;
	Mon, 25 May 2026 20:14:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C43801F000E9;
	Mon, 25 May 2026 20:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779740065;
	bh=vKMrNHjeXL1DWvgeu+GECwrasTsPYGvFygFpV8a+a+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=diR2+1wb5Lg99h3bffkc8h2xgx8OC8HOI643EMKVYMO4a/VHJ7mUr01BD7WIlLs2D
	 YMD8PpJ0U3NUf2N8zuFLIViF/Ei+V5dE1lneMPjYhH1TsLwgtg8eXZOsTe0oQp32SM
	 b0cByFiZTXGWe2LtA7PKEHg0VWqVMlkyi2cYlHG7PFZ5PYAuj55uk4lJUCdfTkozZY
	 o1Rl99Y3tz/Ndp4nx5447jB9O0TdDEHq0eQa8cQUmWsaNBTluuihgyMmcj9OEzlSkr
	 unSFld5Hpeigk80kFh1683p3mouu0pCY2tejlz02ZhUtcTBFfnwZQXYBp7/W95pTue
	 f98Njn6Ipt5EQ==
Date: Mon, 25 May 2026 17:14:22 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: namhyung@kernel.org, adrian.hunter@intel.com,
	alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com,
	james.clark@linaro.org, leo.yan@linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, mingo@redhat.com,
	peterz@infradead.org, tmricht@linux.ibm.com
Subject: Re: [PATCH v9 00/23] perf python: Modernize and extend Python API
 (Phase 1)
Message-ID: <ahStntuCibNk-IjO@x1>
References: <20260428071903.1886173-1-irogers@google.com>
 <20260522220435.2378363-1-irogers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260522220435.2378363-1-irogers@google.com>
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

On Fri, May 22, 2026 at 03:04:11PM -0700, Ian Rogers wrote:
> The perf script command has long supported running Python and Perl scripts by
> embedding libpython and libperl. This approach has several drawbacks:
>  - overhead by creating Python dictionaries for every event (whether used or
>    not),
>  - complex build dependencies on specific Python/Perl versions,
>  - complications with threading due to perf being the interpreter,
>  - no clear way to run standalone scripts like ilist.py.
> 
> This series takes a different approach with some initial implementation posted
> as an RFC last October:
> https://lore.kernel.org/linux-perf-users/20251029053413.355154-1-irogers@google.com/
> with the motivation coming up on the mailing list earlier:
> https://lore.kernel.org/lkml/CAP-5=fWDqE8SYfOLZkg_0=4Ayx6E7O+h7uUp4NDeCFkiN4b7-w@mail.gmail.com/
> 
> The ultimate goal is to remove the embedded libpython and libperl support from
> perf entirely, expanding the existing perf Python module to provide full access
> to perf data files and events, allowing scripts to be run as standalone Python
> applications.
> 
> To make the review process more manageable, the original 58-patch series has
> been split. This v9 series represents "Phase 1: API & Infrastructure" (23 patches).
> It contains:
> 1. Missed explicit dependency cleanups and header sorting.
> 2. Crucial core safety infrastructure (reference counting for evlist/evsel)
>    to support safe lifecycle management in garbage-collected Python.
> 3. The core Python API extensions (session wrappers, perf_data wrappers,
>    sample accessors, stubs, and LiveSession helper).
> 
> The subsequent "Phase 2" series will contain the actual porting of all
> existing Python/Perl scripts to the new API (which yields up to 35x speedups
> as demonstrated previously) and the final removal of embedded interpreters.

I tried applying it now and got this:

Cover: ./v9_20260522_irogers_perf_python_modernize_and_extend_python_api_phase_1.cover
 Link: https://lore.kernel.org/r/20260522220435.2378363-1-irogers@google.com
 Base: not specified
       git am ./v9_20260522_irogers_perf_python_modernize_and_extend_python_api_phase_1.mbx
⬢ [acme@toolbx perf-tools-next2]$        git am ./v9_20260522_irogers_perf_python_modernize_and_extend_python_api_phase_1.mbx
Applying: perf arch arm: Sort includes and add missed explicit dependencies
Applying: perf arch x86: Sort includes and add missed explicit dependencies
Applying: perf tests: Sort includes and add missed explicit dependencies
Applying: perf script: Sort includes and add missed explicit dependencies
Applying: perf util: Sort includes and add missed explicit dependencies
error: patch failed: tools/perf/util/evsel.c:11
error: tools/perf/util/evsel.c: patch does not apply
Patch failed at 0005 perf util: Sort includes and add missed explicit dependencies
hint: Use 'git am --show-current-patch=diff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am --abort".
hint: Disable this message with "git config set advice.mergeConflict false"
⬢ [acme@toolbx perf-tools-next2]$ git am --abort
⬢ [acme@toolbx perf-tools-next2]$ git diff
⬢ [acme@toolbx perf-tools-next2]$

I agree with the intent and plan on reviewing and testing it.

- Arnaldo

