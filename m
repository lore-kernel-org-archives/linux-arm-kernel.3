Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35834C5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 13:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/QJ52aa/j/8uwocsX/awDObRYKIsk+th8jLPBhbAa+8=; b=riRW4kIlhKDnc+QtUlPyAgwgyg
	Cd1OQZVoZn4LOEr345QBgLlIN/1928XEhh9qEprUg6+Snp+jf/1aqIsgJ+1225PoJPU6P49uTSauS
	36q3cRpYFeCNlvhRBd4qzIKPZzKflMWJGJvRmcxHQqR0f5z924+YEKM480f079Hz0IfhUwNc8KmOj
	nKCOqosGVIvbjr/ORpLuPOCL5rWXoBJWHdQFK3dvBE4vdbxHnboFUoieKJ0bOCzVq828f/hTIEXkh
	RJDIT0mhfzkJZ1tm05/rCPRdpRMpaqqihIn5RLvhKO4Heg7NFqwwYNMN1V202j5Z8nWe+oyxakEhg
	0ariRTKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxlxf-0000000EXzY-0EWa;
	Sat, 22 Aug 2026 13:40:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxlxe-0000000EXzR-0Oza
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Aug 2026 13:40:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1A19C600BC;
	Sat, 22 Aug 2026 13:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AD731F000E9;
	Sat, 22 Aug 2026 13:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787406036;
	bh=/QJ52aa/j/8uwocsX/awDObRYKIsk+th8jLPBhbAa+8=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=QmNf+tcXhfF3HPxQMEPftlVZdSwXaBGuI48ojkHIfc6gGbot8Bpd2BWzRAYvdDxJl
	 WyexjyzoFylV284TcVBvP2SsexcO/0qdwwGwmIiHs5F58X0UPKZPLaygsfkL05pKjh
	 02byHm3kt0ba7a1BSFBfQ3dPMFcZT7K3mS3Jw/8GQI8jJKL30Vqj4c2EPlCpbwJRBb
	 8ZuUqV46fDlW6AX2TSwpMk5dZay4RWQhgCFtv69UOVeBlOIeSN9oFNMfHktksDOS4Q
	 DdvfrKQLEeY4IfCCoICSgLA6oKTrAlBACdmFsE0u1DaaVgXlz9oBH3E/c8oZSvR23V
	 KR9c9XSBx8i6w==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id D871C1980047;
	Sat, 22 Aug 2026 09:40:34 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Sat, 22 Aug 2026 09:40:34 -0400
X-ME-Sender: <xms:0KaJalbhwdgab8Xsb_p5zWzrbFVgSEiMG7xbA4Mm6GnL4O2A06Jyhg>
    <xme:0KaJanMJ16UVtZG84oxB9RUCgTqGRCJjt7Se1Ky8MSldTPDgFf8IVA4WWFU6_9I4z
    95Hs3H6iMHdRg3mtolLqJU-Gq7Ie_GLvxz3txmC1_svmMA37HN4sw>
X-ME-Proxy-Cause: dmFkZTGXT/t3A75y4ad8I9KGVcI4tAu786q3SEka9Ctvu7pISFdNozuQON4W27LlXt9KvJ
    v/siQYL5Uc6vUd+85FPmIYxnKk98CRVcMEg/Tk2pif1vuBNBJpMAIsSHwpxst3wYNGyehe
    KSuySAYw4kNEHeIa2CX8xLBUl2tEs3g5nRPxtgkTOtWcUHTIdNU/ub9L0vQmxBg+JGJuDM
    nyZ0/t4Qo7jl5cHUDYk1hS8s9WP1Q6ZHIUGiadNBOBOLLQQEf5q39iNLPhu76mKII/Xlvd
    RqlLsM8Oge9O3xVBp9X6BTRrn+jWrSJ8kTEpp//gzaotZYpPQasg2w1T79EImdLWbixEdk
    +wsnh8Gb6NxoS8QK65q4hkNtOF48FiqqpcDp7Ez1aUw1qJ3GhYZ96wmH1ahIqLBVK49b4I
    qzFoLKPAylFNS4r4I/5b8aTkSXO1rkVMHQ60aqG0jJwIPBPukCEtofeB9XieboXqb2sCTU
    ujT64pDl7KOISDBEk1bEzzjcCBr0wrtPpNl9R1LCyJzOIaKcyh1DteRgbkdbhfeLeNEJ08
    E5Cs5t5FVDuyd2wHjDvn3djgvYDquTKGSUS9fWEkN5Q0VS1xqa4rqR5A4FiQO1CYNd81dq
    n+fQt800/JkMEwl8k1srbSTguVx9u+r61kOCi4WLN1+zeVquYmj/tu1hQKgw
X-ME-Proxy: <xmx:0qaJakLDx1eTfgWneSkDvbQN4q02PQF-4DG57a-4lvqyHdGDEX1stw>
    <xmx:0qaJamtPB0myameKFiCxk-BND2KjdSt7_P5H0HICwIP7OzXXBncJhA>
    <xmx:0qaJaoXHODGjNI7g4rKQOFFMVhFkEMqNQfCE2ThtwcggxCaL9n5UNQ>
    <xmx:0qaJahgnl0pqGU06prOVT08GYEp9mZ58H1xU6D2yeOjjO8ExUkvvBg>
    <xmx:0qaJagplG-sx4s-eAYT0dPCCluN6IT-1U_PeKJQmSuftm2in8IBKmCRo>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 71984F80070; Sat, 22 Aug 2026 09:40:32 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Sat, 22 Aug 2026 16:39:38 +0300
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Chen-Yu Tsai" <wens@kernel.org>
Cc: "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 lkml@vger.kernel.org, "Jernej Skrabec" <jernej@kernel.org>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>
Message-Id: <c599d74d-81e9-4310-b739-7bdb2c43de2c@app.fastmail.com>
In-Reply-To: <CAGb2v64cNU+dyuGUwNk2xNN9CJZVXPTJE_u9YrZUp9XwfNGSvg@mail.gmail.com>
References: <CAGb2v640LRCYpRq8omyRirD4CUSd2mjm72EJ9FtWvZe=Vovg1A@mail.gmail.com>
 <15d76cad-2c02-48cf-8071-b7b60e854298@app.fastmail.com>
 <CAGb2v64cNU+dyuGUwNk2xNN9CJZVXPTJE_u9YrZUp9XwfNGSvg@mail.gmail.com>
Subject: Re: Bug: PHYS_OFFSET no longer points to DRAM physical starting address with
 CONFIG_ARM64_VA_BITS_52
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



On Sat, 22 Aug 2026, at 16:28, Chen-Yu Tsai wrote:
> On Sat, Aug 22, 2026 at 8:50=E2=80=AFPM Ard Biesheuvel <ardb@kernel.or=
g> wrote:
>>
>> Hello Chen-Yu,
>>
>> On Sat, 22 Aug 2026, at 15:39, Chen-Yu Tsai wrote:
>> > Hi,
>> >
>> > On the Allwinner H6 & H616 SoC (and likely others), if running a ke=
rnel
>> > compiled with CONFIG_ARM64_VA_BITS_52 and CONFIG_ARM64_PA_BITS_52,
>> > PHYS_OFFSET no longer points to the start of DRAM (0x40000000) but =
instead
>> > points to 0xfff1000040000000.
>> >
>> >
>> > I've observed this for quite some time but hadn't really nailed dow=
n what
>> > was going on. For context: the IOMMU on these SoCs can only do 32-b=
it
>> > addresses, and that's pretty fine since the SoC only supports up to=
 4 GB
>> > DRAM. However the DRAM starts at 1GB offset in the physical address=
 space.
>> > We want to be able to map the highest 1GB I/O virtual address space=
 and
>> > thus need to check if the physical address is within 4GB without the
>> > offset. Having only 32-bits addressing, the address will wrap aroun=
d fine.
>> > So we check the address against PHYS_OFFSE, which breaks with the m=
angled
>> > address.
>> >
>> >
>> > I suspect this is the result of the following commits:
>> >
>> >     7bc1a0f9e176 arm64: mm: use single quantity to represent the PA=
 to
>> > VA translation
>> >     9684ec186f8f arm64: Enable LPA2 at boot if supported by the sys=
tem
>> >
>> > The first commit introduces a negative (wrapped around) offset to
>> > memstart_addr (PHYS_OFFSET) to work around mapping restrictions, an=
d the
>> > second commit makes the offset dependent on hardware.
>> >
>> >
>> > I hope that Ard and the maintainers can look into it and make PHYS_=
OFFSET
>> > always point to the physical start of DRAM.
>> >
>>
>> On what basis are you claiming that PHYS_OFFSET must always point to =
the
>> start of physical, non-secure DRAM?
>
> AFAIK we've been using this since armv7 in our older drivers to deal w=
ith
> PA <-> IOVA offsets. This was then concentrated into one interconnect
> driver: drivers/soc/sunxi/sunxi_mbus.c
>
> The driver applies PHYS_OFFSET as the DMA address offset for a class of
> devices when the system is using an older device tree that lacks inter=
connect
> properties.
>

That sounds like a hack to me tbh.

>
> There's also Documentation/admin-guide/kdump/vmcoreinfo.rst which stat=
es:
>
> ARM64
> =3D=3D=3D=3D=3D
>
> PHYS_OFFSET
> -----------
>
> Indicates the physical address of the start of memory. Similar to
> kimage_voffset, which is used to translate virtual to physical
> addresses.
>

This information is inaccurate. kimage_voffset is the offset between the
kernel mapping in the vmalloc space and the associated physical memory.
It has nothing to do with PHYS_OFFSET or with the start of memory.

>> On arm64, PHYS_OFFSET is the physical address of the start of memory,
>> where 'start of memory' =3D=3D PAGE_OFFSET, i.e., the start of the li=
near
>> map. When running a 52-bit VA kernel on hardware that is not LPA2 cap=
able,
>> the hardware does not support mapping memory at PAGE_OFFSET, so it is=
 moved
>> upward in the linear map.
>
> So it held true until 52-bit VA support was introduced?
>

It still holds true.

>> I don't quite follow why you need to compare with PHYS_OFFSET in your=
 IOMMU
>> driver: could you elaborate?
>
> Our IOMMU only supports 32-bit of address space. On our SoCs, DRAM phy=
sically
> starts at 0x40000000 (1 GB offset), meaning any physical DRAM above 3GB
> would wrap around. However putting this number in drivers was discoura=
ged
> in the past and we were told to use PHYS_OFFSET (on ARMv7) instead. Al=
so,
> in the past there was this one chip that put DRAM at a different offse=
t,
> so using a fixed number in the driver won't always work.
>
> Right now we're just blocking any physical address above 32 bits. Idea=
lly
> we want to allow up to "start of DRAM + 4GB". So we need to know the D=
RAM
> start address. (And we probably want to block anything below start of =
DRAM
> as well.)
>

Should you be using memblock_start_of_DRAM() instead perhaps?

