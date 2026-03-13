Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5418106FD68
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 02:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bq4iq8k6GkX1ctzNetJVx6rxaOwxLlO+PzTPDVOLeDk=; b=v65DzDcvlTLnUKZrUHbJVM3F2g
	YtP0I92xXopZoZkUdjAA9zVYMt0QOGOEttGAbKbZg0VkbY3uvf0pXxB0STr6zjJmsBOLcIX+TN3kT
	Nd4QYEGPJRyeNkn+i+6zWU/Vbjj1NCVv+UeAPhe2cFutawPT0AzqnOQzOfKi2c+RJa28dSiagMF1v
	3brMbrG6rquIuJecbI2Nj+X9JZGeT+LZ7R0fcEgB+5izrbiJKv5WE5E+bW3+2pfiwVRRoYBaPR4Q0
	bVh8PyZvLAqIKAzzDHIh0frKTJL6DmWSLClfOuObGIFp1Q4CpYINY530W7YKt5dj6Q7yRYzX7/8+c
	52zM+EdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0s12-0000000GBnn-1EUI;
	Fri, 13 Mar 2026 02:12:40 +0000
Received: from mail-m32105.qiye.163.com ([220.197.32.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0s0y-0000000GBn0-3rEt;
	Fri, 13 Mar 2026 02:12:38 +0000
Received: from [172.16.12.43] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 36c776438;
	Fri, 13 Mar 2026 10:07:14 +0800 (GMT+08:00)
Message-ID: <716e9716-2268-438f-ae55-d380877db123@rock-chips.com>
Date: Fri, 13 Mar 2026 10:07:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] dt-bindings: display: rockchip: analogix-dp: Add
 support for RK3576
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, nicolas.frattaroli@collabora.com,
 alchark@gmail.com, cristian.ciocaltea@collabora.com,
 sebastian.reichel@collabora.com, kever.yang@rock-chips.com,
 dmitry.baryshkov@oss.qualcomm.com, luca.ceresoli@bootlin.com,
 dianders@chromium.org, m.szyprowski@samsung.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260310105307.309765-1-damon.ding@rock-chips.com>
 <20260310105307.309765-2-damon.ding@rock-chips.com>
 <20260311-toucanet-of-imaginary-authority-c9f0db@quoll>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20260311-toucanet-of-imaginary-authority-c9f0db@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9ce4f2a92e03a3kunmc1811a2e381cc
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0xJQlYYQkkZQx5KSU5OSk5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=PPY8peb+FTgHiMCthwWnx7ddQB28ebg/49XsKF30c4mNbCyqrWJ52zOSOmR2IRU2UfLunwLLT5U6DjQ0/SomKzjkYrvdEeQRpuHcTdZw76dueIwcCIQHDeGUHsUYzvPe+3wi4X3eqbZaiJpNzvrsCHKw7KjV7QoJyQUD3l77WDs=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=bq4iq8k6GkX1ctzNetJVx6rxaOwxLlO+PzTPDVOLeDk=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_191237_148688_37D457C4 
X-CRM114-Status: GOOD (  12.58  )
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

On 3/11/2026 9:01 PM, Krzysztof Kozlowski wrote:
> On Tue, Mar 10, 2026 at 06:53:04PM +0800, Damon Ding wrote:
>> The eDP TX controller on RK3576 is the same as that on RK3588.
>>
>> The newly added clock 'hclk' is the video datapath clock.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> ---
>>   .../bindings/display/rockchip/rockchip,analogix-dp.yaml     | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
>> index d99b23b88cc5..4496a43881f9 100644
>> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
>> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
>> @@ -15,6 +15,7 @@ properties:
>>       enum:
>>         - rockchip,rk3288-dp
>>         - rockchip,rk3399-edp
>> +      - rockchip,rk3576-edp
>>         - rockchip,rk3588-edp
>>   
>>     clocks:
>> @@ -26,7 +27,9 @@ properties:
>>       items:
>>         - const: dp
>>         - const: pclk
>> -      - const: grf
>> +      - enum:
>> +          - grf
>> +          - hclk
> 
> And why it is not the same clock? Nothing in commit msg explains why
> this clock input (not output!) is different.
> 

After checking the CRU design for both platforms, I confirm that both 
require this HCLK.

The RK3588 platform works without explicitly adding this clock because 
the 'rockchip,vo-grf = <&vo1_grf>' property implicitly enables hclk_vo1.

For v2, it should be better to add the corresponding HCLK reference to 
the eDP nodes in the RK3588 DTS.

Best regards,
Damon


