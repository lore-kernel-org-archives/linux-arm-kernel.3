Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7280ED25050
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 08:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ldRCPrtOBfLYItSV9yMq54CAANmfFEavMvsJtpmTTys=; b=wkChUUJamMHd6UG/CHYy5bEx/h
	0jZIdecDJTOiFf9+CANksu8Kn8SLBc7ZVAWIkjsydZQerwT70m2qGle+b1APNyIVhyweHBfVkOkNU
	jeWcX8wjRn1RPG8k1+AJf4iIX489NfxJZ7IdQWH/eis1Mqf1nXHtjmcK2pZ5n5kpMScgyDpMfHyIK
	aHricBccj3p48INFpf7/OBwN9ICE4MeKEtN9JvTCMUScy0oDhRmd9LEuylR741Ukem+DYJg+g2taV
	XxKxm4A05cU4pIwdVhJmVrI5/X33+a1rBu0vnrapFee8wT3/+UCa8aOsHI/Jwg68afMdPLkgHEcIJ
	p2ADuqQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfDla-000000052ns-0x8D;
	Mon, 12 Jan 2026 08:59:14 +0000
Received: from mail-m3268.qiye.163.com ([220.197.32.68])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfDlX-000000052mv-1TyV;
	Mon, 12 Jan 2026 08:59:12 +0000
Received: from [127.0.0.1] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 30502a33a;
	Mon, 12 Jan 2026 16:59:05 +0800 (GMT+08:00)
Message-ID: <1515a445-576a-4833-a604-c31062f7d3fa@rock-chips.com>
Date: Mon, 12 Jan 2026 16:59:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: usb: Add binding for WCH CH334/CH335
 hub controller
To: Krzysztof Kozlowski <krzk@kernel.org>, Chaoyi Chen <kernel@airkyi.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Quentin Schulz <quentin.schulz@cherry.de>, Jonas Karlman <jonas@kwiboo.se>,
 Hsun Lai <i@chainsx.cn>, John Clark <inindev@gmail.com>,
 Jimmy Hon <honyuenkwun@gmail.com>, Dragan Simic <dsimic@manjaro.org>,
 Michael Riesch <michael.riesch@collabora.com>,
 Peter Robinson <pbrobinson@gmail.com>, Alexey Charkov <alchark@gmail.com>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Andy Yan <andy.yan@rock-chips.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20260112022823.91-1-kernel@airkyi.com>
 <20260112022823.91-2-kernel@airkyi.com>
 <20260112-lively-hallowed-beetle-fc15b2@quoll>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20260112-lively-hallowed-beetle-fc15b2@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9bb16e281a03abkunma6637fdf5a04c7
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGk9CH1ZLQkxOGUlJHR0fSxhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUJNS0
	pVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=IRBny3i1tny0lQHFT1Kqi2Zrp+U9KRru8lqXZ51/YlMkyThb2yqMK/JpU6UZiwbqTyvgn1Kphp/9+DbwHiCbHAtEw/Zt8qxZxPtWhVzjSxypG3x/yor73Pjw6G9NOLVxvR4W5nmhMD0Lh9jTcTDZ3ffUIG8W8dFmxCtmFSqfKuU=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=ldRCPrtOBfLYItSV9yMq54CAANmfFEavMvsJtpmTTys=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_005911_584029_CE40EF70 
X-CRM114-Status: GOOD (  16.67  )
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

On 1/12/2026 4:50 PM, Krzysztof Kozlowski wrote:
> On Mon, Jan 12, 2026 at 10:28:21AM +0800, Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> The WCH CH334/CH335[0] are USB2.0 protocol compliant 4-port USB HUB
>> controller chips, supporting USB2.0 high-speed and full-speed for
>> upstream ports, and USB2.0 high-speed 480Mbps, full-speed 12Mbps and
>> low-speed 1.5Mbps for downstream ports, supporting not only low-cost STT
>> mode (single TT schedules 4 downstream ports in time share), but also
>> supports high performance MTT mode (4 TTs each corresponding to 1 port,
>> concurrent processing).
>>
>> Add a device tree binding for it.
>>
>> [0]: https://www.wch-ic.com/downloads/CH334DS1_PDF.html
>>
>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>> ---
>>  .../devicetree/bindings/usb/wch,ch334.yaml    | 65 +++++++++++++++++++
> 
> This must be separate patch. Do not combine independent subsystems into
> one patchset.
> 

Okay, thank you for the reminder.

>>  1 file changed, 65 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/usb/wch,ch334.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/usb/wch,ch334.yaml b/Documentation/devicetree/bindings/usb/wch,ch334.yaml
>> new file mode 100644
>> index 000000000000..2eeb92f25b4c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/wch,ch334.yaml
>> @@ -0,0 +1,65 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/usb/wch,ch334.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: WCH CH334/CH335 USB 2.0 Hub Controller
>> +
>> +maintainers:
>> +  - Chaoyi Chen <kernel@airkyi.com>
>> +
>> +allOf:
>> +  - $ref: usb-hub.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - usb1a86,8091
>> +
>> +  reg: true
>> +
>> +  reset-gpios:
>> +    description: GPIO controlling the RESET# pin.
>> +
>> +  vdd-supply:
>> +    description:
>> +      The regulator that provides 3.3V core power to the hub.
>> +
>> +  vdd2-supply:
>> +    description:
>> +      The regulator that provides 3.3V or 5V power to the hub.
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    patternProperties:
>> +      '^port@':
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +
>> +        properties:
>> +          reg:
>> +            minimum: 1
>> +            maximum: 4
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +    usb {
>> +        dr_mode = "host";
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        hub: hub@1 {
>> +            compatible = "usb1a86,8091";
>> +            reg = <1>;
>> +            reset-gpios = <&gpio0 2 GPIO_ACTIVE_HIGH>;
> 
> Are you sure?

I guess what you're concerned about here is the polarity? 
If that's the case, then there's no problem.

-- 
Best, 
Chaoyi

