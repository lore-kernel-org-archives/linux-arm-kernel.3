Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42CAEC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 07:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5BV8xtKhERQiCHQtsRIMlHA+oAh5S6GP6avYsWR+heA=; b=UU5qOZaEn/6ryuEMNhZ0DN684+
	PCg2IV1evnFW0AV9fWT1EgH4KbNfa3Zs2DJgNlmjo8TGEP6NqJ4MGqffErtsnRBmSBPTZa4uZgWRQ
	A3tW1huK/YXzeMtyg/Wn44sMct35Yzn84jkF7pmmGxF4wpYnrnR/zYI6NpCXyHInCDqo8LYdf7QWl
	ZVZm63XoUa4phMlRZ3OuJrWjDY6A4V8FbJPmtFmwCAQsJHmP2vqePDb5wM29M0ByXtEv4sE6qlmSI
	KulNcO9cVXF1FuueMY7RBeWg16/q/uRa0DW5F8U7HlwHIXZbCD3xjvG5ABf8gw7+/9aopxwB6jeLE
	4ekCwefw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqRn5-0000000DOTC-0Vjt;
	Fri, 07 Mar 2025 07:06:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqRlR-0000000DOH9-466I;
	Fri, 07 Mar 2025 07:04:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4B8035C06A9;
	Fri,  7 Mar 2025 07:02:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D1DFC4CED1;
	Fri,  7 Mar 2025 07:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741331096;
	bh=5e5MJqakEHjCgRgY1uejLfs+Wy8KtSWOqlKL58qDFPI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kySxEx0QFGm/OEDdq6/QsJaUdCjxywWV5uPO1+QreWZnwSJrHoYfIgtSUJQyMWZAS
	 i3Y0KTwmFM8iB8KN62vj+gWq4xFhvKj3CxDYQyyOo2JQBt8FjGxcYDv6JUMu3W1J2T
	 RpV7CARznlHW3WfZOYEmgKruraRnGGhDs5xPq2qjnldo2ZgzZ5qz6QOTDE43cUOs2L
	 A2ISq9LCYZsQK8RCA8Esi863eujw4oFnAxcajjUqtIoFGpOOfYB/ngMYR7tzemhF1v
	 75kKA/kWb5gWqXq7KlC3wGPE90eADK+Fxym1s9vGe08JzAXtL4a2kHTu2ZihecXYLC
	 4Fv7JUqpTWiZA==
Message-ID: <8d90731b-4b5a-45a8-83d1-4351044f59c7@kernel.org>
Date: Fri, 7 Mar 2025 08:04:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: memory: mediatek: Add SMI reset and
 clamp for MT8188
To: =?UTF-8?B?RnJpZGF5IFlhbmcgKOadqOmYsyk=?= <Friday.Yang@mediatek.com>,
 "robh@kernel.org" <robh@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?UTF-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20250221074846.14105-1-friday.yang@mediatek.com>
 <20250221074846.14105-2-friday.yang@mediatek.com>
 <0dcb2efd-6bbb-4701-960a-74930eb457e4@collabora.com>
 <264f78c1067e363c69e146543ebb77dbedfbd181.camel@mediatek.com>
 <463ca2df-a0ee-4b9e-a988-12f316ae7d1a@kernel.org>
 <9305a4fd6829e5e2ae6c3247d11b9f47ed277f8b.camel@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <9305a4fd6829e5e2ae6c3247d11b9f47ed277f8b.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_230458_125682_E82823E0 
X-CRM114-Status: GOOD (  15.13  )
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

On 07/03/2025 07:38, Friday Yang (杨阳) wrote:
> On Thu, 2025-03-06 at 13:48 +0100, Krzysztof Kozlowski wrote:
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>
>>
>> On 06/03/2025 13:45, Friday Yang (杨阳) wrote:
>>>>> +          const: mediatek,mt8188-smi-larb
>>>>> +        mediatek,larb-id:
>>>>> +          oneOf:
>>>>
>>>> Are you really sure that you need 'oneOf' here? :-)
>>>>
>>>> Regards,
>>>> Angelo
>>>
>>> Yes, I have tested it. If I try to modify the 'examples'
>>> like this. That is:
>>>   change the compatible to "mediatek,mt8188-smi-larb",
>>>   add 'mediatek,larb-id = <10>;'
>>>
>>> examples:
>>>   - |+
>>>     #include <dt-bindings/clock/mt8173-clk.h>
>>>     #includ
>>> e <dt-bindings/power/mt8173-power.h>
>>>
>>>     larb1: larb@16010000 {
>>>       compatible = "mediatek,mt8188-smi-larb";
>>>       reg = <0x16010000 0x1000>;
>>>       mediatek,smi = <&smi_common>;
>>>       mediatek,larb-id = <10>;
>>>       power-domains = <&scpsys MT8188_POWER_DOMAIN_VDEC>;
>>>       clocks = <&vdecsys CLK_VDEC_CKEN>,
>>>                <&vdecsys CLK_VDEC_LARB_CKEN>;
>>>       clock-names = "apb", "smi";
>>>     };
>>>
>>> The 'dt_binding_check' could give the following
>>> errors:
>>>
>>> Documentation/devicetree/bindings/memory-controllers/mediatek,smi-
>>> larb.example.dtb: larb@16010000: 'resets' is a required property
>>> from schema $id:
>>>
> https://urldefense.com/v3/__http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml*__;Iw!!CTRNKA9wMg0ARbw!kEwWhxyfjVtuHKBHazZGRaFdlmrU2bcIsiVDcsUDzEIManMw2XIG9RgOzq773vtmqlR9_sWZDFhU09SV$
>>> Documentation/devicetree/bindings/memory-controllers/mediatek,smi-
>>> larb.example.dtb: larb@16010000: 'reset-names' is a required
>>> property
>>> from schema $id:
>>>
> https://urldefense.com/v3/__http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml*__;Iw!!CTRNKA9wMg0ARbw!kEwWhxyfjVtuHKBHazZGRaFdlmrU2bcIsiVDcsUDzEIManMw2XIG9RgOzq773vtmqlR9_sWZDFhU09SV$
>>>
>>> And this is what I want to achieve. On the MediaTek MT8188 SoC
>>> platform, 'resets' and 'reset-names' are only required for SMI
>>> LARBs
>>> located in image, camera and ipe subsys. Others can be ignored. And
>>> the
>>> 'larb-id' of these SMI LARBs are shown in this array: [ 9, 10, 11,
>>> 12,
>>> 13, 16, 17, 18, 19, 20 ].
>>>
>>> Please feel free to let me know if you have any doubts.
>>
>> You did not really answer the question. Where is anything about oneOf
>> in
>> your reply?
>>
>> I am dropping this patchset from my queue.
>>
> 
> In this SoC, we encountered power-off failures and SMI bus hang issues
> during camera stress tests. SMI LARBs located in the image, IPE, and
> camera subsystems need to implement a reset, while other LARBs do not
> require it.
> 
> The 'mediatek,larb-id' for SMI LARBs in the image, IPE, and camera
> subsystems are as follows:
> - image subsystem: 9, 10, 11, 12, 16
> - IPE subsystem: 13
> - camera subsystem: 17, 18, 19, 20
> 
> Therefore, we believe that 'mediatek,larb-id' should be 'oneOf' the


So explain me where is the second condition?

Best regards,
Krzysztof

