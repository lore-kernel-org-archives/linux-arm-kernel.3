Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F92C369B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 20:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qjMFJPpRCPOvsPjgp/zlZf5TXQQY8q9e/fZxYLwtj0c=; b=k8O2vmdj7iI3YKpIjgCCPW0itA
	PvS+CQ3yd+lwIb8Nn6TMM4QQwvWcvk4ousGnpZuszWh9RRtVTYNLf2LHbUudPBWy4yYurfXjHAY49
	4xB+0+ygy48iKgGM1NElm6PlKP/22WDW3GbB5utlBeDMvJ8227i0M7RrNY25mUKa0pGpvwFZ48qx6
	9zKz3hNCxfucYleI7OIe98cFIOMi+vy9t/BJxGJ1ELCFkiYf+m2WtaFoVqrmR2wG8cxnhjrC0jhef
	4Ro0fIRBBg7fo+CLym6rSTUr7odzkDwaAFqV84yv6Xmjqvkotk3YRjFzqIWJ3EFVm9LOgUNNM/cZe
	onKhiqrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4QR3-00000003TJS-2wv2;
	Mon, 14 Apr 2025 20:29:41 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4QPB-00000003SYX-3d43
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 20:27:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C4EB94384E;
	Mon, 14 Apr 2025 20:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744662460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qjMFJPpRCPOvsPjgp/zlZf5TXQQY8q9e/fZxYLwtj0c=;
	b=N4HnxsbeyxlL0cI2fjrgbDYOY26mtPrjrWBL3s4rpcNcFbKrZ5oML+muF9dSwIf+R31jOO
	KNd1PzJKTjjfbLK6hep9vPg39UlV0zZF1BKJF267ZKn2J1xoru9QbkUvAEvvzknyjloLJP
	whWw08ja2cuoNe2+omAHJq+d4WWMJz7eKipWxuppjlyBY8Jo9C/UgNEqJDTHPvWP/vWHdm
	5/xJrI+nUBg1sp6a6dvPhPruhokRRYG2wFB5FSR7rUVrXYzQ/nSXIftSCXTb8e6TiR1Qh1
	dpKt+psmNo3zzf34HIghYQmvKiizqjkVg33fTgTDXfhAAH/Cfhn3QN9AUiqQCA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Apr 2025 22:27:38 +0200
Message-Id: <D96N84S9OJFA.1L2ME0ASNZH9K@bootlin.com>
To: "Jiri Olsa" <olsajiri@gmail.com>
Cc: "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "John Fastabend" <john.fastabend@gmail.com>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Eduard Zingerman" <eddyz87@gmail.com>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "KP Singh"
 <kpsingh@kernel.org>, "Stanislav Fomichev" <sdf@fomichev.me>, "Hao Luo"
 <haoluo@google.com>, "Puranjay Mohan" <puranjay@kernel.org>, "Xu Kuohai"
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
Subject: Re: [PATCH RFC bpf-next 1/4] bpf: add struct largest member size in
 func model
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com>
 <20250411-many_args_arm64-v1-1-0a32fe72339e@bootlin.com>
 <Z_zryQkfmrSXYN4k@krava>
In-Reply-To: <Z_zryQkfmrSXYN4k@krava>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdduheduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvfevuffhofhfjgesthhqredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhoruceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekgfffhfehhfefgeekhfffudfhheekveffleeuhfelgfefueevhedvkeduhfehveenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdelpdhrtghpthhtohepohhlshgrjhhirhhisehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghstheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrnhhivghlsehiohhgvggrrhgsohigrdhnvghtpdhrtghpthhtohepjhhohhhnrdhfrghsthgrsggvnhgusehgmhgrihhlrdgto
 hhmpdhrtghpthhtoheprghnughrihhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrghrthhinhdrlhgruheslhhinhhugidruggvvhdprhgtphhtthhopegvugguhiiikeejsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhonhhgsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_132746_542004_03DF0906 
X-CRM114-Status: UNSURE (   7.32  )
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

Hello Jiri,

On Mon Apr 14, 2025 at 1:04 PM CEST, Jiri Olsa wrote:
> On Fri, Apr 11, 2025 at 10:32:10PM +0200, Alexis Lothor=C3=A9 (eBPF Found=
ation) wrote:

[...]

>> +	for_each_member(i, t, member) {
>> +		mtype =3D btf_type_by_id(btf, member->type);
>> +		while (mtype && btf_type_is_modifier(mtype))
>> +			mtype =3D btf_type_by_id(btf, mtype->type);
>> +		if (!mtype)
>> +			return -EINVAL;
>
> should we use __get_type_size for member->type instead ?

Ah, yes, thanks for the hint, that will allow to get rid of the manual
modifiers skip.

Alexis
> jirka

--=20
Alexis Lothor=C3=A9, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


