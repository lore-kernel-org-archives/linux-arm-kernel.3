Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91317C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 00:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OLzig2qiNR2jhkyqAnMUWUMLsoL1y25Rwtu/Ci6IzXQ=; b=4zg0pvAdR0hZ2u0fIdSsppMDMh
	wq6++ancRTC2Ucqhxrq1uppfdsBqBDY1Gt7S+KUalnAnJ13ljsjkB1e1a/qoshDxpjJ/CmbSfxVjl
	GcJseBUsvSkhRePARxSV/6Xxq1KMlCls5s78Q2qlHD5xWxjfV0cCCAXkRom/EirX2HJ3XSQh1VTpr
	YfIjdKkiCUZxyxryciG6wucpCXK3BIA2fUQ2yumj/lTOn+RC0vCmIoCkQiHHWpW27Jwh48FTFhPzK
	BPdgzrHWwIrwPpXLk84KPlfknhaWlz3XktwfVYav9tFS1h5A+UX4X/yhPJDOkqbDGOenzZTvQlbF8
	1z9a/LXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZf2A-0000000AJPR-3DUK;
	Thu, 10 Jul 2025 00:21:06 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZezm-0000000AJ9R-3Z5w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 00:18:40 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-748efefedb5so361287b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 17:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752106717; x=1752711517; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OLzig2qiNR2jhkyqAnMUWUMLsoL1y25Rwtu/Ci6IzXQ=;
        b=yz/ahq3HwNcBRsTuRAaJaKVC4d5FgviGwmk52eAxurDJKlah4u19hcTy8LvAGNQkqh
         elZFe7oi837JWJH7XwY96i3/Rp9wBfXszs6KkwKWxMjJ5kj/F8GgkR0f9koU9oNFEII8
         u0pgyqAQE38RlLqBOf+bORxqXnDsCViUryiYLHnskpUit1cAdMKm4DX98Ku36mMRNVyM
         KqcniCDs2mxon9S0btHghlMm3ZpAXtQ4wPmp9ID36/v+HK2iWskQWsDh7YNUmME9E4Tt
         82ZPlHeCCNlonyzly3GxyecFnD3tHtd4wSRjSJkj4frouDLfVrIQP41EiDLOoEtKCIBV
         muEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752106717; x=1752711517;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OLzig2qiNR2jhkyqAnMUWUMLsoL1y25Rwtu/Ci6IzXQ=;
        b=jk6lgiSXFtTCMtT8ai85NHdHtcXou1usGlgtmWoMFvsogpX4U38bqnRVxdj4adkTc5
         58Jl5dNI9tQ5jswhacuXVw4cSShbIT6trqWR9TZojxcXI97LwtvT3+a9wH+betOa9lpt
         yqGciyNeLokTB4kjKIbd/MeKLmqXsr4uo+cCNobXI3orQDFJ5AwTp8/TsNjg3Djl5WpK
         quaglu83Wn1C98+UXXiHSFEWjcWXmAoU8qMWNN7t0o34f4rOPuKWnxBZCLvRWblcg1/F
         KA1E+Om8jPe9c/O912hSVhy9PfHgeBGjJouv2diUpaGO8wl/OnELKIBE6mfyofxw8fSL
         tEUA==
X-Forwarded-Encrypted: i=1; AJvYcCVXR1QqTzkj3bDHBmBTXClfR/atKnmScnMmOdX11Q03HzPtAyUl2dgb8m5WRpG0EYTVeB41+33JgIYyw9icp34v@lists.infradead.org
X-Gm-Message-State: AOJu0YzA9K+FjffkThCWPE/r7x92ZKnZjdkojSS4vrUwxn7QQFX/Gi92
	QeUhke88XSjAwgclKZxnV8MV/ppSG4tTQJ6U/TLLuvD54bFnf6P1imHKWrvATmcdr25MsFxDq/e
	ECANF8w==
X-Google-Smtp-Source: AGHT+IGmcLB52wz+0J/dhZKKbkmNXvfa8dV1v82Mgkyx1EZoNNqGtWbyrclr+1fJ90IPY76axoD2ssci7/I=
X-Received: from pfme10.prod.google.com ([2002:aa7:98ca:0:b0:748:55b9:ffbe])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1795:b0:742:3fb4:f992
 with SMTP id d2e1a72fcca58-74ea64572dcmr6278110b3a.10.1752106717633; Wed, 09
 Jul 2025 17:18:37 -0700 (PDT)
Date: Wed, 9 Jul 2025 17:18:36 -0700
In-Reply-To: <aG71_sKK3jzIs0vt@linux.dev>
Mime-Version: 1.0
References: <20250606235619.1841595-1-vipinsh@google.com> <20250606235619.1841595-12-vipinsh@google.com>
 <aG71_sKK3jzIs0vt@linux.dev>
Message-ID: <aG8G3GNi_PlqgvnB@google.com>
Subject: Re: [PATCH v2 11/15] KVM: selftests: Auto generate default tests for
 KVM Selftests Runner
From: Sean Christopherson <seanjc@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Vipin Sharma <vipinsh@google.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	pbonzini@redhat.com, anup@brainfault.org, borntraeger@linux.ibm.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, maz@kernel.org, 
	dmatlack@google.com
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_171838_912527_E30DA146 
X-CRM114-Status: GOOD (  26.08  )
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

On Wed, Jul 09, 2025, Oliver Upton wrote:
> On Fri, Jun 06, 2025 at 04:56:15PM -0700, Vipin Sharma wrote:
> > Add logic in Makefile.kvm to auto generate default test files for KVM
> > Selftests Runner. Preserve the hierarchy of test executables for
> > autogenerated files.
> > 
> > Autogeneration of default test files guards against missing these files
> > for new tests cases or rename of existing ones. These autogenerated
> > files will be checked in so that during git-diff one can easily identify
> > if the existing test files for the same test binary also needs an
> > update. It also add new tests automatically in the default coverage.
> 
> I'm not sure I'm sold on the merits of committing these to the tree. My
> preference would be to prioritize signal to noise and just commit the
> 'interesting' test configurations and generate the defaults from
> $(TEST_PROGS) somewhere they're gitignored.

Yeah, I don't love it either, even though I suggested it.

> There's no amount of foolproofing that'll prevent folks from renaming a
> test name w/o updating the 'interesting' test configurations that depend
> upon it. Seriously -- I'm sure I'll manage to break it at least once :)

I was more worried about clobbering someone's (poorly named) default.test, e.g.
if the user modifies or creates their own default.test and the building selftests
overwrites their file.

The main reason I pushed for committing the default testcases is to avoid having
to figure out when and where to generate the testcases.  I don't like the idea
of generating testcase on *every* build; it's not slow, but ugh it seem beyond
wasteful, and it feels weird to dump files into the output directory that the
user might not want.

The obvious alternative would be to add a dedicated make command.  The more I
think about it, the more I think that's probably the way to go.  We already have
to `make headers_install`, so having to do `make testcases_install` or whatever
doesn't seem too onerous.  The biggest conundrum is probably what to put in a
.gitignore for folks that do in-tree builds.  I guess maybe we could add
default.test to the .gitignore?  That'd "document" that that name is reserved,
i.e. would help prevent people from trying to create their own default.test
files.

And since the runner supports listing multiple testcase directories, it'd be
quite easy to "install" the defaults to a dedicated directory while also pulling
testcases that are commited to the repo.

> On top of that, there's a lot of selftests that take no arguments. Not
> sure what we gain having a duplicated definition for these ones outside
> of $(TEST_PROGS).

The defaults are purely a way to communicate the existence of the tests to the
runner.  My hacky bash scripts for running selftests copies all binaries into a
directly and then runs everything in the "output" directory, but that has obvious
flaws :-)

