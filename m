Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED56EC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 10:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QH2HlRrsM2GhBqfQeM842UlYrI8bH7FA97PniLkwhl0=; b=4ic6IvZHvCpSUhdbC2l3LAe5ov
	V9hic57Q3/0dIpI/237dfResntp+++IOakiveuXQ73CCsFFgaCw7iWNFQJGMTFsFpqSVJyMJ3Rrqe
	blUKdgHLnmHXluUqwUUqzLZTeHrGHWmHb0cOjaW730WJGJmtXRtPjHBFGrovPc/Wial+KkFMJwr3s
	vaTy5zZfgPixH4iN4aUcU3GC0cLocrhpLKUIKQxr3mR8HtaLz622bsIaxboCwedhxh+zbMGkt4vwk
	py+so1qDeiIkLRBWmZaqpFtjVb3WDHPCn1lX2AUblLiIO12CMxQbpg6Z8lpOkau6+UJgJWns7aiH/
	QXs4CdrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcj6V-00000004gLM-0UAb;
	Tue, 28 Jan 2025 10:45:59 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcj5A-00000004gCa-2OHh;
	Tue, 28 Jan 2025 10:44:37 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1738061074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QH2HlRrsM2GhBqfQeM842UlYrI8bH7FA97PniLkwhl0=;
	b=WNFLx3YFReVPhS8mPLJ+8dWLkj7tr6Z5rlcSM2MBg2AlKXwjQwOYTyUZ7BuIy9cl88zSRg
	9L7QNBrhJTIxbdft7iM1P+wPCvkXVvFBA0CDNbX9oKzXFYPKCPZVjzH+e9KVXAMRll4JG8
	boKosHygywwhKQ7xIsa9MtIZVb8M9nk56NLhzf1qVSLLxENSJqyM6+dM5JV9JrBqhw5ESm
	eqrdC+qqUJ7QOL5Wq8OY/pcLTF8jFTfl4/B92L6B0g2k10D3DUNLajEFHQpL67DMSYhIKV
	knmDzwnuzqgJlPsEFmi/PuyL9iVg57bBwNfmLLkPTkT29wL164GeBWvft+kNEA==
Date: Tue, 28 Jan 2025 11:44:34 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: Alexander Shiyan <eagle.alexander923@gmail.com>, Rob Herring
 <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, devicetree@vger.kernel.org, Sebastian Reichel
 <sebastian.reichel@collabora.com>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: Fix broken tsadc pinctrl binding
 for rk3588
In-Reply-To: <CABjd4YwCH93-=Cqck5TiuJoTUkYbRh0495J6w=J8t93oHdt43g@mail.gmail.com>
References: <20250124052611.3705-1-eagle.alexander923@gmail.com>
 <CABjd4YwA8P9LVuDviO6xydkHpuuOY7XT0pk1oa+FDqOo=uZN4A@mail.gmail.com>
 <a76f315f023a3f8f5435e0681119b4eb@manjaro.org>
 <CABjd4Ywh_AkbXHonx-8vL-hNY5LMLJge5e4oqxvUG+qe6OF-Og@mail.gmail.com>
 <61b494b209d7360d0f36adbf6d5443a4@manjaro.org>
 <CABjd4Yx0p0B=e00MjCpDDq8Z=0FtM0s9EN86WdvRimt-_+kh2w@mail.gmail.com>
 <CABjd4Yy14bpjzvFyc8et-=pmds5uwzfxNqcs7L=+XRXBogZEsQ@mail.gmail.com>
 <CAP1tNvTRER=QzC29Udw4ffOetVECWV+MfZ2o-mbUFvuZ0_i-Kw@mail.gmail.com>
 <b57d8a834f5c07e37e0e7ee74346c700@manjaro.org>
 <CABjd4YwCH93-=Cqck5TiuJoTUkYbRh0495J6w=J8t93oHdt43g@mail.gmail.com>
Message-ID: <1498db1c6664b39b49cfc71d2e4eb5ef@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_024436_920035_3CD0DFF0 
X-CRM114-Status: GOOD (  24.38  )
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

Hello Alexey,

On 2025-01-28 11:30, Alexey Charkov wrote:
> On Tue, Jan 28, 2025 at 1:24 PM Dragan Simic <dsimic@manjaro.org> 
> wrote:
>> On 2025-01-26 15:25, Alexander Shiyan wrote:
>> >> > > I think it's actually better to accept the approach in Alexander's
>> >> > > patch, because the whole thing applies to other Rockchip SoCs as well,
>> >> > > not just to the RK3588(S).
>> >> >
>> >> > Anyway, I've just tried it after including the changes below, and
>> >> > while /sys/kernel/debug/pinctrl/pinctrl-handles shows the expected
>> >> > pinctrls under tsadc, the driver still doesn't seem to be triggering a
>> >> > PMIC reset. Weird. Any thoughts welcome.
>> >>
>> >> I found the culprit. "otpout" (or "default" if we follow Alexander's
>> >> suggested approach) pinctrl state should refer to the &tsadc_shut_org
>> >> config instead of &tsadc_shut - then the PMIC reset works.
>> >
>> > Great, I'll use this in v2.
>> 
>> Please, let's wait with the v2 until I go through the whole thing 
>> again
> 
> I, for one, would welcome a v2 that could be tested and confirmed
> working with and without driver changes. Especially given that:
>  - the changes are pretty small
>  - hardware docs say nothing about the difference between TSADC_SHUT
> vs. TSADC_SHUT_ORG, except that one is config #2 and the other is
> config #1
>  - none of the source trees I looked at seem to enable PMIC based
> resets on any RK3588-based boards, so these pinctrl configs appear to
> have never been tested in the wild for RK3588*
> 
> So trying and testing seems to be the only way to understand the best
> way forward. Unless, of course, someone from Rockchip can comment on
> how the hardware works with TSADC_SHUT vs. TSADC_SHUT_ORG.

Perhaps the best approach would be to have the v2 that works without
the driver changes, so it can be propagated into the stable kernels.

Then, a separate series, which I'll volunteer for, :) would introduce
the cleanups and any needed driver changes, which wouldn't be propagated
into the stable kernels.  That way, we'd have the minimal bugfixes in
stable kernels, and the nice cleanups in the latest kernel version.

Of course, detailed testing is mandatory.

>> which I expected to have done already, but had some other "IRL stuff"
>> that introduced a delay.

