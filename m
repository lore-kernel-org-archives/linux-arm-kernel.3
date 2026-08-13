Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6048C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 09:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DgUgxtuzm+kIKyhbVcquKkq7TZWn5puByEvA3pIroyE=; b=UAcYZVIBNk7yhJhD9tRymvm8v1
	pGroblU7oJf8m19jafZjpsK7KEnrBtt6HjeL4d2tXFAAiRpUXS0w3mRQtayGaeRF3qbTUoQ/Okpda
	yDKyD/ZXc66/w/qSUatV2CZUKeUOsR/KLqcQDx4X36QWL16kojUmBwdle763ubMpZFqt3kqQPiSdS
	Qo+n33E/3G6CH1Meyj7XxDmKMc3LPdcW1424Xqh16sKZwnD0WEX35YRjp46H4LW1y6ISC1y7N1cQf
	UQeNgC+zDs0iIq0nP7E7y2RIqMfXGWGXjyAPxd45q5cTmo6tVBOAg4Fa0QuLi/2G9LLMj/w64GVCb
	kJJL+X6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRe2-00000000HRM-0bsr;
	Thu, 13 Aug 2026 09:22:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRe0-00000000HQy-08LD;
	Thu, 13 Aug 2026 09:22:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 747B741195;
	Thu, 13 Aug 2026 09:22:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 717B21F000E9;
	Thu, 13 Aug 2026 09:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786612955;
	bh=DgUgxtuzm+kIKyhbVcquKkq7TZWn5puByEvA3pIroyE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=UhmmOldq+PDGAyEslmCjiLjBnx7hy3Er+VjxhkncYXo8zcBxMD+tjnDlmW/FV39Uu
	 2PJXoGmz9BRh6oG0yfz4QISKvIVZJPA6RTfD3OQNLXKqt3obXbf2N6eyKpkST+aL/Z
	 a+tUmMMd45MJIP/5Go+YwvfrILL/Gf8/U3MM2kcvHxBh1BHadiZyqFrgcVpmbpUbNM
	 qMAhiaXTnFKM6pGXYtdBXT16Urc8HfRfyzZkLYrgPGPpenLnaaT2jjc0OpGWCaKoSZ
	 9+7iyMyLFxyx3XcYflCl/EKg2BBlRP7Yz9bN8dzdecBF7UuhS2ZjWkFKSo89BYEj2Q
	 VWSbb1xQXgzsA==
Message-ID: <cb21a4d5-9a8e-4530-90bf-d48e13f79b4b@kernel.org>
Date: Thu, 13 Aug 2026 11:22:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/6] media: dt-bindings: Add Amlogic V4L2 video decoder
To: Zhentao Guo <zhentao.guo@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20260812-b4-s4-vdec-upstream-v7-0-3fae085861bd@amlogic.com>
 <20260812-b4-s4-vdec-upstream-v7-3-3fae085861bd@amlogic.com>
 <20260813-rustling-sassy-terrier-11b99d@quoll>
 <80e58bd7-7eb7-4d05-b309-115643767a43@amlogic.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <80e58bd7-7eb7-4d05-b309-115643767a43@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 13/08/2026 10:39, Zhentao Guo wrote:
> Hi Krzysztof
> 
>> On Wed, Aug 12, 2026 at 10:41:25AM +0800, Zhentao Guo wrote:
>>> Describe the initial support for the V4L2 stateless video decoder
>>> driver used with the Amlogic S4 (S805X2) platform.
>>>
>>> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
>>> ---
>>>   .../devicetree/bindings/media/amlogic,s4-vdec.yaml | 111 +++++++++++++++++++++
>>>   1 file changed, 111 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
>>> new file mode 100644
>>> index 000000000000..b5af3f931b26
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
>>> @@ -0,0 +1,111 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +# Copyright (C) 2025 Amlogic, Inc. All rights reserved
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/media/amlogic,s4-vdec.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Amlogic Video Decode Accelerator
>>> +
>>> +maintainers:
>>> +  - Zhentao Guo <zhentao.guo@amlogic.com>
>>> +
>>> +description:
>>> +  The Video Decoder Accelerator present on Amlogic SOCs.
>>> +  It supports stateless h264 decoding.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: amlogic,s4-vdec
>>> +
>>> +  reg:
>>> +    maxItems: 2
>>> +
>>> +  reg-names:
>>> +    items:
>>> +      - const: dos
>>> +      - const: dmc
>>> +
>>> +  interrupts:
>>> +    maxItems: 2
>>> +
>>> +  interrupt-names:
>>> +    items:
>>> +      - const: hvdec
>>> +      - const: vdec
>> vdec is the name of the module, so not really useful name.
> Ok, I'll come up with a new name and change it in the next revision.
>>> +
>>> +  clocks:
>>> +    maxItems: 3
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: dos
>>> +      - const: vdec
>> Same here
> OK, but there would be a nit. In file 
> drivers/soc/amlogic/meson-clk-measure.c, This clock source is also named 
> *"vdec"*in|drivers/soc/amlogic/meson-clk-measure.c|, where a 

Source does not matter. You do not describe here the source, but this
device. How is the input called in this device, not in the source?

> *"vdec"*clock node is created in debugfs for checking its status. Using 
> a different name in the driver (including DT and binding) would make it 
> inconsistent with the debugfs node naming.

What inconsistency? How would provider name matter?


Best regards,
Krzysztof

