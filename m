Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA78CD5BAF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 03:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ix2iDSv2xXDyggBMNPYyTIg1mIFriHtuF7LmuxwXjjM=; b=PNCRiNJps/G1TvnJDjDgSe9fj4
	uYEkE/Aj9dwGILigzI1+qVyp7qpaD83UI2U9XMw9KFbZpSpto2xgmdsjnqclQuKUW8TTYEHzw41YL
	LYY4NOr3ZcgkcNXR2FAky74craXdlbdUD0tjRUO1crdVctPFIOYvaYRawYVGOui+dHB0R16bYX8Kb
	ZnBqxynSs1Gl46pvTcRL0CWTU1WeYBBi1vH7BdkX9y2i7fcXFdatSS1eRO1xwxTOxAnpyha9ekkHi
	aoYTzMaAQP/uXAEunEFGkvdYDarXAE1I/7CFXPXUPymAQHDl1eYa1RgHhcZPZp0J770PZ+RYiEmi0
	mV/k2s2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQGAF-00000009bch-19Ho;
	Fri, 22 May 2026 03:03:07 +0000
Received: from mail-m10204.netease.com ([154.81.10.204])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQGAC-00000009bbw-297Z;
	Fri, 22 May 2026 03:03:06 +0000
Received: from [172.16.12.43] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3f63c7eb5;
	Fri, 22 May 2026 11:03:00 +0800 (GMT+08:00)
Message-ID: <fb40d3fb-b7c6-4c31-b9a7-89318c36c739@rock-chips.com>
Date: Fri, 22 May 2026 11:02:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/10] dt-bindings: display: rockchip: analogix-dp: Fix
 hclk as third clock for RK3588
To: Conor Dooley <conor@kernel.org>
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
 <20260521-waking-case-cd709f0a7712@spud>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20260521-waking-case-cd709f0a7712@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9e4da2df0203a3kunmcdc39b7bb3028
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCHklPVkIeS0hIH09LQxhPT1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=YWNMy7+NkSl3ewSULgQHdbz/2vosC6n4DoirPKOBaGSW+pxLBmEJMuFE6VmFA0OsHpCBjRp/wI7NBieBAoJT91OdjP2y71rQaC9sSqazDzS8MMXYV9YYsXo6X7O1/AqGOeprWhYDlfadH5Pr+Q8+gAehYLkah0zmjTaJGrnQmuE=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=ix2iDSv2xXDyggBMNPYyTIg1mIFriHtuF7LmuxwXjjM=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_200305_134241_E659A857 
X-CRM114-Status: GOOD (  18.87  )
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

Hi Conor,

On 5/22/2026 3:54 AM, Conor Dooley wrote:
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
> 
> Instead of removing this, you can make it
> 
> items:
>   - const: dp
>   - const pclk
>   - enum:
>       - grf
>       - hclk
> 
>> +    maxItems: 3
> 
> And delete this.
> 

Oh I see, thanks for clarifying.

The idea is to keep all valid clock names at the top level, and use only 
minItems/maxItems in allOf to differentiate platforms.

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
> Then this becomes
>    clock-names:
>      maxItems: 2
>    clocks:
>      maxItems: 2
> 
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - rockchip,rk3399-edp
>> +    then:
>> +      properties:
>> +        clock-names:
>> +          items:
>> +            - const: dp
>> +            - const: pclk
>> +            - const: grf
> 
> maybe this needs a minItems: 3? Depends on if the grf clock is
> mandatory. Also probably needs a
> clocks:
>    minItems: 3
> if that's the case.
> 

Yes, the minItems should be 3 for both clocks and clock-names.

>> +
>>     - if:
>>         properties:
>>           compatible:
>> @@ -68,6 +92,11 @@ allOf:
>>                 - rockchip,rk3588-edp
>>       then:
>>         properties:
>> +        clock-names:
>> +          items:
>> +            - const: dp
>> +            - const: pclk
>> +            - const: hclk
> 
> And the same here as for the 3399.
> 

Will update in v7.

Best regards,
Damon


