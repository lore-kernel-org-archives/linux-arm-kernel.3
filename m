Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B99F9D0F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 20:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:To:From:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L8bWJr7FXUdlTXBxL69DdsJ20JowQnELYHkBWQ0j71o=; b=SgkfaqZ4D1Sp10jQkR0AP4tfGI
	xzSvdsqlGqEvrzJBD0SDfiHqUvqwCQJQVQhzZ7+RVk0WKc7Qz38OeQn6p+Z5Wz50QuGN8zR64eEnW
	lU7sy82EGU+bTAm+FqI8t6QR48jrli5urpj+PdgA2zucEhz+N3VoSv1EALAwVA50gUDrDhBueeiFl
	zVXLZCAyWQ+xAFwMU5ko9pcRlI3SlvqZsl90jFo3JS9CycfD7oTgA/J57ljk5QyAdsvwoNyOmqm5H
	6gbKYkblZuSKRL1PTSKALvQC+rbGz+MzT+ITLNTMLjwoseBmTnVhSPmWIgG/kssC6dS8YO/I/NKjx
	YxLA37yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCkce-00000000CyA-0cF8;
	Tue, 14 Apr 2026 20:44:36 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCkca-00000000Cxj-0Jbo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 20:44:34 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 36C6FC5AAB7;
	Tue, 14 Apr 2026 20:45:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CCCED60410;
	Tue, 14 Apr 2026 20:44:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4D13710450F98;
	Tue, 14 Apr 2026 22:44:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776199466; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=L8bWJr7FXUdlTXBxL69DdsJ20JowQnELYHkBWQ0j71o=;
	b=tp0oFwTf5VHzsnEQcoI6YFXubpXr48s6UWlXK4aDR8EDMSSF+/OjNf6hUwJE2BAbHAdgPz
	v2f4A8tTxVtK7dqJZfFAdjP+hWDl0Fam9eGGy91tNDrdqr1jGCVU5mlUKQsx7dKkw5Fj/o
	8xB9Inm9XOYYzG+OqKhmNW03MF+ALRZMBSynxDWIF5QBxopuN97KxRbIxhOyfKSB9o6wkS
	91454gD3J6J7wN/TaEOT0JgO64Dp+ztksnjtLIOwoMGIkVJ9RQPJZYo6iGmJA9iAtEHlyl
	YSu689PmkWekOvBlF+bpB2iuXK1nNSBHe1tFVeClAIGo4vy+Vjuo6lCfP898kw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Apr 2026 22:44:13 +0200
Message-Id: <DHT65O6DS001.14GNQMXFJZHTN@bootlin.com>
Cc: "Andrey Konovalov" <andreyknvl@gmail.com>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>,
 "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "John Fastabend"
 <john.fastabend@gmail.com>, "David S. Miller" <davem@davemloft.net>, "David
 Ahern" <dsahern@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>, "Ingo
 Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>, "Dave Hansen"
 <dave.hansen@linux.intel.com>, "X86 ML" <x86@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, "Shuah Khan" <shuah@kernel.org>, "Maxime Coquelin"
 <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Andrey Ryabinin" <ryabinin.a.a@gmail.com>,
 "Alexander Potapenko" <glider@google.com>, "Dmitry Vyukov"
 <dvyukov@google.com>, "Vincenzo Frascino" <vincenzo.frascino@arm.com>,
 "Andrew Morton" <akpm@linux-foundation.org>, <ebpf@linuxfoundation.org>,
 "Bastien Curutchet" <bastien.curutchet@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Xu Kuohai" <xukuohai@huawei.com>, "bpf"
 <bpf@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>, "Network
 Development" <netdev@vger.kernel.org>, "open list:KERNEL SELFTEST
 FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel"
 <linux-arm-kernel@lists.infradead.org>, "kasan-dev"
 <kasan-dev@googlegroups.com>, "linux-mm" <linux-mm@kvack.org>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Subject: Re: [PATCH RFC bpf-next 1/8] kasan: expose generic kasan helpers
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com>
 <20260413-kasan-v1-1-1a5831230821@bootlin.com>
 <CA+fCnZfubV6LgRjO3NQvhrG2Q5o0ftkFFupLWVYS50XDnmCaog@mail.gmail.com>
 <DHSWK17EZUDP.GIJ6BX2NFR6U@bootlin.com>
 <CAADnVQLJ=fJ7t1i2+_RYqU1gqYqiLP9Zrwo4vdZsgzjK_yzJTQ@mail.gmail.com>
 <DHT3JV7GTOBL.29205LGGNEDSH@bootlin.com>
 <CAADnVQ+c9h_wuNwj8pjx885oNErGY7bxxCwKi+DiJ0XKSpyYfg@mail.gmail.com>
In-Reply-To: <CAADnVQ+c9h_wuNwj8pjx885oNErGY7bxxCwKi+DiJ0XKSpyYfg@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_134432_403136_90A1F050 
X-CRM114-Status: GOOD (  17.00  )
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

On Tue Apr 14, 2026 at 9:16 PM CEST, Alexei Starovoitov wrote:
> On Tue, Apr 14, 2026 at 11:41=E2=80=AFAM Alexis Lothor=C3=A9
> <alexis.lothore@bootlin.com> wrote:
>>
>> On Tue Apr 14, 2026 at 4:36 PM CEST, Alexei Starovoitov wrote:
>> > On Tue, Apr 14, 2026 at 6:13=E2=80=AFAM Alexis Lothor=C3=A9
>> > <alexis.lothore@bootlin.com> wrote:
>> >>
>> >> Hi Andrey, thanks for the prompt review !

[...]

>> > No. The performance penalty will be too high.
>>
>> Since we are mentioning it, I did not consider yet any performance
>> comparision/benchmarking (and I am not really familiar with usual bpf
>> performance validation practices for new bpf features). Is there any
>> existing test I should take a look at for this ? Maybe some specific
>> benches in tools/testing/selftests/bpf/bench ?
>
> So far everything in bpf/bench/ measures bpf infra like
> maps, kprobes, tracepoints, etc.
> We don't have benchmarks for bpf programs.
> So we don't know how well JITs are generating code
> and how much inlining done by the verifier, JITs actually helps.
>
> Puranjay is working on creating a SPECint like set of benchmarks.
>
> For this kasan work we should make the best decisions from
> performance point of view, like not wasting unnecessary call
> and not saving unnecessary registers. btw in the other patch
> I think you can skip saving of r10 and r11.

Noted, I'll do some checks and tests without those two.

> But we cannot quantify yet that avoiding extra call gives us N%.
>
> You can micro-benchmark, of course, but gotta be careful
> interpreting the results. It might be too easy to get into
> thinking that JIT must inline __asan_load() for the sake of performance.

Ok, interesting, thanks for those details

Alexis

--=20
Alexis Lothor=C3=A9, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


