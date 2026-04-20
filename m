Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02167F588DF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 14:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:
	Subject:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7iZB9lVR4tjlUQWISf4C9RaUtnMV6A5tolEZjLKPmq0=; b=Yw5Wb990yLjC3e9AlJad56dS6I
	OFtS8+UNm4DKPTxiLk/O8v1aHf0woaze9WeYRFTtdcdkyGC7dp2PEEfr5PO6Sfay/XFTwuIATjUTp
	SKYuIVG5eiZA9cWKDL72OYwAwyzp2IbROY1nQtsNDZ/Z5Bma9d3bw5x/8p4CWDSh94YEN9ZZ52B4L
	qmaF5kdRN09su2NGIcIMUKnnxXtCAQuOGmnTIdkvZJyBnzS+Q7Eak/56OEWxsy2CMGAEYvsIcZWq5
	4lFKCMXWBGhH2QclO60yHwZpHxpCe9iHrgHijeqkh6KMp++/ugEffbZWE5MQ41a3uBFsVjiOOCKNJ
	7FNFSjuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEpbC-00000007AqR-0WKz;
	Mon, 20 Apr 2026 14:27:42 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEpb8-00000007Apr-1zgE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 14:27:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 749361A3361;
	Mon, 20 Apr 2026 14:27:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4520E5FFA5;
	Mon, 20 Apr 2026 14:27:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D76FA104609E1;
	Mon, 20 Apr 2026 16:27:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776695251; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7iZB9lVR4tjlUQWISf4C9RaUtnMV6A5tolEZjLKPmq0=;
	b=cQx3iAWhs/KPT6ZKsayEJ77QUJ33XBAG/t0wnqcTpu3msayl+KXgWefDzyP6FHZbfakEkZ
	mUR9idudII95auF9BStFdEyg/ZfrWZJCELMf6aEJ9nJnKcF3lYW4yWiIbwvmeXqGWTpGmf
	6EF//PlEz9TgQjwnfV7Im08Tdi8PN2MJhTmQrHK3ZcYqVN+h4i1NR1PcJfySN2cwnhClDq
	928UAmnD/sIgSbP085aDV8aYk/2N8juRaUClIP5Mya/PjkZy+fiJZcnNXxg9mz4R2m4w41
	IRTL6ZhZmOioqx+JmCYgjuunP3yDG68/rxphRxpBvUN8z7Kr2df9dCBqhog1xw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Apr 2026 16:27:19 +0200
Message-Id: <DHY1WD3EUHEE.2R8PQXVKW6FO4@bootlin.com>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>, "Andrey Konovalov"
 <andreyknvl@gmail.com>
Subject: Re: [PATCH RFC bpf-next 1/8] kasan: expose generic kasan helpers
Cc: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>, "Alexei
 Starovoitov" <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "John Fastabend" <john.fastabend@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, "David Ahern" <dsahern@kernel.org>, "Thomas
 Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>, "Borislav
 Petkov" <bp@alien8.de>, "Dave Hansen" <dave.hansen@linux.intel.com>, "X86
 ML" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "Shuah Khan"
 <shuah@kernel.org>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>, "Andrey Ryabinin"
 <ryabinin.a.a@gmail.com>, "Alexander Potapenko" <glider@google.com>,
 "Dmitry Vyukov" <dvyukov@google.com>, "Vincenzo Frascino"
 <vincenzo.frascino@arm.com>, "Andrew Morton" <akpm@linux-foundation.org>,
 <ebpf@linuxfoundation.org>, "Bastien Curutchet"
 <bastien.curutchet@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Xu Kuohai" <xukuohai@huawei.com>, "bpf"
 <bpf@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>, "Network
 Development" <netdev@vger.kernel.org>, "open list:KERNEL SELFTEST
 FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel"
 <linux-arm-kernel@lists.infradead.org>, "kasan-dev"
 <kasan-dev@googlegroups.com>, "linux-mm" <linux-mm@kvack.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com>
 <20260413-kasan-v1-1-1a5831230821@bootlin.com>
 <CA+fCnZfubV6LgRjO3NQvhrG2Q5o0ftkFFupLWVYS50XDnmCaog@mail.gmail.com>
 <DHSWK17EZUDP.GIJ6BX2NFR6U@bootlin.com>
 <CAADnVQLJ=fJ7t1i2+_RYqU1gqYqiLP9Zrwo4vdZsgzjK_yzJTQ@mail.gmail.com>
 <CA+fCnZd31GzdpEqR8VhfK4JtUKyyRMgbBoAbeGACJgm7WvB6Vw@mail.gmail.com>
 <CAADnVQKv5y+gq=TnOAEXSqgBRpmHNjwqCfxpLaw5XkcbQ+23bg@mail.gmail.com>
 <CA+fCnZe-b0Qqbo5gGv3HN20twquQETDfYYkE1r9tPr9zUFbW9Q@mail.gmail.com>
 <CAADnVQKuptG_opA12O=Xb9_+cHf3f=ycAZdfUp17P2HBYQzdsg@mail.gmail.com>
In-Reply-To: <CAADnVQKuptG_opA12O=Xb9_+cHf3f=ycAZdfUp17P2HBYQzdsg@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_072738_867669_E49BF062 
X-CRM114-Status: GOOD (  25.55  )
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

On Mon Apr 20, 2026 at 12:51 AM CEST, Alexei Starovoitov wrote:
> On Sun, Apr 19, 2026 at 2:49=E2=80=AFPM Andrey Konovalov <andreyknvl@gmai=
l.com> wrote:
>>
>> On Tue, Apr 14, 2026 at 5:58=E2=80=AFPM Alexei Starovoitov
>> <alexei.starovoitov@gmail.com> wrote:
>> >
>> > I think we're talking past each other.
>> > We're not interested in KASAN_SW_TAGS or KASAN_HW_TAGS.
>> > We're not going to modify arm64 JIT at all.
>> >
>> > This is purely KASAN_GENRIC and only on x86-64.
>> > JIT will emit exactly what compilers emit for generic
>> > which is __asan_load/store. This is as stable ABI as it can get
>> > and we don't want to deviate from it.
>>
>> OK, I supposed that's fair. You did throw me off point with your
>> performance comment. But if you decide to add SW_TAGS support at some
>> point, I think this discussion needs to be revisited.
>>
>> But please add a comment saying that those functions are only exposed
>> for BPF JIT and they are not supposed to be used by other parts of the
>> kernel. And in case you do end up adding a new config option, guard
>> the public declarations by a corresponding ifdef.
>
> I feel concerns of misuse are overblown.
> Being in include/linux/kasan.h doesn't make them free-for-all
> all of a sudden, but if you prefer we can just copy paste:
> +void __asan_load1(void *p);
> +void __asan_store1(void *p);
> into bpf_jit_comp.c

That's actually what I initially went with when working on this, but it
did look a bit fragile, and suspected that I would rather be asked to expor=
t
them properly through a dedicated header. I'm fine with putting back the
manual declarations in jit comp, though.

>
>> > The goal here is to find bugs in the verifier.
>> > If something got past it, that shouldn't have,
>> > kasan generic on x86-64 is enough.
>>
>> FWIW, I suspect HW_TAGS KASAN already just works with JITed BPF code.
>
> Ohh. Good point. Looks like modern arm64 cpus in public clouds
> don't have that enabled, so one would need pixel phone to
> catch verifier bugs via hw_tags.
> So we still need this x86-specific jit kasan.
> I guess eventually it can be removed when hw_tags support is widespread.




--=20
Alexis Lothor=C3=A9, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


