Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E73D43349
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 11:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EGWEtzyJ3mpnGrJvn7StfDxulLgKk/n+RAvps6Y02c0=; b=wvVCCVGS81Q8aFlXgNe+p71Y8M
	61wK5aBmqTXSGO/KGFsZR4blhzjH1P0kut3PRVC4UdXk4yU07aWN7yhdQKAWB5PI/VU1JMibPG7NB
	gAqdXvQCrhb8W8RVS0YP+CFer4cEVo6lt7WZqjo4AdD7mDOfn3rPcrHI4jEsLJQRS1m0dY3SDwj4f
	+Bxf7KVLdJuRQ/V3fc7HyqiYPrxZjI4lpYE+++CLr14sv9nDFMstPCEwDdMTx4kEl/Il6i1YOb8PP
	OzhOLg/Mt4m8CT1u6qJbiCGL+eVnZ/QZxyiGR3paKR98+6xr9N0tTZXR0t99KUfZboAiDSSX08Cxt
	oE8VaqDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t90iU-00000006jkS-2rT5;
	Thu, 07 Nov 2024 11:30:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t90ff-00000006i4c-2lj1
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 07 Nov 2024 11:27:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EGWEtzyJ3mpnGrJvn7StfDxulLgKk/n+RAvps6Y02c0=; b=Ud58hkpx3bUYZF6iGivmGDGgHz
	BIHuSSrPzxap7b1ylEEEuFan7K5mwsCgb57r8yMF2P1aAQTBSEYl6ubqOcA8f4f8sLxu9/dyDT0kl
	FsH3SAQJK8QQh8bERtp/7dSk5T9P+DkbmG4gSPSN/51S96BdK0LgmSVCNG/H/5odm/RSqRSZvIOSj
	BXnj3u10dHCI2PJy2Tby6FGpDOExi7mIkzpZWm+iU+gjN0mYRFZbSaRrBmaPh2uMdnopyod9GL2sP
	TL1rjHwpz34YJmJ2sEUwTQ9pQLDMs1UXC9/Jfs8u5lKcmqsqNI5FNOM/8rhFZVVmoncU2KTsazIKx
	Zeb8w1ow==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t90fc-0000000C7iq-31lv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 11:27:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5AA95A43BB6;
	Thu,  7 Nov 2024 11:25:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2D3BC4CED0;
	Thu,  7 Nov 2024 11:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730978840;
	bh=7gqbQk8bplGmcvfUPSUYFL1na1ktG3G6Z6rLbPzXwNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UAau52Nwe+uRAGcTn3tag5sZ2IjE2Y+7UqVk5YyUwm2HNDwzSKSk/xybWw6oJs1xH
	 aw6tom+24uo5mAYQR5DzWVwT2yW34ukMfw+9AHsd7P2SLJTQAZSYi9tAAit/WRZGxa
	 QmzVc4YoqXwop7JFKLxOht5phOc/6HTbt1uqpCR90f+huMY/5DXKA9mgk6zHUcuK6S
	 VEVz9HkKvEsADS/IQb1wRyV1rcj/Zm9/g6PlsD3SyjwlbH8DY8Xwhe8rksxoG65u9E
	 CHsWN3QDdzsjCbbirD9NkeAngtYhhQuh+bBBSwr2WLO75iChdkRMddYYodWx5tzFED
	 BR8m340iXt1qA==
Date: Thu, 7 Nov 2024 11:27:11 +0000
From: Will Deacon <will@kernel.org>
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>,
	Sean Christopherson <seanjc@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v6 1/5] arm: perf: Drop unused functions
Message-ID: <20241107112710.GC15424@willie-the-truck>
References: <20241105195603.2317483-1-coltonlewis@google.com>
 <20241105195603.2317483-2-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105195603.2317483-2-coltonlewis@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_112724_960827_A9DE0816 
X-CRM114-Status: GOOD (  11.48  )
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

On Tue, Nov 05, 2024 at 07:55:58PM +0000, Colton Lewis wrote:
> For arm's implementation, perf_instruction_pointer() and
> perf_misc_flags() are equivalent to the generic versions in
> include/linux/perf_event.h so arch/arm doesn't need to provide its
> own versions. Drop them here.
> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>
> Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
> ---
>  arch/arm/include/asm/perf_event.h |  7 -------
>  arch/arm/kernel/perf_callchain.c  | 17 -----------------
>  2 files changed, 24 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will

