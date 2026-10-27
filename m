Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E773A606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 06:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wEiHOEzy;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=Odr0VIDB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/4xZBRPqWoqmG3ZLUyWqQC80cb8SEBhLFlhSnr0xrG4=; b=wEiHOEzyCOKRD98d9bPhroOqlo
	U3GD7LtELOtTqDu628C80YaE4ZmKZcbd3TNZYuNXJy5DuHF1TlpwUT/D+OL+P6M9RWXX9qosLDSx+
	rKImIp0uFfQDYlpgEmQBYEnFZN692IWxfl2h12FRmrUjwlG70gKPBs8NCTrHoeoqBcM10HLV6LPQX
	lxQ0RLWWFpxeFzxTNSu1NgzB+30oxKCZt/Ul+NicdCcugO0oP/lUNGnHscnpnakeYdmNOsLU3t+7I
	ApF5RwCz+D4kUZ74mxSV/wNBQ8cSKZDv1RCw82k+kG2/e2v+rgx3dXuVCmA6fBDlkIMvd9GmnnSqp
	SdmVy1mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLanB-00000003qKZ-29PD;
	Tue, 27 Oct 2026 06:36:17 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLan8-00000003qIq-0v8h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 06:36:15 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso1971557a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 23:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793082973; x=1793687773; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/4xZBRPqWoqmG3ZLUyWqQC80cb8SEBhLFlhSnr0xrG4=;
        b=Odr0VIDBDDF5haK485dSktldqca2oXKasd/KUMLwZpq33oW3jwMnF5zDhJExes4xda
         ByvFyOPQRc1zwNiV5cCHUqmogZeBGolSM/qSfHF792zzdk1uIP8PFO7sXyik2L2aezzc
         bpDVv00AP+cPjcFHjyFlZscGpORTPicYI7h8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793082973; x=1793687773;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/4xZBRPqWoqmG3ZLUyWqQC80cb8SEBhLFlhSnr0xrG4=;
        b=cfdNrcVXjedsA2mPaB1KBWCvjWwhdnmI7SUAbt7nHIRs4talbQ7GRZGA4K8+Uzqv8W
         DHEVxIox+zWooZAUEOx4VGSlI3NnQvYAM2OBIdm/x7H9e2lr4QY6O2xmGofR76j3nNHm
         9+fnJtorlP4aXqccYurKQD8DyFmYsX8BEoDc/uUG9JYwWSmLCyikdd/mK7x/mLUbzCf+
         CAULtcrC4TWHSBe3HbHo1oAZU9ACQpYYpVOK8YFZbY/DHx5DP3trABqXvWKJEM5EM4p+
         lTUJop/bpbCC9Oh35QupFMKBpM9V/JqTvNVjU2HFMv1xcEwBB49rxItbaHzxGcRMaO2Q
         LLBA==
X-Forwarded-Encrypted: i=1; AKwUvBxlyfDlKH6LSEE0/ZWN58or2EvoMHdP+tUYLfI2P3Iuz/3LVgHx3G2ENUMku5hurisPyRNboTAlbGUakZeyGSqe@lists.infradead.org
X-Gm-Message-State: AFq9FYIQcDO8f7EoJBfKDngSpeTslfxYWIkwcmeDje3L/gz8Gtew/4/5
	vWjdrslXDNr/DAPd4vdvxtZryOPah+Xv0WN23IGNG36Ku2bKq6ECRJR0rAl9w/KyxIk=
X-Gm-Gg: AYBFou1CMfVnZ0AUpuoUg7lnJATEpmLf1pq/Aoz+bRuvHUoVlhsw8VcvD+Di6/sczzx
	FPh8k9ItiCz/1lFuKZVIGxFgew26zR4lpAQbyA2yo1dBz6/Z+IqejMoOpNwtGOt5PoRJLCIVy8b
	V73qsEg0p5bK9Hbv8sYQ890A5ccKyXEf0KTzYi2SsTAPG1J2BYKd3e5x4UwNUt3fThS6CynEFXm
	FH2YbrhWT8jmdGCYCEYVrmFqAcxA1UTrLJdnAxSbt2Y1pBd0OdA39Y0/cxw6uGIgT8HGuEMmgyR
	qYUsiT/WDexvjcO6SkHIp7AemlUQ6YcLtZgpaaJtkdy5ci5L/4W3oYMBr2A7rpbpXBuw0c/yLn/
	nA9v3rwsjhonRxRzO0GD9z6owXd/uuse8Al3VzUWff45erYQN+hlsX+wBlAe4UJTUPifkcOh0iN
	vD82S+SnEte+82bej84+rkl1Fu18nbIGGdkbn6FfYnf3gj2aASQZl/5M/gDkbt68rZTwXwG4A2S
	MsaoY2LpMVBKtRLVhCHqlF6k7kxOwDD6PAN/b1+7diPvZWq0Bimhiel0nIkV/+BPOu8Ui3kBBF8
	FQnxK0/b3c8nk3k7w35ZQNI2YPu13t/N+TYbz5jm7q5ujuo3uGAczNvVNaL+FWj9LOUkkLDJHVa
	GrSJPRzIIk5UR9u594/QJY0A=
X-Received: by 2002:a17:90b:1c0b:b0:3ac:9e5e:d19c with SMTP id 98e67ed59e1d1-3adea8990f5mr7512458a91.17.1793082972994;
        Mon, 26 Oct 2026 23:36:12 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40614daasm2254704a91.4.2026.10.26.23.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 23:36:12 -0700 (PDT)
Date: Tue, 27 Oct 2026 14:36:09 +0800
From: Chris Down <chris@chrisdown.name>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Kees Cook <kees@kernel.org>
Cc: Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH 1/3] sched/core: Skip the shadow stack end check when SCS is
 disabled
Message-ID: <0e607d3aa7c2c4cc1b5b8ba7b0e25ebdb55726af.1793082868.git.chris@chrisdown.name>
References: <cover.1793082868.git.chris@chrisdown.name>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1793082868.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_233614_279232_27A40D41 
X-CRM114-Status: GOOD (  17.32  )
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
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With CONFIG_DYNAMIC_SCS, shadow call stacks are only used when the boot
CPU lacks pointer authentication. scs_release() already checks
scs_is_enabled() before it looks at the shadow stack since commit
9beccca09840 ("scs: add support for dynamic shadow call stacks"), but
schedule_debug() does not.

With CONFIG_SCHED_STACK_END_CHECK=y it therefore checks init_task's
unused shadow stack on every context switch. That is harmless right now,
but the check is redundant and costs a load from an unrelated cache line
in __schedule().

So, let's guard on scs_is_enabled(). It is a static branch, and it folds
to true when CONFIG_DYNAMIC_SCS is not set.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 kernel/sched/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index d7c3b43158de..fc269fd10192 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6152,7 +6152,7 @@ static inline void schedule_debug(struct task_struct *prev, bool preempt)
 	if (task_stack_end_corrupted(prev))
 		panic("corrupted stack end detected inside scheduler\n");
 
-	if (task_scs_end_corrupted(prev))
+	if (scs_is_enabled() && task_scs_end_corrupted(prev))
 		panic("corrupted shadow stack detected inside scheduler\n");
 #endif
 
-- 
2.54.0


