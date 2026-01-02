Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC7DFFA374B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 13:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SVGIiSWIzg80Bqq7LCYYlALqbBWZ2ofIsrcdUHfyZPU=; b=G8Hyok0JRvlykWuQacnRlxjhy5
	cnMnHGoiut1dnQ8mdZGHHTeIR6rnkjhKbP1QQFfF60ioGUEz18/PZuXPSITb7+B9hdinm6Q/wCZTk
	1bwQUA7a+NqJ6b65eGNHb/rD3NGbPmRKPlyQRPo3PRDd/RRoLCXt/UmWoqzFCKlhvACsDogWePPox
	ZunyBg1J7LsXQ2wjXK/P2lou9yvvnsPZ3Uj1kBWkSYkb2vs5QMgOvpb16Z4H4IEGQWWD0j31bf0xe
	DLVs6VDYff5r5BDl7qR6FWT+3gE8ruuOWBUjdp08djylQiyXCtHsVQ7R0D6Iue/gwQBeY7Fxmb2Fl
	jiEvmRTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbfNY-00000008ItK-3JLJ;
	Fri, 02 Jan 2026 13:39:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbfNW-00000008Isi-0C2w
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 13:39:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 43E3A40A33
	for <linux-arm-kernel@lists.infradead.org>; Fri,  2 Jan 2026 13:39:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA5D0C116B1
	for <linux-arm-kernel@lists.infradead.org>; Fri,  2 Jan 2026 13:39:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="bW2ENvpW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1767361177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SVGIiSWIzg80Bqq7LCYYlALqbBWZ2ofIsrcdUHfyZPU=;
	b=bW2ENvpWXyyENTYao9a8vpF6KdMw2iFyt3fMDnWm28sEiGCG1ZAVfj8QBckNS1URBdKuSy
	qMkKWGSU/R3XJnRP9oKK+a6PfgA0khTJvm4Y4kYpV+AgAW4PmlGOVPDAd3T5sq+1zoMJ/V
	G5EA9eYLmQnrQH/pUXdhhleeLIDRB8c=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 82b4b76d (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <linux-arm-kernel@lists.infradead.org>;
	Fri, 2 Jan 2026 13:39:37 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7ce2b14202fso32042a34.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 05:39:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWbzjnnXpIg2vdYzuV9JPaPnfd/ccvQWNUC9toBAhrLl1zJmmMuZtcurpPUP5brr40KmRqi/Aq9i7p1bM4HNMWx@lists.infradead.org
X-Gm-Message-State: AOJu0YwNnJRt/eZjyQww0MOresoOJzKsESSe6EdEPlqGof7L/E0vDlC/
	n01cqq+xRredaYs7v2Xg/6JREAwsrmRdiDO4JN09dHWZGDDeBtMMr7KnkGvLi57r/y0szVJ6kyv
	FPAqvlynuok7p64FUzcGRj0Yc89LT3n8=
X-Google-Smtp-Source: AGHT+IFV0P4UwOKgGcidVSe3+C3GT9JSRutBmyTJY+Ko+TYwuWXifwQH5m/QQSPv0qrqCY9iwE1wKuoYX25E7txH4AI=
X-Received: by 2002:a05:6830:4c08:b0:7c7:65f4:1120 with SMTP id
 46e09a7af769-7cc66a6f068mr24618037a34.23.1767361173696; Fri, 02 Jan 2026
 05:39:33 -0800 (PST)
MIME-Version: 1.0
References: <20260102131156.3265118-1-ryan.roberts@arm.com> <20260102131156.3265118-3-ryan.roberts@arm.com>
In-Reply-To: <20260102131156.3265118-3-ryan.roberts@arm.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 2 Jan 2026 14:39:21 +0100
X-Gmail-Original-Message-ID: <CAHmME9qHiVZwf4TAringRHSZ-yqHuPwmP=Wnx98n09jv7Vu_Rg@mail.gmail.com>
X-Gm-Features: AQt7F2qdo3e8gMqv9IRozONnOouAGf6XyGKVO6JwEtjeNVfJ3A-5G4I57eyZbDw
Message-ID: <CAHmME9qHiVZwf4TAringRHSZ-yqHuPwmP=Wnx98n09jv7Vu_Rg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] prandom: Convert prandom_u32_state() to __always_inline
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Jeremy Linton <jeremy.linton@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_053942_335319_29669BED 
X-CRM114-Status: GOOD (  12.55  )
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

Hi Ryan,

On Fri, Jan 2, 2026 at 2:12=E2=80=AFPM Ryan Roberts <ryan.roberts@arm.com> =
wrote:
> context. Given the function is just a handful of operations and doesn't

How many? What's this looking like in terms of assembly? It'd also be
nice to have some brief analysis of other call sites to have
confirmation this isn't blowing up other users.

> +static __always_inline u32 prandom_u32_state(struct rnd_state *state)

Why not just normal `inline`? Is gcc disagreeing with the inlinability
of this function?

Jason

