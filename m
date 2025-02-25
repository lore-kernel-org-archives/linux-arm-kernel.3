Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF3D4C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 08:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7QRWTrxpjekZTUx1eMKMRstQgVYfZ/X4MyjK30teX2M=; b=V9EOZurHpCRSGtZydbOA+fII9g
	kboBrq6ZZ+mcHI1X0G1iUzys2iCsbakrd2FxpXuSkAHdUCrTHnb6ctD8qa1UGcIsn4XDTB7lUBlbW
	VI25IO/gHsYxr0VbThOGv7aZPXPk952obBANWdfTZDpE3cdbWb1WQUidcsrvWzyarc2pOnhU/TJRM
	CE8zorKencPj+ARO0kiw5u8KwTWQZNmLebjCGivksFqVKjuvDcJLrIjTu70kyIJ6CeB70qyRikp72
	UW6Rt1rrneMx8q2Z8VawlwfsFLtr8v/PSHX2YgSSgtJzJ3S7q0K7vALy+er8sKS7xCXfG57Kagr/i
	EK4HDaug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmqM2-0000000GOQm-2AdN;
	Tue, 25 Feb 2025 08:31:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmqJ7-0000000GNoF-2KOm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 08:28:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9A4BB5C690E
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 08:28:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16D54C4CEE7
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 08:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740472128;
	bh=8vPpJ8olOuwN9lQFG5YAxtDVHtl13Hwmn7GTiIrcqhc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=W+3vlCZa9bUAZTxTn/9J71uNJbnotvyK9PmaPGkw4X4oDmLXIMxWqkfsCcSwSLluV
	 Db0FfEvW+SAZXPOywDNfozz7H/frK0a4sToUc9cyCm5/VAuZ+/uGiuR3lr9A7lfGCY
	 qyXUeAX0oNyqtPXG6eDHAyyo0jGeM7qolZiMPt04E3KDkWD7fkZnQWcINq2VcNejEh
	 vxeCel3h2xVc0TK+G5o0zlcuBWI8sDdcnkf5aU0ERlRZAbkwMHPX1cUtjszlMPdL38
	 S1b6ZxUhfwR3IuBuqzMcFMsOubgserxyc4QJoNuO0ut0gfcaSWRY7T92LX05cN3tEJ
	 DLJRIviLFdGoQ==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30738a717ffso41245751fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 00:28:47 -0800 (PST)
X-Gm-Message-State: AOJu0Yy5a0y5Txsjl6d0+9vQqp21Swby7r5uvyJX3ya7kAoCw3Yrha9s
	er3fuebS+tm9Jhe1bz2GCdoD4XNp/BGGDXxqryseij+xcr420ptr1ZhVgLVbKEPyo7biWT+lE5H
	huZ5CukOxKD/RWmT87l4A8wJ75sA=
X-Google-Smtp-Source: AGHT+IEo2P1y8oZ4sGjozx2IPF/FoxHw0AwPGW5G+13Hqko9jHR6xC99gVXu+gG39GPDa7xUUBqQyzk+N/BNjhsnf4Q=
X-Received: by 2002:a05:6512:ba6:b0:545:8f0:e1a4 with SMTP id
 2adb3069b0e04-54838f5b0c7mr7334086e87.45.1740472126391; Tue, 25 Feb 2025
 00:28:46 -0800 (PST)
MIME-Version: 1.0
References: <20250224062111.66528-1-kpark3469@gmail.com> <CA+KhAHYujgeC2kAd-vs0N0zwprpeqtD8G-8DpJ0w2RSxzZ5SQw@mail.gmail.com>
In-Reply-To: <CA+KhAHYujgeC2kAd-vs0N0zwprpeqtD8G-8DpJ0w2RSxzZ5SQw@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 25 Feb 2025 09:28:35 +0100
X-Gmail-Original-Message-ID: <CAMj1kXH-QmuXGi-5MSEzz7zSpPYWvM2eBPN-NbWF+R=49P2_2g@mail.gmail.com>
X-Gm-Features: AWEUYZmXdqSofSbFbm1Jzg5QlVhvXfgc9GSCI-mItVYgS6fAb-clLZXGzXceAac
Message-ID: <CAMj1kXH-QmuXGi-5MSEzz7zSpPYWvM2eBPN-NbWF+R=49P2_2g@mail.gmail.com>
Subject: Re: [PATCH] arm64: kaslr: consider parange is bigger than linear_region_size
To: Keun-O Park <kpark3469@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, Keuno Park <keun-o.park@katim.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_002849_681587_40C3739A 
X-CRM114-Status: GOOD (  23.75  )
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

On Tue, 25 Feb 2025 at 05:48, Keun-O Park <kpark3469@gmail.com> wrote:
>
> On Mon, Feb 24, 2025 at 10:21=E2=80=AFAM Keun-O Park <kpark3469@gmail.com=
> wrote:
> >
> > From: Keuno Park <keun-o.park@katim.com>
> >
> > On systems using 4KB pages and having 39 VA_BITS, linear_region_size
> > gets 256GiB space. It was observed that some SoCs such as Qualcomm
> > QCM8550 returns 40bits of PA range from MMFR0_EL1. This leads range
> > value to have minus as the variable range is s64, so that all the
> > calculations for randomizing linear address space are skpped.
> > As a result of this, the kernel's linear region is not randomized.
> > For this case, this patch sets the range by calculating memblock
> > DRAM range to randomize the linear region of kernel.
> >
> > Change-Id: Ib29e45f44928937881d514fb87b4cac828b5a3f5
> > Fixes: 97d6786e0669 ("arm64: mm: account for hotplug memory when random=
izing the linear region")
> > Signed-off-by: Keuno Park <keun-o.park@katim.com>
> > ---
> >  arch/arm64/mm/init.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> > index 9c0b8d9558fc..2ee657e2d60f 100644
> > --- a/arch/arm64/mm/init.c
> > +++ b/arch/arm64/mm/init.c
> > @@ -290,6 +290,11 @@ void __init arm64_memblock_init(void)
> >                 s64 range =3D linear_region_size -
> >                             BIT(id_aa64mmfr0_parange_to_phys_shift(para=
nge));
> >
> > +               if (range < 0) {
> > +                       range =3D linear_region_size -
> > +                               (memblock_end_of_DRAM() - memblock_star=
t_of_DRAM());
> > +               }
> > +
..
>
> In most cases, the hotplug memory code will be working the same as before=
.

How so? Such memory will usually appear above memblock_end_of_DRAM(),
and due to the randomization, there may not be any space left there.

