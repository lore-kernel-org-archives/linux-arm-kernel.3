Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5F9C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 07:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Yg2TszODfSWyu/tkAewlOKe9bmGQWD5HRPUFzitAq0=; b=B+Jg7frXC/tOwwpDAY0QXedhC5
	XSq8G/XaPoDykcE3/3SQ2ccwHftC9NDz7jWBinpv+wnMtMVwgNkzUQ5z65cAGLDSJuWIesQayR8cF
	VJiJ70PLuhQLzgwf74+wR4RMlmuUXqn3T1J+wIukXeq0pn2K4dGADSdE6SASQFAQzWdFhIgjTgvKI
	frovB37ttlBSv9MflHCHPDW1a3xgkIpukLZzip94kc4VXLjYPrvh0Kmg9RatcO+tvOQ2Kc5IUHK/L
	yzEZ1GCgHKIOnP25s3dGx9UyjjvxNXJyd/fWh/O7RdX9UnoznPWF2nEb7Z2zsZN5TMtHQala6c4wn
	/WPjFLrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN5Ap-0000000ExdV-0cp9;
	Thu, 05 Jun 2025 07:38:03 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN58H-0000000ExGc-1SiP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 07:35:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5236843935;
	Thu,  5 Jun 2025 07:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749108920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Yg2TszODfSWyu/tkAewlOKe9bmGQWD5HRPUFzitAq0=;
	b=kj784Nm5ZgltuTXJv+pbKGMDA1t5/ru/eck+iLsRHT9bh9dUAeKg1UtiSce3r6Rlkt7NZG
	qIToZTnegQa10FbPzHFs+21XG8fPMSJ9luRmHf0Tcez7mIKtXf9cvIyEX0qlJeupy/3EGv
	MrWDfRryvUUNfeFlQnZP3sB5mO5Z0Q7yCadc1YSb2Q4hFOq0DMbigaRqE5MeN8JAuyOXOS
	tdRwbxKu/TiRONaFFbT1o0xDZe9esDi5hlY10LwDmFTJoQ+xZELZxa87B0WtIdPEUOanPV
	hRLRzekmcstDQk4EaSTKY5DBrLMkgQ6hPQxyzj9+v0rfzvpRPaSdlch0EXpxZg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Jun 2025 09:35:15 +0200
Message-Id: <DAEFD2WH7HRV.2SOG9Q00QSEXH@bootlin.com>
Cc: "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "John Fastabend" <john.fastabend@gmail.com>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Eduard Zingerman" <eddyz87@gmail.com>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "KP Singh"
 <kpsingh@kernel.org>, "Stanislav Fomichev" <sdf@fomichev.me>, "Hao Luo"
 <haoluo@google.com>, "Jiri Olsa" <jolsa@kernel.org>, "Puranjay Mohan"
 <puranjay@kernel.org>, "Xu Kuohai" <xukuohai@huaweicloud.com>, "Catalin
 Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Mykola Lysenko" <mykolal@fb.com>, "Shuah Khan" <shuah@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Florent Revest" <revest@chromium.org>,
 "Bastien Curutchet" <bastien.curutchet@bootlin.com>,
 <ebpf@linuxfoundation.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kselftest@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <dwarves@vger.kernel.org>
Subject: Re: [Question] attributes encoding in BTF
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Andrii Nakryiko"
 <andrii.nakryiko@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com>
 <20250411-many_args_arm64-v1-1-0a32fe72339e@bootlin.com>
 <CAEf4Bzbn6BdXTOb0dTcsQmOMZpp5=DzGS2hHHQ3+dwcja=gv+w@mail.gmail.com>
 <D98Q8BRNUVS9.11J60C67L1ALR@bootlin.com>
 <CAEf4BzZHMYyGDZ4c4eNXG7Fm=ecxCCbKhKbQTbCjvWmKtdwvBw@mail.gmail.com>
 <D9E9IQQ3QKXM.3UJ17G9CBS1FH@bootlin.com>
 <DADMLIVHMSSO.3AXSI5216WCT6@bootlin.com>
 <9a2ba0ad-b34d-42f8-89a6-d9a44f007bdc@linux.dev>
In-Reply-To: <9a2ba0ad-b34d-42f8-89a6-d9a44f007bdc@linux.dev>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdeffedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvefuhffvofhfjgesthhqredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhoruceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffvddufffhieffheetfffggeeugedtieduheeilefguddvheegvdeuffeuveeltdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvuddvrddutdehrdduhedtrddvhedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdduvddruddthedrudehtddrvdehvddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefvddprhgtphhtthhopehihhhorhdrshholhhoughrrghisehlihhnuhigrdguvghvpdhrtghpthhtoheprghnughrihhirdhnrghkrhihihhkohesghhmrghilhdrtghomhdprhgtphhtthhopegrshhtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghnihgvlhesihhoghgvrghrsghogidrnhgvt
 hdprhgtphhtthhopehjohhhnhdrfhgrshhtrggsvghnugesghhmrghilhdrtghomhdprhgtphhtthhopegrnhgurhhiiheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrhhtihhnrdhlrghusehlihhnuhigrdguvghvpdhrtghpthhtohepvgguugihiiekjeesghhmrghilhdrtghomh
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_003526_134505_09EDD160 
X-CRM114-Status: GOOD (  15.87  )
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

Hi Ihor,

On Wed Jun 4, 2025 at 7:31 PM CEST, Ihor Solodrai wrote:
> On 6/4/25 2:02 AM, Alexis Lothor=C3=83=C2=A9 wrote:

[...]

>> Could I be missing something obvious ? Or did I misunderstand the actual
>> attribute encoding feature ?
>
> Hi Alexis.
>
> The changes recently landed in pahole and libbpf re attributes had a=20
> very narrow goal: passing through particular attributes for some BPF=20
> kfuncs from the kernel source to vmlinux.h
>
> BTF now has a way of encoding any attribute (as opposed to only bpf=20
> type/decl tags) by setting type/decl tag kind flag [1]. So it is=20
> possible to represent attributes like packed and aligned in BTF.
>
> However, the BTF tags need to be generated by something, in case of=20
> vmlinux by pahole. Pahole generates BTF by parsing DWARF. And, as far as=
=20
> I understand, attributes are not (can not be?) represented in DWARF in a=
=20
> generic way, it really depends on specifics of the attribute.
>
> In order to support packed/aligned, pahole needs to know how to figure=20
> them out from DWARF input and add the tags to BTF. And this does not=20
> happen right now, which is why you don't see anything in bpftool output.
>
> [1]=20
> https://lore.kernel.org/bpf/20250130201239.1429648-1-ihor.solodrai@linux.=
dev/

Thanks for the details ! I have missed this possibility, as I have been
assuming that DWARF info was exposing the needed info. I'll take a look at
it, but if those attributes can not be represented by DWARF, I'll have to
find another way of getting those packing/alignment modifications on data
type (eg: re-use/share btf__align_of from libbpf, as suggested by Andrii,
but it may not able to cover all cases).

Thanks,

Alexis

--=20
Alexis Lothor=C3=A9, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


