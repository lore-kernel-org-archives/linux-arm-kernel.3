Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DE5E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 08:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YBxLONAc2YXY1BIJF//FZvX1aM+Sn/tfGnBkN7/bO1Q=; b=xuHKyLb78uS4b8DmeOqsyaerde
	p3XTjPmRao7vHNtiH+nL88lAa6i08agt9uDnhpPaEamG7rp+x+LH3GCQ7Cj1/aX8rL18tAm6Crp5I
	FezrPdg944e/hghRPsVjIjYGO9Vn/6z0VyQJZcwwirYyP3+SruIUtYkBRx3JhfYk/gRD8c5m/2APF
	+7DTxOVlxEDh7sEvbY07AWnKSc7YPEYPVuqpi65CAcc1WFqD72Ae6V6jgfwsv5KL7x+E2zF4BZobq
	cnPkvmrd0w55mj/yBD4Ervu7tx9/N8E0xjm+4q1reZwF+ZPMMfWtVPW4vX2zanN9OrGPBgK29DKhz
	Phi6lyPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ0Q1-0000000BVmV-41zU;
	Tue, 24 Dec 2024 08:37:33 +0000
Received: from mail-m19731101.qiye.163.com ([220.197.31.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ0Op-0000000BVc2-1kPQ;
	Tue, 24 Dec 2024 08:36:21 +0000
Received: from [172.16.12.67] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 6a83f662;
	Tue, 24 Dec 2024 16:36:12 +0800 (GMT+08:00)
Message-ID: <e75b38b4-605f-4f9e-8c95-204877b9bf84@rock-chips.com>
Date: Tue, 24 Dec 2024 16:36:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/38] dt-bindings: clock: add rk3562 cru bindings
To: Conor Dooley <conor@kernel.org>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Elaine Zhang <zhangqing@rock-chips.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20241220103825.3509421-1-kever.yang@rock-chips.com>
 <20241220103825.3509421-2-kever.yang@rock-chips.com>
 <20241222-grandpa-vessel-66e9ca9cde75@spud>
Content-Language: en-US
From: Kever Yang <kever.yang@rock-chips.com>
In-Reply-To: <20241222-grandpa-vessel-66e9ca9cde75@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkhITlZIGh1JQ0tLGh9CGE9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	JVSktLVUpCS0tZBg++
X-HM-Tid: 0a93f7cf356603afkunm6a83f662
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OEk6Txw5HjILCEtDQiJNS0oC
	CDwaCgFVSlVKTEhOS0lCSExIQkhKVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJQ09ONwY+
DKIM-Signature: a=rsa-sha256;
	b=BDoLd2npj0n6Om1OH5DJXSsVpoK+ms+L4VEFsKWa6Q0BUz0mLywgGE0K0gSQ1wUl+kIAVw6MhuIoiApVIqXDgVQhOx+++sWjEqjmkDWYpFpvd6MKN9JfoWOjlFO0Sd9OelNfkNzAb+tQPJ4C7mAajNDAC8Ru9FqNGdq8lAKktAk=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=YBxLONAc2YXY1BIJF//FZvX1aM+Sn/tfGnBkN7/bO1Q=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_003619_972791_A94251A1 
X-CRM114-Status: GOOD (  15.39  )
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

On 2024/12/22 22:51, Conor Dooley wrote:
> On Fri, Dec 20, 2024 at 06:37:47PM +0800, Kever Yang wrote:
>> Document the device tree bindings of the rockchip rk3562 SoC
>> clock and reset unit.
>>
>> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
>> ---
>>
>>   .../bindings/clock/rockchip,rk3562-cru.yaml   | 62 +++++++++++++++++++
>>   1 file changed, 62 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3562-cru.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3562-cru.yaml b/Documentation/devicetree/bindings/clock/rockchip,rk3562-cru.yaml
>> new file mode 100644
>> index 000000000000..aa8dedf2bfce
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/rockchip,rk3562-cru.yaml
>> @@ -0,0 +1,62 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/rockchip,rk3562-cru.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Rockchip rk3562 Clock and Reset Control Module
>> +
>> +maintainers:
>> +  - Elaine Zhang <zhangqing@rock-chips.com>
>> +  - Heiko Stuebner <heiko@sntech.de>
>> +
>> +description:
>> +  The RK3562 clock controller generates the clock and also implements a reset
>> +  controller for SoC peripherals. For example it provides SCLK_UART2 and
>> +  PCLK_UART2, as well as SRST_P_UART2 and SRST_S_UART2 for the second UART
>> +  module.
>> +
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
>> +
>> +  clock-names:
>> +    items:
>> +      - const: xin24m
>> +      - const: xin32k
>> +
>> +  rockchip,grf:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      Phandle to the syscon managing the "general register files" (GRF),
>> +      if missing pll rates are not changeable, due to the missing pll
>> +      lock status.
> Two questions:
> - Why would it ever be missing? Seems like you should make it required.

This may not need for some of SoC, for the rk3562, we don't need it, I 
will remove it.


Thanks,
- Kever
> - Why is it not possible to look the grf up by compatible rather than
>    phandle?
>
> Cheers,
> Conor.
>
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
>> +    };
>> -- 
>> 2.25.1
>>
>>

