Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B23C369D8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 17:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Abk3WUggpCh+pV9/jGehaWPhGHzsr5iDxN7IoX5cqEk=; b=Weg3Kk04sralS1nhGlSiqfu85k
	nKf8XQyhLHlPCev7SAq5dA7lD9Bc+/wURn6ZZ7hhrRSsVnTlU1kkn0vUdm+7tEqVWgYmjIp9PJ6p2
	rjy/FIderKldtYKZWg+F9qbHF+iqNItPSxnwZPbuxIzL1QRYSAdbLQT9gvsV7WAWN/wvPuMrCsVfq
	6swSPDWBSOQfobpxlFLbftD1URer52/m2TSIBP5l94sAhCADhDR2DsAIFFYHEw7U9Vd4J0UISvEzF
	U+qPtYsG1s7K11FNkIIuwnsWG4YzTvArdGA9ayFl0nM4yztPh2ssyXn3nv4QjOS8ybksfqGJa/yTE
	SE2b/SYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e8L-0000000BNCB-2oMt;
	Wed, 23 Apr 2025 17:43:42 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7cB1-0000000Azg4-36GD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 15:38:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1449D43201;
	Wed, 23 Apr 2025 15:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745422694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Abk3WUggpCh+pV9/jGehaWPhGHzsr5iDxN7IoX5cqEk=;
	b=RI7Tw1As9wOTHmRLRlOtw+97DusGjkgz5iMRLKZN4zcskq36CRb9ussT2NX7gXEdh90q7r
	POeVrueShYUjYRyn65z8VBjfO7iTqa/ZspwQMggtDMw3E7uMMC48R6WZou47bJ0oCgze/d
	xb5vD9tIm0T9icAfYRLJuQE1aslLweYHBA0hMYlsY/FV97+ZuevI1AS2ZMiBYPewPNmzHP
	vroE13/rb7Gl2LXV09Id2Du0mc/S0jjLsyK+HNJgSCKUPB9FLTgL3SLZiwDSQ71MgYofaA
	OsbniHoJmQ711I/9rNmlgjJpQ10ueCniBFkZSq8VBczxUgBqcTzGumXVtj+Zww==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Apr 2025 17:38:09 +0200
Message-Id: <D9E4PE3RTE37.2LU30RI1ZS6XL@bootlin.com>
Cc: "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "John Fastabend" <john.fastabend@gmail.com>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Eduard Zingerman" <eddyz87@gmail.com>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "KP Singh"
 <kpsingh@kernel.org>, "Stanislav Fomichev" <sdf@fomichev.me>, "Hao Luo"
 <haoluo@google.com>, "Jiri Olsa" <jolsa@kernel.org>, "Puranjay Mohan"
 <puranjay@kernel.org>, "Catalin Marinas" <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, "Mykola Lysenko" <mykolal@fb.com>, "Shuah Khan"
 <shuah@kernel.org>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
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
To: "Xu Kuohai" <xukuohai@huaweicloud.com>, "Andrii Nakryiko"
 <andrii.nakryiko@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com>
 <20250411-many_args_arm64-v1-1-0a32fe72339e@bootlin.com>
 <CAEf4Bzbn6BdXTOb0dTcsQmOMZpp5=DzGS2hHHQ3+dwcja=gv+w@mail.gmail.com>
 <D98Q8BRNUVS9.11J60C67L1ALR@bootlin.com>
 <9da88811-cce0-41df-8069-2e8b67541c39@huaweicloud.com>
 <D9BLCJSCHE9A.1IKHK3XBPF8MU@bootlin.com>
 <8b800c09-eade-4dcf-90f6-2f5a78170bc4@huaweicloud.com>
In-Reply-To: <8b800c09-eade-4dcf-90f6-2f5a78170bc4@huaweicloud.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeeileejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvefuhffvofhfjgesthhqredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhoruceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelkeehiefhfeehvefhtdegueelkeehffffffeuvdekkeekuddvueeguefgieeukeenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedtpdhrtghpthhtohepgihukhhuohhhrghisehhuhgrfigvihgtlhhouhgurdgtohhmpdhrtghpthhtoheprghnughrihhirdhnrghkrhihihhkohesghhmrghilhdrtghomhdprhgtphhtthhopegrshhtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghnihgvlhesihhoghgvrghrsghogidrnhgvthdprhgtphhtthhopehjohhhn
 hdrfhgrshhtrggsvghnugesghhmrghilhdrtghomhdprhgtphhtthhopegrnhgurhhiiheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrhhtihhnrdhlrghusehlihhnuhigrdguvghvpdhrtghpthhtohepvgguugihiiekjeesghhmrghilhdrtghomh
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_083820_399545_972B67F5 
X-CRM114-Status: GOOD (  15.70  )
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

On Mon Apr 21, 2025 at 4:14 AM CEST, Xu Kuohai wrote:
> On 4/21/2025 12:02 AM, Alexis Lothor=C3=A9 wrote:
>> Hi Xu,
>>=20
>> On Thu Apr 17, 2025 at 4:10 PM CEST, Xu Kuohai wrote:
>>> On 4/17/2025 3:14 PM, Alexis Lothor=C3=A9 wrote:
>>>> Hi Andrii,
>>>>
>>>> On Wed Apr 16, 2025 at 11:24 PM CEST, Andrii Nakryiko wrote:
>>>>> On Fri, Apr 11, 2025 at 1:32=E2=80=AFPM Alexis Lothor=C3=A9 (eBPF Fou=
ndation)
>>>>> <alexis.lothore@bootlin.com> wrote:

[...]

>> Ah, thanks for those clear examples, I completely overlooked this
>> possibility. And now that you mention it, I feel a bit dumb because I no=
w
>> remember that you mentioned this in Puranjay's series...
>>=20
>> I took a quick look at the x86 JIT compiler for reference, and saw no co=
de
>> related to this specific case neither. So I searched in the kernel for
>> actual functions taking struct arguments by value AND being declared wit=
h some
>> packed or aligned attribute. I only found a handful of those, and none
>> seems to take enough arguments to have the corresponding struct passed o=
n the
>> stack. So rather than supporting this very specific case, I am tempted
>> to just return an error for now during trampoline creation if we detect =
such
>> structure (and then the JIT compiler can keep using data size to compute
>> alignment, now that it is sure not to receive custom alignments). Or am =
I
>> missing some actual cases involving those very specific alignments ?
>>=20
>
> How can we reliably 'detect' the case? If a function has such a parameter
> but we fail to detect it, the BPF trampoline will pass an incorrect value
> to the function, which is also unacceptable.

That's a question I still have to answer :) I imagined being able to detect
it thanks to some info somewhere in BTF, but I have to dig further to find
how.


Alexis

--=20
Alexis Lothor=C3=A9, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


