Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC772C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 07:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2+a4tmR/A6ANRwQiGU6A/fzxxPhMQUHBWtsMGAxzq3M=; b=ObJLohpBuRv6fvThDsoXKliQ3s
	muU7u2M1/8QqoWrCogfgWC2LPsI3OXFhrvtHZCWIbxRjiv3nsns+SIetd9hTzSfvNvO+gXa/EpOT+
	BS/69GaaviQ1i3pWX+DUbteIK9BPirYNmY2Us2rEpBkYJTT+wRDh76hrJgKEoEnhU8zUWas7BY6a5
	W4aunbb4FkgsdBAgJ+qkB3CzQOyYjcM8KOQe6JxibZJJPlyxwosiwyNY0fR4AsO8/pUBQmcU9byCt
	f6H4my8q4frnKk+fPuGwk2W1d8hiXbNxgdUMz4jzIhGGFF0L33OHXIL4jBn9O8PIbO2PA+35Q6g6S
	XXcsBvkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNRoO-0000000HL7L-2doI;
	Fri, 06 Jun 2025 07:48:24 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNRm8-0000000HKqF-3tA5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 07:46:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3B90F442AE;
	Fri,  6 Jun 2025 07:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749195958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2+a4tmR/A6ANRwQiGU6A/fzxxPhMQUHBWtsMGAxzq3M=;
	b=FbcBo+GO49Gf4nun+ACzzLWBd7hkcSEKiitgBAVSvqrZiijkTwKBI0uSbwLisokMQt1oD+
	qDpcmFva4f3cqTdmgZTVwjY61/BXc4vuqQM3UzFLSJA5BHlVsHBzlkMa9vTg4KcETJp+sN
	yJ66JPB2utPtj9hgCyWKd57/wxZ5BfRrnZsHixXZxwynbcCfBEycAPgZefFV2OAm0YTuas
	03uBMg5uX+ZbI/KYG2jwsizN8uEb5UQkZOnTwidlDSIdxRgZlDTKmOukYH8rdpD319jPgf
	pGQzZuy3BZ0YrMvdehF+RGesgL2H5RIPdqFTxOZoAKNvQrWWKZLxSK8NJxAAGQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Jun 2025 09:45:51 +0200
Message-Id: <DAFA7QSTVFQF.3MG5408HBVNT7@bootlin.com>
Cc: "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Andrii Nakryiko"
 <andrii.nakryiko@gmail.com>, "Alexei Starovoitov" <ast@kernel.org>, "Daniel
 Borkmann" <daniel@iogearbox.net>, "John Fastabend"
 <john.fastabend@gmail.com>, "Andrii Nakryiko" <andrii@kernel.org>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Song Liu" <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>,
 "KP Singh" <kpsingh@kernel.org>, "Stanislav Fomichev" <sdf@fomichev.me>,
 "Hao Luo" <haoluo@google.com>, "Jiri Olsa" <jolsa@kernel.org>, "Puranjay
 Mohan" <puranjay@kernel.org>, "Xu Kuohai" <xukuohai@huaweicloud.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon"
 <will@kernel.org>, "Mykola Lysenko" <mykolal@fb.com>, "Shuah Khan"
 <shuah@kernel.org>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>, "Florent Revest"
 <revest@chromium.org>, "Bastien Curutchet" <bastien.curutchet@bootlin.com>,
 <ebpf@linuxfoundation.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "bpf" <bpf@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel"
 <linux-arm-kernel@lists.infradead.org>, "open list:KERNEL SELFTEST
 FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <dwarves@vger.kernel.org>
Subject: Re: [Question] attributes encoding in BTF
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com>
 <20250411-many_args_arm64-v1-1-0a32fe72339e@bootlin.com>
 <CAEf4Bzbn6BdXTOb0dTcsQmOMZpp5=DzGS2hHHQ3+dwcja=gv+w@mail.gmail.com>
 <D98Q8BRNUVS9.11J60C67L1ALR@bootlin.com>
 <CAEf4BzZHMYyGDZ4c4eNXG7Fm=ecxCCbKhKbQTbCjvWmKtdwvBw@mail.gmail.com>
 <D9E9IQQ3QKXM.3UJ17G9CBS1FH@bootlin.com>
 <DADMLIVHMSSO.3AXSI5216WCT6@bootlin.com>
 <9a2ba0ad-b34d-42f8-89a6-d9a44f007bdc@linux.dev>
 <DAEFD2WH7HRV.2SOG9Q00QSEXH@bootlin.com>
 <CAADnVQ+T_s6dAwJ5JKqNqA8tq1P+MdfPvPw0EoY5yOf8PnGT4g@mail.gmail.com>
In-Reply-To: <CAADnVQ+T_s6dAwJ5JKqNqA8tq1P+MdfPvPw0EoY5yOf8PnGT4g@mail.gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdegjeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvefuhffvofhfjgesthhqredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhoruceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelkeehiefhfeehvefhtdegueelkeehffffffeuvdekkeekuddvueeguefgieeukeenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdduvddruddthedrudehtddrvdehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvuddvrddutdehrdduhedtrddvhedvpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfeefpdhrtghpthhtoheprghlvgigvghirdhsthgrrhhovhhoihhtohhvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepihhhohhrrdhsohhlohgurhgriheslhhinhhugidruggvvhdprhgtphhtthhopegrnhgurhhiihdrnhgrkhhrhihikhhosehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghstheskhgvrhhnvghlrdhorhhgpdhrt
 ghpthhtohepuggrnhhivghlsehiohhgvggrrhgsohigrdhnvghtpdhrtghpthhtohepjhhohhhnrdhfrghsthgrsggvnhgusehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghnughrihhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrghrthhinhdrlhgruheslhhinhhugidruggvvh
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_004605_595546_9D197ADA 
X-CRM114-Status: GOOD (  16.59  )
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

Hi Alexei,

On Thu Jun 5, 2025 at 6:09 PM CEST, Alexei Starovoitov wrote:
> On Thu, Jun 5, 2025 at 12:35=E2=80=AFAM Alexis Lothor=C3=A9
> <alexis.lothore@bootlin.com> wrote:
>>
>> Hi Ihor,
>>
>> On Wed Jun 4, 2025 at 7:31 PM CEST, Ihor Solodrai wrote:
>> > On 6/4/25 2:02 AM, Alexis Lothor=C3=83=C2=A9 wrote:

[...]

>> Thanks for the details ! I have missed this possibility, as I have been
>> assuming that DWARF info was exposing the needed info. I'll take a look =
at
>> it, but if those attributes can not be represented by DWARF, I'll have t=
o
>> find another way of getting those packing/alignment modifications on dat=
a
>> type (eg: re-use/share btf__align_of from libbpf, as suggested by Andrii=
,
>> but it may not able to cover all cases).
>
> Not sure all the trouble is worth it.
> I feel it's a corner case. Something we don't need to fix.

TBH I don't own any specific use case really needing this handling, so if
it does not feel worth the trouble, I'm fine with not trying to support
this. My effort is rather motivated by the goal of aligning the ARM64
features with other platform, and so of getting rid of
tools/testing/selftests/bpf/DENYLIST.aarch64.

For the record, this effort also showed that the same kind of issue affects
other platforms already supporting many args + structs passed by value ([1]=
)
- structs alignment with specific alignment constraints are not
  specifically handled (eg: a struct with an __int128 as a top-level
  member, leading to a 16 byte alignment requirement)
- packing and custom alignment is not handled

From there, I could do two different things:
1. do nothing, keep ARM64 as-is with the current version which has been
  recently merged: ARM64 then denies attachment to any function trying to
  pass a struct by value on stack. We keep the tracing_struct tests denied
  for ARM64. Other platforms still allow to attach such functions, but may
  be parsing wrongly arguments in those specific cases.
2. add the constraint applied on ARM64 (refusing attachment when structs ar=
e
  passed through stack) to other JIT compilers. Then update the
  tracing_struct test to ensure this specific case is properly denied on
  all platforms to avoid risking reading wrongly arguments passed through
  stack when structs or large types are involved.

I tend to think 2. is better, but let me know if you have a different
opinion here.

Thanks,

Alexis

--=20
Alexis Lothor=C3=A9, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


