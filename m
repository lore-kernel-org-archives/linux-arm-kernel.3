Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5218FCD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 00:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=97IIq8lVfoxPcx9z1ZIELY50Kibd7E9gbr5EXk5ek/k=; b=GUY99A04WZpn3Y2Ji3iatTxs2K
	U0L8ujMPNj9MfJcFqyVqCbh6xJ8sZLKJ/y3Tm3MBkmo3Xp4Lnscd8hBO7mzkTCSB4KRmqZeoHlS3l
	LN2Z19kjSpqlbso/e/1NuiVnj/OTv+OJV3ZrjTwMp1+7kyn4nEDmSbzvbUuetFMEw5J0RSKSpTAW5
	gN5oKEP44MpRLg64pPAygM0sCmg/7FZizgFUgvKAjxcvru8CzyRlmEbUUKMB7qM7B8D3Ou3ZN5zSw
	FUmkF5wOgS0kmfAlUfsf2SiPXZnSz7CdOhSUtn7CUStUl59wYUqC0umhrygZVmUdcz0wWRArgPbRP
	oqXPMpxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRg4V-00000000jku-0qdV;
	Tue, 26 May 2026 00:55:03 +0000
Received: from mail-m60152.netease.com ([210.79.60.152])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRg4R-00000000jjg-3nni;
	Tue, 26 May 2026 00:55:02 +0000
Received: from [172.16.12.74] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3fc9780e3;
	Tue, 26 May 2026 08:54:53 +0800 (GMT+08:00)
Message-ID: <f6c2f07b-52b8-4181-aa1d-a7d8dcda245c@rock-chips.com>
Date: Tue, 26 May 2026 08:54:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/10] dt-bindings: display: rockchip: analogix-dp: Fix
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
References: <20260525125331.140059-1-damon.ding@rock-chips.com>
 <20260525125331.140059-2-damon.ding@rock-chips.com>
 <20260525-ominous-hurling-c24874030f5a@spud>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20260525-ominous-hurling-c24874030f5a@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9e61c7054903a8kunme36fcba8b2de2a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaQklPVhkaQk9IQ04eGUNLHVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=PA/SyP4K+3grpZhgwmugkGiLt2pakSPtQ7es0kjAWOvTdXRwXKV6BimEu7C/BasjL1kJAzUkHcfN+YefohHLGhWK3aWZuc+8/cQIc8VD48Pmx6uXYVz0FJe6YDtfBPb5WFxdAy3Rqu3i+m/PXKguBe7PZbxwk9+lyuvkogi6ec4=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=97IIq8lVfoxPcx9z1ZIELY50Kibd7E9gbr5EXk5ek/k=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_175500_509811_60DE035D 
X-CRM114-Status: GOOD (  17.33  )
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

On 5/26/2026 12:54 AM, Conor Dooley wrote:
> On Mon, May 25, 2026 at 08:53:22PM +0800, Damon Ding wrote:
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
>>
>> Changes in v7:
>> - List all valid clock names at the top level, and constrain the clock
>>    count for each platform with minItems/maxItems in allOf.
>>
>> Changes in v8:
>> - Fix indentation to 10 for enum in clock-names property.
>> ---
>>   .../rockchip/rockchip,analogix-dp.yaml        | 34 ++++++++++++++++++-
>>   1 file changed, 33 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
>> index d99b23b88cc5..a1ab7a77bdd3 100644
>> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
>> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
>> @@ -26,7 +26,9 @@ properties:
>>       items:
>>         - const: dp
>>         - const: pclk
>> -      - const: grf
>> +      - enum:
>> +          - grf
>> +          - hclk
>>   
>>     power-domains:
>>       maxItems: 1
>> @@ -60,6 +62,32 @@ required:
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
>> +        clocks:
>> +          maxItems: 2
>> +        clock-names:
>> +          maxItems: 2
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - rockchip,rk3399-edp
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 3
>> +        clock-names:
>> +          minItems: 3
> 
> If you go back to v6, you'll see that I never asked you to remove the
> explict clock-names from here or below. Only the one from the 3288
> section. The minItems was an addition, not a replacement.
> 
> pw-bot: changes-requested
> 

Sorry for the misunderstanding. I will restore the explicit clock-names 
definitions and fix this in next version.

Best regards,
Damon

> 
>> +
>>     - if:
>>         properties:
>>           compatible:
>> @@ -68,6 +96,10 @@ allOf:
>>                 - rockchip,rk3588-edp
>>       then:
>>         properties:
>> +        clocks:
>> +          minItems: 3
>> +        clock-names:
>> +          minItems: 3
>>           resets:
>>             minItems: 2
>>           reset-names:
>> -- 
>> 2.34.1
>>
>>


