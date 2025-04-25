Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A463C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 08:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Content-Transfer-Encoding:Mime-Version:Subject:Cc:To:From:Message-Id:Date:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F20bZhqAcFtAHBc8oMhq0YvImZee5ACc/cX8f7eyPuQ=; b=aVmLzxR/vw+cTXvWeBLtu5t2t3
	uKecW3u+FOMd2/sdWv/1YufR8pJUBVBKopSLSY8DHkvawf2WbefaOEZ6FSB4xsNcIVqmGoLJsBLQr
	qhi8FDtk2XID67A0RwRZ6s1wyUkge9MAW78csfcK0xoSCJlLxZZbE4qPjKgN0H0wo4ttL8Pk/xywJ
	KoOkVwc0TI1Z6ckJufDcpescIEpl6VYSDdz2fG3wWKxWyaYX2grnfNfXY465ZDN9q9MNDEqNIUabq
	nmXAdaV8ukot75h62qRPFqGDGfKpqpvn5jgY7zCwlfaly1rj6ZBx2cA0rObR7YC1y4RFimOwDwROp
	FTILgtew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8EkK-0000000GPKJ-0gx5;
	Fri, 25 Apr 2025 08:49:20 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8EiR-0000000GOsC-0AmG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 08:47:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5EBCD432E9;
	Fri, 25 Apr 2025 08:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745570837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F20bZhqAcFtAHBc8oMhq0YvImZee5ACc/cX8f7eyPuQ=;
	b=XfnHkCqteD1vpSoUt3ytJgWvsKgXhBYCY/VDhoaYvcppi7dX9o7N3sJa/QEBclq2bvIvS2
	8oGE2voC8liDallF7KWtiuCZpafMIKHtPveqUr200YcwxdIxaKUnyBy08CUCDvmQumUHcc
	CbJWVkyDn16/vVWwVae39myfJRsgODUT7oziDllNHVJoAv2lqaCmj+GkRmNHrINV4OXf8Z
	vwa9a87Oq0n5Vo79Wk4l45c7L20tIGyTYunrSm9vcX+JBDZe0j1ryGLZ2U4qloUAH6uo6l
	4ZI8oRkKI94MsvFag4FC6XVg/yArVD+aQQcwN0mhCAm1X0/MZAmVhSjN++Bcww==
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Apr 2025 10:47:15 +0200
Message-Id: <D9FL7V8UX9GP.25220KL6CKOY7@bootlin.com>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
Cc: "Xu Kuohai" <xukuohai@huaweicloud.com>, "Andrii Nakryiko"
 <andrii.nakryiko@gmail.com>, "Alexei Starovoitov" <ast@kernel.org>, "Daniel
 Borkmann" <daniel@iogearbox.net>, "John Fastabend"
 <john.fastabend@gmail.com>, "Andrii Nakryiko" <andrii@kernel.org>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Song Liu" <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>,
 "KP Singh" <kpsingh@kernel.org>, "Stanislav Fomichev" <sdf@fomichev.me>,
 "Hao Luo" <haoluo@google.com>, "Jiri Olsa" <jolsa@kernel.org>, "Puranjay
 Mohan" <puranjay@kernel.org>, "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Mykola Lysenko" <mykolal@fb.com>, "Shuah
 Khan" <shuah@kernel.org>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>, "Florent Revest"
 <revest@chromium.org>, "Bastien Curutchet" <bastien.curutchet@bootlin.com>,
 <ebpf@linuxfoundation.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "bpf" <bpf@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel"
 <linux-arm-kernel@lists.infradead.org>, "open list:KERNEL SELFTEST
 FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [PATCH RFC bpf-next 1/4] bpf: add struct largest member size in
 func model
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com>
 <20250411-many_args_arm64-v1-1-0a32fe72339e@bootlin.com>
 <CAEf4Bzbn6BdXTOb0dTcsQmOMZpp5=DzGS2hHHQ3+dwcja=gv+w@mail.gmail.com>
 <D98Q8BRNUVS9.11J60C67L1ALR@bootlin.com>
 <CAEf4BzZHMYyGDZ4c4eNXG7Fm=ecxCCbKhKbQTbCjvWmKtdwvBw@mail.gmail.com>
 <D9E9IQQ3QKXM.3UJ17G9CBS1FH@bootlin.com>
 <6b6472c3-0718-4e60-9972-c166d51962a3@huaweicloud.com>
 <D9EWSDXHDGFJ.FIDSHIR1OP80@bootlin.com>
 <CAADnVQJjQLdc_Chvz9v2-huCb9rmi048heK-eEX30AtW10H+-Q@mail.gmail.com>
In-Reply-To: <CAADnVQJjQLdc_Chvz9v2-huCb9rmi048heK-eEX30AtW10H+-Q@mail.gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvheduledtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegtfffkhffvvefuggfgofhfjgesthhqredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhoruceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeigefgieffvddvvdduuefhvdeivdejtddvfedthefhgefggedtledtueehuddtieenucffohhmrghinheplhhinhhugigsrghsvgdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedupdhrtghpthhtoheprghlvgigvghirdhsthgrrhhovhhoihhtohhvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepgihukhhuohhhrghisehhuhgrfigvihgtlhhouhgurdgtohhmpdhrtghpthhtoheprghnughrihhirdhnrghkrhihihhkohesghhmrghilhdrtghomhdprhgtphhtthhopegrshhts
 ehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghnihgvlhesihhoghgvrghrsghogidrnhgvthdprhgtphhtthhopehjohhhnhdrfhgrshhtrggsvghnugesghhmrghilhdrtghomhdprhgtphhtthhopegrnhgurhhiiheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrhhtihhnrdhlrghusehlihhnuhigrdguvghv
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_014723_718060_B03A3F88 
X-CRM114-Status: GOOD (  17.19  )
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

Hello Alexei,

On Fri Apr 25, 2025 at 1:14 AM CEST, Alexei Starovoitov wrote:
> On Thu, Apr 24, 2025 at 6:38=E2=80=AFAM Alexis Lothor=C3=A9
> <alexis.lothore@bootlin.com> wrote:

[...]

>> > With DWARF info, we might not need to detect the structure alignment a=
nymore,
>> > since the DW_AT_location attribute tells us where the structure parame=
ter is
>> > located on the stack, and DW_AT_byte_size gives us the size of the str=
ucture.
>>
>> I am not sure to follow you here, because DWARF info is not accessible
>> from kernel at runtime, right ? Or are you meaning that we could, at bui=
ld
>> time, enrich the BTF info embedded in the kernel thanks to DWARF info ?
>
> Sounds like arm64 has complicated rules for stack alignment and
> stack offset computation for passing 9th+ argument.

AFAICT, arm64 has some specificities for large types, but not that much
compared to x86 for example. If I take a look at System V ABI ([1]), I see
pretty much the same constraints:
- p.18: "Arguments of type __int128 offer the same operations as INTEGERs,
  [...] with the exception that arguments of type __int128 that are stored
  in memory must be aligned on a 16-byte boundary"
- p.13: "Structures and unions assume the alignment of their most strictly
  aligned component"
- the custom packing and alignments attributes will end up having the same
  consequence on both architectures

As I mentioned in my cover letter, the new tests covering those same
alignment constraints for ARM64 break on x86, which makes me think other
archs are also silently ignoring those cases.

> Since your analysis shows:
> "there are about 200 functions accept 9 to 12 arguments, so adding suppor=
t
> for up to 12 function arguments."
> I say, let's keep the existing limitation:
>         if (nregs > 8)
>                 return -ENOTSUPP;
>
> If there is a simple and dumb way to detect that arg9+ are scalars
> with simple stack passing rules, then, sure, let's support those too,
> but fancy packed/align(x)/etc let's ignore.


[1] https://refspecs.linuxbase.org/elf/x86_64-abi-0.99.pdf


--=20
Alexis Lothor=C3=A9, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


