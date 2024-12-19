Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E821E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 17:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L3l7f5oRq2V0tTQzvXReorJwNICgy2ej2lpZWF49p+k=; b=obAOysvx9GkgUO525qht14kC3J
	3J2DSsxt8v+YLaw+tuJ7RU7A+Pa7JgmwBPMtu2F1F4wGlXHyuqHkOHIU6HTsJQppUGLkZ5L+u2iCT
	ZltpKplAeazLhHANASMQppNyxEQbI389GyEo4YkOUUsoNzllL+GuNFUVfmwKbJ95rrPEaJYf/y98q
	kkL5x16IfIqqtWtCMbg5ZAd7LrAHGXz7XIMQYEVGC527OsMtkAKIWAUXSeuXDtg2FetQqjNUkuuE+
	oeVqyGESCLVOSnrOOiWtA93846cJYDf8sTHW6ZrzQhbpJNzUZAqPM5xP7PHyYzceGLP+QXSneV5l4
	ZkcvEsZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOJuE-00000002So8-0TJL;
	Thu, 19 Dec 2024 17:01:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOJpp-00000002SJJ-1rv2
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 19 Dec 2024 16:57:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=L3l7f5oRq2V0tTQzvXReorJwNICgy2ej2lpZWF49p+k=; b=gIGnMUcX467jcnaHx+Gglt6jaU
	alwLxv7HILVHJkKT8U5lYpkj7O77EsnIjeV+LTLCGPAmOLiSxiBfYVJs76dP7Pp1y7aCpgWAGyzPX
	6dMAM74LthRjrnx1ZYK460LlFSzXzd+n8AJ05a901+P1jfD6nQn3o0OL9khCio20FTWTts8KoED04
	S2DBb5v7FOGUbVTbZ1ucupIhkUfeBWjpov52HPi8r0Z/iLwKeUeAusxk6x3wSOvV+/w1wwOgoOWuS
	hS9CsygQ7iPX+3gk3qVWANKnrT92CEnSK2VWNOuS3OwDozYxwcj2tp+NuigNT1g2DI6ZnmheL6qmd
	FhFJeERQ==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOJpm-00000005THN-24EA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 16:57:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 13A76A42747;
	Thu, 19 Dec 2024 16:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F38F5C4CED6;
	Thu, 19 Dec 2024 16:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734627426;
	bh=WwHpP68WsS0yrXAj1bsIoT9Q9TikJFuGrs1v0icekw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S9simPy5gm7FERVFtGSRbSFPrG9gxD1rQigXcOaP39LyDClM0qvcWifLvJM7SsPGf
	 rW399gxR+RuOwG+kDIlTPYw5Ia0CK/NK72MzjrcIG3X2fHjZNQaTelKDyoor/eapNQ
	 M2LNZ6pBcDzUDhEpDyPjlNrxxOvHvnItzMyBFF1Oqw58ybSznANlRSrj7wPw1nd49O
	 CU8BS5jtqMT3B0qn1tpooIz08+Gj40Tz7t5o7jFR3tZOEnj+xWalZD3MedPKsMq5am
	 8gufCvpAkyri/Uij8dTM/6YsB3rz3bxSMLBZ1NmAoy28Unij+VG/VyIbcw1GRX2WBt
	 7QBALVNVD6VYw==
Date: Thu, 19 Dec 2024 16:57:00 +0000
From: Will Deacon <will@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 2/9] arm64/sysreg: Update ID_AA64ISAR3_EL1 to DDI0601
 2024-09
Message-ID: <20241219165659.GI24724@willie-the-truck>
References: <20241203-arm64-2024-dpisa-v3-0-a6c78b1aa297@kernel.org>
 <20241203-arm64-2024-dpisa-v3-2-a6c78b1aa297@kernel.org>
 <20241210170953.GB16075@willie-the-truck>
 <b859bdcd-7343-4d53-9f3a-f374deca725a@sirena.org.uk>
 <20241211224015.GB17836@willie-the-truck>
 <248dea18-bfad-4ec9-9a7d-5c87c7f48c84@sirena.org.uk>
 <20241219155547.GC24724@willie-the-truck>
 <51632b4e-19a0-487f-878d-f03abeea2553@sirena.org.uk>
 <317e06e8-6e85-48cb-902b-4b3c7748bd8f@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <317e06e8-6e85-48cb-902b-4b3c7748bd8f@sirena.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_165710_672149_0DD5554C 
X-CRM114-Status: GOOD (  16.58  )
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

On Thu, Dec 19, 2024 at 04:49:05PM +0000, Mark Brown wrote:
> On Thu, Dec 19, 2024 at 04:39:11PM +0000, Mark Brown wrote:
> > On Thu, Dec 19, 2024 at 03:55:48PM +0000, Will Deacon wrote:
> > > On Thu, Dec 12, 2024 at 11:33:05AM +0000, Mark Brown wrote:
> 
> > > > That'd be useful, yes - unfortunately I think that's still something I
> > > > can't work on myself at the moment for the above mentioned non-technical
> > > > reasons.
> 
> > > Is anybody able to work on it? Without insight into the "non-technical
> > > reasons", I don't know what I'm supposed to do other than write the tool
> > > myself (which means finding some spare cycles...) or refusing to take
> > > wholesale sysreg definitions until it's been ironed out :/
> 
> > Similar issues will apply to anyone at Arm as things currently stand.
> 
> Oh, actually - shortly after I sent this mail I got a notification that
> there's now an "Open Source Machine Readable Data" package at:
> 
>   https://developer.arm.com/Architectures/A-Profile%20Architecture#Downloads
> 
> as part of the 2024-12 which should unblock this, just in time for
> Christmas.  There's just the small matter of free time to resolve!

<party.gif>

That's great! Hopefully we can knock up some basic linter tools in the
new year.

Thanks,

Will

