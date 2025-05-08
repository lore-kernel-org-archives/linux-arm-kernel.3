Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3563C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 08:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mpt0+g9c8cV/2h8BIvqsNb1JBcnr6Rbu0rfrAIyuOb0=; b=Lh1codeY53bLi8hMnpAYWRfM5V
	gy6uGi9802iax5TaRcUemurs4DraPWG40eG9PN5oRCMfAj+eiuUqpQS0ZpzzRZP5azMWJxgx/Esi6
	bizPTRdMRT8mVPNJRsmKP7ErEVUWOiLFrs9LYoPKsxbByqjEfIuc7IbWGuHW/zxrDTDE6JdJdA4Dv
	Vy3c+zfI+y8Re5zP/X5cFW8ngKq46N5IED3UYyGBQFEHahtEkHfp7z1v08kIGU82pnKwRUia6f1c4
	QLgPJrrevF4UNuGpZP0MGtR2RbgggUVsRtk7grIebvHr52C14Vwcl25kZGEFpLQZYnh/TWxm87PuV
	cnVNXhyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwv0-00000000AEU-2fzY;
	Thu, 08 May 2025 08:47:50 +0000
Received: from mail-m19731100.qiye.163.com ([220.197.31.100])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwhF-0000000084N-0YJs;
	Thu, 08 May 2025 08:33:39 +0000
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 145d7c840;
	Thu, 8 May 2025 16:33:22 +0800 (GMT+08:00)
Message-ID: <f040a52e-51a8-4cea-afc1-7b3de259b067@rock-chips.com>
Date: Thu, 8 May 2025 16:33:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: display: rockchip: Convert
 cdn-dp-rockchip.txt to yaml
To: Krzysztof Kozlowski <krzk@kernel.org>, Chaoyi Chen <kernel@airkyi.com>,
 Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Dragan Simic <dsimic@manjaro.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250508064304.670-1-kernel@airkyi.com>
 <20250508064304.670-3-kernel@airkyi.com>
 <a3ef7af4-3c6a-4bc6-912b-5819393dcd6a@kernel.org>
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <a3ef7af4-3c6a-4bc6-912b-5819393dcd6a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUIfSlYaQx5OTh8fSh5MHUhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a96af0721d103abkunm145d7c840
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MEk6Mio4QjJJKw4SPwIOOQJN
	Nk4aFANVSlVKTE9NTUJISUtCSktJVTMWGhIXVRgTGhQCElUYEx4VOwkUGBBWGBMSCwhVGBQWRVlX
	WRILWUFZTkNVSUlVTFVKSk9ZV1kIAVlBTUlMTTcG
DKIM-Signature: a=rsa-sha256;
	b=d+d+GykKLO20BqAKyXobUAllLDcMm1FBKpufSoAaZTPmGMx0GkA+ZvMb4smItqg+JwLtrMyeuewWSNTfjKfuI4Xhnxf/j+yt27JadVLZBfsLhKDXvcEL9bBMicizb6paOsRCdizeMBKEmZtWX8ObSkpopPJMXNSMG99yzVMUGJE=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=Mpt0+g9c8cV/2h8BIvqsNb1JBcnr6Rbu0rfrAIyuOb0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_013337_630089_BFBACAA2 
X-CRM114-Status: GOOD (  20.67  )
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

On 2025/5/8 15:16, Krzysztof Kozlowski wrote:
> On 08/05/2025 08:43, Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> Convert cdn-dp-rockchip.txt to yaml.
>>
>> Tested with:
>>
>> 1. make ARCH=arm64 dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip,cdn-dp.yaml
>>
>> 2. make ARCH=arm64 dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip,cdn-dp.yaml
> Drop. You do not have to embed in commit msg standard makefile targets.
> We all know how to use it. You do not do it for C files, do you?

Will drop it on v2.


>
>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>> ---
> ...
>
>> -	};
>> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,cdn-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,cdn-dp.yaml
>> new file mode 100644
>> index 000000000000..ed68b48a6743
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,cdn-dp.yaml
> Filename matching compatible.

Will change it in v2.


>
>> @@ -0,0 +1,148 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/rockchip/rockchip,cdn-dp.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Rockchip RK3399 specific extensions to the CDN Display Port
>> +
>> +maintainers:
>> +  - Andy Yan <andy.yan@rock-chip.com>
>> +  - Heiko Stuebner <heiko@sntech.de>
>> +  - Sandy Huang <hjc@rock-chips.com>
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: rockchip,rk3399-cdn-dp
>> +
>> +  reg:
>> +    description:
>> +      CDN DP core register
> Missing constraints. Drop description.
>
> Just look at other bindings.

Will fix in v2.


>
>> +
>> +  assigned-clock-rates: true
>> +  assigned-clocks: true
> Drop these two
>
>> +
>> +  clocks:
>> +    minItems: 4
> No, look at other bindings.

Will fix in v2.


>
>> +
>> +  clock-names:
>> +    items:
>> +      - const: core-clk
>> +      - const: pclk
>> +      - const: spdif
>> +      - const: grf
>> +
>> +  extcon:
>> +    description:
>> +      Phandle to the extcon device providing the cable state for the DP phy.
> Missing type, unless you could not add a type because of conflicts? This
> should be really fixed...

Will add refs in v2.


>
>
>> +
>> +  interrupts:
>> +    maxItems: 1
> and here is maxItems. Why in other places you put minItems?

Sorry for that,  I misunderstood the meaning of those filed. Will fix in v2.


>
>> +
>> +  phys:
>> +    minItems: 1
>> +    maxItems: 2
> Why is this flexible? It wasn't in original binding and you must
> document all the changes done to the binding in commit msg.

I think the original binding had this. I will fix this in v2 and add 
more description.


>
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: Input of the CDN DP
>> +        properties:
>> +          endpoint@0:
>> +            description: Connection to the VOPB
>> +          endpoint@1:
>> +            description: Connection to the VOPL
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: Output of the CDN DP
>> +
>> +    required:
>> +      - port@0
>> +      - port@1
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  resets:
>> +    minItems: 4
> No, look at other bindings.

Will fix in v2.


>
>> +
>> +  reset-names:
>> +    items:
>> +      - const: spdif
>> +      - const: dptx
>> +      - const: apb
>> +      - const: core
>> +
>> +  rockchip,grf:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      This SoC makes use of GRF regs.
> For what? You did not say anything useful above, so instead explain the
> purpose.

Will add more description in v2.


>
>> +
>> +  "#sound-dai-cells":
>> +    const: 1
> Missing dai-common ref, unless this is not a DAI?

Will add dai-common.yaml ref in v2.


>
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - interrupts
>> +  - phys
>> +  - ports
>> +  - resets
>> +  - reset-names
>> +  - rockchip,grf
>> +
>> +unevaluatedProperties: false
> Where is any $ref? additionalProperties instead or add proper ref

Will fix in v2.


>
>
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/rk3399-cru.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/power/rk3399-power.h>
>> +    cdn_dp: dp@fec00000 {
> Drop unused label

Will drop it in v2.


Thanks for you fast reply!


