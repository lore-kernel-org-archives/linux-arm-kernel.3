Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F2DC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 20:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b4S5NohzcZt8hjZWHfp8WHteVctUQSoPl0lKofU3tDA=; b=mNAsdftfT3u3P6s4hUEzQ3vzpO
	dwapTezN6uvmRzluo6Rw4PWnBMlVoacEdTWn7uGhKEcjelSvaUrFepAFwTf9q082Dh/LyqNHHHV/v
	NZrMldZynm59Ik+PERpLURtRttzsDUjECYvH1sKpFokQMDXRcVC28F+LKtt2+0wd8rTCqrUvY5lve
	9kbXOD/meD90fV5cXDJCeDaxufR1kqvMsd6U2cZ+KC3ANk+E5hV0eQSZeHgECiB7tiK3TcZ4dPkNr
	HGnXNosbTPQPRa8v9SVJFiI/MEnOdw2YTXUW/s8ITOHkA+9EK1xETxmHz7aeHGKxAR3EMUFmZEwee
	W0/otQtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9VQT-00000007Vda-1Zs3;
	Mon, 28 Apr 2025 20:50:05 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9VHz-00000007Unj-3ZqC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 20:41:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5B548438B9;
	Mon, 28 Apr 2025 20:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745872876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b4S5NohzcZt8hjZWHfp8WHteVctUQSoPl0lKofU3tDA=;
	b=aKaQLhaISwSMkAlavm0KAhgbL2bv1f7sjgQSBKhWkB3EbQh+EF8u7bEF4eAVxMVarACoFw
	xFdlkcS3HVdC9Xqk7e/Bby0QzpfLuppbosJROUureXUuEzaXySDxfm2SC7blF/WcjwaFY5
	4JWfDaNu9g1yK3AOxPq5ZbYZazSAng+4Dn9TCwM7YhGabMo+iT/zE0Og4JCTK+lFypYNqP
	sWvVj0apUgJpkdZgbzLKpMw+yFUXoFw1wfNEDwuGlmGBiWoxUBjno0DyVJ7ENZ8cQt8QyH
	I63KthotL9d/f85B4/Da4IaFzVzGAcdpqvc5CiQj5Ryvcmx8qCOlftgukfq+ZA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Apr 2025 22:41:13 +0200
Message-Id: <D9IKA5K8PFAO.21V0PXVU6VPF1@bootlin.com>
Cc: "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "John Fastabend" <john.fastabend@gmail.com>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "KP Singh" <kpsingh@kernel.org>, "Stanislav
 Fomichev" <sdf@fomichev.me>, "Hao Luo" <haoluo@google.com>, "Jiri Olsa"
 <jolsa@kernel.org>, "Puranjay Mohan" <puranjay@kernel.org>, "Xu Kuohai"
 <xukuohai@huaweicloud.com>, "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Mykola Lysenko" <mykolal@fb.com>, "Shuah
 Khan" <shuah@kernel.org>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>, "Florent Revest"
 <revest@chromium.org>, "Bastien Curutchet" <bastien.curutchet@bootlin.com>,
 <ebpf@linuxfoundation.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kselftest@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [PATCH RFC bpf-next 3/4] bpf/selftests: add tests to validate
 proper arguments alignment on ARM64
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Eduard Zingerman" <eddyz87@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com>
 <20250411-many_args_arm64-v1-3-0a32fe72339e@bootlin.com>
 <3a16fae0346d4f733fb1a67ae6420d8bf935dbd8.camel@gmail.com>
 <D9I6TQN2I6B1.QC4FFHEWAURZ@bootlin.com> <m21ptcmdnw.fsf@gmail.com>
In-Reply-To: <m21ptcmdnw.fsf@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieduleegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvefuhffvofhfjgesthhqredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhoruceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffvddufffhieffheetfffggeeugedtieduheeilefguddvheegvdeuffeuveeltdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvledprhgtphhtthhopegvugguhiiikeejsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghstheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrnhhivghlsehiohhgvggrrhgsohigrdhnvghtpdhrtghpthhtohepjhhohhhnrdhfrghsthgrsggvn
 hgusehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghnughrihhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrghrthhinhdrlhgruheslhhinhhugidruggvvhdprhgtphhtthhopehsohhngheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohephihonhhghhhonhhgrdhsohhngheslhhinhhugidruggvvh
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_134120_813885_E8B1E749 
X-CRM114-Status: GOOD (  20.67  )
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

On Mon Apr 28, 2025 at 6:52 PM CEST, Eduard Zingerman wrote:
> Alexis Lothor=C3=A9 <alexis.lothore@bootlin.com> writes:
>
> [...]
>
>>> The function listened to is defined as accepting 'struct bpf_testmod_st=
ruct_arg_7',
>>> at the same time this function uses 'struct bpf_testmod_struct_arg_5'.
>>
>> That's not an accidental mistake, those are in fact the same definition.
>> bpf_testmod_struct_arg_7 is the kernel side definition in bpf_testmod.c:
>>
>> struct bpf_testmod_struct_arg_7 {
>> 	__int128 a;
>> };
>>
>> and struct bpf_testmode_struct_arg_5 is the one defined in the bpf test
>> program:
>>
>> struct bpf_testmod_struct_arg_5 {
>> 	__int128 a;
>> };
>
> Apologies, but I'm still confused:
> - I apply this series on top of:
>   224ee86639f5 ("Merge git://git.kernel.org/pub/scm/linux/kernel/git/bpf/=
bpf after rc4")
>
> - line 12 of tracing_struct_many_args.c has the following definition:
>
>   struct bpf_testmod_struct_arg_5 {
>          char a;
>          short b;
>          int c;
>          long d;
>   };
>
> - line 135 of the same file has the following definition:
>
>    SEC("fentry/bpf_testmod_test_struct_arg_11")
>    int BPF_PROG2(test_struct_many_args_9, struct bpf_testmod_struct_arg_5=
, a,
>                  struct bpf_testmod_struct_arg_5, b,
>                  struct bpf_testmod_struct_arg_5, c,
>                  struct bpf_testmod_struct_arg_5, d, int, e,
>                  struct bpf_testmod_struct_arg_5, f)
>
> - line 70 of tools/testing/selftests/bpf/test_kmods/bpf_testmod.c:
>
>    struct bpf_testmod_struct_arg_7 {
>          __int128 a;
>    };
>
> - line 152 of the same file:
>
>   noinline int bpf_testmod_test_struct_arg_11(struct bpf_testmod_struct_a=
rg_7 a,
>                                               struct bpf_testmod_struct_a=
rg_7 b,
>                                               struct bpf_testmod_struct_a=
rg_7 c,
>                                               struct bpf_testmod_struct_a=
rg_7 d,
>                                               short e,
>                                               struct bpf_testmod_struct_a=
rg_7 f)
>
> Do I use a wrong base to apply the series?

Argh, no, no, you are right, I checked again and I made some confusions
between progs/tracing_struct.c and progs/tracing_struct_many_args.c. I
initially did most of the work in tracing_struct.c, and eventually moved
the code to tracing_struct_many_args.c before sending my series, but I
apparently forgot to move bpf_testmod_struct_arg_5 declaration in
tracing_struct_many_args.c (and so, to rename it, since this name is
already used in there). As a consequence the bpf program is actually using
the wrong struct layout. So thanks for insisting and spotting this issue !

I fixed my mess locally in order to re-run the gdb analysis mentioned in my
previous mail, and the bug seems to be the same (unexpected t11:f: actual
35 !=3D expected 43), with the same layout issue on the bpf context passed =
on
the stack ("lucky" mistake ?). However, thinking more about this, I feel
like there is still something that I have missed:

0xffffc900001dbce8:     38      0       0       0       0       0       0  =
     0
0xffffc900001dbcf0:     0       0       0       0       0       0       0  =
     0
0xffffc900001dbcf8:     39      0       0       0       0       0       0  =
     0
0xffffc900001dbd00:     0       0       0       0       0       0       0  =
     0
0xffffc900001dbd08:     40      0       0       0       0       0       0  =
     0
0xffffc900001dbd10:     0       0       0       0       0       0       0  =
     0
0xffffc900001dbd18:     41      0       0       0       0       0       0  =
     0
0xffffc900001dbd20:     0       0       0       0       0       0       0  =
     0
0xffffffffc04016a6:     42      0       0       0       0       0       0  =
     0
0xffffc900001dbd30:     35      0       0       0       0       0       0  =
     0
0xffffc900001dbd38:     43      0       0       0       0       0       0  =
     0
0xffffc900001dbd40:     37      0       0       0       0       0       0  =
     0

If things really behaved correctly, f would not have the correct value but
would still be handled as a 16 bytes value, so the test would not fail with
"actual 35 !=3D 43", but something like "actual
27254487904906932132179118915584 !=3D 43" (43 << 64 | 35) I guess. I still
need to sort this out.

Alexis
--=20
Alexis Lothor=C3=A9, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


