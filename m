Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC97BC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 13:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ey4/7w/CXrclzX5N7qtLTv+YmSU6I197cuenBfkjNRk=; b=ifWbnlnUCARvE8T3GgsXvC5GD/
	oLeek2iHjBN0nUJmsmAsNgXlr6jSnF3iujzWHiv4cGCrGZdHNwFlwy3cLqJsmVbvwIkyXEnkbf6xT
	/uRrbmvAW2yfmnAp4MEmymBR5N3XSgIOSlFp5spIln1Rx2wknmjPecndIxDj2HxU54X1K3dUHcyyW
	cpzUb7mBert2Z4rC+RHHdLkRSqVW8EifeBsNbqZ/KQ0vsPoWB4X3E27H6LB07B1S6Z2O2u9F0vB3h
	iXy7aNnSSeafHe/QQH25+mdOC9Y0UG9BU+3oXc6+6S+ycOrmYfPEbSpWy2Zm/tU8eZL7Ev2UQWXhY
	nBqhV6NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtmNS-0000000E5Uk-1gEx;
	Tue, 11 Aug 2026 13:18:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtmNR-0000000E5UT-0sQc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 13:18:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3E14343BAA;
	Tue, 11 Aug 2026 13:18:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 590951F00A3A;
	Tue, 11 Aug 2026 13:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786454324;
	bh=ey4/7w/CXrclzX5N7qtLTv+YmSU6I197cuenBfkjNRk=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=PuL5Cu/oHchkszGOdKRg89L8mczLMKys8EIPe04jpPSFWvhLbCWYom2IW4zofnBTF
	 Ub7f90c6nGKTponVqXcAX5vCdoYTo9UgF6/OZCufK3lVXYwEBr51OURZCSIoqLUav4
	 sjT/L2RX/NqpNj4OAzRKt33g/Lz66Ji4PIsIObOovPBucDnqxPhKC1aYuOxFCAusTF
	 uzA+wZFwcdBcm/mYQ5por90gSaaHOIBI1jRCx2x8hpo3xSKrNODGXOYNyW5ucYn4YE
	 wd3E0uyQt7YKfbToA9XNY9KQeTBAw2dYjpokIBfpgUDopMeU8o6PbV8tQznAhjNKb2
	 CUY4sX59Y1u9g==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id CD2B91980043;
	Tue, 11 Aug 2026 09:18:41 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Tue, 11 Aug 2026 09:18:41 -0400
X-ME-Sender: <xms:LyF7atwpahL9Gmj2_Vlu-k5AOey6PcwirGlQXbF7UCuFWcIa3mPWZQ>
    <xme:LyF7aoFOLnOj1PoJIeV_ixcRpvesky98QPMuHMXhslvWpI_xMHwFAvtUgLv2-3-a4
    gS1osHe0z_rSaxspWLpMpUIbB9-xKkBU29sEVlvukNNr-gevThD-vf5>
X-ME-Proxy-Cause: dmFkZTFCfnFU7vc46UZ4sGs86bvsDr3lsu8eIEFL3zQ/h/s+zge6xPi+6AMDWGR6mmZA29
    EL10sdCzyeDpJjZklXJAqbLV72ez+UPzf9eo5A7dWYhQQmxuE9yTGvFsFKYtw3UJtFOhbL
    RLyPraoiiuVgPwb3iCKV/u22v0Bd8jz1G1YY/OBUM105MFQLTmalKcBc66/oizA0rliCzr
    3tR2bppAuZANfvbt6Te36/jIfP6ChfuLPITNOouPwph+pEktuuz4OYF0FobTGqL5AL4LLt
    y1/gXUSKhDlUf3zZTRWDe6Oynoy2HZC8ksHt9UNvVLuffDHaa4hOJHRj+aCDIR0iwIGzJG
    Q3tNNjl4Zi/Ch0/13qsJdMhVbSHPwymhBhkvUQkI3p65z7SfLyR703F8g3bOg1McIvPK7t
    QkGo7I2dE0gLSbQNxad/qcs77unDdt3fbkg72ltrci532ODH80JoVHGgRJ6p95HoguYzdD
    2FTd6CLigCQNKDbYsK0HmZHM/W/nZqOFGSipouwhyjKbpW3FBK7nK84K21Z4om2/DheTEe
    nYBuZih0NE48CmywjtwuNVvDliyfv4/Q9/LfPRwMoTf6RSFDKZ280SoR3lpS7ww1KRo/Lr
    VzWdYGUZhphVqxdy74RPf09SufZV8OxjlgV6dKRdLlAX2PG047rvniH8aiKw
X-ME-Proxy: <xmx:MSF7aoBdpEDgy3xmBnWiwNqNrZRAHVa0ldtlnHI5brwXpvIAz79Ggw>
    <xmx:MSF7am5P3aQRqfsmdap4G5BVIW51e5uVV_62nfKIFPNh2V0q3qLqJQ>
    <xmx:MSF7agA3u-eXSBLM3TbbO4mUKImqpGxJ4jhGYLanJHCnSdG4gTmyxg>
    <xmx:MSF7as5_VRmo7RD49O8flXjQlQH_7VEq25PLmQThbS9P4lwVNpSysw>
    <xmx:MSF7apse6bx1G6AGg7eBLfp3AuDQ2HR8k-G0wRCHAnIZmzo9xzyOr68m>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 28F19F8006A; Tue, 11 Aug 2026 09:18:39 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 11 Aug 2026 15:18:17 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Will Deacon" <will@kernel.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>
Cc: "Josh Poimboeuf" <jpoimboe@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, live-patching@vger.kernel.org,
 "Song Liu" <song@kernel.org>, "Miroslav Benes" <mbenes@suse.cz>,
 "Petr Mladek" <pmladek@suse.com>, "Joe Lawrence" <joe.lawrence@redhat.com>,
 "Mark Rutland" <mark.rutland@arm.com>, "Mark Brown" <broonie@kernel.org>,
 "Kees Cook" <kees@kernel.org>
Message-Id: <16e3ed42-1b1f-4ddc-9d8c-5e12ee7dbe3c@app.fastmail.com>
In-Reply-To: <4986ac98-d6da-474a-b218-b6468b68cb9f@app.fastmail.com>
References: <ed4fe1f95071897859ec7fbe9176246cbd4962bf.1786138806.git.jpoimboe@kernel.org>
 <anmobvJXiBQqWn6S@willie-the-truck>
 <e5q2mvqtf6iw4lco55uny5ffhppw6vlflxguhc4gg5nm3zdvmo@zs6rw7iov5qc>
 <08d6c5cd-9924-4359-9181-a03718161528@app.fastmail.com>
 <kp4rvh4vxo65gipgqz4i4dnw2ueylmus4yys6xfrbngp5nefzn@4a4ekjlzqlph>
 <CAKwvOdmSVjY0TmOTc6WMmDHcLbn=tOV3R3zH_TO4zXZiYEsaBw@mail.gmail.com>
 <anrvDIWMNGIa4WPK@willie-the-truck>
 <4986ac98-d6da-474a-b218-b6468b68cb9f@app.fastmail.com>
Subject: Re: [PATCH] arm64/module: Fix livepatch BTI exceptions with Clang 21+
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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


On Tue, 11 Aug 2026, at 14:02, Ard Biesheuvel wrote:
> On Tue, 11 Aug 2026, at 11:44, Will Deacon wrote:
>> On Mon, Aug 10, 2026 at 09:41:35AM -0700, Nick Desaulniers wrote:
>
>>> Sure, but let's replace this with a link to a bug report in llvm's
>>> issue tracker?
>>
>> Yes, please! I can apply the patch once we have the bug number.
>>
>
> I can look into that.

https://github.com/llvm/llvm-project/issues/215547

