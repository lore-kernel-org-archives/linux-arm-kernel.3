Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E676F9D0CE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 13:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ljtr9WPSUnaAjZD/FtGwji3II/sbFJuzXTsBaHKsQSU=; b=Ov31hNXzXOintjVYnDtOjKiG6U
	bqOw+pVYcTRcOQa+iHjEU1J1pFFbhdQRG3xYkvoNWV7svFqi0ChAk5ahYblhitoUGRsjEBH1+dzg6
	Z3KBZibMtjz/xwGHvnNeks73wCzzTLeDatSTMYzaw+b3JakWBxQOin1L+AFU3ehq2OFEzuWsoeTEO
	EjHvrcTi8veyClLGa1tbsJS1i7EQfAxq1tWmWI21P1axGTFxHaPATf7XLgdXFXR+fctYkZvi21R/V
	OOzV6CRym8tXJCEUDS7+zqGPrSgnpw7j5RmOALGp2q2I4bb7uR2Z+OADVngr6LwDTNpfGO8cZtlz4
	339WcNAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdZk-0000000HLq3-0Koo;
	Tue, 14 Apr 2026 13:13:08 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdZg-0000000HLpW-3HGl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 13:13:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 932294E429EC;
	Tue, 14 Apr 2026 13:13:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 46E3160410;
	Tue, 14 Apr 2026 13:13:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 569A6104500A2;
	Tue, 14 Apr 2026 15:12:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776172379; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ljtr9WPSUnaAjZD/FtGwji3II/sbFJuzXTsBaHKsQSU=;
	b=lhDeNvog7+cXfwfKejAzO+yVIre7KeKOh4nxhyYR84tw7Qhs4CDNLFYshF/sNo/ddcHeul
	OAXDnRRPYFfdKmNFr6FNXLWBgkwR5bSerHfi1jG3QAuxmeyq9DKVn4ADpvD+k/LktKcxCV
	Qo+C51KQYvBPk2tQWgzerrUX38wX8fl9mns5nowg6aBHUe0QUCDETlFcTsN3Vd+g6AhDW1
	t0+PPdVn0VXoKLO/NdWsu8xr8pa5SfFsPWlNHjagwF2HUg4Jwz/bTTtoEDbu5jNS5UXcqe
	/1a7m2ycQR5Rypiiam1nxF1Kid65dAD8mzMdsDqIpVAnb6rsDVnu+pzT2qXnlw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Apr 2026 15:12:47 +0200
Message-Id: <DHSWK17EZUDP.GIJ6BX2NFR6U@bootlin.com>
Subject: Re: [PATCH RFC bpf-next 1/8] kasan: expose generic kasan helpers
Cc: "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "John Fastabend" <john.fastabend@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, "David Ahern" <dsahern@kernel.org>, "Thomas
 Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>, "Borislav
 Petkov" <bp@alien8.de>, "Dave Hansen" <dave.hansen@linux.intel.com>,
 <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "Shuah Khan"
 <shuah@kernel.org>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>, "Andrey Ryabinin"
 <ryabinin.a.a@gmail.com>, "Alexander Potapenko" <glider@google.com>,
 "Dmitry Vyukov" <dvyukov@google.com>, "Vincenzo Frascino"
 <vincenzo.frascino@arm.com>, "Andrew Morton" <akpm@linux-foundation.org>,
 <ebpf@linuxfoundation.org>, "Bastien Curutchet"
 <bastien.curutchet@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Xu Kuohai" <xukuohai@huawei.com>,
 <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <kasan-dev@googlegroups.com>,
 <linux-mm@kvack.org>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Andrey Konovalov" <andreyknvl@gmail.com>,
 =?utf-8?b?QWxleGlzIExvdGhvcsOpIChlQlBGIEZvdW5kYXRpb24p?=
 <alexis.lothore@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com>
 <20260413-kasan-v1-1-1a5831230821@bootlin.com>
 <CA+fCnZfubV6LgRjO3NQvhrG2Q5o0ftkFFupLWVYS50XDnmCaog@mail.gmail.com>
In-Reply-To: <CA+fCnZfubV6LgRjO3NQvhrG2Q5o0ftkFFupLWVYS50XDnmCaog@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_061304_984121_3670DECD 
X-CRM114-Status: GOOD (  12.52  )
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

Hi Andrey, thanks for the prompt review !

On Tue Apr 14, 2026 at 12:19 AM CEST, Andrey Konovalov wrote:
> On Mon, Apr 13, 2026 at 8:29=E2=80=AFPM Alexis Lothor=C3=A9 (eBPF Foundat=
ion)
> <alexis.lothore@bootlin.com> wrote:
>>

[...]

>> +#ifdef CONFIG_KASAN_GENERIC
>> +void __asan_load1(void *p);
>> +void __asan_store1(void *p);
>> +void __asan_load2(void *p);
>> +void __asan_store2(void *p);
>> +void __asan_load4(void *p);
>> +void __asan_store4(void *p);
>> +void __asan_load8(void *p);
>> +void __asan_store8(void *p);
>> +void __asan_load16(void *p);
>> +void __asan_store16(void *p);
>> +#endif /* CONFIG_KASAN_GENERIC */
>
> This looks ugly, let's not do this unless it's really required.
>
> You can just use kasan_check_read/write() instead - these are public
> wrappers around the same shadow memory checking functions. And they
> also work with the SW_TAGS mode, in case the BPF would want to use
> that mode at some point. (For HW_TAGS, we only have kasan_check_byte()
> that checks a single byte, but it can be extended in the future if
> required to be used by BPF.)

ACK, I'll try to use those kasan_check_read and kasan_check_write rather
than __asan_{load,store}X.

Alexis

--=20
Alexis Lothor=C3=A9, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


