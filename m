Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDD8C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 09:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dmNtmNaGuf1MBoX5YYoNpQolP/kFATeXJjhsO68f2RM=; b=1KWApdvQ6CLrZOAY4IttvuBpq+
	HfRxyWDm2L6WRK+XbZK9obj6lCR+Z784kYiXFx1Xg4C08rT0vu356E3o0g413RDJhlGUKYDlBReNH
	uJ2IUr/Ad/CNWb2UIf0R8BM0XgQEVZH77aKawqbMsf0EOxamKSfs0yj03h38c6UU1CdPFFgye1ILt
	shTasY703y3LK2L0lhOIW+85CgN53x0MVngzT3IA1YM0SZzSBUKLyCAvpaTXpfM10oWf6al39Anv4
	4nccM21AlKeDFuzasQgNZ5W9/spLWqux0kijIV4wWowS83AXy++XMp5Kwp6IuIJnRINel6zXu8dRo
	VT+B2/aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujaaO-0000000En2N-0MdT;
	Wed, 06 Aug 2025 09:37:28 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujaMt-0000000ElI7-3Dnt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 09:23:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1897EA567EA;
	Wed,  6 Aug 2025 09:23:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 538D7C4CEE7;
	Wed,  6 Aug 2025 09:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754472210;
	bh=Hwk7vf4HuAvJ7UE5NKvVA2XssqjK1pHzEDmND+upm+w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i6GNOto+ufwZENyRkRe/0U2+uH/1sJM9g0wsZ61Ffeoees9k2birWd0oPEd/qr7QX
	 1tErIhLbKSjseupyE4qMugARknExUz+FDgWq06s5mJgRN+me57kwAzEVm0KZYfg66X
	 JR/AN8nU2UsLuJZ5fJiaHI5tnfKTm7F/R+/2ZfwkjBA/orFv19vzXWuh/lNh6qXWqq
	 KOqOS37KyZXWVmoYqRuvUXX4Okpne/HTVHYwLhGJnGcRx9DR2UCyrdy7sLTroDbI1c
	 VcexKBfRy5HQB8mHPo/seo5c8xMfa9x8ETmEaKwUcoC160BsgykC0u6Ke6n1wA9v7c
	 etW7oMX8cjHZw==
Message-ID: <ef3b8e12-0677-4e49-bf2c-b8136c9a6908@kernel.org>
Date: Wed, 6 Aug 2025 11:23:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/16] Add support for the Axis ARTPEC-8 SoC
To: Pankaj Dubey <pankaj.dubey@samsung.com>,
 'SeonGu Kang' <ksk4725@coasia.com>,
 'Jesper Nilsson' <jesper.nilsson@axis.com>,
 'Michael Turquette' <mturquette@baylibre.com>,
 'Stephen Boyd' <sboyd@kernel.org>, 'Rob Herring' <robh@kernel.org>,
 'Krzysztof Kozlowski' <krzk+dt@kernel.org>,
 'Conor Dooley' <conor+dt@kernel.org>,
 'Sylwester Nawrocki' <s.nawrocki@samsung.com>,
 'Chanwoo Choi' <cw00.choi@samsung.com>,
 'Alim Akhtar' <alim.akhtar@samsung.com>,
 'Linus Walleij' <linus.walleij@linaro.org>,
 'Tomasz Figa' <tomasz.figa@gmail.com>,
 'Catalin Marinas' <catalin.marinas@arm.com>, 'Will Deacon'
 <will@kernel.org>, 'Arnd Bergmann' <arnd@arndb.de>
Cc: 'kenkim' <kenkim@coasia.com>, 'Jongshin Park' <pjsin865@coasia.com>,
 'GunWoo Kim' <gwk1013@coasia.com>, 'HaGyeong Kim' <hgkim05@coasia.com>,
 'GyoungBo Min' <mingyoungbo@coasia.com>, 'SungMin Park'
 <smn1196@coasia.com>, 'Shradha Todi' <shradha.t@samsung.com>,
 'Ravi Patel' <ravi.patel@samsung.com>, 'Inbaraj E' <inbaraj.e@samsung.com>,
 'Swathi K S' <swathi.ks@samsung.com>, 'Hrishikesh'
 <hrishikesh.d@samsung.com>, 'Dongjin Yang' <dj76.yang@samsung.com>,
 'Sang Min Kim' <hypmean.kim@samsung.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@axis.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, soc@lists.linux.dev
References: <20250710002047.1573841-1-ksk4725@coasia.com>
 <847e908b-1073-46ea-93f3-1f36cc93d8b8@kernel.org>
 <bfdc2eddde554e1d1808dd8399bc6a693f681c9b.camel@coasia.com>
 <CGME20250721064006epcas5p4617b0450e69f72c94d2b3ae7b1d200e7@epcas5p4.samsung.com>
 <99977f38-f055-46ed-8eb0-4b757da2bcdd@kernel.org>
 <000501dc06ab$37f09440$a7d1bcc0$@samsung.com>
 <e334f106-d9f3-4a21-8cdd-e9d23dd2755d@kernel.org>
 <002001dc06b1$540dc980$fc295c80$@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <002001dc06b1$540dc980$fc295c80$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_022331_944240_EFE416B4 
X-CRM114-Status: GOOD (  23.58  )
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

On 06/08/2025 11:05, Pankaj Dubey wrote:
> 
>> Also SAME strict DT compliance profile will be applied. (see more on
>> that below)
>>
>>>
>>> Given that ARTPEC-8 is a distinct SoC with its own set of IPs, we believe it's
>> reasonable
>>> to create a separate directory for it, similar to FSD.
>>
>> No. It was a mistake for FSD to keep it separate why? Because there is
>> no single non-Samsung stuff there. I am afraid exactly the same will
>> happen there.
>>
> 
> I am not sure, why you are saying this as a mistake, in case next version of FSD


My mistake that I agreed on that, based on promise that "there will be
non Samsung stuff" and that "non Samsung stuff" never happened.

> or ARTPEC is manufactured (ODM) by another vendor in that case, won't it
> create problems? 


No problems here. Non-Samsung Artpec/Axis soc will not go there. It will
go the top-level axis directory, just like artpec-6


> 
> For example ARTPEC-6/7 (ARM based) have their own directories as "arch/arm/boot/dts/axis/"
> These were not Samsung (ODM) manufactures SoCs. 
> 
> But ARTPEC-8/9 (ARM64) based SoCs are samsung manufactured. What if the next version say
> ARTPEC-10 is not samsung manufactured, so different version of products (SoCs) from
> same vendor (OEM), in this case Axis, will have code in separate directories and with different maintainers? 

It will be the same with Google Pixel for whatever they decide in the
future. dts/exynos/google/ + dts/google/.

I know that this is not ideal, but for me grouping samsung stuff
together is far more important, because there is much, much more to
share between two SoCs designed by Samsung, than Axis-9 and future
non-Samsung Axis-10. And I have `git grep` as argument:
git grep compatible -- arch/arm64/boot/dts/tesla/

and point me to any Tesla IP. Zero results.


> 
>> Based on above list of blocks this should be done like Google is done,
>> so it goes as subdirectory of samsung (exynos). Can be called axis or
>> artpec-8.
> 
> I will suggest to keep axis, knowing the fact that sooner after artpec-8 patches gets approved and merged
> we have plan to upstream artpec-9 (ARM64, Samsung manufactured) as well.
> 
>>
>> To clarify: Only this SoC, not others which are not Samsung.
>>
>>>
>>> We will remove Samsung and Coasia teams from the maintainers list in v2
>> and only
>>> Axis team will be maintainer.
>>
>> A bit unexpected or rather: just use names of people who WILL be
>> maintaining it. If this is Jesper and Lars, great. Just don't add
>> entries just because they are managers.
> 
> AFAIK, Jesper will be taking care. 
> 
>>
>>>
>>> Maintainer list for previous generation of Axis chips (ARM based) is already
>> present,
>>> so this will be merged into that.
>>
>> Existing Artpec entry does not have tree mentioned, so if you choose
>> above, you must not add the tree, since the tree is provided by Samsung SoC.
>>
> 
> OK
> 
>> OTOH, how are you going to add there strict DT compliance? Existing axis
>> is not following this, but artpec-8, as a Samsung derivative, MUST
>> FOLLOW strict DT compliance. And this should be clearly marked in
>> maintainer entry, just like everywhere else.
>>
> 
> As I said this is tricky situation, though artpec-8 is derivative of samsung, we can't confirm 
> if future versions (> 9) will be samsung derivative. 
> 
> But this would be case for all such custom ASIC manufactured by samsung, so I would like to
> understand how this will be handled? 


I suggest to do the same as Google and when I say Google in this email,
I mean Pixel/GS101. Google was easier because there was no prior entry
and Axis has, so you will have two Axis entries. But I don't see how we
can add clean-dts profiles to the existing Axis entry, if you decide to
include Artpec-8 in that one.


Best regards,
Krzysztof

