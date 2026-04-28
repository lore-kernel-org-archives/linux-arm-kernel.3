Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0078FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 16:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1bsBBNqxiKFL3r8pzOvOev7yw0CjKM3t1BUQ0CdvGx0=; b=Pu0ylEmyX84EdjqGzPNCLeC1vG
	9kamMOS3P5Z4PqzrE2KwAsCgIUXe3ABtRvvvnJrbOSR90CiWAJ4tXu0McJVDsMYIUYdd029YnnbTa
	4D6sbjrcF2pmC5mK/mlpr/WPKE6jSvAN0Ectaj2ZUUU7TrQUw4VV/R8vre615/lZggbFif6E3PPD3
	YRRDBCXrHWsp9icGI1hOpzv09FHfaIH+5//BfPIKIX0XolwfNqNC3eHtWY+LSrGFFIXzcW48aXLy9
	9ZqiregGYMTjD0q7Hxocwm0BXWeknBRViQNZu9sVdF0TKAqVGGvI9ngGRmT65lPOLjjX16WnYZvc5
	YmbAJ6tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHlEM-00000001vUQ-40CC;
	Tue, 28 Apr 2026 16:24:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHlEK-00000001vU5-3NNq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 16:24:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A26042A67;
	Tue, 28 Apr 2026 16:24:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 470BDC2BCB7;
	Tue, 28 Apr 2026 16:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777393452;
	bh=1bsBBNqxiKFL3r8pzOvOev7yw0CjKM3t1BUQ0CdvGx0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=tDGDCMSc5frNPLYZ1u32bsd5FETEqhuxXGC8wu2FRMjopEjqhnJwfxDb3g94QfMwz
	 U4hzQPRUQ/um2cRzZ2URy3UVX/krs4hTUW/B3K6NuJcznEgiEHCCgCul3VQ/3s25Eq
	 oUwTfuAleMiZOmRmW5sYBEoNWc47t0BRVwpjohlPR6zHnpa2sH/3t6I7mYV53/IOiP
	 smCgkL7ziANseRsmthrorHxqOMwmfpAYStLZDDNVUtjUKsSVSZX+MACppps/JxfANS
	 WjqR/HuTo312R67GOueHyTwBQRQaTHhYq4wssY8K+S0ctiz+gNwwpmQ1KRkNfe6Bu7
	 0eydU9nWThUaw==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 420E4F4006B;
	Tue, 28 Apr 2026 12:24:10 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Tue, 28 Apr 2026 12:24:10 -0400
X-ME-Sender: <xms:Kd_waTM-YpeIRzy6D8hDAAt6tG8XpwJacDqOgicev-Z2qTgRv44aGA>
    <xme:Kd_waYwhSSVNBP78OasJTegpNlbyZaVG9bMbGJfUfL-mwJqvhkcePIwgGLvB3IgtX
    uWdXMW7Nn4z9cEV3njTHAWlN0IpeO2AKTZ9LhSGUtAuoElV8mPr_DM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekvddtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhguuceu
    ihgvshhhvghuvhgvlhdfuceorghruggssehkvghrnhgvlhdrohhrgheqnecuggftrfgrth
    htvghrnhepueetieduieegkeejvdehudeiheettefgtdeugffhjefghfeftdelhedvheff
    hfdvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrugdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeijedthedttdejledq
    feefvdduieegudehqdgrrhgusgeppehkvghrnhgvlhdrohhrghesfihorhhkohhfrghrug
    drtghomhdpnhgspghrtghpthhtohepudejpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegrnhhshhhumhgrnhdrkhhhrghnughurghlsegrrhhmrdgtohhmpdhrtghpthhtoh
    eptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopehkvghv
    ihhnrdgsrhhoughskhihsegrrhhmrdgtohhmpdhrtghpthhtohepmhgrrhhkrdhruhhtlh
    grnhgusegrrhhmrdgtohhmpdhrtghpthhtoheprhihrghnrdhrohgsvghrthhssegrrhhm
    rdgtohhmpdhrtghpthhtoheprghruggsodhgihhtsehgohhoghhlvgdrtghomhdprhgtph
    htthhopehlihiiphhruhgtkhgrsehgohhoghhlvgdrtghomhdprhgtphhtthhopehsvght
    hhhjvghnkhhinhhssehgohhoghhlvgdrtghomhdprhgtphhtthhopegurghvihgusehkvg
    hrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:Kt_waetmYIlefUPzV8DLJtcXoLyndaR0qgHSXePM5t-l1I6k7WeH_Q>
    <xmx:Kt_wafy9qHJBlVvot4VmPvKrB1oLabolvskFZjhEuHfBCd8ye4MdnQ>
    <xmx:Kt_wabbuztJ0Wj6nXCkW5OdQ5qtgvzpA30rGIbmCNeR4Z5FwwmerCw>
    <xmx:Kt_waWXmn9nmIyXPgk4Tmqxgiwfc-GzV_MBAadTlVGA9CktWULE_Vw>
    <xmx:Kt_waUFzERDSXIWNL7VNTwX1AjlL5laOfDG61W-HqteEpSf5IwAdRQtM>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E4EF9700065; Tue, 28 Apr 2026 12:24:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 28 Apr 2026 18:23:48 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Kevin Brodsky" <kevin.brodsky@arm.com>,
 "Ard Biesheuvel" <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, "Will Deacon" <will@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Mark Rutland" <mark.rutland@arm.com>, "Ryan Roberts" <ryan.roberts@arm.com>,
 "Anshuman Khandual" <anshuman.khandual@arm.com>,
 "Liz Prucka" <lizprucka@google.com>, "Seth Jenkins" <sethjenkins@google.com>,
 "Kees Cook" <kees@kernel.org>, "Mike Rapoport" <rppt@kernel.org>,
 "David Hildenbrand" <david@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-hardening@vger.kernel.org
Message-Id: <6f514d91-c8ce-473f-8383-f3b9a4cc2f7a@app.fastmail.com>
In-Reply-To: <82091dd4-9d11-4054-89ec-99aadaeec7b2@arm.com>
References: <20260427153416.2103979-17-ardb+git@google.com>
 <20260427153416.2103979-18-ardb+git@google.com>
 <82091dd4-9d11-4054-89ec-99aadaeec7b2@arm.com>
Subject: Re: [PATCH v4 01/15] arm64: mm: Map the linear alias of text/rodata as tagged
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_092412_900911_35741DF4 
X-CRM114-Status: GOOD (  11.13  )
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

Hi Kevin,

On Tue, 28 Apr 2026, at 16:16, Kevin Brodsky wrote:
> On 27/04/2026 17:34, Ard Biesheuvel wrote:
>> From: Ard Biesheuvel <ardb@kernel.org>
>>
>> Before moving the empty_zero_page into the __ro_after_init section, m=
ake
>> sure it has the memory-tagged type. This is needed to ensure that
>> cpu_enable_mte() will be able to initialize the tags correctly.
>
> mark_linear_text_alias_ro() is called after all features have been
> detected and enabled, so do we actually need this?
>
> AFAICT the lines that matter for cpu_enable_mte() are those, in map_me=
m():
>
> =C2=A0 =C2=A0 __map_memblock(pgdp, kernel_start, kernel_end,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PAGE_KERNEL, NO=
_CONT_MAPPINGS);
>
> It is probably this call that needs to be changed to use
> pgprot_tagged(PAGE_KERNEL).
>

I see. I guess we should probably update both, no?

