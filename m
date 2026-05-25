Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D28C5CD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 20:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/SFhSJg3I0yWRV11t8AuSF99CxN+vX+ywiFBDw5lm4s=; b=kZMt9wuU/OViCGvUGNXoKgSZro
	X4gDnv8YByaaj7ikKvjLmWfhEAYlmdGPMZFKUFcwIwjMm3MjI7+zoLkqyX/JVfnmjrlKv6u3/SCLr
	glmSTVND/2wsG0r5VOKLmKk6njdHgurufDE6fuwxKhSZBUM0S5cZrXXad1//KXUOTuA0iwD5isqAJ
	GjZYb7HPIw6miubAx9PHbYz8lafvc5F9KmGiWEtORw7CxZXzvWYZk+sS2opMiYufq2ik3B2WbD0Hh
	r4SODy8lDKkcwzlgovCn8jqfDShuGsKReeQaIH9zuSFkZ7k7EDnXHf+CQgbGcaLGDp3BYft6Wop/Y
	URq+gSbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRbkC-00000000OVY-34Be;
	Mon, 25 May 2026 20:17:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRbk9-00000000OV7-1q0R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 20:17:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B22B4241D;
	Mon, 25 May 2026 20:17:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0B441F000E9;
	Mon, 25 May 2026 20:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779740264;
	bh=/SFhSJg3I0yWRV11t8AuSF99CxN+vX+ywiFBDw5lm4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QLnC2GxzTRKD+Pl4uQ7YxwR4xoZBwOfsUV0Vk9keuLbcjluZK9bKvOVBNKrfiC2J8
	 m4FCU5n3AJd+GUDmQeH6oOiEwDMfBIpwN5E3Ukkd1/D1OuIcAv2OTzfmhLrCVEuuvk
	 Ji+wjxOJzq2yv1YSOBUhbFLHjttzK/wyzDNZUKdF4+0er6hruuO1jvTi42ObwLZM37
	 OP6DvxJVZeu8RdVYeS4IL7YgqGpdIdpFxXFpGp40gRuj+eMDKVbet7+UuybQocXtZl
	 EgJz4KkXyPT/gKWJrvuAUgoKiMApCXLW3zMz21cSgC0/sRiykpRQUZa/Xh4V2r+rc8
	 2EaMj22jcCPGg==
Date: Mon, 25 May 2026 17:17:40 -0300
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
Message-ID: <ahSuZCJCQa4tE5aN@x1>
References: <20260428071903.1886173-1-irogers@google.com>
 <20260522220435.2378363-1-irogers@google.com>
 <ahStntuCibNk-IjO@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ahStntuCibNk-IjO@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_131745_536888_21618918 
X-CRM114-Status: GOOD (  18.60  )
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

On Mon, May 25, 2026 at 05:14:25PM -0300, Arnaldo Carvalho de Melo wrote:
> On Fri, May 22, 2026 at 03:04:11PM -0700, Ian Rogers wrote:
> > This series takes a different approach with some initial implementation posted
> > as an RFC last October:
> > https://lore.kernel.org/linux-perf-users/20251029053413.355154-1-irogers@google.com/
> > with the motivation coming up on the mailing list earlier:
> > https://lore.kernel.org/lkml/CAP-5=fWDqE8SYfOLZkg_0=4Ayx6E7O+h7uUp4NDeCFkiN4b7-w@mail.gmail.com/

> > The ultimate goal is to remove the embedded libpython and libperl support from
> > perf entirely, expanding the existing perf Python module to provide full access
> > to perf data files and events, allowing scripts to be run as standalone Python
> > applications.
 
> I tried applying it now and got this:
 
> Cover: ./v9_20260522_irogers_perf_python_modernize_and_extend_python_api_phase_1.cover
>  Link: https://lore.kernel.org/r/20260522220435.2378363-1-irogers@google.com
>  Base: not specified
>        git am ./v9_20260522_irogers_perf_python_modernize_and_extend_python_api_phase_1.mbx
> ⬢ [acme@toolbx perf-tools-next2]$        git am ./v9_20260522_irogers_perf_python_modernize_and_extend_python_api_phase_1.mbx
> Applying: perf arch arm: Sort includes and add missed explicit dependencies
> Applying: perf arch x86: Sort includes and add missed explicit dependencies
> Applying: perf tests: Sort includes and add missed explicit dependencies
> Applying: perf script: Sort includes and add missed explicit dependencies
> Applying: perf util: Sort includes and add missed explicit dependencies
> error: patch failed: tools/perf/util/evsel.c:11
> error: tools/perf/util/evsel.c: patch does not apply
> Patch failed at 0005 perf util: Sort includes and add missed explicit dependencies
> hint: Use 'git am --show-current-patch=diff' to see the failed patch
> hint: When you have resolved this problem, run "git am --continue".
> hint: If you prefer to skip this patch, run "git am --skip" instead.
> hint: To restore the original branch and stop patching, run "git am --abort".
> hint: Disable this message with "git config set advice.mergeConflict false"
> ⬢ [acme@toolbx perf-tools-next2]$ git am --abort
> ⬢ [acme@toolbx perf-tools-next2]$ git diff
> ⬢ [acme@toolbx perf-tools-next2]$
 
> I agree with the intent and plan on reviewing and testing it.

What I have now is at tmp.perf-tools-next if you wish to rebase from
there,

Regards,

- Arnaldo

