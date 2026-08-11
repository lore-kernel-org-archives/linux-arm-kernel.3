Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E86E2C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 16:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K74qCRzxn651l3XaxagRai5qzbIH3fM2gu1tb8jTrx0=; b=iL6Bhk2JIUlxvaHifQlJOgeiRD
	KP50FQ7ZmXHMJ0WU4fV9X3i8uIJ4SP1jwfMGnMNySwy9ckVrEL7NzNPEIwwQcoZczw9o0iBQZl7dO
	qQzm/L/epdnnk7jCNpb4ziyGa6dmQLS+Zy3/vr1VfVf4YbKIuM7PBsFljGcyvq6/PDZ/VLydwJuW7
	szX2rZXroG1DH0WLcplUBFpExnrNU3GFA4HayRsiRNh9M61905XFOuF7TErDZIQNtQwZopL/Cbr4Y
	yDjaguihZpV1yLZQp63vDq02VchoC6vWQ0z/OQm1G2LpYHe9mEh0f0MSDgctDs7pzcYz9irepCDlr
	VBSuNURg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpl1-0000000EZCu-32xW;
	Tue, 11 Aug 2026 16:55:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpl0-0000000EZCh-2FYD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 16:55:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1347343607;
	Tue, 11 Aug 2026 16:55:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCEF81F00A3D;
	Tue, 11 Aug 2026 16:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786467317;
	bh=K74qCRzxn651l3XaxagRai5qzbIH3fM2gu1tb8jTrx0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=SiPVmjPUCYCxgQzflAyEvjyLjnx5GvlEuODxiPI8m++VKdO0I8M3VOV547DreCsnZ
	 J2q6XfOxN4h2D1YzLk1s3DwmE9luW5dN/B66tPRp4zNDTYKTijlqAMt/eZaxZzx+Ml
	 2tfsASB8FGYkK9fybZKshiZ3hmDfVP60wUpnFlK1I5BtYfUoPqN7A14w0gqA7hB74j
	 cSP7j5K05C8x4voipdJFHuWOZ1Oonj8Xvjs2Mnv3hKDE+tuAQHGcQ7vzBVrZ6FTItY
	 TmumGHNCdLYGd7DesLI0+JRgDuGdrOmHgp40l6MMFJ6EwU34RQQR8561e3S0STfSvm
	 MMz+KfVUfRsaQ==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 67BA11980054;
	Tue, 11 Aug 2026 12:55:14 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Tue, 11 Aug 2026 12:55:14 -0400
X-ME-Sender: <xms:71N7arl23h6xw1CH1z2nddTAoYbwEJOGVDZNFtujad0vzLpT-zq1Qg>
    <xme:71N7apqWfb-zaLERpc4oN23uRcsxXPVAMnaqpYZcAGXT78g6eY77w-HFTkQow9bwK
    ETuNnBXzNHW3qRCWLhpmSP5x6u6phPZxkQqYiw2Auq9mXwmNGO8FUM>
X-ME-Proxy-Cause: dmFkZTFLc7TJ0dCZCnX8dz/KaeoCy81UUCnt5usIFl0AbbXPkucwxamVid5h2jlpBQ/6LL
    tkmHNiBDJbnaueeGmoN5qhchkdBHK0JaoAv9ua78VI5NXvIlN4AZTsW9oIkre85QvVOX8O
    KG9TOwxxELKxGxQVI5OHhEkppJjUIqoQhBGdlmWrjaChLy54Fo00vYU4mB5CxgH4nLOUnr
    l/HKgI1B45m76zJ2Ilm7k34nZwAS/QrFjzIfD1LSfKbsV8Y+rgioXB3PgLFDWcwwf7TKUD
    a3rMaLk0nBXVC3IEguTnZiQbUt7dwuCcq8aQ2uaHyGkjuT5aH59w9EChvazhf7QBSPjDAZ
    btPY06AHFTIIm9P/l8h2EtOIV7gp18ZxiSvgrEzMl55Ixju9io10JfX1dlBhj7o9eP75fp
    imKHBSS0JKfkxL7SM/rPBjzjB3aCrZJOfxK8kPujWtJmLcFJRrLHkhqF3k00hlNWvDl+U8
    qQnwknKwLkDTDNb4U+cOX8Z4mBFfbZcKHY8B4Hxv1QAFrN8HO10a/nv0WV+lirE0FP9WhV
    EJ1Snv5EEvBqNmZSQoZS0ON+ZCmU+UIWmy05UW+4gTRXyQRrFqt2ygjTU+cAmFShxQz07+
    HxEl3mtTcAbaQtydmWg52Wezoed8gLO6FO7KGtd/o9CqQQjdbBDHfn+q538A
X-ME-Proxy: <xmx:8lN7ag2mfx_pCrSL36pe2INckIFMJ1pTV5vmN2elIR3KGU2eun4XeQ>
    <xmx:8lN7anfhZbPkmbtb8wQPNV6waarKDNqj81uDEPgLT_RTywpMGIzJXw>
    <xmx:8lN7atV6YTk14TC5s7fVrGJYHhmQomRCm3j0tj9mudk0EwHRL_Jszg>
    <xmx:8lN7an-_bXx9f6Q216lbEvdQbb26eryIlCar6LR1zPCjlU0F1iIDyw>
    <xmx:8lN7avhCoeyxuTy-8toXIKtulM7nStebFLgRcoI6hErv9u2XfZIVARFt>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id A4453F8006E; Tue, 11 Aug 2026 12:55:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 11 Aug 2026 18:54:51 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Nick Desaulniers" <ndesaulniers@google.com>,
 "Josh Poimboeuf" <jpoimboe@kernel.org>
Cc: "Will Deacon" <will@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, live-patching@vger.kernel.org,
 "Song Liu" <song@kernel.org>, "Miroslav Benes" <mbenes@suse.cz>,
 "Petr Mladek" <pmladek@suse.com>, "Joe Lawrence" <joe.lawrence@redhat.com>,
 "Mark Rutland" <mark.rutland@arm.com>, "Mark Brown" <broonie@kernel.org>,
 "Kees Cook" <kees@kernel.org>
Message-Id: <b4bdf563-274f-4ab9-804f-35c47ab2f353@app.fastmail.com>
In-Reply-To: <CAKwvOdkS5ZaBGaoiLwcXqCBjcOXLXE88VD3bj5ES1sssKFf4HA@mail.gmail.com>
References: <anmobvJXiBQqWn6S@willie-the-truck>
 <e5q2mvqtf6iw4lco55uny5ffhppw6vlflxguhc4gg5nm3zdvmo@zs6rw7iov5qc>
 <08d6c5cd-9924-4359-9181-a03718161528@app.fastmail.com>
 <kp4rvh4vxo65gipgqz4i4dnw2ueylmus4yys6xfrbngp5nefzn@4a4ekjlzqlph>
 <CAKwvOdmSVjY0TmOTc6WMmDHcLbn=tOV3R3zH_TO4zXZiYEsaBw@mail.gmail.com>
 <anrvDIWMNGIa4WPK@willie-the-truck>
 <4986ac98-d6da-474a-b218-b6468b68cb9f@app.fastmail.com>
 <16e3ed42-1b1f-4ddc-9d8c-5e12ee7dbe3c@app.fastmail.com>
 <answWdRpVQLtIzIj@willie-the-truck>
 <CAKwvOdkrxJ_9qjaBNQS+o=+_m_f3e9k6jMEmXB-S3+nXGoLV7w@mail.gmail.com>
 <buq25tpmdjlvskzfvlit6swc6tsjuzbdnjfix4w6af6247zads@ka44wuolomci>
 <CAKwvOdkS5ZaBGaoiLwcXqCBjcOXLXE88VD3bj5ES1sssKFf4HA@mail.gmail.com>
Subject: Re: [PATCH] arm64/module: Fix livepatch BTI exceptions with Clang 21+
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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


On Tue, 11 Aug 2026, at 18:52, Nick Desaulniers wrote:
> On Tue, Aug 11, 2026 at 9:41=E2=80=AFAM Josh Poimboeuf <jpoimboe@kerne=
l.org> wrote:
>>
>> On Tue, Aug 11, 2026 at 09:27:28AM -0700, Nick Desaulniers wrote:
>> > On Tue, Aug 11, 2026 at 7:23=E2=80=AFAM Will Deacon <will@kernel.or=
g> wrote:
>> > >
>> > > On Tue, Aug 11, 2026 at 03:18:17PM +0200, Ard Biesheuvel wrote:
>> > > >
>> > > > On Tue, 11 Aug 2026, at 14:02, Ard Biesheuvel wrote:
>> > > > > On Tue, 11 Aug 2026, at 11:44, Will Deacon wrote:
>> > > > >> On Mon, Aug 10, 2026 at 09:41:35AM -0700, Nick Desaulniers w=
rote:
>> > > > >
>> > > > >>> Sure, but let's replace this with a link to a bug report in=
 llvm's
>> > > > >>> issue tracker?
>> > > > >>
>> > > > >> Yes, please! I can apply the patch once we have the bug numb=
er.
>> > > > >>
>> > > > >
>> > > > > I can look into that.
>> > > >
>> > > > https://github.com/llvm/llvm-project/issues/215547
>> > >
>> > > Thanks, Ard. I've ended up with the patch below.
>> >
>> > What's the extent that HAVE_LIVEPATCH will be used?
>> >
>> > Does this penalize kernels built with BTI in favor of HAVE_LIVEPATC=
H?
>> >
>> > For example, with my Android hat on, if we have a kernel that's bui=
lt
>> > with ARM64_BTI_KERNEL=3Dy, and _dont_ use HAVE_LIVEPATCH, we're goi=
ng to
>> > turn off BTI for a feature we're not using?  But maybe we _do_ inte=
nd
>> > to use HAVE_LIVEPATCH, and my assumption was wrong?
>>
>> The problem isn't specific to livepatch, livepatch just makes it easi=
er
>> to hit.
>
> Rereading Ard's report, let me see if I can articulate _how_ and tell
> me if I'm still not getting it.
>
> Let's say we have code in .init.text that calls code in .text. If
> .text was placed large enough away from .init.text, we get a veneer
> inserted by _the kernel_ (not the linker).  This veneer has an
> indirect call to the destination. No landing pad. Boom.
>
> Is that precise?
>

Yes.

