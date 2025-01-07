Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5CEE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 15:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YnuDZR6kb6Vo6DMVx/NjTYtYPWXwF+qLOBfi29+1rzk=; b=Jp5m8mI+Ky0VyYS0gCa0pvKcSj
	6gStnYkgpOi+0rtp6cpik8VjdA/r1Jx/msl5WpBR921mF4IsFFO63ynE1G6cMXobHWMQY3glL9ygo
	ijEUS/1pmmzCAuajBIlpRhoDaiaNVmjfSPA6aevg/S6UsyfXfSlH8Yvzdn2iYY1sfh87z07Cimnh2
	r8XMGS9x1rDcg3lTXE50qLKHHnNJLsShjS5+AS549Tt75+Duf1wU3+FE/6stxGaFkiU1TyHX5JaL6
	G4Veu8Nu7jLcs6uPx0SQ7U0BDbOn4bephfP36p05tpVxui3hm3PXndEvHNtLXhA9tXsrWyzqgofaG
	5zIlCFmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVBhF-00000005TZK-04x0;
	Tue, 07 Jan 2025 15:40:45 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVBfz-00000005TJY-1Kz8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 15:39:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AC5EEA41837;
	Tue,  7 Jan 2025 15:37:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B10E2C4CED6;
	Tue,  7 Jan 2025 15:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736264366;
	bh=oD8IZZwblmQdes/eUweJjCun95li3dhJu+Tixr8By8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qvcWubaS3/P9y4urANkoZVtMDfSIRtNxM86ZjQW81wGXVyxkDitHE4ipa0sS//RXS
	 mfFdJEPfMslBdRELTXEHTcXt6tnmlLNmIiNu+BxQJXdjWBsvElmQ5m0yqNcOWQog+F
	 LmuyODBWk/DXiq1DsEWApRiqbtrHo0qHWPMZgx5dMrQfJMb3AqhewA1SSsUKaiFq0C
	 qOW3Ax73VQYIpgm7lCKiVH4HowMczROQYoy6YnNUTWJhUQZCAe6h+uFcHBOO+/IBsN
	 NOSWHSyLfUFP96hHNybbA1ixMhQZ/4OmilRubx6cO1eW5izbr2WCHFEwhCaSuDDP8c
	 L4JPYDrmq93Ow==
Date: Tue, 7 Jan 2025 15:39:20 +0000
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
Subject: Re: [PATCH v4 5/9] arm64/sysreg: Update ID_AA64SMFR0_EL1 to DDI0601
 2024-09
Message-ID: <20250107153919.GA7728@willie-the-truck>
References: <20241211-arm64-2024-dpisa-v4-0-0fd403876df2@kernel.org>
 <20241211-arm64-2024-dpisa-v4-5-0fd403876df2@kernel.org>
 <20250107151323.GA7368@willie-the-truck>
 <9e93418d-ef66-42bb-b276-9f92da2596fa@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e93418d-ef66-42bb-b276-9f92da2596fa@sirena.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_073927_427947_686E6DEB 
X-CRM114-Status: GOOD (  15.60  )
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

On Tue, Jan 07, 2025 at 03:26:34PM +0000, Mark Brown wrote:
> On Tue, Jan 07, 2025 at 03:13:24PM +0000, Will Deacon wrote:
> > On Wed, Dec 11, 2024 at 01:02:50AM +0000, Mark Brown wrote:
> 
> > > -Res0	27:0
> > > +UnsignedEnum	27	SF8MM8
> > > +	0b0	NI
> > > +	0b1	IMP
> > > +EndEnum
> > > +UnsignedEnum	26	SF8MM4
> > > +	0b0	NI
> > > +	0b1	IMP
> > > +EndEnum
> 
> > afaict, bits 27 and 26 are still RES0 in all the documentation I can
> > find...
> 
> They're in the 2024-09 XML release here:
> 
>    https://developer.arm.com/documentation/ddi0601/2024-09/AArch64-Registers/ID-AA64SMFR0-EL1--SME-Feature-ID-Register-0?lang=en
> 
> which was current at the time the series was sent but I see that they've
> been removed in the 2024-12 release which came out later, right at the
> end of last year:
> 
>    https://developer.arm.com/documentation/ddi0601/2024-12/AArch64-Registers/ID-AA64SMFR0-EL1--SME-Feature-ID-Register-0?lang=en
> 
> so we should just remove these.  I'll respin (or should I do it
> incrementally to save on re-review of the rest of it?).

Gimme a sec as I'm the process of applying the other sysregs bits (which
looked fine).

Will

