Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BDDCCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 08:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s0z0m5I3iTOnk1uia32ngawtgAW75JmI5fNRgQhQ4w8=; b=lBF9WWvCWBhfQoKw4oDAH7XLie
	hWVDwYjByAYfNWb9XZNJW9TdoJNKfvdUnO9hX05yC8UT8TBtobYJUV4Xy5OLMTrAgoe8qdpxx3LUn
	fPJ8w4RW8qGdhojIAQsIyoT04ptkvJKpQX8EEj6XSbIXoPR2sXMoa1oDNh5HtZNXkGNAt6Z8y4RVU
	DP5taAGOpnN5avCDG74lLUMkdbGwsw38cUIhN9X97CT0359uJFOyj90BiC/5L/RgK4z38TJSSpUdp
	oeZ2LegDJdmstv+9GPl4ensJ8WN7uvf5IpZyM7qbLuk6aeZPiQZ7WQAI8Y6iJs1CpOHvwM4B9qsbH
	hBVyJU9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8wvQ-00000000wfC-2EoR;
	Wed, 15 Oct 2025 08:32:00 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8wvO-00000000wdm-1eGu;
	Wed, 15 Oct 2025 08:31:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760517116;
	bh=LHvokEjTG+iDmfz8a8WfH/PVU55uP938bDrAF617h6w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jY0a7noLy0Ijmfc07CX9yvvjDHr2vYhPF3q8f6Aha3qmLYOxBY6vIrMInS8LyZeES
	 izl/cj/MvnDWiStvIciy/WJhbwNmZ6XqpiRQkfF94+/V7AieqHP0BuhI0BYzMbTdZz
	 8a/D/cCkjP3L5dHAI265xVfDYQI/6L7f2qsPzV/je7U8jNe5Rkk3D1202aygwPA4X5
	 M4E2/DEuZgpXL6Qj4tbxFfjH2hTG9CfenYzj/7dpzjHQhirDz5WZJoKToToEXn3ZJ2
	 hBcXz6xssGykPw6nhIPtNRuRjsl/209YZLJrk0rzKuTH7GIyR/wS2M9+FG/XJXpy8w
	 pCNlIVNOtiUGA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 076EE17E00A3;
	Wed, 15 Oct 2025 10:31:55 +0200 (CEST)
Message-ID: <f613c223-a2ae-4092-8361-0396ace8df99@collabora.com>
Date: Wed, 15 Oct 2025 10:31:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8188-geralt: Enable first SCP
 core
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Fei Shao <fshao@chromium.org>
References: <20250814092510.211672-1-wenst@chromium.org>
 <b20a1c7d-0da5-433b-987c-f55a5a229bed@collabora.com>
 <CAGXv+5EPd5hLSNTFYkBWPCL1Bq4CJN4R7v5ZWtoRMYSi9+TeCA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5EPd5hLSNTFYkBWPCL1Bq4CJN4R7v5ZWtoRMYSi9+TeCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_013158_583221_DF8D90F1 
X-CRM114-Status: GOOD (  14.98  )
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

Il 15/10/25 09:31, Chen-Yu Tsai ha scritto:
> On Tue, Oct 14, 2025 at 9:27 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 14/08/25 11:25, Chen-Yu Tsai ha scritto:
>>> The first SCP core is used to drive the video decoder and encoders.
>>>
>>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>>> ---
>>> Changes since v1:
>>> - Added SCP vreq pin
>>> ---
>>>    .../boot/dts/mediatek/mt8188-geralt.dtsi      | 25 +++++++++++++++++++
>>>    1 file changed, 25 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
>>> index c5254ae0bb99..7fedbacdac44 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
>>> @@ -164,6 +164,12 @@ reserved_memory: reserved-memory {
>>>                #size-cells = <2>;
>>>                ranges;
>>>
>>> +             scp_mem_reserved: memory@50000000 {
>>> +                     compatible = "shared-dma-pool";
>>> +                     reg = <0 0x50000000 0 0x800000>;
>>> +                     no-map;
>>> +             };
>>> +
>>>                apu_mem: memory@55000000 {
>>>                        compatible = "shared-dma-pool";
>>>                        reg = <0 0x55000000 0 0x1400000>;
>>> @@ -1077,6 +1083,13 @@ pins-bus {
>>>                };
>>>        };
>>>
>>> +     scp_pins: scp-pins {
>>> +             pins-scp-vreq {
>>> +                     pinmux = <PINMUX_GPIO98__FUNC_O_SCP_VREQ_VAO>;
>>> +                     bias-disable;
>>> +             };
>>> +     };
>>> +
>>>        spi0_pins: spi0-pins {
>>>                pins-bus {
>>>                        pinmux = <PINMUX_GPIO69__FUNC_O_SPIM0_CSB>,
>>> @@ -1146,6 +1159,18 @@ &postmask0_out {
>>>        remote-endpoint = <&dither0_in>;
>>>    };
>>>
>>> +&scp_cluster {
>>> +     status = "okay";
>>> +};
>>> +
>>> +&scp_c0 {
>>> +     pinctrl-names = "default";
>>> +     pinctrl-0 = <&scp_pins>;
>>> +     firmware-name = "mediatek/mt8188/scp.img";
>>
>> After a (very brief) discussion with Arnd last time, turns out we decided to avoid
>> using the firmware-name property, including for mtk-scp.
>>
>> Please resend without firmware-name.
>>
>> P.S.: there's a patch to construct the firmware name from compatible...
>> https://lore.kernel.org/r/20250911140043.190801-1-angelogioacchino.delregno@collabora.com
> 
> I'm aware of the patch, but did that get merged?

Not yet.

 >> If not then this would
> cause it to default to just /lib/firmware/scp.img?

Yes... but there's no way around it, we can't add firmware-name to devicetrees.

> 
> ChenYu
> 
>> Cheers,
>> Angelo
>>
>>> +     memory-region = <&scp_mem_reserved>;
>>> +     status = "okay";
>>> +};
>>> +
>>>    &sound {
>>>        pinctrl-names = "aud_etdm_hp_on", "aud_etdm_hp_off",
>>>                        "aud_etdm_spk_on", "aud_etdm_spk_off",
>>
>>



