Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B6CC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 09:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wkj5uNlX0tJSQD/Cdm3vu3AtdbrZyweYKQfMb+Q0YnQ=; b=S67ni5pHq6IWP2WCiwleEfUqFX
	KOMNkxMfashSQ3J+oUDT/C/dHZtF2hK6ShdwYIXJ16NzjARS1U/sQQbmZcEjeVg1HaG7kjIFAxgfU
	zSifCcVoZ+3XixO+FMf3Uz9pGtL/lU1nOUnY5QClEbauBnl7Byh2z7GP7ujbr6EG+5svVEEO3al68
	5M2fciqyu+oGKlnulPaPJ90TV/OsxRtGRrJ3LHMs2GPK5riB3mKilEDJno4JnOI7LqABJp6RQQtMa
	NYle3xRKvgsjX9Cv7AVyTGCaBLYcCbFv/s9E8RsDakK1EmrmWKKcd5+nTlORioYG/Xc0g8mTs55IH
	2iElt+Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUWz-0000000Cr39-2caj;
	Mon, 24 Feb 2025 09:13:41 +0000
Received: from mail-m32117.qiye.163.com ([220.197.32.117])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUCI-0000000ClyI-2EUY;
	Mon, 24 Feb 2025 08:52:19 +0000
Received: from [192.168.60.65] (unknown [103.29.142.67])
	by smtp.qiye.163.com (Hmail) with ESMTP id bfe919b3;
	Mon, 24 Feb 2025 16:52:13 +0800 (GMT+08:00)
Message-ID: <23c84fd5-83f4-46b3-a247-56e4a2c06d1d@rock-chips.com>
Date: Mon, 24 Feb 2025 16:52:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: add rk3562 cru bindings
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Elaine Zhang <zhangqing@rock-chips.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20241224092310.3814460-1-kever.yang@rock-chips.com>
 <krrqtjllx6akrurefbtuhgxw6bwmkiro5rtvdexoevjyufm2uz@r5biw7kbttyr>
Content-Language: en-US
From: Kever Yang <kever.yang@rock-chips.com>
In-Reply-To: <krrqtjllx6akrurefbtuhgxw6bwmkiro5rtvdexoevjyufm2uz@r5biw7kbttyr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaThgeVh9OGktDHh9NSh9LSlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKS0hVSUJVSk9JVU1MWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0NMVUpLS1
	VLWQY+
X-HM-Tid: 0a95372829e503afkunmbfe919b3
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NSo6KQw5NjIUGRMeHQ5CCBEP
	EiMKCgxVSlVKTE9LSENMSkhOTEJJVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlKS0hVSUJVSk9JVU1MWVdZCAFZQUpNT0s3Bg++
DKIM-Signature: a=rsa-sha256;
	b=PpTe76hOHpGk0srvgTU0V496WB4QNRT16SyUTn3RovpGoBOgTamAQyJdyZ9toeKiU54XiNCMokCsB49WToThltFD51fK/JpVz+l7gvApnkmIk9Sa+5mI5YZHT4Ia9oRoVVDjyPoqbW/xiMS5xWNsf9kUucbzusnm/W+YIBC1iDc=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=wkj5uNlX0tJSQD/Cdm3vu3AtdbrZyweYKQfMb+Q0YnQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_005218_747791_177AE3A0 
X-CRM114-Status: GOOD (  12.94  )
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

On 2024/12/27 16:25, Krzysztof Kozlowski wrote:
> On Tue, Dec 24, 2024 at 05:23:08PM +0800, Kever Yang wrote:
>> Document the device tree bindings of the rockchip rk3562 SoC
>> clock and reset unit.
>>
>> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
>> ---
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
>
>
> s/rk3562/Rocchip RK3562/
> or whatever your proper name is (and use proper capitalized parts of
> products)
Will update.
>
>> +properties:
>> +  compatible:
>> +    const: rockchip,rk3562-cru
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  "#clock-cells":
>> +    const: 1
>> +
>> +  "#reset-cells":
>> +    const: 1
>> +
>> +  clocks:
>> +    maxItems: 2
>
> Why clocks are not required?
The cru is the clock-controller, which is always on module in SoC,
so we don't need to enable "clock" for this clock-controller.

Thanks,
- Kever
>
>> +
>> +  clock-names:
>> +    items:
>> +      - const: xin24m
>> +      - const: xin32k
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - "#clock-cells"
>> +  - "#reset-cells"
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    clock-controller@ff100000 {
>> +      compatible = "rockchip,rk3562-cru";
>> +      reg = <0xff100000 0x40000>;
>> +      #clock-cells = <1>;
>> +      #reset-cells = <1>;
> Why clocks are not here?
>
> Best regards,
> Krzysztof
>
>

