Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F2EEF588EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 15:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OZaJBIhgsDq0upYh4RqdlXEmj6l683FqTBoGfv+TMvM=; b=Iq1tVTVoCM2TZrYRY48UFMkciO
	WeSSrMs2Eh90kkbO8ePrU017wxx0UYiwH2RvgJazSePU9cn5vah97QmN0Oy38LPppl9HN3gfIjZsd
	1ICyT66dZNZR05O1hDqt4VgZ21TULJPFlgZG3tbkNvWOv3MopN6umCZYZthbk8s4Hn7kBwIZffFEJ
	/BJfJaB4OaQpa7q6DH1Vi/n45CvTdvsRxmO0iKgwCVQlM9xfWZ1vDanpx2W4B+5lYKEt0QAtzP61v
	LFxek9WIIEGwPBq6lVf8PeeDC9VPG/rF5VJJGIWne9UBUzAdF9HJedpjny28YMOhlt4AFE6wPCuxu
	lZJ7wLMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEqwJ-00000007Nih-20Tp;
	Mon, 20 Apr 2026 15:53:35 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEqwH-00000007Ni5-20Zu;
	Mon, 20 Apr 2026 15:53:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776700406;
	bh=AD5SU7VAHmOec5494xhlBBXbP87I8anCA//9QBwyto4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DqsBU3cAZqitqjmVK+sLr4bmFIpQ0J6XbYpByue8a6Mbcc3TfQS1UPd9g9fZ0wS4L
	 2pmXCQHwczCr5cK9WTdkdbmG3PakX0/qnZnEl1vutxb6PLUYbOn4kZnpicMQtrGe7K
	 bQ4AbJ7yV0Td+uwv+qzpGNzR9V+MgL/ydHQ2imXC46kmQidtbLOMQAOq3ucEaoRK2l
	 /6Qv9yJzeadicJbQJSZoDDgDMODBTjzPqgKtE2Iesm3SYErdK7AHEr+lj26iBHecV6
	 0o0mY/7DcEF3VN+kZwl2mYqxrfXss8KIP4iUdw7918pAagajKHrEYYgZeIVcykIJqR
	 kHoRpmFhAvk+g==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9105517E137D;
	Mon, 20 Apr 2026 17:53:26 +0200 (CEST)
Message-ID: <693537c8-b7d9-40e9-9c53-284c1af78e06@collabora.com>
Date: Mon, 20 Apr 2026 18:53:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3576-luckfox-core3576
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
 <2282688.C4sosBPzcN@phil>
 <401a020f-ca5d-4c7d-941e-f0288e144357@collabora.com>
 <2480203.yKrmzQ4Hd0@phil>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <2480203.yKrmzQ4Hd0@phil>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_085333_760104_DD3EE308 
X-CRM114-Status: GOOD (  25.44  )
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

On 4/20/26 6:18 PM, Heiko Stuebner wrote:
> Am Montag, 20. April 2026, 13:00:25 Mitteleuropäische Sommerzeit schrieb Cristian Ciocaltea:
>> Hi Heiko,
>>
>> On 4/18/26 2:12 AM, Heiko Stuebner wrote:
>>> Hi Cristian,
>>>
>>> Am Freitag, 17. April 2026, 18:34:17 Mitteleuropäische Sommerzeit schrieb Cristian Ciocaltea:
>>>> On 4/17/26 2:32 PM, Heiko Stuebner wrote:
>>>>> the comments below apply sort of to all patches in that series.
>>>>>
>>>>> Am Freitag, 17. April 2026, 11:24:39 Mitteleuropäische Sommerzeit schrieb Cristian Ciocaltea:
>>>>>> The board exposes the GPIO4_C6 line to control the voltage bias on the
>>>>>> HDMI data lines.  It must be asserted when operating in HDMI 2.1 FRL
>>>>>> mode and deasserted for HDMI 1.4/2.0 TMDS mode.
>>>>>>
>>>>>> Wire up the HDMI node to the GPIO line using the frl-enable-gpios
>>>>>> property and drop the line from the vcc_5v0_hdmi regulator to allow
>>>>>> adjusting the bias when transitioning between TMDS and FRL operating
>>>>>> modes.
>>
>> [...]
>>
>>>>>
>>>>>
>>>>>> @@ -231,6 +228,8 @@ &gpu {
>>>>>>  };
>>>>>>  
>>>>>>  &hdmi {
>>>>>> +	pinctrl-0 = <&hdmi_txm0_pins &hdmi_tx_scl &hdmi_tx_sda &hdmi_frl_en>;
>>>>>> +	frl-enable-gpios = <&gpio4 RK_PC6 GPIO_ACTIVE_LOW>;
>>>>>
>>>>> this should be sorted the other way around I think.
>>>>>
>>>>> Also please provide a pinctrl-names property too. If for whatever reason
>>>>> the dw-hdmi aquires a 2nd pinctrl state in the future, this makes sure
>>>>> board DTs are staying in the "old" compatible mode until they are adapted.
>>>>
>>>> Just to make sure I fully understand, the convention is that 
>>>>
>>>>   pinctrl-names = "default";
>>>>
>>>> should be always provided, even when the node overrides an existing pinctrl-0
>>>> property?
>>>>
>>>> E.g. in rk3576.dtsi we have:
>>>>
>>>>   hdmi: hdmi@27da0000 {
>>>>     ...
>>>>     pinctrl-names = "default";
>>>>     pinctrl-0 = <&hdmi_txm0_pins &hdmi_tx_scl &hdmi_tx_sda>;
>>>>     ...
>>>>   }
>>>>
>>>> Hence I omitted pinctrl-names which doesn't change and just appended
>>>> &hdmi_frl_en to pinctrl-0's original value.
>>>
>>> correct, please always provide a pinctrl-names entry when setting a new
>>> pinctrl-0 .
>>>
>>> The background is, imagine you have a base:
>>>
>>> pinctrl-names = "default";
>>> pinstrl-0 = <....>;
>>>
>>> and override pinctrl-0 in a board.
>>>
>>> Now a newer binding introduces a 2nd pinctrl state "foo". Of course
>>> we're backwards compatible, and both are valid and the driver checks
>>> what states are defined.
>>>
>>> So the base sets:
>>> pinctrl-names = "default", "foo";
>>> pinctrl-0 = <...>;
>>> pinctrl-1 = <...>;
>>>
>>> in your (old) board you override pinctrl-0, but the driver still sees
>>> the new variant with 2 pinctrl states, where it should've stayed with
>>> the legacy 1-state, until the board-dts might get adapted in the future.
>>>
>>>
>>> And I know, we're likely not doing that everywhere, and also in most
>>> cases it won't really matter, but still it is safer and sets the better
>>> precedent :-) .
>>
>> Thanks for the detailed explanation, that clears things up!
>>
>> There are several other nodes (e.g. i2c, pwm, uart) that also lack
>> pinctrl-names despite providing pinctrl-0 - I can address those in a
>> separate patch.
> 
> As said above it is an ideal to aspire to (having -names together with
> defining states), but if you want to add the "missing" -names,
> go ahead :-) .
> 
> 
>> I also noticed an inconsistency in property ordering: some nodes place
>> pinctrl-names before pinctrl-<n> and others after.  I have always used
>> the former, but we should probably prefer the latter to stay consistent
>> with how clocks, resets, phys, etc. are ordered.
>>
>> Thoughts?
> 
> There is sort of a "conflict" between regular ordering and possibly
> better readability. I.e. the dt-writing guidelines propose alphabetical
> ordering which I guess puts numbers before letters.
> 
> On the other hand the semantic definition of list the states and then
> define them (names first, -0, -1, etc second) looks more sensible from
> a understanding standpoint.
> 
> 
> But there we'd end up with special rules, so just sticking to the
> base sorting will cause less friction in the long run I think.
> Aka, -0, -1 first; -names after, follows the main sorting suggestions
> so it's easy to explain to newcomers.

Yes, that seems like a good enough reason to go with this approach.

> But please don't re-sort existing entries :-)

Oh, no, it's just for the current changes. :-)

Thanks,
Cristian


