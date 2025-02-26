Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A13C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 21:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=So7C0SR7WzrmyyQUcYu45BoPp7pzAYrOZ8CNuL8f6P8=; b=Oe7KhmyHod/VFQSxYEDXGjBnRp
	ljRmCzmDmPsu+N6hx2jPONmk6kgGjvPhwwYhocX3prudOATQ7IAS78O8m4YB6R6jFEkrqE3gycobx
	n+QfmJmfgSbtewSZfmDbvCPeaVQlKgFXMl+vkXMqVsYO0KjKgGE2c0GtgdeKRAZO+1WoUrh5y1Iw/
	KB0OtvX37aFd71PgP4N3e2mmes8NnNh6lFbj2EK4AYI2M5YneOI8Ww2tpGf9lx/s78fetJ31dz8mU
	VT4pnaJMdiuQnxfzbFXon17LVc5VmPfSK28ZkqzpQqr3m48I3XDLMw6IZcrbhMZmsCfKRetrhXHKi
	RyGzIy9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnP1Z-00000005TQO-2SKz;
	Wed, 26 Feb 2025 21:33:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnP01-00000005TGH-3NHT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 21:31:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5E2F15C6C1F;
	Wed, 26 Feb 2025 21:30:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31AF5C4CEE7;
	Wed, 26 Feb 2025 21:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740605484;
	bh=PRE/A1VqtcxDcp5QHrfXCdxA0NkFgqWuo0KK3OU5E/o=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=VbT+32uoi+S966XSIV43IVdHDOCkoR4xt4GkRsdG5Gfx0l/lk1OZaGmab0b9KJBJH
	 PPnRDqjW1RQZPJl35PtQKX7iCuxXhRoCatilQzGbYf3TRETC4bv+lfwo/fgLQldyhf
	 dNwjEvsTbU5kS2bPjXX7kHW6Vm4MAbhYCsNw0GgRaHR4sAADfynFS1pdGgH/fTHzNn
	 MVInle6Att2aa+UNdkDx41uw3/9Fqxslx/pRhfaEUavE57Ai6nypu1uqF/CtDnmzEC
	 InDnIgYKUi+0s2+ZiBWM0fk7yk5IBnq/IWJvlLg/V3SXnAtftMVIhixKbYmmNwbMJw
	 FXDXX4fOk9O3g==
Message-ID: <17450f7d-d398-4a75-8b53-6c9c396661ab@kernel.org>
Date: Wed, 26 Feb 2025 22:31:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] ARM: dts: stm32: add Hardware debug port (HDP) on
 stm32mp25
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Clement LE GOFFIC <clement.legoffic@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250225-hdp-upstream-v1-0-9d049c65330a@foss.st.com>
 <20250225-hdp-upstream-v1-7-9d049c65330a@foss.st.com>
 <418a80a9-8c08-4dd1-bf49-1bd7378321aa@kernel.org>
 <b257aa79-6ca9-4f57-988a-ec00225992ab@foss.st.com>
 <b57e3c9e-244e-435b-8a7b-cf90f3a973b3@kernel.org>
 <988667a4-4bc0-4594-8dfd-a7b652b149b2@foss.st.com>
 <55beb3e7-65ac-4145-adae-fb064378c78d@kernel.org>
 <8cdc7e52-f9e2-4fc9-be68-0dd72a25ee1b@foss.st.com>
 <48cc626a-d632-444f-8563-07a9ea0ecc71@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <48cc626a-d632-444f-8563-07a9ea0ecc71@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_133125_932961_FD6C139F 
X-CRM114-Status: GOOD (  21.92  )
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

On 26/02/2025 22:26, Krzysztof Kozlowski wrote:
> On 26/02/2025 16:30, Alexandre TORGUE wrote:
>>
>>
>> On 2/26/25 16:08, Krzysztof Kozlowski wrote:
>>> On 26/02/2025 10:33, Alexandre TORGUE wrote:
>>>>>>>> +		hdp: pinctrl@44090000 {
>>>>>>>> +			compatible = "st,stm32mp-hdp";
>>>>>>>
>>>>>>> So here again - you have stm32mp251 SoC, but use entirely different
>>>>>>> compatible.
>>>>>>
>>>>>> Ok so I will use "st,stm32mp15-hdp"
>>>>>
>>>>>
>>>>> This means this is stm32mp15 SoC. I do not see such SoC on list of your
>>>>> SoCs in bindings. What's more, there are no bindings for other SoC
>>>>> components for stm32mp15!
>>>>
>>>> Yes stm32mp15 is not a "real SoC". I agree that at the beginning of the
>>>> STM32 story we didn't have a clear rule/view to correctly naming our
>>>> compatible. We tried to improve the situation to avoid compatible like
>>>> "st,stm32", "st,stm32mp" or "st,stm32mp1". So we introduced
>>>> "st,stm32mp13", "st,stm32mp15" or "st,stm32mp25" for new drivers. So yes
>>>> it represents a SoC family and not a real SoC. We haven't had much
>>>> negative feedback it.
>>>>
>>>> But, if it's not clean to do it in this way, lets define SoC compatible
>>>> for any new driver.
>>>
>>> Compatibles are for hardware.
>>>
>>>> For the HDP case it is: "st,stm32mp157" and used for STM32MP13,
>>>> STM32MP15 end STM32MP25 SoC families (if driver is the same for all
>>>> those SoCs).
>>>
>>> No, it's three compatibles, because you have three SoCs. BTW, writing
>>> bindings (and online resources and previous reviews and my talks) are
>>> saying that, so we do not ask for anything new here, anything different.
>>> At least not new when looking at last 5 years, because 10 years ago many
>>> rules were relaxed...
>>
>> So adding 3 times the same IP in 3 different SoCs implies to have 3 
> 
> Yes. Always, as requested by writing bindings.
> 
>> different compatibles. So each time we use this same IP in a new SoC, we 
>> have to add a new compatible. My (wrong) understanding was: as we have 
> 
> Yes, as requested by writing bindings and followed up by all recent
> platforms having decent/active upstream support. See qcom, nxp, renesas
> for example.
> 
>> the same IP (same hardware) in each SoC we have the same compatible (and 
> 
> You do not have same hardware. You have same IP, or almost same because
> they are almost never same, implemented in different hardware.
> 
>> IP integration differences (clocks, interrupts) are handled by DT 
>> properties.
> 
> Which binding doc/guide suggested such way? Countless reviews from DT
> maintainers were saying opposite.
I was not precise: IP integration differences are of course handles as
DT properties, but I wanted to say that it does not solve the problem
that IP integration means you might have differences in this device and
you should have different quirks.

And the example in this patchset: entirely different pin functions is a
proof. This device behaves/operates/integrates differently, thus
different compatible.

Best regards,
Krzysztof

