Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E832FC591F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 10:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sm64a9O9rK4Ai47DZclEUW07jSoi+FnNST7teOkGChg=; b=elKiTRZnw7TDuxz3x9uka2kt9h
	7UUrai0qTbCn4pRta0k+N4DRJGGwthiG0FO+R8YxcQcpPKP55L89UOirFox6T0gqZm+upQBCqgiyi
	Hx1amqYeFKnRBPv+2Jyzo5oRs/VJjf2wLppCK0QxprR1wgA71NvVNb1UBMqTCp6i5i+C44SzCoSHH
	zuCr0BOWEtYZTyPu4AkRlY/m7xzyj/GXfSSM7z6HNpeQABovwsLCfPit69CJQ6DZVVSH4TIvAQQBZ
	ksHitWCcCRd3VYgQMPeqa/H9zjLo/jFflz59Yd708pF+hFhXQ2bEukbxtCGe/GyRv3K5FkshR6D5x
	UPyU7vjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvYXX-00000005u06-2mZy;
	Thu, 26 Feb 2026 10:24:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvYXT-00000005tyt-3a4f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 10:24:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 12BED443CB;
	Thu, 26 Feb 2026 10:24:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E9D6C19424;
	Thu, 26 Feb 2026 10:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772101449;
	bh=P8zq4XL1vIHvWaTfBf9OJPokXFV2/Uw/qIckm/L5wQg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=rFFaOw5lZ5fOy3yVkc9gRviWvSQf3yiFW5Ja1Z5f361kd6d748MSq/D2jCcH8W4Pt
	 56n/U/sPWlvY5nRBNZhV64ltIJMTNVzTwz3p56v+C/rqaOjv+ubQMmHxt2cPYxAvar
	 xIOsjuLuJWvFVOjwnZ1PuqU8u66EuiIjnQhMPYntSZblcbTS70HtPK/wmKZgdhk0OS
	 rfza2Gk9kVIM3FKCpnCaoEQCdSnptd5ZAYGm+xsESgw52FFtP1FEf8Hv6Hsan88fnt
	 uaYS4OjebMizTiqrmNJgwpLFCa24MXX0tFp3Bo61yjBMZ6v2Edsbs7QrW/UpHnEbVp
	 4nnH80O586DwA==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id DD5D3F4006A;
	Thu, 26 Feb 2026 05:24:07 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Thu, 26 Feb 2026 05:24:07 -0500
X-ME-Sender: <xms:Rx-gaXkDrx5pnznR-SNMQS1tYTFTDjDVzc2UVuufzpa3L83PXaWj2A>
    <xme:Rx-gaVoEvkp6raOOwqQWPDa0cH-Ob-gPQix5xIzkuQVQm6h-NQbdzrS1pMcsoN3Ia
    -kZBU3FrMUKRHOIg7YnLpvy204Tr5tobrq5gruzze2vMtko18K1InM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeehjeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrugcu
    uehivghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpeekvdffkefhgfegveekfedtieffhfelgeetiedvieffhfekfeeikeetueeg
    teetteenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrugdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqudeijedthedttdejledqfeefvdduieegudehqdgrrhgusgeppe
    hkvghrnhgvlhdrohhrghesfihorhhkohhfrghrugdrtghomhdpnhgspghrtghpthhtohep
    feeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsphesrghlihgvnhekrdguvg
    dprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghp
    thhtohepmhhpvgesvghllhgvrhhmrghnrdhiugdrrghupdhrtghpthhtohepughmihhtrh
    ihrdhkrghsrghtkhhinhesghhmrghilhdrtghomhdprhgtphhtthhopehnphhighhgihhn
    sehgmhgrihhlrdgtohhmpdhrtghpthhtohepshgvrhhgvgeshhgrlhhlhihnrdgtohhmpd
    hrtghpthhtoheprhhosggvrhhtohdrshgrshhsuheshhhurgifvghirdgtohhmpdhrtghp
    thhtoheprhhosggvrhhtohdrshgrshhsuheshhhurgifvghitghlohhuugdrtghomhdprh
    gtphhtthhopegurghvvgdrhhgrnhhsvghnsehinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:Rx-gaceSkD7L3hUQ-QIntX5c8SF2UJvuNnlnCMg5x0km8JqIId1NUw>
    <xmx:Rx-gaXnaIY1-tJR3H2eKYjQqxgSwsae5h1FvMCQzz1XTnwkXn4A87w>
    <xmx:Rx-gaWo6YeaJZds-Per8yiexkNYiocIFKlSdVrZEta5R-DmtVqRepA>
    <xmx:Rx-gaU9JdnIBR33acIHa5vRJ_FAVN8423onO6PDBDHqIfNIXMgTbhw>
    <xmx:Rx-gaS0UmRYHqy-FoG7gumIna3Ay9Z737XOXqgkPGLVVt4wqDB4deV7_>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id AE587700065; Thu, 26 Feb 2026 05:24:07 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A6OHCiXwHjx-
Date: Thu, 26 Feb 2026 11:23:47 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Mimi Zohar" <zohar@linux.ibm.com>
Cc: "Coiby Xu" <coxu@redhat.com>, "Dave Hansen" <dave.hansen@intel.com>,
 linux-integrity@vger.kernel.org, "Heiko Carstens" <hca@linux.ibm.com>,
 "Roberto Sassu" <roberto.sassu@huaweicloud.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 "Vasily Gorbik" <gor@linux.ibm.com>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Christian Borntraeger" <borntraeger@linux.ibm.com>,
 "Sven Schnelle" <svens@linux.ibm.com>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "H . Peter Anvin" <hpa@zytor.com>,
 "Roberto Sassu" <roberto.sassu@huawei.com>,
 "Dmitry Kasatkin" <dmitry.kasatkin@gmail.com>,
 "Eric Snowberg" <eric.snowberg@oracle.com>,
 "Paul Moore" <paul@paul-moore.com>, "James Morris" <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 "Jarkko Sakkinen" <jarkko@kernel.org>,
 "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)"
 <linux-arm-kernel@lists.infradead.org>,
 "open list" <linux-kernel@vger.kernel.org>,
 "open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)"
 <linuxppc-dev@lists.ozlabs.org>,
 "open list:S390 ARCHITECTURE" <linux-s390@vger.kernel.org>,
 "open list:EXTENSIBLE FIRMWARE INTERFACE (EFI)"
 <linux-efi@vger.kernel.org>,
 "open list:SECURITY SUBSYSTEM" <linux-security-module@vger.kernel.org>,
 "open list:KEYS/KEYRINGS_INTEGRITY" <keyrings@vger.kernel.org>
Message-Id: <2115ea47-9a9f-4718-8531-4a9c2067899b@app.fastmail.com>
In-Reply-To: <ad471c33eeb9e21c49ac81032dc64555a2fb816f.camel@linux.ibm.com>
References: <20260115004328.194142-1-coxu@redhat.com>
 <20260115004328.194142-2-coxu@redhat.com>
 <CAMj1kXFXNo1-pMbo-VZrjQ3TYe1tufebrLr_avL12A0nHMSGnA@mail.gmail.com>
 <8bfa859ed3a4f1cf0db0ab64d8c1c3b24684582a.camel@linux.ibm.com>
 <CAMj1kXHsJNZoUEnbD1y=v4Ftuv9d2c08VckRV7ru4k4P83vZbQ@mail.gmail.com>
 <97b69bc79a5d9246f7a399510908c7b95b2e95e7.camel@linux.ibm.com>
 <CAMj1kXGx4ebaK87W7k0SNUNQnO9+=z1nmYxXC7retmp3OqRRFg@mail.gmail.com>
 <ac5e5e45c12e9b0bda19807e60b06057d74be0b3.camel@linux.ibm.com>
 <aW2i3yacr5TvWU-m@Rk>
 <1a0b6e5601a673a81f8823de0815f92b7afbeb60.camel@linux.ibm.com>
 <CAMj1kXFBMSEdRL8FotASbQO3dcfNG0bpp9Vnm5JPn-yjyDr=GA@mail.gmail.com>
 <ad471c33eeb9e21c49ac81032dc64555a2fb816f.camel@linux.ibm.com>
Subject: Re: [PATCH 1/3] integrity: Make arch_ima_get_secureboot integrity-wide
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_022413_388580_6BCFE08E 
X-CRM114-Status: GOOD (  18.25  )
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


On Wed, 25 Feb 2026, at 01:03, Mimi Zohar wrote:
> On Wed, 2026-01-21 at 17:25 +0100, Ard Biesheuvel wrote:
>> On Wed, 21 Jan 2026 at 16:41, Mimi Zohar <zohar@linux.ibm.com> wrote:
>> > 
>> > On Mon, 2026-01-19 at 12:04 +0800, Coiby Xu wrote:
>> > 
>> > > diff --git a/security/integrity/ima/Kconfig b/security/integrity/ima/Kconfig
>> > > index 976e75f9b9ba..5dce572192d6 100644
>> > > --- a/security/integrity/ima/Kconfig
>> > > +++ b/security/integrity/ima/Kconfig
>> > > @@ -311,6 +311,7 @@ config IMA_QUEUE_EARLY_BOOT_KEYS
>> > >   config IMA_SECURE_AND_OR_TRUSTED_BOOT
>> > >          bool
>> > >          depends on IMA_ARCH_POLICY
>> > > +       depends on INTEGRITY_SECURE_BOOT
>> > > 
>> > > 
>> > > Another idea is make a tree-wide arch_get_secureboot i.e. to move
>> > > current arch_ima_get_secureboot code to arch-specific secure boot
>> > > implementation. By this way, there will no need for a new Kconfig option
>> > > INTEGRITY_SECURE_BOOT. But I'm not sure if there is any unforeseen
>> > > concern.
>> > 
>> > Originally basing IMA policy on the secure boot mode was an exception.  As long
>> > as making it public isn't an issue any longer, this sounds to me.  Ard, Dave, do
>> > you have any issues with replacing arch_ima_get_secureboot() with
>> > arch_get_secureboot()?
>> 
>> I don't see an issue with that. If there is a legitimate need to
>> determine this even if IMA is not enabled, then this makes sense.
>
> Ard, Dave -
>
> FYI, Coiby posted v3 of this patch set[1], which is queued in the next-
> integrity-testing branch[2].
>
> [1]
> https://lore.kernel.org/linux-integrity/20260213012851.2532722-1-coxu@redhat.com/
>
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity.git/
>

Ack. Looks fine to me.


