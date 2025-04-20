Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A40C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Apr 2025 16:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Mime-Version:Content-Transfer-Encoding:To:From:Subject:Cc:Message-Id:Date:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u/70UOSCWyv3wSRrnsWxaHKu2UYedV9SAR2KFYDLoLE=; b=kBglr2eZljTPZL8s5TNwzcmItM
	qr6L0t6WVRnCohUF+GRc7HfNkJR1MejNsxsuHs8E8nBI48AHNgFKkqmIRdgsGP9cqMwblJW2zC1Hm
	KBkkAMyKrJtcOn553EOb/87QZLdh5xdZ2Ljb8Sw2dzQ6jMkQjRLvq5NH2QX8RkgIb8d2gt8+JsXEY
	aaXuMx7MBbUJ/PPXlLxBz+GGETHgehzyYmrWBgSCidtYVtlQ7cLu6xOD/W8JwfYikvfxLnrFCdP6b
	hA87sJIiWt71wB3vQZkZKaD8TfAwpIFmS+gIMkc17BPYPJhKKLIaVD4DVecE25Mpl+/Cw8VK+/8kC
	EHLBDIwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6XA2-00000002keP-00j4;
	Sun, 20 Apr 2025 16:04:50 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6X87-00000002kVC-0tOv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Apr 2025 16:02:53 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 32A874395F;
	Sun, 20 Apr 2025 16:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745164965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u/70UOSCWyv3wSRrnsWxaHKu2UYedV9SAR2KFYDLoLE=;
	b=HXBdcwxedYm/XKxEcj0DuL/5+TCm68ve5D/oVE6pwjOqxK40e8lNcQ7eNSvbKqpVb3VAzd
	24HDvQz6xW+VHvn5FmW4KuvleT41VPH2YHkaEpu24C1c0JbkJeeGivNGnkHNzStBwVIY43
	sC34A0QgJPQMlNiNBIBdx5q+22/YJHQMvt4IrJefm0aJZ2bg+1jooAlkI3EzMapTvDIwGx
	8rPuX1x4w438R8M9+FjumkIuS7PTC5ZfWBonqAelTEWd78ZZYPzc3Yu7qycOlmrvO52h8k
	Jdzvgj4xaIwHxvxL4xGi1DgprftAxSw0D1b10tOynMyeOi3ArZir2Vose5pLAw==
Content-Type: text/plain; charset=UTF-8
Date: Sun, 20 Apr 2025 18:02:42 +0200
Message-Id: <D9BLCJSCHE9A.1IKHK3XBPF8MU@bootlin.com>
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
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com>
 <20250411-many_args_arm64-v1-1-0a32fe72339e@bootlin.com>
 <CAEf4Bzbn6BdXTOb0dTcsQmOMZpp5=DzGS2hHHQ3+dwcja=gv+w@mail.gmail.com>
 <D98Q8BRNUVS9.11J60C67L1ALR@bootlin.com>
 <9da88811-cce0-41df-8069-2e8b67541c39@huaweicloud.com>
In-Reply-To: <9da88811-cce0-41df-8069-2e8b67541c39@huaweicloud.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeekfeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegtfffkvefuhffvgfggofhfjgesthhqredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhoruceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiffegveeihfelgfelveeihfetueeuueekieetheeftefhjeelveehffdvgeevudenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedtpdhrtghpthhtohepgihukhhuohhhrghisehhuhgrfigvihgtlhhouhgurdgtohhmpdhrtghpthhtoheprghnughrihhirdhnrghkrhihihhkohesghhmrghilhdrtghomhdprhgtphhtthhopegrshhtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghnihgvlhesihhoghgvr
 ghrsghogidrnhgvthdprhgtphhtthhopehjohhhnhdrfhgrshhtrggsvghnugesghhmrghilhdrtghomhdprhgtphhtthhopegrnhgurhhiiheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrhhtihhnrdhlrghusehlihhnuhigrdguvghvpdhrtghpthhtohepvgguugihiiekjeesghhmrghilhdrtghomh
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_090251_931870_EB9D72A7 
X-CRM114-Status: GOOD (  23.35  )
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

Hi Xu,

On Thu Apr 17, 2025 at 4:10 PM CEST, Xu Kuohai wrote:
> On 4/17/2025 3:14 PM, Alexis Lothor=C3=A9 wrote:
>> Hi Andrii,
>>=20
>> On Wed Apr 16, 2025 at 11:24 PM CEST, Andrii Nakryiko wrote:
>>> On Fri, Apr 11, 2025 at 1:32=E2=80=AFPM Alexis Lothor=C3=A9 (eBPF Found=
ation)
>>> <alexis.lothore@bootlin.com> wrote:

[...]

>>> I might be missing something, but how can the *size* of the field be
>>> used to calculate that argument's *alignment*? i.e., I don't
>>> understand why arg_largest_member_size needs to be calculated instead
>>> of arg_largest_member_alignment...
>>=20
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
>>=20
>> And since for ARM64, all needed alignments are somehow derived from size
>> (it is either directly size for fundamental types, or alignment of the
>> largest member for structs, which is then size of largest member),
>> returning the size seems to be enough to allow the JIT side to compute
>> alignments.
>>
>
> Not exactly. The compiler's "packed" and "alignment" attributes cause a
> structure to be aligned differently from its natural alignment.
>
> For example, with the following three structures:
>
> struct s0 {
>      __int128 x;
> };
>
> struct s1 {
>      __int128 x;
> } __attribute__((packed));
>
> struct s2 {
>      __int128 x;
> } __attribute__((aligned(64)));
>
> Even though the largest member size is the same, s0 will be aligned to 16
> bytes, s1 and s2 are not aligned the same way. s1 has no alignment due to
> the "packed" attribute, while s2 will be aligned to 64 bytes.
>
> When these three structures are passed as function arguments, they will b=
e
> located on different positions on the stack.
>
> For the following three functions:
>
> int f0(__int128 a, __int128 b, __int128 c, int64_t d, __int128 e, int64_t=
 f, struct s0 g);
> int f1(__int128 a, __int128 b, __int128 c, int64_t d, __int128 e, int64_t=
 f, struct s1 g);
> int f2(__int128 a, __int128 b, __int128 c, int64_t d, __int128 e, int64_t=
 f, struct s2 g);
>
> g will be located at sp+32 in f0, sp + 24 in f1, and some 64-byte aligned
> stack address in f2.

Ah, thanks for those clear examples, I completely overlooked this
possibility. And now that you mention it, I feel a bit dumb because I now
remember that you mentioned this in Puranjay's series...

I took a quick look at the x86 JIT compiler for reference, and saw no code
related to this specific case neither. So I searched in the kernel for
actual functions taking struct arguments by value AND being declared with s=
ome
packed or aligned attribute. I only found a handful of those, and none
seems to take enough arguments to have the corresponding struct passed on t=
he
stack. So rather than supporting this very specific case, I am tempted
to just return an error for now during trampoline creation if we detect suc=
h
structure (and then the JIT compiler can keep using data size to compute
alignment, now that it is sure not to receive custom alignments). Or am I
missing some actual cases involving those very specific alignments ?

Thanks,

Alexis

--=20
Alexis Lothor=C3=A9, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


