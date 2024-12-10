Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D3AE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 08:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e8rvyg+nlfaC27AfpiFrEfyzoUuw2U8sHPYRBq7Z5Kg=; b=0vA7L+y4GztADPj4J+X0EWUD9h
	bskKIf2cIgu5oUVUW82YVxJMN2VS/o2Th9YLtEpTLD37eSJDemvksvs/oycDaqkob4aQKsofJfZbY
	ChpEVDkzJTFs7KAVpHrMUFU240YvFo5iXHYoDY1oK3kmorQWsLSNNukwv6uhVmHPBp+M7DRPhJzPw
	m9cz70lopVHikvUJ/BRRqicdYC8c8TQz3zd4tQgN17Sh+cC1YS0rQDDxQOFg6qG2xyliLkK31M+xC
	cIK5RW8Gw7WtxP2AKnHmyIo1EOetrW45+N6XiOhvTPM5XLu1DRB40S25qavm5Toq8pVJkJrRLm+CI
	bWWkrGmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvbJ-0000000Ahm6-1gDk;
	Tue, 10 Dec 2024 08:28:13 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvaE-0000000AhbG-46ff;
	Tue, 10 Dec 2024 08:27:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733819224;
	bh=diwroXgDfFNnxf4klVn8zrbSRkjG62ZAQpvqL6XtdtE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IG0T+9XfaeyS+RmWBZiQT/og+j3HPF9nFz6CK4NPsOHhgFpI8wvAvqhLY2+AfcFnI
	 XX3ruDPm/UTsUq9lRFNIrr0laPOLcOAGjFrrjPs3FUH6V1E9hqct5pmHaqcFYb8dkd
	 6qV4wYMsn0UGuIaSffJVdGrrS7RkAD05iZfEZeAuycO7fFudr600psv6F8GSBFjKjk
	 4oev1p2SP6tFhqSYtMW818wP6QFxPSdt73LQ7pXlzqyOAiimNfZVX+YUbX++aANZxg
	 Yz1u6Upz3+nsCf0PG3yhvzHNL40Ij5bWmtoG4nsHgMl7lsvtgkIEk3T0bn5rTHkwsQ
	 0T6RsQFSn/uHw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C026417E1323;
	Tue, 10 Dec 2024 09:27:03 +0100 (CET)
Message-ID: <35392d9d-56a3-4db8-b500-6272d0bd275c@collabora.com>
Date: Tue, 10 Dec 2024 09:27:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: mediatek: mt8183-kukui-jacuzzi: Drop
 pp3300_panel voltage settings
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
References: <20241030070224.1006331-1-wenst@chromium.org>
 <20241030070224.1006331-2-wenst@chromium.org>
 <CAGXv+5HVy41qee6kwVUeLV_DfA0=wk2X77kv81rBKAZDGE6mww@mail.gmail.com>
 <bbaa0c8f-9702-4252-a674-e46fb51f0a2a@collabora.com>
 <CAGXv+5GHP1M1rKwR8j+bN8GmpxWtpkfLTnvBdkg5wOvWanc-kw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5GHP1M1rKwR8j+bN8GmpxWtpkfLTnvBdkg5wOvWanc-kw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_002707_177265_12D7850B 
X-CRM114-Status: GOOD (  25.99  )
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

Il 04/11/24 14:47, Chen-Yu Tsai ha scritto:
> On Mon, Nov 4, 2024 at 9:19 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 04/11/24 14:00, Chen-Yu Tsai ha scritto:
>>> On Wed, Oct 30, 2024 at 3:02 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>>>>
>>>> The pp3300_panel fixed regulator is just a load switch. It does not have
>>>> any regulating capabilities. Thus having voltage constraints on it is
>>>> wrong.
>>>>
>>>> Remove the voltage constraints.
>>>>
>>>> Fixes: cabc71b08eb5 ("arm64: dts: mt8183: Add kukui-jacuzzi-damu board")
>>>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>>>
>>> I see that the other three patches were merged and included in the pull
>>> request, but not this one. Were there any concerns?
>>>
>>
>> Sorry I forgot to actually provide an explanation for that - yes, I do have some
>> comment about this one.
>>
>> Despite this being a load switch, it's still switching power from regulator A to
>> target device X, so this is technically still providing 3.3V to device X.
>>
>> Think about how a "regular" full-fledged regulator works: you can (sometimes) set
>> a voltage, and then you can ENABLE the VOUT for said regulator (/rail): this kind
>> of "load switch" does exactly the same as the ENABLE switch for a full-fledged
>> regulator.
> 
> But it does not provide regulation. One cannot "set" the voltage on a load
> switch; one can only set it on its upstream supply, if that supply provides
> regulation.
> 
> IIRC Mark said some years ago that if a regulator doesn't regulate the
> voltage, then the voltage constraints should not be given. The constraints
> are then derived from its upstream supply.
> 
> That's the guideline I've followed for all the regulator related changes
> I've done over the years. Does that work for you?
> 

Ok, let's go with that then.

There's only one problem - patches 2 to 4 don't apply for whatever reason, is there
any dependency?

Cheers,
Angelo

>> So, this is switching on and off a power rail that is derived from a source rail,
>> practically creating... well, a "new" rail, with...
>>
>>    VIN=somewhere-3.3v,
>>    VOUT=somewhere-still-3.3v
>>
>> Any objections/doubts/etc? :-)
> 
> I agree with most of it, except the part that I laid out above about the
> load switch not providing regulation.
> 
>> P.S.: I'm writing fast, sorry if anything appears unclear, feel free to shoot more
>>         questions in case :-)
> 
> No, it's pretty clear, and I believe one of the common interpretations
> I see. Thank you for the quick response.
> 
> 
> Thanks
> ChenYu
> 
>> Cheers,
>> Angelo
>>
>>>
>>> ChenYu
>>>
>>>> ---
>>>>    arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi | 2 --
>>>>    1 file changed, 2 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
>>>> index 783c333107bc..7bbafe926558 100644
>>>> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
>>>> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
>>>> @@ -35,8 +35,6 @@ pp1800_mipibrdg: pp1800-mipibrdg {
>>>>           pp3300_panel: pp3300-panel {
>>>>                   compatible = "regulator-fixed";
>>>>                   regulator-name = "pp3300_panel";
>>>> -               regulator-min-microvolt = <3300000>;
>>>> -               regulator-max-microvolt = <3300000>;
>>>>                   pinctrl-names = "default";
>>>>                   pinctrl-0 = <&pp3300_panel_pins>;
>>>>
>>>> --
>>>> 2.47.0.163.g1226f6d8fa-goog
>>>>
>>



