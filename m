Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CAD10AB82D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 22:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yfPukI5njba9Mj6lVMGLkk2uns36tU31Nb7gWKDihaI=; b=27ln7HCQo+qAg19lGVErlSmyc+
	VXCfq7iqcLlx3iXFtKibrGIPULPmSFvKtnQDo0xVCEKDzv2JyUIc486DtlEJ7rqFt5d62xinvC7uS
	l0891EAon+4/buZqK2GVxIpJ6XpDfzYsPvauKvrh70JOJILMlo4aDKWmZiUsMW8d4bzPeKx3JX3pC
	v/UkG0q/WL0m99Ht4lJHyDFYNJ03XKOlYMLYaeLL23P04aFpHQjHMmBIpBmYtyanSiNokrxWtvLEX
	n6Te2ZB2phJdlZ8UvnlQ3YpxfcAX6Adabr8T1a/ucnEE/yIGq4JY0nnVrqJsfA93s6hyADYb8G9Ze
	xyH7Sgaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5tWQ-00000006LTj-2hxq;
	Thu, 26 Mar 2026 22:49:50 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5tWO-00000006LTL-0Kro;
	Thu, 26 Mar 2026 22:49:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774565383;
	bh=72AnQfC7Y2zJajeESpEpdCNxcAMsKHMg0UXOwH4hjjk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KDf/+QElodAdciXe4nenVpGbeDnLtNoWUP/RyrXaW25je4P1sP6n7TWv0wLf1FmdV
	 H/jXbj/VroQO09XAWWp/5Eo8jhuLgdoaPD65v1bGvgrISeU+1a2gO3JgEC+ngS2o23
	 uOVBq/QprGE9MVVkUEMKYuyqZ3wAMbeKTfqd4wFLZOp9km2EAEuY8iwAotAlr6t1Ed
	 UDE94iE2b9BV8DGEN1MQ1vA7TqGtnb9NONQrPWmDrycbV+ZPoyWhkKJxAK4q6VjRDq
	 9/5sno361FDIgs8D+CHFWtTK2DPOJ1O8Ow3tImEYc449ZLQxsbSctYGOCye8VS9KpR
	 5xj2lP4/hjdTg==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8C01417E6002;
	Thu, 26 Mar 2026 23:49:42 +0100 (CET)
Message-ID: <1af216b1-c78b-41fb-80eb-992e487e63e6@collabora.com>
Date: Thu, 26 Mar 2026 23:49:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] media: dt-bindings: rockchip,rk3568-mipi-csi2: add
 rk3588 compatible
To: Rob Herring <robh@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Frank Li <Frank.li@nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Collabora Kernel Team <kernel@collabora.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260305-rk3588-csi2rx-v3-0-754473981f39@collabora.com>
 <20260305-rk3588-csi2rx-v3-1-754473981f39@collabora.com>
 <20260325210634.GA3963190-robh@kernel.org>
 <703bcf13-ab45-4e9a-b80c-80911d85d819@collabora.com>
 <CAL_JsqLy4=z24-RrJWLp3hPpTwYLJ8=ehRw8cRdhZiW-eAsYCA@mail.gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <CAL_JsqLy4=z24-RrJWLp3hPpTwYLJ8=ehRw8cRdhZiW-eAsYCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_154948_302799_18EE5891 
X-CRM114-Status: GOOD (  18.91  )
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

Hi Rob,

On 3/26/26 20:42, Rob Herring wrote:
> On Wed, Mar 25, 2026 at 4:34 PM Michael Riesch
> <michael.riesch@collabora.com> wrote:
>>
>> Hi Rob,
>>
>> On 3/25/26 22:06, Rob Herring wrote:
>>> On Wed, Mar 25, 2026 at 11:25:34AM +0100, Michael Riesch wrote:
>>>> The RK3588 MIPI CSI-2 receivers are compatible to the ones found in
>>>> the RK3568.
>>>> Introduce a list of compatible variants and add the RK3588 variant to
>>>> it.
>>>>
>>>> Acked-by: Rob Herring (Arm) <robh@kernel.org>
>>
>> First of all, apologies for applying your Acked-by tag. I figured
>> resolving the merged conflict was trivial and impossible to screw up, but...
> 
> No worries. I would have kept it too.
> 
>>>> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
>>>> ---
>>>>  .../devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml   | 10 +++++++---
>>>>  1 file changed, 7 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
>>>> index 4ac4a3b6f406..3d3b3cd78884 100644
>>>> --- a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
>>>> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
>>>> @@ -16,9 +16,13 @@ description:
>>>>
>>>>  properties:
>>>>    compatible:
>>>> -    enum:
>>>> -      - fsl,imx93-mipi-csi2
>>>> -      - rockchip,rk3568-mipi-csi2
>>>> +    oneOf:
>>>> +      - const: fsl,imx93-mipi-csi2
>>>> +      - const: rockchip,rk3568-mipi-csi2
>>>
>>> These 2 should be a single enum as they were before.
>>
>> ... hm. Well.
>>
>> First, do you mean
>>
>> properties:
>>   compatible:
>>     oneOf:
>>       - enum:
>>          - fsl,imx93-mipi-csi2
>>          - rockchip,rk3568-mipi-csi2
>>       - items:
>>          - enum:
>>             - rockchip,rk3588-mipi-csi2
>>          - const: rockchip,rk3568-mipi-csi2
>> ?
> 
> Yes.

Thanks for the clarification. v4 coming up.

> 
>> If so, what is the practical difference?
> 
> First, then you aren't changing what's already there. For validation,
> there is no difference other than failures with 'oneOf' give poor
> error messages. It wouldn't be much better, just one less oneOf entry.

I'll try to keep that one in mind!

Best regards,
Michael


