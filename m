Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C7ECD6E7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 15:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Cc:Subject:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SK9KuxS1ziFhMMC1VuJ1L9c3rL5t3987G0g0RIOVuXY=; b=nHCJnNXwPRvM9qLuAbMTJO2svn
	7MeteUfvB7sXMes4SX34P7aSFVcZ6aahDUi0gKXKdYkKgA/JDU/AIF4aqyiwZGQoPH/G1XOGgx1Cs
	YJ4PafP2mgUA7/X7YqGmL8L5MvQC1OejBjtwgRi5gQsfjSX++b/+HtHyhHB18o+fWpVjpGkz920ca
	SrUX5S7QFbI57dh8Ds5mhAl7NP+0tWs0CWW1Bj4+NuHjszanINCMG5oQOAtUF7mDHZzFBpneAJRMo
	hSyLTTcRKehXHf2xzKfNDTayE3dqR5zCRhvEqfU7WSUMlXNTMo7G/ZQ1BAfcAEms6KYzKGRoX0mw5
	EKdqsiyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVWog-00000000rYp-0T4S;
	Fri, 05 Jun 2026 15:50:38 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVWoc-00000000rYT-2WiW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 15:50:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D8384C58476;
	Fri,  5 Jun 2026 15:50:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 132FF5FED1;
	Fri,  5 Jun 2026 15:50:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 32D1B106A250B;
	Fri,  5 Jun 2026 17:50:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780674630; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SK9KuxS1ziFhMMC1VuJ1L9c3rL5t3987G0g0RIOVuXY=;
	b=El9/+tTcBzEyeAzQTFeFhzTs0NAXSig/ZmmOW1SkHrjIZN/GGwlVIMVAMjCgFkoboVMyT5
	GjqQxVRcv5LIvnYTgCxLDTFrCHFkkG9ZpREs9AebRMiO649TyfFEUKADbh5Xe/oUUqZ/ZX
	BBTHkMNYQzk5Yih1Piqd+yX310sr7lzevEA+8dCEFlH4D0j0NZqN8+zLzGEDToLFop1RjW
	dJgjW+AxMlIIi7Ao/uumGpK5HXwY6DuBuPOeSE+IvU4b2LCLeOVbgcDRJYvL98/D7m2469
	PNHd/uU5/VwmiNsRGylx6YZaYjEQwEVQYHCQyPImefg1ag9BSF3eIjhLakZsIA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Jun 2026 17:50:24 +0200
Message-Id: <DJ18H1FKONSJ.QNJHYMX6AW6B@bootlin.com>
To: "Yonghong Song" <yonghong.song@linux.dev>,
 =?utf-8?b?QWxleGlzIExvdGhvcsOpIChlQlBGIEZvdW5kYXRpb24p?=
 <alexis.lothore@bootlin.com>, "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Song Liu" <song@kernel.org>, "Jiri Olsa"
 <jolsa@kernel.org>, "John Fastabend" <john.fastabend@gmail.com>, "Thomas
 Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>, "Borislav
 Petkov" <bp@alien8.de>, "Dave Hansen" <dave.hansen@linux.intel.com>,
 <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "Shuah Khan"
 <shuah@kernel.org>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>
Subject: Re: [PATCH bpf-next v2 5/8] bpf, x86: emit KASAN checks into x86
 JITed programs
Cc: <ebpf@linuxfoundation.org>, "Bastien Curutchet"
 <bastien.curutchet@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260604-kasan-v2-0-c066e627fda8@bootlin.com>
 <20260604-kasan-v2-5-c066e627fda8@bootlin.com>
 <78009c06-4233-4e0a-88ec-33eba10ad8b3@linux.dev>
In-Reply-To: <78009c06-4233-4e0a-88ec-33eba10ad8b3@linux.dev>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_085034_825862_98C00749 
X-CRM114-Status: UNSURE (   9.50  )
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

Hi Yonghong,

On Fri Jun 5, 2026 at 4:54 PM CEST, Yonghong Song wrote:
>

[...]

>>   			if (BPF_MODE(insn->code) =3D=3D BPF_PROBE_MEMSX ||
>>   			    BPF_MODE(insn->code) =3D=3D BPF_MEMSX)
>> @@ -2592,13 +2622,13 @@ static int do_jit(struct bpf_verifier_env *env, =
struct bpf_prog *bpf_prog, int *
>>   			fallthrough;
>>   		case BPF_STX | BPF_ATOMIC | BPF_W:
>>   		case BPF_STX | BPF_ATOMIC | BPF_DW:
>> +			bool is64 =3D BPF_SIZE(insn->code) =3D=3D BPF_DW;
>> +			u32 real_src_reg =3D src_reg;
>> +			u32 real_dst_reg =3D dst_reg;
>
> With llvm23, I got the following build failure:
>
>      /home/yhs/work/bpf-next/arch/x86/net/bpf_jit_comp.c:2625:4: error:
>              label followed by a declaration is a C23 extension [-Werror,=
-Wc23-extensions]
>       2625 |                         bool is64 =3D BPF_SIZE(insn->code) =
=3D=3D BPF_DW;
>            |                         ^
>      1 error generated.
>
> The below is a fix:

Thanks for the test, the report and the fix. So this warning looks
specific to llvm23, as CI does not trigger it with LLVM21. I'll bring
the fix in in the next revision.

Alexis

--=20
Alexis Lothor=C3=A9, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


