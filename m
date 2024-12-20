Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3A8E77184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 02:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BnTG/sbpkXhlifAr32NESdvTHkU0t98XHfRuC7OuuwQ=; b=igAtCR8WWeDgUG43d0A8pp7Zet
	51oaRnyxyBlIJY5aKVjV6bkfi+v7VEdu/NvtRI3CuhWdqitziOcHnQjqZnL21rdJBoU1LPvC56eVH
	6tv+OSru7b2MDbcq4Rba/VKxfHzucy7BLDAG4cmcKMAXcXQGm9xAKAZ5ZmUMl9Vg3F+YgCmx4m6o2
	e9YfT7D0ag8o73ThtHTaDmPvUg8Um4OkOE6UClshiWnn94/1a9PMiMq7nKosB1c4Amdj3mhbdDL3L
	65eudhcTYTGrggcXpSbMFu/RUz+rzTpqymhSwgvwWibgZbUNhjC3VXPGXA88cSoWuki93RGnIPeL/
	l54O3byA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOT5l-00000003kBV-0uNn;
	Fri, 20 Dec 2024 02:50:17 +0000
Received: from mail-m3274.qiye.163.com ([220.197.32.74])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOT4Z-00000003k2W-32Mn;
	Fri, 20 Dec 2024 02:49:05 +0000
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 64782b86;
	Fri, 20 Dec 2024 10:48:57 +0800 (GMT+08:00)
Message-ID: <c06381b7-1e38-4af4-9873-15862e91937d@rock-chips.com>
Date: Fri, 20 Dec 2024 10:48:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/15] dt-bindings: display: rockchip: analogix-dp: Add
 support to get panel from the DP AUX bus
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org,
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, andy.yan@rock-chips.com, hjc@rock-chips.com,
 algea.cao@rock-chips.com, kever.yang@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
References: <20241219080604.1423600-1-damon.ding@rock-chips.com>
 <20241219080604.1423600-11-damon.ding@rock-chips.com>
 <bjkcue3dfgaf5i66cqbiczifo7r3xngupghklxgevwqpwfeeix@i2jfd477igri>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <bjkcue3dfgaf5i66cqbiczifo7r3xngupghklxgevwqpwfeeix@i2jfd477igri>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGhlNSFZIGR8fTklCTR1CQx1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a93e1f7db9703a3kunm64782b86
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NFE6Szo5QjIOEAo1SjlCL0IM
	Mw5PCxpVSlVKTEhPTU1JQkhCSUtOVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKSUlINwY+
DKIM-Signature: a=rsa-sha256;
	b=deB0Jb94udSAo7ZPYkOoiDXrtBIRVqu0+kLEM19169DFiIFcei1LSpKufWBIrzG6vYJv5PNC9OwrY6G8JVKp9RAHMygxg6l2KSWfpJn8SbqdhLiwpx2+U5psTdmjjWKAY+wR/edr5OSCkURTbAKVIwCMiFIC2KPVTL/z0ZaZ9oo=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=BnTG/sbpkXhlifAr32NESdvTHkU0t98XHfRuC7OuuwQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_184904_326157_E47873B1 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
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

Hi Dmitry,

On 2024/12/20 8:18, Dmitry Baryshkov wrote:
> On Thu, Dec 19, 2024 at 04:05:59PM +0800, Damon Ding wrote:
>> According to Documentation/devicetree/bindings/display/dp-aux-bus.yaml,
>> it is a good way to get panel through the DP AUX bus.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> ---
>>   .../bindings/display/rockchip/rockchip,analogix-dp.yaml        | 3 +++
>>   1 file changed, 3 insertions(+)
> 
> Business before pleasure.^W^W^W Bindings before the driver.

I couldn't agree more. ;-)

> 
>>
>> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
>> index 4f84e8849876..c45d92a2d901 100644
>> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
>> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
>> @@ -49,6 +49,9 @@ properties:
>>       description:
>>         This SoC makes use of GRF regs.
>>   
>> +  aux-bus:
>> +    $ref: /schemas/display/dp-aux-bus.yaml#
>> +
>>   required:
>>     - compatible
>>     - clocks
>> -- 
>> 2.34.1
>>
> 

Best regards,
Damon

