Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35668C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 15:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aj/zZWLiOp0sZr8jGtsU7IqlQMK+yhKTerymVsQwIeU=; b=ruu4Km0f5OcNoeOu1z+FNMmLDA
	EIhqdjcKmYORhoJrD04G2enpvll+YmdZWXwWZR2Bkv2X13SnTztmVdJg09uZxj8v3EUiSmSku02Um
	bx0avjY1pFKEPt7r0WOB2lypkJju95XZlazg8NG2GTICXtzvs6ocSxEd1gYXjlrf0BMd7DKrSdZLX
	sKMD75+qc+8ELTsfLiAz9oewVWnKeqCl3RYQfQTPDi2WR5CPhdbE3sma49puzP0FBE2h1ghi5uVkQ
	oo4qIMBw695sGb9AxsjFjsoYk0mymvHgAErLa1/0OEqCO4/Gc3D1hNL6248pv+3uXU2EcZd/BY/dg
	UXjAwxCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thscz-00000004Nuv-0wLl;
	Tue, 11 Feb 2025 15:56:49 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thsbY-00000004NjB-2vw1;
	Tue, 11 Feb 2025 15:55:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 52A9AA40808;
	Tue, 11 Feb 2025 15:53:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EC65C4CEDD;
	Tue, 11 Feb 2025 15:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739289319;
	bh=M1/OJ7oCvUKvR27rDX+k2QZ5R/MtI/RabABd+WlSS2M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T7Egnyot+P43in3laKiCZaR1gSsKw5uM9r0lOuRYvosobgpNBigDHP8Am8gCLpE8a
	 GO2Dcq3UCKC8kGoGwvtlh5J0KPmsyezcuvqgaX3PaxMUGPi7May6tXN8pKQ8FAVy/k
	 /6qsMjMpF1fg/f+nhFjOCd1A6hPVVgXGse9TPzz81ozWZCVGR5+T0A6BNrh46h3h7H
	 MsXwnNzaIzgHglo5kQZkUytlVbIADfU8pfYR1ka/Y4hxSd5YybRalnKdpxaI1+n4EQ
	 L3mYy/I5G4pIGv5ohZYMGlOuj5hA9QSvPR+9HM86+mRrlLjRW2MxxD7NYwkMi+1PWS
	 n/alb/+eEEkQA==
Message-ID: <d81c46ca-45de-4c69-a786-9c74bd06333c@kernel.org>
Date: Tue, 11 Feb 2025 16:55:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: memory-controllers: Add mediatek
 common-dramc dt-bindings
To: =?UTF-8?B?Q3J5c3RhbCBHdW8gKOmDreaZtik=?= <Crystal.Guo@mediatek.com>,
 "robh@kernel.org" <robh@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20241212090029.13692-1-crystal.guo@mediatek.com>
 <20241212090029.13692-3-crystal.guo@mediatek.com>
 <c978937a-e589-4e9a-ba37-265dbfc1b252@kernel.org>
 <8746bc17ef28da632e9ca765d2c3ce6bdc56c6f4.camel@mediatek.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <8746bc17ef28da632e9ca765d2c3ce6bdc56c6f4.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_075520_872313_FE5EC199 
X-CRM114-Status: GOOD (  16.99  )
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

On 11/02/2025 13:56, Crystal Guo (郭晶) wrote:
>>> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
>>> ---
>>>  .../mediatek,common-dramc.yaml                | 129
>>> ++++++++++++++++++
>>>  1 file changed, 129 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/memory-
>>> controllers/mediatek,common-dramc.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/memory-
>>> controllers/mediatek,common-dramc.yaml
>>> b/Documentation/devicetree/bindings/memory-
>>> controllers/mediatek,common-dramc.yaml
>>> new file mode 100644
>>> index 000000000000..c9e608c7f183
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/memory-
>>> controllers/mediatek,common-dramc.yaml
>>> @@ -0,0 +1,129 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>> +# Copyright (c) 2024 MediaTek Inc.
>>> +%YAML 1.2
>>> +---
>>> +$id: 
>>> https://urldefense.com/v3/__http://devicetree.org/schemas/memory-controllers/mediatek,common-dramc.yaml*__;Iw!!CTRNKA9wMg0ARbw!mztYfN3n6_IAx78S44PFOetQS51-h6obm2HHrjEVRI-HJYyzJ2VWbbik2rn3pybssUBOT4gp5GD5-Mgk$
>>> +$schema: 
>>> https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!mztYfN3n6_IAx78S44PFOetQS51-h6obm2HHrjEVRI-HJYyzJ2VWbbik2rn3pybssUBOT4gp5AGE5Eci$
>>> +
>>> +title: MediaTek Common DRAMC (DRAM Controller)
>>
>> Common? Is this a real thing? Please describe the hardware.
>>
> 
> Sorry, my original description was not accurate. It has been changed
> to:
> 
> Title: MediaTek DRAM Controller (DRAMC)
> 
>>> +
>>> +maintainers:
>>> +  - Crystal Guo <crystal.guo@mediatek.com>
>>> +
>>> +description: |
>>
>> Do not need '|' unless you need to preserve formatting.
>>
> 
> Okay, remove it in v2.
> 
>>> +  The DRAM controller of MediaTek SoC provides an interface to
>>> +  get the current data rate of DRAM.
>>
>> So not common here?
> 
> Sorry, my original title description was not accurate.
> 
>>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: mediatek,common-dramc
>>
>> This has to be SoC.
>>
> 
> Change to "mediatek,mt8196-dramc"
> 
>>> +
>>> +  reg:
>>> +    minItems: 9
>>
>> Why this is flexible?
>>
> The original implementation was incorrect and has been corrected in v2


You replied to two months old review. I don't have the context and I do
not have these emails in my inbox, therefore if you have any questions I
cannot answer.

Please implement entire feedback or discuss within reasonable amount of
time. If something is unresolved, please mention it in the changelog of
future versions.

Best regards,
Krzysztof

