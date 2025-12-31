Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D47B2EE6427
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 10:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=38C12CA+yJXwWbEH8TepZMkmX51aW9ULukFZHKnMqZQ=; b=3oxIOuRTdkoSIPY6Or+l8hGOaG
	HeYEE74RdAQCy5vyCpvHoAmQgNopxkzW7L57aMHLaqKA38MeS//KWR1Jeqf3ATenmiSJyLF9hHji9
	k5t+PikZxkmDWHpamXaR8Ky5gYlP8sV9fTmH4ILYMJiqw/SjRDPSS9Gd7SGIUiJU4GWvliOQCiU9D
	J3hfNL/5TRtqlO7YyLgXYbwG4Sfx600x7lwFfepjrgOuvK+KBQHTzz/q3pfBohU9bz2NV9dewz8fb
	w424m+3Gi+YaQgdHOlzs0BsMkDI2v+EE1T8XBWS7r6Qp+xlM/N88gyXZalC59CkNB4wxSlJMtFU37
	m+cfJumg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vatCL-00000005rZq-19MA;
	Wed, 31 Dec 2025 10:12:57 +0000
Received: from mail-m32124.qiye.163.com ([220.197.32.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vatCI-00000005rZL-115W;
	Wed, 31 Dec 2025 10:12:56 +0000
Received: from [172.16.12.16] (gy-adaptive-ssl-proxy-4-entmail-virt151.gy.ntes [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2f2651ced;
	Wed, 31 Dec 2025 18:12:44 +0800 (GMT+08:00)
Message-ID: <7370b9a4-692d-43f8-9a48-82da0b4de939@rock-chips.com>
Date: Wed, 31 Dec 2025 18:12:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] dt-bindings: pinctrl: rockchip: Add rk3506 rmio
 support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner
 <heiko@sntech.de>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 tao.huang@rock-chips.com
References: <20251227114957.3287944-1-ye.zhang@rock-chips.com>
 <20251227114957.3287944-6-ye.zhang@rock-chips.com>
 <20251228-olive-termite-of-painting-1bee5b@quoll>
From: Ye Zhang <ye.zhang@rock-chips.com>
In-Reply-To: <20251228-olive-termite-of-painting-1bee5b@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b73e547e909d8kunm087a468e2a54c65
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkhJTVZLH0tMH05NTE1OTU9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUJNS0
	pVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=VfB2YTq1dDLW4lPQb/wYiy8TiQJLBnx5w//V6mZeX82fybxRalbCFF764gDqYPMyY8TwubCdWJxDd0nDgN9nPJkdhk16V7IiHCYc2A0Bwh+vQZJ6Ra0U8vSuvApQSnLgkUmzXmfhUd46JG7C0+gqVzBw8EG2mRIIuHLqkuDY5zo=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=38C12CA+yJXwWbEH8TepZMkmX51aW9ULukFZHKnMqZQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_021254_787389_25091584 
X-CRM114-Status: GOOD (  21.83  )
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


在 2025/12/28 18:37, Krzysztof Kozlowski 写道:
> On Sat, Dec 27, 2025 at 07:49:55PM +0800, Ye Zhang wrote:
>> The RK3506 SoC introduces a secondary block-level pinmux controller called
>> RMIO (Rockchip Matrix I/O). When the primary IOMUX is selected to a
>> specific function, the pin signal is routed to the RMIO block, where a
>> secondary selection determines the final function.
>>
>> This patch adds the necessary properties to support RMIO:
>> - rockchip,rmio: phandle to the RMIO syscon node.
>> - rockchip,rmio-pins: a matrix to configure the RMIO block.
>>
>> Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
>> ---
>>   .../bindings/pinctrl/rockchip,pinctrl.yaml    | 24 +++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
>> index 97960245676d..887bec22b172 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
>> @@ -66,6 +66,13 @@ properties:
>>         Required for at least rk3188 and rk3288. On the rk3368 this should
>>         point to the PMUGRF syscon.
>>   
>> +  rockchip,rmio:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      The phandle of the syscon node for the RMIO registers, used by
>> +      some SoCs (e.g. rk3506) to configure the secondary block-level
>> +      pinmux functions.
>> +
> You need to disallow it for other variants in if:then: block.
Will be completed in v5.
>>     "#address-cells":
>>       enum: [1, 2]
>>   
>> @@ -144,6 +151,23 @@ additionalProperties:
>>                   The phandle of a node contains the generic pinconfig options
>>                   to use as described in pinctrl-bindings.txt.
>>   
>> +      rockchip,rmio-pins:
>> +        $ref: /schemas/types.yaml#/definitions/uint32-matrix
>> +        minItems: 1
>> +        items:
>> +          items:
>> +            - minimum: 0
> That's redundant. 0 is already minimum.
I will remove it in v5
>> +              description: RMIO ID (Controller index)
> Why do you need this? Is this pin controller having multiple RMIO IDs?
> Nothing like that was expressed in previous DTS. No other IDs are
> present in this DTS, either...

The RMIO hardware IP itself is designed to support multiple instances. 
Although the RK3506 only integrates one instance, other chips (like the 
RK2116) already utilize multiple RMIO blocks.

We want to define the binding based on the capabilities of the IP block 
rather than the specific configuration of the RK3506. This ensures the 
binding format (3 cells) remains stable when support for multi-RMIO SoCs 
is added to Linux in the future, avoiding the need to handle different 
cell formats in the driver.

We prefer to keep the ID column (fixed to 0 for RK3506) for this forward 
compatibility.

Is this acceptable?

>> +            - minimum: 0
>> +              description: Pin index within the RMIO controller
>> +            - minimum: 0
>> +              description: Function Mux ID
>> +        description:
>> +          Configuration for the Rockchip Matrix I/O (RMIO) block. The format
>> +          is <rmio_id pin_id function_id>. This acts as a secondary muxing
>> +          layer when the primary 'rockchip,pins' mux is set to the RMIO
>> +          function.
>> +
>>   examples:
>>     - |
>>       #include <dt-bindings/interrupt-controller/arm-gic.h>
>> -- 
>> 2.34.1
>>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
>

