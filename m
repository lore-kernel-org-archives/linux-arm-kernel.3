Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC8E606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 11:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Zkdz+PJ1;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p8DC97hl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8/DEyBWZeNjbIYVLMYEXjqZxeouD7j/CxCTXFjXVFWE=; b=Zkdz+PJ1ViJBl4MSP1JTmJHKLN
	RldKC5Eut1lvwtrmyLCVsB92zw3ubqja0v9zecbqwgbG3hpLaTPctY4NOpO+3sGHvFMYBG3CAuwiw
	DE+/zzcCiJ0xInCqgBpcuXAEOB4DEdKRvLQsrqCTuroyM8J1zpnfMnbK3yTXRyQ4Y9wDKJgNSF2pe
	S9vbYi7Fy81iBBDg78cCNINO7G4E9h8zMOujKNu01Lb0joMOnV81zgWd+RV6Ty4BKCORq4g3mp7j9
	GlPDl0ajmScicfFCUuntKiZ4/PRBgkzMd6GY38CNn7o9AoRUcyuvIEq1p5QjAi+Ks/3iYKPMOaxeK
	sDh6hPXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN6z7-0000000DFSW-3HDd;
	Sat, 31 Oct 2026 11:10:53 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN6z5-0000000DFRj-0qzj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 11:10:52 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so17324385e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 04:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793445049; x=1794049849; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8/DEyBWZeNjbIYVLMYEXjqZxeouD7j/CxCTXFjXVFWE=;
        b=p8DC97hlDmkgEQx6/2JR94D/RBK5YfT+S/jlBGWt7sKX7UfbfsDkNF/b7OmFk44d9A
         4ubTygVX6lZXOzQxBpkK04pFdJK73tvZ0cdXAfLgmARS6Z/LnqaN+riUmohHoyDanC7e
         Jq3KNMLuWqnKSAFX2MsTc/ri9A0Kf3iX24ZkMKpbrtrpxfwb8YDqb95Oc8A3WK76iN12
         NQuLuj2YCgv/cZ/c6b/CHpTJZ68sHXH4yC123hQrsloAJCBIccvD+5YhkbZGXHNxEjbC
         gjRe0+o7xbcPc84wwTwh00t46JDYyeKK4RDnLy/kBmh8qybGSjRl7zq2MBDezhu8Xu+0
         cGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793445049; x=1794049849;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8/DEyBWZeNjbIYVLMYEXjqZxeouD7j/CxCTXFjXVFWE=;
        b=sExcbXEFZPQ9ORYzA/RL8A6yVRv2CqGRGsV3rGCAMCQ7EuqHz6stQ1updPeXc2fTjq
         n93SS8uMAsB8M83G/91T9BHiwRp0gXOfriGUXv+VRl7b7dx8mbbdHAzIJZYA9Fqk0kTa
         NH/IEF2PlZ1rAzYYAFjLfy8lvl6zwV03isHfXT3Q7RB0elYYbcnAnKbR2/3EuKSYf9Ym
         eUjqjTE9feEOEus45n51vHlUun6iJksvOS2pKC2UBpJcU9xb0Gw00bkk9BgxO8jaOqLy
         gRTO0BdTNyETeKI/Ct+yyHAq9nxpfWdrpoGuJZD+7W76EPGYEUVHHI6rpQ+yz1dN4rPT
         R4cg==
X-Forwarded-Encrypted: i=1; AKwUvByo/bqaC71iOUQtNsZmlVB+4fTMQ6dPdKwIU2YWOJtY3cXSQHHyog4fLjG/CV2pudoS8cCTA80gaXPqV6aQuYXK@lists.infradead.org
X-Gm-Message-State: AFq9FYLt6HKx759DbEdV0gp3eHrlelFVJ+RV4NNcBWq1n4gggObe/eF6
	m40ym7bSaIr5UMt8EV36XeuYZ5cToFeFe7P+wYRV6Q9vlndSk9KvqHUv
X-Gm-Gg: AYBFou09RGjR6H97Tw2UEm3fXQobfYxNEDlSTETDjNpDduLhqWPA5ILgeBxXGpslsyE
	UE/In7z1E2pl00nbTMuMf99UZnvsuCSoJTIaM9D+QJ0eEiOkD7vHMakiQaAybMbuW1b089qDe8U
	QLwTaLw9bVvnkdUb0LGq/OL4ZTMzXTOEyak+52aBQzOpRWOQ+6Cya4Dl0YN5T8fzLelgQmB/NoK
	fFycZkPnB/TErcZUVnNRZRK4rEDUhIGLkiTI/LG8qNELICc7W9jX+UG3JZWD8GeQ14PXND+PeUM
	x63ZoLdidOZ4x0koqphc8CdllGf+SD4OzImz0QA6/WIFE+z/gQZb40pJQjZM9Fp5ELhLi8B+wyK
	tbaaDwW0GKdI9WAIsbVSJ+CNJ6ZpeUfg8zPKIUEJUy0zaXHgv2t/ZPiXu4sj0MzksROb6jTQJZn
	m2f9PKjUKzIyYU75Ri79ZZpocftjxdjBfXdyDyc8u3BfBSOc9IO0dcbPCrwPgqdpRh6CJDc7Hww
	GTe9r8PtlmBrRuNuuaAAtZHS6kgpD916w7M/53EsKxnG1DPx/ZTZQyheLSjKUIjPIUB14iiCERQ
	2niZdNOBBgsOgP6sEySXoIJd6XHlqSr8nKscAHlZyMBSbcvNmpKqYuN3mz1Kgdvb7NePDsElR+r
	J3ckIR2cRDsj7StdF52tmLqJWJNsWUM3g1QzGjcJA9x56KmlFZHfO1LIvQ2PH6VTOblRtqHGUa4
	UhjUB1YxczJ/TWwyAT07x7bSHC2hV+
X-Received: by 2002:a05:600c:198c:b0:4a2:5ca:767f with SMTP id 5b1f17b1804b1-4ac151a9a36mr117500995e9.4.1793445048512;
        Sat, 31 Oct 2026 04:10:48 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a81d-e001-9c9b-db33-f166-0fda.310.pool.telefonica.de. [2a02:3100:a81d:e001:9c9b:db33:f166:fda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf67aa704sm117315545e9.8.2026.10.31.04.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 04:10:47 -0700 (PDT)
Date: Sat, 31 Oct 2026 12:10:45 +0100
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Gleixner <tglx@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ingo Molnar <mingo@redhat.com>, 
	Andy Lutomirski <luto@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Hongyan Xia <hongyan.xia@transsion.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-trace-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, linux-doc@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 03/13] sched: Split preempt-count bookkeeping from
 raw updates
Message-ID: <auXLfz6mFh_uOvRr@gmail.com>
References: <20261028033127.82193-1-kmehltretter@gmail.com>
 <20261028033127.82193-4-kmehltretter@gmail.com>
 <20261029093219.GH1779021@noisy.programming.kicks-ass.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029093219.GH1779021@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_041051_259011_44B28042 
X-CRM114-Status: GOOD (  16.52  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 10:32:19AM +0100, Peter Zijlstra wrote:
> Urgh, so much crazy.
> 
> So WARNs in noinstr code are 'fine'. That is, they should not happen, if
> they do, bad things have happened and we need the warning out ASAP, if
> it takes the machine down, too bad. See the
> instrumentation_{begin,end}() markers in x86 asm/bug.h.
> 
> But yes, the tracing needs to go. But moving that around should not be
> this ugly and also, that will give you the opportunity to fix
> preempt_{en,dis}able_notrace(), since they currently also skip the bound
> checks.

Yes, that's a good direction.

I checked the call chain and DEBUG_LOCKS_WARN_ON() is already fine in
noinstr. arm64 just needs __always_inline on preempt_count() and
should_resched() so Clang doesn't outline them.

I will work on that.

Thanks,
Karl

