Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB66AD29DC7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 03:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Efl5RuE0mVY+YJW1yRffgZbr4IC25Y+TVgIpBMs5y7Y=; b=ylLo9wSi2CGIz1k2QH0eM9R2cv
	W80tNDg6F1oacfqUCU+vs+M4VdTiftZ+nvd8eXzkncJlFYtXP8T0cLBqBhyHuhSPNpTs3/5jjNsWi
	gDYf2sn/1+87q7sBD+y3tMx+FTepFqGw3NlxKIrTDGh0VTO3cUTq54t42Gpd0JVsyr6oTWTL/5fFr
	oUSImUogNS6GQOWt4Sy6PJUE2IQVLM0dAyFmIkNnC4nkuNKOM/oIA9wdUM91srp1VqCW0qt4U5Urk
	RSBSf55tvmSw/fnRG0BNcWANgRA4YBjjcmOqr4jPwQjUzQbixLYF7vhXGbhEXpbgNF/UHqyRi+ewn
	u2khau3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfVEp-00000006UZ4-0jxg;
	Tue, 13 Jan 2026 03:38:35 +0000
Received: from mail-m128225.netease.com ([103.209.128.225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfVEl-00000006UYW-00Bx;
	Tue, 13 Jan 2026 03:38:33 +0000
Received: from [127.0.0.1] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 306abc5d2;
	Tue, 13 Jan 2026 11:38:25 +0800 (GMT+08:00)
Message-ID: <dc5dbed9-cd48-4d22-9960-d35f9dcdc5f0@rock-chips.com>
Date: Tue, 13 Jan 2026 11:38:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: usb: Add binding for WCH CH334/CH335
 hub controller
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Chaoyi Chen <kernel@airkyi.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonas Karlman <jonas@kwiboo.se>, Hsun Lai <i@chainsx.cn>,
 John Clark <inindev@gmail.com>, Jimmy Hon <honyuenkwun@gmail.com>,
 Dragan Simic <dsimic@manjaro.org>,
 Michael Riesch <michael.riesch@collabora.com>,
 Peter Robinson <pbrobinson@gmail.com>, Alexey Charkov <alchark@gmail.com>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Andy Yan <andy.yan@rock-chips.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20260112022823.91-1-kernel@airkyi.com>
 <20260112022823.91-2-kernel@airkyi.com>
 <07ce7c4e-7fc7-40f8-9c46-4977e3ce2458@cherry.de>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <07ce7c4e-7fc7-40f8-9c46-4977e3ce2458@cherry.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9bb56ef09a03abkunm4d9a2525bea91
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkMaHlZPHxhNTh5MQkoZSE1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUJNS0
	pVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=EfK1WbsQ2pS868dyEmAt018UkLX0plHykv8VwY0z06nQOnLBA8V/nAlesyU4ZeeCiwPO4y82K14gHO2Yv3upKG8FkH3T19BUID8R25VKOnmk1OBZFZClwC0HACXVovPWQ8fX1HXTHJX5jEJI5WUZy1jovZ8dBcUW9WbJRVo3+z0=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=Efl5RuE0mVY+YJW1yRffgZbr4IC25Y+TVgIpBMs5y7Y=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_193831_619169_9F152C69 
X-CRM114-Status: GOOD (  18.98  )
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

Hi Quentin,

On 1/12/2026 10:00 PM, Quentin Schulz wrote:
> Hi Chaoyi,
> 
> On 1/12/26 3:28 AM, Chaoyi Chen wrote:
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
>>   .../devicetree/bindings/usb/wch,ch334.yaml    | 65 +++++++++++++++++++
>>   1 file changed, 65 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/usb/wch,ch334.yaml
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
> 
> Which driver does this node bind to? I couldn't quickly find a driver which would match this compatible?
>

Oh, I missed that part. It will be fixed in the next version.

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
> 
> There's v5 and vdd33 as power input, shouldn't we maybe use those names instead? How did you come up with vdd/vdd2?
>

That make sense. Will fix in next version.

> There's also a timing that needs to be respected after a power-on event so that the reset has enough time to be performed, c.f. 3.2.1 Power-on Reset in the datasheet you linked to in the commit log. How are you making sure we wait those (apparently, the wording in the datasheet is confusing) 14ms?

This part should be described in the driver. 
I'll fix it in the next version.

-- 
Best, 
Chaoyi

