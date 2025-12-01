Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C53D116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 10:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8sGdiDw6g2aIC+kgdxh9j/4AxnFYgyT7fP0om/w0YQE=; b=lfUtqpeF+ve03cQfPwZWx+Kbrw
	g/Oz8ajF2BGjcZ7lbGtQ9cz53wrbJdwH5aRxfep5bC3jr/8LLDab35CifytSTkhmX/E2Xi39iOa0y
	M8vYqTedwiv52Nvx4VZY1M8XwDGa2sNnAB9K39tXGb7W5YvCRT77Y2JDwehXi9BMvViOsNHAJOP6R
	8UaV4/EluDE6Obo+WiZoTB742ptSZNyFfBU0t+Wh6fGGt5amum1HCcr3M+6wwHO+lzrfbXWZx1z16
	KQijHRi5E1dqwZ+OSmMoqxeJn5BYhIB2IYGh3R4ogwP49Tv7/ZkCCma5XlQygPv2YZO4GDBL60ij4
	Ji/mp1LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ17X-00000003KZ4-47oG;
	Mon, 01 Dec 2025 10:27:04 +0000
Received: from mailtransmit04.runbox.com ([2a0c:5a00:149::25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ17U-00000003KWT-1Qa4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 10:27:02 +0000
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight@runbox.com>)
	id 1vQ17A-007cSW-56; Mon, 01 Dec 2025 11:26:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector2; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date;
	bh=8sGdiDw6g2aIC+kgdxh9j/4AxnFYgyT7fP0om/w0YQE=; b=B0r4zwnIdjTV3MYep6gUPns+zZ
	THazDeh9bhz2Ex9diTPzPm77uZV97qEOLXNwpCKgJgFVzDL1hEkJSk5DScUvlyJnQoj4bIpkUJHOS
	troE4+pu6DeekF8Muzp5olhtvkZv/9c1c4itUA6dA1cXIdVCUeJEghE/LRa+tmvcrAzAvoyokqKYb
	2HljkpoZlWQyqr8FUEdJ/AiwJAEZASom7U8aFtr5srhmUXW1+X2k45cEQijMXAANPtn0XyNQj4Tvf
	FS88vSC17g1lKPiJ1ln3u0pgYdKqqTyrGh15aDNA3ZRH8uBTWnrQskPEHe2fUl0WwsugIVMbo+NXA
	Qpw6K99A==;
Received: from [10.9.9.73] (helo=submission02.runbox)
	by mailtransmit02.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight@runbox.com>)
	id 1vQ178-0005ri-0O; Mon, 01 Dec 2025 11:26:38 +0100
Received: by submission02.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1vQ176-008sUH-7s; Mon, 01 Dec 2025 11:26:36 +0100
Date: Mon, 1 Dec 2025 10:26:33 +0000
From: david laight <david.laight@runbox.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, linux@armlinux.org.uk,
 catalin.marinas@arm.com, will@kernel.org, chris@zankel.net,
 jcmvbkbc@gmail.com, akpm@linux-foundation.org, macro@orcam.me.uk,
 charlie@rivosinc.com, deller@gmx.de, ldv@strace.io, rostedt@goodmis.org,
 tglx@linutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: Avoid memcpy() for syscall_get_arguments()
Message-ID: <20251201102633.17a99afc@pumpkin>
In-Reply-To: <aS1qYhHhZK3CD_bU@J2N7QTR9R3>
References: <20251127123630.4149828-1-ruanjinjie@huawei.com>
	<20251127123630.4149828-3-ruanjinjie@huawei.com>
	<aS1qYhHhZK3CD_bU@J2N7QTR9R3>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_022700_708661_47F69575 
X-CRM114-Status: GOOD (  22.23  )
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

On Mon, 1 Dec 2025 10:13:54 +0000
Mark Rutland <mark.rutland@arm.com> wrote:

> On Thu, Nov 27, 2025 at 08:36:30PM +0800, Jinjie Ruan wrote:
> > Do not use memcpy() to extract syscall arguments from struct pt_regs
> > but rather just perform direct assignments.
> >=20
> > The performance benchmarks with Generic Entry patch[1] with audit on
> > from perf bench basic syscall on kunpeng920 gives roughly a 1%
> > performance uplift and also aligns the implementation with
> > x86 and RISC-V.
> >=20
> > | Metric     | W/O this patch | With this patch | Change    |
> > | ---------- | -------------- | --------------- | --------- |
> > | Total time | 2.241 [sec]    | 2.211 [sec]     |  =E2=86=931.36%   |
> > | usecs/op   | 0.224157       | 0.221146        |  =E2=86=931.36%   |
> > | ops/sec    | 4,461,157      | 4,501,409       |  =E2=86=910.9%    |
> >=20
> > Before:
> > <syscall_get_arguments.constprop.0>:
> >        aa0103e2        mov     x2, x1
> >        91002003        add     x3, x0, #0x8
> >        f9408804        ldr     x4, [x0, #272]
> >        f8008444        str     x4, [x2], #8
> >        a9409404        ldp     x4, x5, [x0, #8]
> >        a9009424        stp     x4, x5, [x1, #8]
> >        a9418400        ldp     x0, x1, [x0, #24]
> >        a9010440        stp     x0, x1, [x2, #16]
> >        f9401060        ldr     x0, [x3, #32]
> >        f9001040        str     x0, [x2, #32]
> >        d65f03c0        ret
> >        d503201f        nop
> >=20
> > After:
> >        a9408e82        ldp     x2, x3, [x20, #8]
> >        2a1603e0        mov     w0, w22
> >        f9400e84        ldr     x4, [x20, #24]
> >        f9408a81        ldr     x1, [x20, #272]
> >        9401c4ba        bl      ffff800080215ca8 <__audit_syscall_entry>=
 =20
>=20
> It's probably worth noting that __audit_syscall_entry() only takes 4
> syscall arguments, and hence the compiler has elided the copy of
> regs->regs[4] and regs->regs[5], which it apparently couldn't manage
> before.

Hasn't it actually inlined it and completely optimised away the regs[] arra=
y?
It looks (from the asm) as though syscall_get_arguments() is followed by:
	fn(regs[0], regs[1], regs[2], regs[3])

    David

>=20
> > [1]: https://lore.kernel.org/all/20251126071446.3234218-1-ruanjinjie@hu=
awei.com/
> > Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> > ---
> >  arch/arm64/include/asm/syscall.h | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/=
syscall.h
> > index f3853047c28e..f3564ba97f7e 100644
> > --- a/arch/arm64/include/asm/syscall.h
> > +++ b/arch/arm64/include/asm/syscall.h
> > @@ -82,9 +82,11 @@ static inline void syscall_get_arguments(struct task=
_struct *task,
> >  					 unsigned long *args)
> >  {
> >  	args[0] =3D regs->orig_x0;
> > -	args++;
> > -
> > -	memcpy(args, &regs->regs[1], 5 * sizeof(args[0]));
> > +	args[1] =3D regs->regs[1];
> > +	args[2] =3D regs->regs[2];
> > +	args[3] =3D regs->regs[3];
> > +	args[4] =3D regs->regs[4];
> > +	args[5] =3D regs->regs[5];
> >  } =20
>=20
> FWIW, I think this is clearer than the 'args++' and the memcpy(), so I'm
> happy with this regardless of the performance concern.
>=20
> However, as Dmitry says, we should keep this structurally the same as
> syscall_set_arguments(), and so we should update that in the same way.
>=20
> Mark.
>=20


