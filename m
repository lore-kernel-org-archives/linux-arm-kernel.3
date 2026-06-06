Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6796CD8C8E
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Jun 2026 08:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:
	Subject:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bt0Rpwdmhi3tP2g6vq+0m6jbqp4BA+UUcba7I2nnpu8=; b=avcKAOTtBQwtxseiXTRHLZDT1O
	/EF9ypmTGvMSreZeQWyu7LsbxIGzgvc7RHOVog1/lO1UIfbzAsVAFiStahJuHyM8fjEg70Rsira0K
	wD6q6bwfhEnCOEP8KI7OTMEW7+658Yj/7o3Ih0D1FUDCfFLzNf5VuAqODQkughSyg/RAK9lhqsTag
	kNkRGZXSsrBMgViQFm0GCq0Qi5toKTnkeyV+xb0/R9JxsRZRxxxvLTTNWXeu7nXPAM2/hHj/k2gWd
	lVlpu4Xo6BXudXeAepE7i4M6+w3EwDwVOu+AhzAx16F8X4M+h1Qe019hlF25oyHNo/yrTJdU02Kl1
	6QdpC1dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVmlC-00000001WuA-252p;
	Sat, 06 Jun 2026 08:52:06 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVml8-00000001Wte-0siO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Jun 2026 08:52:04 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EF77A4E40923;
	Sat,  6 Jun 2026 08:51:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A7B285FF0F;
	Sat,  6 Jun 2026 08:51:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 95DEA106A264A;
	Sat,  6 Jun 2026 10:51:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780735917; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bt0Rpwdmhi3tP2g6vq+0m6jbqp4BA+UUcba7I2nnpu8=;
	b=XW/UZLANsbxFOVp9pW/jMl3pmKtyerySaLVvM9tsqfgS9C2kdf8LpIjycJRE4qfj4dX/5o
	IiSMlIBRoLGreB7D9SIgo+GPxVN46Gipxojkpy5xpbWQ5HhXJfhcdMnd1fIG5rzFKZbuv3
	J32INZbh5I0MYcFCKlmZRtH3PPlolwUhQa5hKlZVF/Zpi/wBri8PakIn1876IzBPFKljC9
	hro6Nr2se1w1xIIxTxhMEKprKFjLqDK9kWzeBdy6D4ElHCIdPMGqicCR/JUMimKVWtGeDY
	/nHgoIPLN15A5tnOdC9igeSwywCgNlj0j1ViIKwQumFNc6Uapcdizf8glNjRqA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 06 Jun 2026 10:51:45 +0200
Message-Id: <DJ1U71MEBQDQ.2PHD22ZTTV64B@bootlin.com>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Yonghong Song" <yonghong.song@linux.dev>,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>, "Alexei
 Starovoitov" <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>, "Song Liu" <song@kernel.org>, "Jiri
 Olsa" <jolsa@kernel.org>, "John Fastabend" <john.fastabend@gmail.com>,
 "Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>, "Dave Hansen"
 <dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, "Shuah Khan" <shuah@kernel.org>, "Maxime Coquelin"
 <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Ihor Solodrai" <ihor.solodrai@linux.dev>
Subject: Re: [PATCH bpf-next v2 8/8] selftests/bpf: add tests to validate
 KASAN on JIT programs
Cc: <ebpf@linuxfoundation.org>, "Bastien Curutchet"
 <bastien.curutchet@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260604-kasan-v2-0-c066e627fda8@bootlin.com>
 <20260604-kasan-v2-8-c066e627fda8@bootlin.com>
 <13b87293-5237-43d3-9f91-33c13041cb43@linux.dev>
 <DJ18PD6QWGA2.2HOYGKU7RUB68@bootlin.com>
 <f73d0971-0544-4a92-bde7-b2fbfcdaf28b@linux.dev>
 <DJ1EYKOXV11H.25EJOUKFI81T4@bootlin.com>
 <d717e193-f3b3-4022-8b0f-5e94595dd69b@linux.dev>
In-Reply-To: <d717e193-f3b3-4022-8b0f-5e94595dd69b@linux.dev>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260606_015202_405274_F9CDEFCB 
X-CRM114-Status: UNSURE (   8.65  )
X-CRM114-Notice: Please train this message.
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

On Sat Jun 6, 2026 at 6:09 AM CEST, Yonghong Song wrote:

[...]

>>> But when I am running another same test './test_progs -t kasan', there =
is no kasan reports.
>> Ok, I guess you are missing kasan_multi_shot on your kernel command
>> line: without this option, only the first report is generated, then
>> KASAN does not emit additional report until you restart your kernel.
>> Could you please try adding it and running the tests again ?
>
> Thanks! Adding 'kasan_multi_shot' to the kernel command line indeed fixed=
 the problem.
> It would be great if you can mention 'kasan_multi_shot' is needed in kern=
el command
> line in cover letter and in patch 8.

Yes, that's definitely missing, I'll make sure to add it. Thanks again
for the test !

Alexis
--=20
Alexis Lothor=C3=A9, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


