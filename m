Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6690C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 11:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1laSR5a4v9EPE2epbHuClH0DrMWKE0kMd4jDMidubus=; b=KQI74+EIy3Q6+MMKU5rheBG5f1
	LQFq/8RSqrTiPSADPALanz7ZKRHfB6lAHeSp2UQbcxMf/HRLNCskU+ufCoEyqSfKTbcgeRu4y2jsn
	d700Y5YmU0JkHiEsh4La0f6ekoH8wgFrR19SPdQAPv6M2GH3psjhIVGFbcR8KSoVWnDB+wgasTAEs
	yhRYjjDvV09oh8MrrnrCnmpYPdJpfGS9y3bfazbO8qSxhTunytEHBtrkB7J2sfrRklT+fAwYUhrcO
	7LgBGCjZaqXOtzvVJPgxtjy3g+E+ARR6XzmMTJJsuUe6LyEP6/pNKbWBWIbv32+OzjkcgbwxWzzqi
	kvf8CU7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUOZg-00000008Wsl-089g;
	Wed, 25 Jun 2025 11:45:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNa8-00000008LTY-1kV0
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Jun 2025 10:42:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1laSR5a4v9EPE2epbHuClH0DrMWKE0kMd4jDMidubus=; b=EklqML8WmaC5Smi4eWjuqAsQt7
	14ezoeYCZ6hFbjVmmjV9N4Ai0smeJyAr6AibmvJWOB/euITEI5HnYMFPHyoy04ipQh42YHZuQW8AM
	tIVjtadsSttMKkODUeTkvq2HV/q6podSJlPzSEmNuJoY/1sRyPqR6nQLliTZdaeW2ixCnvj/VJ2WY
	RZefOuZHemrKgwXXLuoTMfVR0NMr2ZAZlRuh+fpq/xhxGOwLFkXbi3mz8R0/6qCs7iczPkEHWu0GE
	A+ZxuEaMEQ0+Vbq2t+2q+IX/AsT5NNKLP+zHvZFlLNkHjFkGkP06F3XLfZuYpMnMeqkivBjMcFxFr
	5zDTKZ/Q==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNa5-00000005nFj-2yE2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 10:42:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A69145C6908;
	Wed, 25 Jun 2025 10:39:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1486C4CEEA;
	Wed, 25 Jun 2025 10:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750848133;
	bh=KhFN1TxOoGEmZA8OZHUI01EMEP3LX35H19OmFZ+F6GY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DdZlfoNlv/H7Af1L1xaYMvRGXMUgDT6xnCPcQxGoruRELBvqLyCfYCryua+hOi6aK
	 QlwhkKD4HctTsYZVYHzfaSC9sQFWnSLGTNFXb2qUfGhUM4Xw59I2bZbJgCmV0ma8TH
	 YsPr0egj300IuGlPpIENtBm8DTnIyo1qmeowAmFre7+KVfIaW2cuKVxbNDdHg4igqo
	 Qwc19o4YJQ4g+AwcJ5blORv2P1DZeiGTP/etdLfoiiWLyR5esfmZ0Ou1lvRrthTeAP
	 Z99cZf2w2w8dyAA3gXZVF23Z9/hUpeamI6AycNq/z8Xs6gazVipKx+g1Rs63DngSW4
	 DGmam5kfZJtXA==
Message-ID: <33c99324-a50b-4e0f-bcc7-012d3244d47a@kernel.org>
Date: Wed, 25 Jun 2025 12:42:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 2/6] gpio: mmio: get chip label and GPIO base from
 device properties
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Russell King <linux@armlinux.org.uk>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 patches@opensource.cirrus.com, linux-samsung-soc@vger.kernel.org
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
 <20250624-gpio-mmio-pdata-v1-2-a58c72eb556a@linaro.org>
 <CACRpkdavsQJTfiwn-F+ML5MK6ADtr-31bBxLA4gV7MTAYR0YGQ@mail.gmail.com>
 <CACMJSestPPEvsUrWaqz7yZ8OxZTMEOBY7htE7c8BV-VBumj1Lw@mail.gmail.com>
 <6c64751d-67f6-4c30-a312-af289d9f432e@kernel.org>
 <CAMRc=MdEZkjoDR83JFg5OPP07_DkAfeZixN9C+uxhkqkxaKypg@mail.gmail.com>
 <b9c6f5bf-ac43-497a-9354-6448cfb2839c@kernel.org>
 <CAMRc=MdEWmgj8hTY3fQrXnDDv6pmK9XPvT9gE=5oGEs8R7GOVA@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAMRc=MdEWmgj8hTY3fQrXnDDv6pmK9XPvT9gE=5oGEs8R7GOVA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_114218_120734_195CB5D5 
X-CRM114-Status: GOOD (  14.89  )
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

On 25/06/2025 12:28, Bartosz Golaszewski wrote:
> On Wed, Jun 25, 2025 at 12:26 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>>>>>> I wouldn't be stoked to see device trees abusing the "gpio-mmio,base"
>>>>>> property all of a sudden just because it now exists as a device
>>>>>> property though... I kind of wish we had a way to opt out of exposing
>>>>>> this to all the sub-property paths. But it seems tiresome, so:
>>>>>>
>>>>>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>>>>>>
>>>>>> Yours,
>>>>>> Linus Walleij
>>>>>
>>>>> That's not a problem - this property is not in any DT bindings and as
>>>>> such is not an allowed property in DT sources. For out-of-tree DTs? We
>>>>> don't care about those.
>>>> That's not true, we do care about implied ABI. Try changing/breaking
>>>> this later, when users complain their out of tree DTS is affected, and
>>>> explaining this all to Greg.
>>>>
>>>
>>> Wait, seriously? I thought that the upstream bindings are the source
>>> of truth for device-tree sources...
>>
>>
>> They are, until they are not... ok, we don't really care that much about
>> out of tree DTS, but in-tree DTS still could use these and don't care
>> about bindings check, right?
>>
> 
> Could they though? I can imagine this happening by accident but in
> general: you'd expect new sources to follow the bindings and be

Yes, that is what I would expect.

> verifiable against them? Otherwise, what's the point of the schema?

Of course, but do you really think most SoC maintainers even run
dtbs_check on their existing or new code?

I think some maintainers pay attention, but RISC-V and my tree are the
only ones actually actively checking this for existing and new code.
Except me, no other maintainer even referenced maintainer-soc-clean-dts
profile.

I can easily imagine DTS with warnings and undocumented ABI gets merged
and then released in some kernel. And when you release such kernel in
v6.17 with DTS and drivers, isn't this already an implied ABI?

Best regards,
Krzysztof

