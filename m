Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6830DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 13:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mlc0hY64KprUwSkJXUEicHTWOnkEtNJugkLOdrrZUCQ=; b=KINGvn3DN9s6+a45E1JtvooDEK
	jlDaoYqEPSzi/n/D8c+R8UbcOdQrCJPUuWvBPseOuAkSzfIrY8OFGD47PtEfuq1ZZWxjeliWgLEiX
	ldav3u5I7hP5dbniQuY7xeuyEDBqL/KARVrnSxLTEY+VOV++aWB1OqXFwiimf3/hJbW5zYytzmF2w
	KnWFYnaACxwiAsIH14iT0OzDf+gim6U7AKobnN3W0CGc9ZL2eI96gsVBzIiU3mv2k1MBn1ae4JS0N
	noS4R+yw4kgOA6Xqbh902F2rBboEzLupGhFzhytXrBoyEf4g1Z/jy8e8I40UzfT8ABYDv9+kNy36u
	QUlFyxZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdPn-0000000CDTh-0gNu;
	Tue, 14 Jul 2026 13:43:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdPj-0000000CDRw-3HlV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 13:43:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E0412F;
	Tue, 14 Jul 2026 06:43:04 -0700 (PDT)
Received: from localhost (a079125.arm.com [10.164.21.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2CFCC3F93E;
	Tue, 14 Jul 2026 06:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784036588; bh=XEGCQNz6DX9A+EjN/qbl6Yj1SrGTd3gPqQ0Y8PcOT4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WhqFm/n/5K02i+v6vOAuVrgmcsgHSQy3l9WkMK/HNMdTZFgjuafGCWt5eNi3m16hU
	 200Q3vUxqRdElXyOsQiwxtLFXbgofGRO/fgjs8kEK02OkqeI3V6xrAZddcP9Jp3UO5
	 nfER6AyYELi/rjZ/i0+m3PoIxHyYn3eDSMsj9lZ0=
Date: Tue, 14 Jul 2026 19:13:05 +0530
From: Linu Cherian <linu.cherian@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] arm64: cpufeature: Extend bbml2_noabort support
 list
Message-ID: <alY86WOa-O2aguT7@a079125.arm.com>
References: <20260708144331.679816-1-linu.cherian@arm.com>
 <20260708144331.679816-4-linu.cherian@arm.com>
 <eab6908e-d897-4fd0-9626-ef2e0b553cc2@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eab6908e-d897-4fd0-9626-ef2e0b553cc2@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_064311_866610_C3E773DB 
X-CRM114-Status: GOOD (  18.65  )
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

On Wed, Jul 08, 2026 at 03:53:59PM +0100, Suzuki K Poulose wrote:
> On 08/07/2026 15:43, Linu Cherian wrote:
> > Add below cpus to the midr list, which supports
> > BBML2_NOABORT.
> > 
> > Cortex A520(AE)
> > Cortex A715
> > Cortex A720(AE)
> > Cortex A725
> > Neoverse N3
> > C1-Nano
> > C1-Pro
> > C1-Ultra
> > C1-Premium
> > 
> > C1-Ultra and C1-Premium both suffer from erratum 3683289,
> > where Break-Before-Make must be followed to avoid a livelock.
> > For both CPUs, the erratum is fixed from r1p1.
> > Hence we do not enable BBML2_NOABORT for CPU revisions <= r1p0.
> 
> Please could you also update the list of errata here :
> 
> Documentation/arch/arm64/silicon-errata.rst

Ack.

> 
> > 
> > The relevant SDENs are:
> > * C1-Ultra: https://developer.arm.com/documentation/111077/9-00/
> > * C1-Premium: https://developer.arm.com/documentation/111078/9-00/
> > 
> > Signed-off-by: Linu Cherian <linu.cherian@arm.com>
> > ---
> >   arch/arm64/kernel/cpufeature.c | 9 +++++++++
> >   1 file changed, 9 insertions(+)
> > 
> > diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> > index 9a22df0c5120..adcabea80fcb 100644
> > --- a/arch/arm64/kernel/cpufeature.c
> > +++ b/arch/arm64/kernel/cpufeature.c
> > @@ -2152,6 +2152,15 @@ bool cpu_supports_bbml2_noabort(void)
> >   		MIDR_ALL_VERSIONS(MIDR_NVIDIA_OLYMPUS),
> >   		MIDR_ALL_VERSIONS(MIDR_AMPERE1),
> >   		MIDR_ALL_VERSIONS(MIDR_AMPERE1A),
> > +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A520AE),
> > +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A715),
> > +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A720AE),
> > +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A725),
> > +		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N3),
> > +		MIDR_ALL_VERSIONS(MIDR_C1_NANO),
> > +		MIDR_ALL_VERSIONS(MIDR_C1_PRO),
> 
> And mention it here, so that it is evident from the code alone ?
> 
Ack.

> > +		MIDR_REV_RANGE(MIDR_C1_ULTRA, 1, 1, 0xf),
> > +		MIDR_REV_RANGE(MIDR_C1_PREMIUM, 1, 1, 0xf),
> 
> 
> Suzuki
> 
> 
> >   		{}
> >   	};
> 

