Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4146D206A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 14:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eE2Uvh99MMqIIvSd8KCYplYmteqyQ+tOEAxNmRJMzEA=; b=CwbhoYopDUsdm9bPB7+7zL9cJc
	YnUKebfwcWfFXYe2KueSm8t46pbXfdIpesN8NcWOlHTS2i6/lTHqZFIjZbnVOd1MLYs10++SWkUxG
	9Qggpj0+RAwTXg/0CumWbnQSXY2sqfqfPxm0UJgXfuBfO8f6bE0G+RvuWO+2Do5zy9f17N0GxnfIw
	eaDr+SrnoXTvjH4OihLuUQ9PR6VDw5H36tH30TzDJ/27nlkg7ahUYMtAmDmMwjPUzhr8UqHbrmdBY
	N7sF/XTow7UMfgyOfYF6Qyljvf1jClritFEGzvJ0EGgBfrmutQgFcbD47lXvvIn0HqwszW3l9kou2
	LJDaQopw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRAOu-000000087jO-2ksY;
	Thu, 04 Dec 2025 14:33:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRAOq-000000087ij-4C21;
	Thu, 04 Dec 2025 14:33:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5303A339;
	Thu,  4 Dec 2025 06:33:32 -0800 (PST)
Received: from [10.1.28.112] (010265703453.cambridge.arm.com [10.1.28.112])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B9F93F66E;
	Thu,  4 Dec 2025 06:33:38 -0800 (PST)
Message-ID: <43f9753d-2e63-4b52-a4af-ca8d22f0b351@arm.com>
Date: Thu, 4 Dec 2025 14:33:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: add SPDIF audio to Beelink A1
To: Christian Hewitt <christianshewitt@gmail.com>,
 Alex Bee <knaerzche@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250828164300.3829488-1-christianshewitt@gmail.com>
 <66ae20b3-3316-4ec2-9c51-8414c053dc32@arm.com>
 <f0df035f-3c3d-4649-9f48-3e8e2e69d17b@gmail.com>
 <5557C31E-3B1D-426C-BF9F-C417FF29E97C@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <5557C31E-3B1D-426C-BF9F-C417FF29E97C@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_063341_178215_F95E657D 
X-CRM114-Status: GOOD (  14.55  )
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

On 2025-12-04 2:13 pm, Christian Hewitt wrote:
>> On 4 Dec 2025, at 12:23 am, Alex Bee <knaerzche@gmail.com> wrote:
>>
>> Hi Robin,
>>
>> Am 03.12.25 um 17:21 schrieb Robin Murphy:
>>> [ Just noticed this... ]
>>>
>>> On 2025-08-28 5:43 pm, Christian Hewitt wrote:
>>>> From: Alex Bee <knaerzche@gmail.com>
>>>>
>>>> Add the required nodes to enable SPDIF audio output on
>>>> the Beelink A1 set-top-box.
>>>
>>> But the A1 doesn't have S/PDIF? Only HDMI plus a 3.5mm jack connected to the analog audio codec (and possibly the composite TV out) :/
>>>
>> Yeah, sorry - this patch wasn't supposed to be submitted upstream.
> 
> Apologies, this is my enthusiasm for trying to clear out the patch
> collection LibreELEC has been hoarding by sending things upstream
> on behalf of the original authors (and hoarders).

No worries :)

> Would you like me to send a revert patch?

Since I'm the only one complaining, and I'm liable to have a couple more 
Rockchip DT patches to send soon anyway, feel free to leave it with me 
unless you're particularly keen.

Cheers,
Robin.

> 
> Christian
> 
>> Regards,
>>
>> Alex
>>
>>> Thanks,
>>> Robin.
>>>
>>>> Signed-off-by: Alex Bee <knaerzche@gmail.com>
>>>> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
>>>> ---
>>>>    arch/arm64/boot/dts/rockchip/rk3328-a1.dts | 23 ++++++++++++++++++++++
>>>>    1 file changed, 23 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3328-a1.dts b/arch/arm64/boot/dts/rockchip/rk3328-a1.dts
>>>> index f7c4578865c5..b276a29bdd85 100644
>>>> --- a/arch/arm64/boot/dts/rockchip/rk3328-a1.dts
>>>> +++ b/arch/arm64/boot/dts/rockchip/rk3328-a1.dts
>>>> @@ -58,6 +58,24 @@ ir-receiver {
>>>>            gpios = <&gpio2 RK_PA2 GPIO_ACTIVE_LOW>;
>>>>            linux,rc-map-name = "rc-beelink-gs1";
>>>>        };
>>>> +
>>>> +    spdif_sound: spdif-sound {
>>>> +        compatible = "simple-audio-card";
>>>> +        simple-audio-card,name = "SPDIF";
>>>> +
>>>> +        simple-audio-card,cpu {
>>>> +            sound-dai = <&spdif>;
>>>> +        };
>>>> +
>>>> +        simple-audio-card,codec {
>>>> +            sound-dai = <&spdif_dit>;
>>>> +        };
>>>> +    };
>>>> +
>>>> +    spdif_dit: spdif-dit {
>>>> +        compatible = "linux,spdif-dit";
>>>> +        #sound-dai-cells = <0>;
>>>> +    };
>>>>    };
>>>>      &analog_sound {
>>>> @@ -325,6 +343,11 @@ &sdmmc {
>>>>        status = "okay";
>>>>    };
>>>>    +&spdif {
>>>> +    pinctrl-0 = <&spdifm0_tx>;
>>>> +    status = "okay";
>>>> +};
>>>> +
>>>>    &tsadc {
>>>>        rockchip,hw-tshut-mode = <0>;
>>>>        rockchip,hw-tshut-polarity = <0>;
> 


