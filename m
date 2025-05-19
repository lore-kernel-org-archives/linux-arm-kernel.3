Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0E2C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 08:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UN9mV4Ay8ghFsuFemLHGgtg/VXgBJG+F9kHs6DqrncA=; b=fBue1kLv8pPkAuTqsqIOFsAvoJ
	spz8qj3Li3l8jkEfZp1vd9L7FOAXfeLCMxh3L8LhlXTKTgsR15hQ7N+ar3e39eoTHk60unmCHWrpx
	Ed6MNZqfWHu2JlJ3vthoCxWb8JWSrsjwbHfBlm3+9mTtQ34K3LUfuy+wWYQ2O9KNfMppGPrnGAEyE
	gv5FYKMo1qapYVrFrxdfwvR7Mhg13NZiV8wLJJ3oAN9dGigf5VP7Fm2jDJUoBVb5j+otD+l7DT2tj
	wKgE+8j0+ThD+JMv5+HKL++LiGIngEQb2Gah6HfwBl0dF6aWOeFmGKlNS2GFFAZS55g+IsucI1rbM
	bTAHVPqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGw8n-00000008PUX-1xQR;
	Mon, 19 May 2025 08:46:33 +0000
Received: from mail-m15595.qiye.163.com ([101.71.155.95])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGw6j-00000008Ozl-1X4r;
	Mon, 19 May 2025 08:44:27 +0000
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 158ccae3f;
	Mon, 19 May 2025 16:44:14 +0800 (GMT+08:00)
Message-ID: <6dac10df-d410-4d52-8711-4c8046f90fbd@rock-chips.com>
Date: Mon, 19 May 2025 16:43:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] dt-bindings: display: rockchip: Convert
 cdn-dp-rockchip.txt to yaml
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Chaoyi Chen <kernel@airkyi.com>, Sandy Huang <hjc@rock-chips.com>,
 Heiko Stuebner <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Dragan Simic <dsimic@manjaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250519012632.94-1-kernel@airkyi.com>
 <20250519012632.94-3-kernel@airkyi.com>
 <20a565da-296c-4920-b962-e9de9af464d9@kernel.org>
 <632f9f4d-ec0f-4512-a153-d2abfd9f6841@rock-chips.com>
 <20250519-tall-glistening-quokka-9ffa6f@kuoka>
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20250519-tall-glistening-quokka-9ffa6f@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkMeT1ZLThpIHxhJHkgdTUpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a96e7b7094a03aekunm158ccae3f
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OCo6HSo5LjExDC0zLio4FRhI
	STMwCS5VSlVKTE9MTU9PSU1KSEpDVTMWGhIXVRgTGhQCElUYEx4VOwkUGBBWGBMSCwhVGBQWRVlX
	WRILWUFZTkNVSUlVTFVKSk9ZV1kIAVlBT0pOTzcG
DKIM-Signature: a=rsa-sha256;
	b=ZPU7PwL+nAfueycpdY2yJue2tLZTRMoaiSKoIlGm+G9Xi5nboCuoO35Wc21TaIz7dmKHezIH5NNK7VX/AwNFNGs4VT9yz1RQ8ILaIY3w7ZNE2aSZPqay6utDnKSNSgECauwziW8cxvAKh6tB/lrJCpw5w5MseqaRQIiz8er641o=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=UN9mV4Ay8ghFsuFemLHGgtg/VXgBJG+F9kHs6DqrncA=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_014425_895635_72C2A114 
X-CRM114-Status: GOOD (  15.87  )
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

Hi Krzysztof,

On 2025/5/19 16:23, Krzysztof Kozlowski wrote:
> On Mon, May 19, 2025 at 02:56:03PM GMT, Chaoyi Chen wrote:
>> Hi Krzysztof,
>>
>> On 2025/5/19 14:16, Krzysztof Kozlowski wrote:
>>> On 19/05/2025 03:26, Chaoyi Chen wrote:
>>>> +maintainers:
>>>> +  - Andy Yan <andy.yan@rock-chip.com>
>>>> +  - Heiko Stuebner <heiko@sntech.de>
>>>> +  - Sandy Huang <hjc@rock-chips.com>
>>>> +
>>>> +allOf:
>>>> +  - $ref: /schemas/sound/dai-common.yaml#
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    items:
>>>> +      - const: rockchip,rk3399-cdn-dp
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  clocks:
>>>> +    items:
>>>> +      - description: DP core work clock
>>>> +      - description: APB clock
>>>> +      - description: SPDIF interface clock
>>>> +      - description: GRF clock
>>>> +
>>>> +  clock-names:
>>>> +    items:
>>>> +      - const: core-clk
>>>> +      - const: pclk
>>>> +      - const: spdif
>>>> +      - const: grf
>>>> +
>>>> +  extcon:
>>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>>> +    items:
>>>> +      maxItems: 1
>>>> +    maxItems: 2
>>> Instead of this, list the items. Old binding said only "specifier", so
>>> this is technically a change, which should be explained in commit msg.
>> Will fix in v5.
>>
>>
>>>> +    description:
>>>> +      List of phandle to the extcon device providing the cable state for the DP PHY.
>>>> +
>>>> +  interrupts:
>>>> +    maxItems: 1
>>>> +
>>>> +  phys:
>>>> +    items:
>>>> +      maxItems: 1
>>>> +    maxItems: 2
>>>> +    description: |
>>>> +      List of phandle to the PHY device for DP output.
>>>> +      RK3399 have two DP-TPYEC PHY, specifying one PHY which want to use,
>>>> +      or specify two PHYs here to let the driver determine which PHY to use.
>>> You do not allow one phy, so your description is not accurate. OTOH,
>>> original binding did not allow two phandles, so that's another change in
>>> the binding. You need to document all changes done to the binding in the
>>> commit msg.
>> Oh, the original binding example use two phandles. I think only one PHY can
> Example is not the binding, just an example.
>
>> also pass the dtb check here, or maybe I'm missing something else?
> You think or you tested it? What is the minItems value? 2, so even if
> this works it's rather a bug in dtschema.

Yes I tested it. Both of "phys = <&tcphy0_dp>", "phys = <&tcphy0_dp>, 
<&tcphy1_dp>" pass the dtb check.


>
> Also, inner maxItems:1 is not really correct. Why can't this work with
> different phy providers?

I'll see what other bindings do. Thanks for the clarification!


