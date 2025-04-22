Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91983C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 06:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WoUER+RlE16ITj8VlE+L9VguQMKJtmcK5lmnna4nc70=; b=nwBqIv/TxarSf2N8ViTSVd+BVu
	fnEfNCTNoBU90i45PpUbP8/hk1PKwXNrCGk5Y7QY3Tae55eNRDczEhnRWunjjQFdiEZ1rXjY5FrAT
	XzRYazHwd5F8LaGgMIszirupBzM+HD9ZJ12B5WhtLZgEceUQ+Lunoe8WOcQBwFe1wEXPoQg8NtAoI
	tjibU1qos0vZfYXN6AunNt81z5x2nrd+z8tPD5TIwcC0/vBnp3uynPKglb41eopynHUgvrEFCIXNg
	M59UUHsTHf8ra8ck/deqdVY085raqdifk01umsM+n5CRljTsxhWprdlDlBTethPv+CDpz/wfMPXbs
	GArwJPjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u77AL-00000005xwF-3MHk;
	Tue, 22 Apr 2025 06:31:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u774I-00000005wpT-0G5N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 06:25:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5FA055C58EE
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 06:23:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0F37C4CEEC
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 06:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745303116;
	bh=WoUER+RlE16ITj8VlE+L9VguQMKJtmcK5lmnna4nc70=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QYr1Rm0vtNdW2Jym6LuMjLQXkwPJ7nYN+2ABwFI6PIoQA1M+PpuEfXJbszuhS28oh
	 DuhLfDCDd5f6h9e9sFgVrhS9EkiWR18bayr+l67aQ90G81u8vnA2wZwAqBcT/FmHSv
	 GrA+LB6ouU+bje/LqK/OfBtpab9zUJDENENR0xf32JcC1MRTwCsMwhwHXmHC47TEZq
	 cXWAsByaIMZg0SaHMQbQfrt0Due1hyNEBippqKDKiyS0Fm0ORVKkf5MEzTEEde90d9
	 jrwG9EbL/zrocRA1qT1bV7NBtXNqUKj8iT1bR9bHN2StEzsyQ5GoAEoxwSX5LvTF2K
	 K+XUOqaqJU8gA==
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c08fc20194so150449885a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 23:25:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVa2m0jbcRiAZpi5okrdc71dDiUMUiL9tvh3wgosWwPQCswFGMlB1nznS7FqRs49htEl9Upix18K1vH5sv7n2E+@lists.infradead.org
X-Gm-Message-State: AOJu0YxJLPwWj5WbiNbDmTUsRPqiY9n06NrbJdtezGTpURcBglWpTe3q
	4yeUrNmEzHsHUiL4RwafrGLbtzOXTkI8LL4byNmw7VwxuksEyyEDEzl2xJKQmJ644asLqk/QbIM
	pvdGNLKeu/6V66baSdBWv8F21mYc=
X-Google-Smtp-Source: AGHT+IFq/kCrp5sAoPRx2ufn6VDCk/MgNt2ImfpjzZ/wbGytewzE7HFRZ82iD9KlMJRBFRa24L4t6F5ZSbo1aByp8XI=
X-Received: by 2002:a05:620a:46ab:b0:7c5:5e05:df33 with SMTP id
 af79cd13be357-7c92804d668mr2515679885a.51.1745303115971; Mon, 21 Apr 2025
 23:25:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250412010940.1686376-1-dylanbhatch@google.com>
 <20250412010940.1686376-3-dylanbhatch@google.com> <CAPhsuW4LO9Cr8kpTeNR7nBw1FYrNrXBndYtcTEnA408GL1jT0A@mail.gmail.com>
In-Reply-To: <CAPhsuW4LO9Cr8kpTeNR7nBw1FYrNrXBndYtcTEnA408GL1jT0A@mail.gmail.com>
From: Song Liu <song@kernel.org>
Date: Mon, 21 Apr 2025 23:25:04 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7z2rdNK3w9Hpwh8FXy29fSUNGKyAw0GbUqfxnfgsfg_Q@mail.gmail.com>
X-Gm-Features: ATxdqUEv9Xn7L89x3Z4tWfx0SMDCVGs9AoZFtdJTNbi3OfiiHlhmph8HruZ6k7M
Message-ID: <CAPhsuW7z2rdNK3w9Hpwh8FXy29fSUNGKyAw0GbUqfxnfgsfg_Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64/module: Use text-poke API for late relocations.
To: Dylan Hatch <dylanbhatch@google.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Roman Gushchin <roman.gushchin@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_232518_189379_3E9B15FF 
X-CRM114-Status: GOOD (  14.97  )
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

On Mon, Apr 21, 2025 at 5:35=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
> On Fri, Apr 11, 2025 at 6:10=E2=80=AFPM Dylan Hatch <dylanbhatch@google.c=
om> wrote:
> >
> > To enable late module patching, livepatch modules need to be able to
> > apply some of their relocations well after being loaded. In this
> > scenario, use the text-poking API to allow this, even with
> > STRICT_MODULE_RWX.
> >
> > This patch is largely based off commit 88fc078a7a8f6 ("x86/module: Use
> > text_poke() for late relocations").
> >
> > Signed-off-by: Dylan Hatch <dylanbhatch@google.com>

Could you please share how you test this?

Thanks,
Song


> Acked-by: Song Liu <song@kernel.org>

