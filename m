Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8536C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 17:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6BaPnjQcShc/TQj8w7bokIUcnPjhGONOza6lZPt107c=; b=sHM7Dw4mGGlC4FehVAFulzwD+3
	M1tD/4mVuAro1QfGNwjqef5vL08Gxs1cWFUn5UEXjCy1Ksg7bs4AKfkugZy8QP7YdtqQnwwwKStMe
	uJt6Tgl9g6ZehtHZdq+4xMnAqpesTBNAHutIqAyrS+gwunSDZY2XpfhHQfJxZCd7MSomoK1coCAzN
	g/2opV9P7R6QqbUnqktNidccRA0PWW0Ag/ydkm318gr8dAohDnG65XuwkGEemeMictfvxvjz+G+K9
	WjnIIAsh8LLR/D6bkJyGTVXj6roqFKiQF3vC3Q3xnDnV0L3rhMz16/b+6Bhdw7iay+s+jPGW26par
	JhMpf9sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzfg7-000000042R6-3xNK;
	Tue, 01 Apr 2025 17:45:35 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzfeK-000000042KZ-1tZW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 17:43:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1743529422;
 bh=6BaPnjQcShc/TQj8w7bokIUcnPjhGONOza6lZPt107c=;
 b=GmvvYrHM0w5hAojndOpA3Ph753og2jqLUr9ByDKEQe04mgzpe8WAGBZvsMYTwfo9rSVmVL4+s
 0PdHIML7wAJe+ECUBbUnD5P6kJHC1gWRcrxDBOxAnYoYp/IhQQ09r1ktMHdDdiXOZoAq0Rl4BoK
 EtE3+/PMDwh6vagS81rm+OrWd1V/rSnBSdV1fZYnka8x5V8LsO79p/EiVHH3G3FZsfj4Q8sAwUo
 SHbHllb3UObXiuQJ96jI40D6TXUbJqcMKh4FMNi7Nsb7WF50zB8zzYLz9AB34tmeejtOZf9dzO9
 Q208l2D1NuO0JkXsaeyZZ/RNU7xC0kRwnyla/8N39MAQ==
X-Forward-Email-ID: 67ec25c900d8331c283c9f62
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.0.0
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <02f6e0e0-9cd8-425c-bad2-f061b601fdcd@kwiboo.se>
Date: Tue, 1 Apr 2025 19:43:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: rockchip: Add DMA controller for
 RK3528
To: Yao Zi <ziyao@disroot.org>, Chukun Pan <amadeus@jmu.edu.cn>
Cc: Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250401100020.944658-1-amadeus@jmu.edu.cn>
 <20250401100020.944658-3-amadeus@jmu.edu.cn> <Z-wj_eO6FGcwsEh6@pie.lan>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <Z-wj_eO6FGcwsEh6@pie.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_104344_595692_53C595BA 
X-CRM114-Status: GOOD (  16.21  )
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

On 2025-04-01 19:35, Yao Zi wrote:
> On Tue, Apr 01, 2025 at 06:00:19PM +0800, Chukun Pan wrote:
>> Add DMA controller dt node for RK3528 SoC.
>>
>> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
>> ---
>>  arch/arm64/boot/dts/rockchip/rk3528.dtsi | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
>> index 7f1ffd6003f5..c366766ee3f5 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
>> @@ -493,6 +493,24 @@ sdhci: mmc@ffbf0000 {
>>  			status = "disabled";
>>  		};
>>  
>> +		dmac: dma-controller@ffd60000 {
>> +			compatible = "arm,pl330", "arm,primecell";
>> +			reg = <0x0 0xffd60000 0x0 0x4000>;
>> +			clocks = <&cru ACLK_DMAC>;
>> +			clock-names = "apb_pclk";
>> +			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
>> +			arm,pl330-periph-burst;
> 
> Should this be moved above "clocks" line to sort the properties?

Not preferred according to [1], vendor-prefixed props is ordered after
non-vendor-prefixed props.

"""
The following order of properties in device nodes is preferred:
- "compatible"
- "reg"
- "ranges"
- Standard/common properties (defined by common bindings, e.g. without
  vendor-prefixes)
- Vendor-specific properties
- "status" (if applicable)
- Child nodes, where each node is preceded with a blank line

The "status" property is by default "okay", thus it can be omitted.

The above-described ordering follows this approach:
- Most important properties start the node: compatible then bus
  addressing to match unit address.
- Each node will have common properties in similar place.
- Status is the last information to annotate that device node is or is
  not finished (board resources are needed).
"""

[1] https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-of-properties-in-device-node

Regards,
Jonas

> 
> Thanks,
> Yao Zi
> 
>> +			#dma-cells = <1>;
>> +		};
>> +
>>  		pinctrl: pinctrl {
>>  			compatible = "rockchip,rk3528-pinctrl";
>>  			rockchip,grf = <&ioc_grf>;
>> -- 
>> 2.25.1
>>


