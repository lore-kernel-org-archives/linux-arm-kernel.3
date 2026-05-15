Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7982CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 02:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wiOcpYgO5JDj+FjoQaOM0eym/Auz/dWfyTv2lzex6Rs=; b=f1hHUHaD9iD21T6f4SbqSJl/99
	Sec2CBBLnL3/zz40Ah/smtYBnxAnXZkCLc+MekF95r1uirs6kObKRYQO1TpOtUOxFKLV1OfqzQOW0
	S6XEg4/e/4oCPUVhq8EDeHr4c6FcaJL4DOF075ZL3qhK40SWUSCoPrVxEr47Cg85IRg0P2sj4Obx/
	Otp+dOCPsXm1oqAFuntLLJxpD41z9srrpzgH7rOnKtsIS2Pg4DqqKAPN8Y8YCHpVgDp2A9FLFh5h7
	3SoeAQbaS91V1JoDUMAKSqHfqitc58jpDLUjzJjEVOqoBPt+rueMGTXU9BzuDkaHtZuUrSgXlbcKu
	pwHYzzUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNigM-00000007AUK-0YE5;
	Fri, 15 May 2026 02:53:46 +0000
Received: from mail-m19731101.qiye.163.com ([220.197.31.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNigJ-00000007ATc-0w2S;
	Fri, 15 May 2026 02:53:44 +0000
Received: from [172.16.12.43] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3e805fe57;
	Fri, 15 May 2026 10:53:37 +0800 (GMT+08:00)
Message-ID: <f9fd086e-9d9f-40a3-9393-7cfa5c426c66@rock-chips.com>
Date: Fri, 15 May 2026 10:53:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] dt-bindings: display: bridge: analogix-dp: Add
 data-lanes support for endpoint
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
References: <20260514070133.2275069-1-damon.ding@rock-chips.com>
 <20260514070133.2275069-3-damon.ding@rock-chips.com>
 <20260514-jolly-confining-997882e502c7@spud>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20260514-jolly-confining-997882e502c7@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9e298dc37203a3kunm6bd5d8e111d35b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZGhofSVZPShpPHUtKTB
	pLTEtWFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSEpKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=bNuiS2Dre4Q5BTbn3B1+0fBx2UlyKHcHIU2sndZ4rhJCriwHPmLgl2XgQ0+5OezFxNij6gzxyCaFuJ9XbQD19js2/mtL18ORxirq3opoRFCafpHIl1GwXZuzlWA27nAx7xFTpabrXENpRkIAGv0cmL/NRF6OFA+Vs0hUey4n0NI=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=wiOcpYgO5JDj+FjoQaOM0eym/Auz/dWfyTv2lzex6Rs=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_195343_430214_312C4CBA 
X-CRM114-Status: GOOD (  15.55  )
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

On 5/15/2026 2:19 AM, Conor Dooley wrote:
> On Thu, May 14, 2026 at 03:01:32PM +0800, Damon Ding wrote:
>> Add data-lanes property support to the port@1 endpoint for physical
>> lane mapping configuration.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> ---
>>   .../bindings/display/bridge/analogix,dp.yaml  | 24 +++++++++++++++----
>>   1 file changed, 20 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml
>> index 62f0521b0924..a82f9b7776c0 100644
>> --- a/Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml
>> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml
>> @@ -36,19 +36,35 @@ properties:
>>         Hotplug detect GPIO.
>>         Indicates which GPIO should be used for hotplug detection
>>   
>> +  data-lanes:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    deprecated: true
> 
> Why are you adding a new property as deprecated? Why does this duplicate
> what you're adding to the port node? At the very least, your commit is
> lacking an explanation.
> pw-bot: changes-requested
> 

Thank you for the review.

I referenced the implementation in 
Documentation/devicetree/bindings/display/msm/dp-controller.yaml. After 
evaluating QCOM DP driver and other drivers, I agree that implementing 
'data-lanes' in the endpoint node is the preferred and common approach 
nowadays.

The top-level `data-lanes` property together with the `deprecated` mark 
was leftover content from my early reference and arrangement, which I 
neglected to delete before submitting. It is redundant, unreasonable and 
should not have been added at all.

I will fix it in the next version.

Best regards,
Damon

> 
>> +    minItems: 1
>> +    maxItems: 4
>> +    items:
>> +      maximum: 3
>> +
>>     ports:
>>       $ref: /schemas/graph.yaml#/properties/ports
>>   
>>       properties:
>>         port@0:
>>           $ref: /schemas/graph.yaml#/properties/port
>> -        description:
>> -          Input node to receive pixel data.
>> +        description: Input node to receive pixel data.
>>   
>>         port@1:
>>           $ref: /schemas/graph.yaml#/properties/port
>> -        description:
>> -          Port node with one endpoint connected to a dp-connector node.
>> +        description: Port node with one endpoint connected to sink device node.
>> +        properties:
>> +          endpoint:
>> +            $ref: /schemas/media/video-interfaces.yaml#
>> +            unevaluatedProperties: false
>> +            properties:
>> +              data-lanes:
>> +                minItems: 1
>> +                maxItems: 4
>> +                items:
>> +                  enum: [ 0, 1, 2, 3 ]
>>   
>>       required:
>>         - port@0
>> -- 
>> 2.34.1
>>


