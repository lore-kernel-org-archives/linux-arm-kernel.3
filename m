Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 539F2C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 19:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j2tDrkkBQe3JKRslIUmoWfOqe7k2mOTW95nGkd+giIA=; b=fRKIDdw39Gv5ab7igVkFdlz813
	9EqKgKSL+aWR/wF1XoMpSB+uUHTu2upwEU7YHSvDS1Lrce+rsuBQYbN2Zynw+RbjsxwkNLDMngXl6
	sw0iZuVLJo2Ecdkoo//CbqWD/MuYZsWBSjOeQ3UXhGRnWTRzTMe/0B5RgdgLs+CEkrhDT6oxIEVBL
	KHrifTD7zR9Vqjy03BKpnHtasikaIUIFU9zXZgY2KRwGexb4X7AgjNM1sCn3oe+Nw34NupKrPFKA3
	bt2jJkCv1VgINtwUPn2gIaPLYxQlQGqViPSxvcKNK8rSVRTzse7B6Kx9qLF6wNHIgm96uUdYT3FG5
	eQCbE4kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7fqR-0000000BlL0-00AG;
	Wed, 23 Apr 2025 19:33:19 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7fi3-0000000BjeM-1sTc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 19:24:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 57DE443D43;
	Wed, 23 Apr 2025 19:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745436276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j2tDrkkBQe3JKRslIUmoWfOqe7k2mOTW95nGkd+giIA=;
	b=JyMP61V2AwXdhFa/MfRsPknQuX+9zLoQUYtqvFgqLxqliWXnPJH34GipEY9qLDu8f7SOwF
	L8jxLNkDlXpvpCTUahNBDq64T+h8dShffNbUpErWHn1x/hthcTZ5Vhfb+11gcMowNWfteN
	lMtxy7eNihMWGR1cfiyeiBMHdFAh6/Qkp740gcZF/k3F/n5r2A+L97u2Wp7fBZWy0zuMo+
	PYecer6KKZ/ZgNu1gqyVkTs47GKuuYwTdT3yWzZ9AXC833zqNXwOSMWk8F7fOivfSBFC1Q
	gdPEfuqHmDoodf8h5KichaaTG/S7VwJ99WpomEnNl9DoF7NAvN0SmDDj5OvjeA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Apr 2025 21:24:34 +0200
Message-Id: <D9E9IQQ3QKXM.3UJ17G9CBS1FH@bootlin.com>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Andrii Nakryiko" <andrii.nakryiko@gmail.com>
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
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [PATCH RFC bpf-next 1/4] bpf: add struct largest member size in
 func model
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com>
 <20250411-many_args_arm64-v1-1-0a32fe72339e@bootlin.com>
 <CAEf4Bzbn6BdXTOb0dTcsQmOMZpp5=DzGS2hHHQ3+dwcja=gv+w@mail.gmail.com>
 <D98Q8BRNUVS9.11J60C67L1ALR@bootlin.com>
 <CAEf4BzZHMYyGDZ4c4eNXG7Fm=ecxCCbKhKbQTbCjvWmKtdwvBw@mail.gmail.com>
In-Reply-To: <CAEf4BzZHMYyGDZ4c4eNXG7Fm=ecxCCbKhKbQTbCjvWmKtdwvBw@mail.gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeejgeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkhffvvefuofhfjgesthhqredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhoruceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehveevkeelvdejhffhudfhtdevvddvfffgiedtveejiefgveeljeduveetuddtveenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeftddprhgtphhtthhopegrnhgurhhiihdrnhgrkhhrhihikhhosehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghstheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrnhhivghlsehiohhgvggrrhgsohigrdhnvghtpdhrtghpthhtohepjhhohhhnr
 dhfrghsthgrsggvnhgusehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghnughrihhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrghrthhinhdrlhgruheslhhinhhugidruggvvhdprhgtphhtthhopegvugguhiiikeejsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhonhhgsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_122440_248168_819871D5 
X-CRM114-Status: GOOD (  23.76  )
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

Hi Andrii,

On Wed Apr 23, 2025 at 7:15 PM CEST, Andrii Nakryiko wrote:
> On Thu, Apr 17, 2025 at 12:14=E2=80=AFAM Alexis Lothor=C3=A9
> <alexis.lothore@bootlin.com> wrote:
>>
>> Hi Andrii,
>>
>> On Wed Apr 16, 2025 at 11:24 PM CEST, Andrii Nakryiko wrote:
>> > On Fri, Apr 11, 2025 at 1:32=E2=80=AFPM Alexis Lothor=C3=A9 (eBPF Foun=
dation)
>> > <alexis.lothore@bootlin.com> wrote:

[...]

>> Indeed I initially checked whether I could return directly some alignmen=
t
>> info from btf, but it then involves the alignment computation in the btf
>> module. Since there could be minor differences between architectures abo=
ut
>> alignment requirements, I though it would be better to in fact keep alig=
nment
>> computation out of the btf module. For example, I see that 128 bits valu=
es
>> are aligned on 16 bytes on ARM64, while being aligned on 8 bytes on S390=
.
>>
>> And since for ARM64, all needed alignments are somehow derived from size
>> (it is either directly size for fundamental types, or alignment of the
>> largest member for structs, which is then size of largest member),
>> returning the size seems to be enough to allow the JIT side to compute
>> alignments.
>
> If you mean the size of "primitive" field and/or array element
> (applied recursively for all embedded structs/unions) then yes, that's
> close enough. But saying just "largest struct member" is wrong,
> because for
>
> struct blah {
>     struct {
>         int whatever[128];
>     } heya;
> };
>
>
> blah.heya has a large size, but alignment is still just 4 bytes.

Indeed, that's another case making my proposal fail :)

> I'd suggest looking at btf__align_of() in libbpf (tools/lib/bpf/btf.c)
> to see how we calculate alignment there. It seems to work decently
> enough. It won't cover any arch-specific extra rules like double
> needing 16-byte alignment (I vaguely remember something like that for
> some architectures, but I might be misremembering), or anything
> similar. It also won't detect (I don't think it's possible without
> DWARF) artificially increased alignment with attribute((aligned(N))).

Thanks for the pointer, I'll take a look at it. The more we discuss this
series, the less member size sounds relevant for what I'm trying to achieve
here.

Following Xu's comments, I have been thinking about how I could detect the
custom alignments and packing on structures, and I was wondering if I could
somehow benefit from __attribute__ encoding in BTF info ([1]). But
following your hint, I also see some btf_is_struct_packed() in
tools/lib/bpf/btf_dump.c that could help. I'll dig this further and see if
I can manage to make something work with all of this.

Thanks,

Alexis

[1] https://lore.kernel.org/bpf/20250130201239.1429648-1-ihor.solodrai@linu=
x.dev/

--=20
Alexis Lothor=C3=A9, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


