Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B089DCD5BAF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 06:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qMah8/jyNcPvAfqkwCIR/RWKyy2WqG3nOuBp+tSy2AA=; b=QTvwAyzVQlL+k1+ZzFsl0FW+eu
	NziyqoHV604/EKQqIW/Gpahv6sgwFi5RNeIVbWH56r5gTGEYZplaR85rDwL5hUVdW+9FB8+46mwfQ
	a8/Hj7c9StinX5xqgxIC6w4A45XR9wX1OkTKNFWxoKN8w+h+dLJcwBT+bfwTcEy5ggIPQYsc1rYC9
	unqHhOLXtu5kcTKqa04QzmNAC+G9tMPY7yQD1pZ6bepY+Zk67XwX1DI3RJ6M2Z+9fTgeXgz9zfYS1
	1rR2nXMTpTKTh8KA+0EYq0qe2Hg+wDDmLZsaSTbxHzq8ehtVprBhyj8XjXwKiUnbkeHorADi92Cy1
	S2l6kJYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQJNu-00000009yLi-0ryo;
	Fri, 22 May 2026 06:29:26 +0000
Received: from mail-m82130.xmail.ntesmail.com ([156.224.82.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQJNp-00000009yKe-0bgr;
	Fri, 22 May 2026 06:29:24 +0000
Received: from [172.16.12.43] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3f6a8ca63;
	Fri, 22 May 2026 14:29:13 +0800 (GMT+08:00)
Message-ID: <32192c5f-cc25-4a2d-ada6-53f28edb6cbb@rock-chips.com>
Date: Fri, 22 May 2026 14:29:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/10] dt-bindings: display: rockchip: analogix-dp: Fix
 hclk as third clock for RK3588
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, nicolas.frattaroli@collabora.com,
 cristian.ciocaltea@collabora.com, sebastian.reichel@collabora.com,
 dmitry.baryshkov@oss.qualcomm.com, luca.ceresoli@bootlin.com,
 dianders@chromium.org, m.szyprowski@samsung.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260521080835.1362416-1-damon.ding@rock-chips.com>
 <20260521080835.1362416-2-damon.ding@rock-chips.com>
 <20260522-demonic-shaggy-wasp-a3f261@quoll>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20260522-demonic-shaggy-wasp-a3f261@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9e4e5fadf103a3kunmc160eef7c9158
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSx0dVh0aQ0sYS00ZSk5IHlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=Ge2Vi3wu2ir9dKSljIze3RU0HI4ooU+nbjYYN4NtZj672UOwX4tXHZTNQBewK8gB1YpVxTOQiJbWg6hCG5TY5DkfojEbr4ySYSz6NS7/DhB3GUh9wi1h+ORTDA9wJNNjA9a563651C6YEN+H6GxyCjSRhiEP3Y5LAchPv2jlqA0=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=qMah8/jyNcPvAfqkwCIR/RWKyy2WqG3nOuBp+tSy2AA=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_232921_847701_1ACFD5A5 
X-CRM114-Status: GOOD (  12.95  )
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

On 5/22/2026 2:11 PM, Krzysztof Kozlowski wrote:
> On Thu, May 21, 2026 at 04:08:26PM +0800, Damon Ding wrote:
>> RK3588 eDP controller requires HCLK_VO1 to access the VO1 GRF
>> registers and enable the video datapath.
>>
>> Previously, the clock was enabled implicitly via the 'rockchip,vo-grf'
>> phandle reference, which allowed the eDP to work without explicitly
>> managing the hclk_vo1 clock. However, this is not safe or explicit.
>>
>> To make the clock dependency explicit, enforce per-SoC clock-names
>> requirements:
>>   - RK3288: 2 clocks (dp, pclk)
>>   - RK3399: 3 clocks (dp, pclk, grf)
>>   - RK3588: 3 clocks (dp, pclk, hclk)
>>
>> Do not reuse the 'grf' clock name for RK3588 because it represents
>> a different clock with distinct control logic:
>> - The 'grf' clock is only for GRF register access and is toggled
>>    dynamically during register access.
>> - The 'hclk' clock controls both GRF access and video datapath
>>    gating, and must remain enabled during probe.
>>
>> Fixes: f855146263b1 ("dt-bindings: display: rockchip: analogix-dp: Add support for RK3588")
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>
>> ---
>>
>> Changes in v4:
>> - Modify the commit msg.
>>
>> Changes in v5:
>> - Enforce the correct third clock name on a per-compatible basis.
>> - Modify the commit msg simultaneously.
>>
>> Changes in v6:
>> - Expand more detail commit msg about using hclk instead of grf clock.
>> ---
>>   .../rockchip/rockchip,analogix-dp.yaml        | 37 +++++++++++++++++--
>>   1 file changed, 33 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
>> index d99b23b88cc5..8001c1facf98 100644
>> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
>> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
>> @@ -23,10 +23,7 @@ properties:
>>   
>>     clock-names:
>>       minItems: 2
>> -    items:
>> -      - const: dp
>> -      - const: pclk
>> -      - const: grf
>> +    maxItems: 3
>>   
>>     power-domains:
>>       maxItems: 1
>> @@ -60,6 +57,33 @@ required:
>>   allOf:
>>     - $ref: /schemas/display/bridge/analogix,dp.yaml#
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - rockchip,rk3288-dp
>> +    then:
>> +      properties:
>> +        clock-names:
>> +          items:
>> +            - const: dp
>> +            - const: pclk
> 
> Why aren't there constraints for clocks? They always must come together.
> 
> Please open any other binding and look how it is done there.
> 
> 

Yes, as Conor's suggestion, the right way is to keep all valid clock 
names at the top level, and use only minItems/maxItems in allOf to 
differentiate clocks and clock-names of platforms.

I will update this in next version.

Best regards,
Damon


