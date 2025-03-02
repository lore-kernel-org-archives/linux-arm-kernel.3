Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46053C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 11:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2rZnsvHwyI+sU9+EF0i7TafNRHUGql1r6Nc38HeeaK4=; b=G4p3EjCVCReeN1oShuQstDaHIA
	3SI/TH6G4u+U9uPzJcowfPd7kr6BweyACi1QrF3FW5erBDPePVrszxmBIBIfnMdxBiuyvCU9z5qJt
	zQ0oOYlrdZ8iGkcOrWixoCsKNaiJW5zt0m4Fuk3PdBqodGZDV/8GdIaMQwcPr+Qs+lpJrCveQmaE/
	M30SteT9iG0LCnHQprDWhuwPJyXQbHnPt7c/esDiVoWBlAoj1mFbd+nkCMWwJAIFWe3gmMWck9BN+
	r5Ahxd672LDCRZXWLCCSDGjKAWrz8IoN8f9FIYj/KklamqBvdIE7uVoO/r+m9uMJ7jZwvnej6Zpmu
	DeyVBjrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tohbh-0000000Fv0N-3tRu;
	Sun, 02 Mar 2025 11:35:41 +0000
Received: from smtp.forwardemail.net ([121.127.44.59])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toha9-0000000FutN-1KOI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Mar 2025 11:34:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1740915243;
 bh=2rZnsvHwyI+sU9+EF0i7TafNRHUGql1r6Nc38HeeaK4=;
 b=zPitsCZVDDz/gdJrhV059oOWSuq6Jiy0u/Zq7EHM16UYHpxIP2dPBThsoIWawdn9zHAQMc4Fr
 g1kR6j2FKNG0Xq6Seh9+hIspyed2NWETVrbeIbCGR/yAmCRI8VWL1hgEMrwgKxiixu/JCks6a5a
 EYDVEbcNmAXtjQ5B6L0M1e4Y+l5d/iaYfMEhI1GobJ4i5HA7lFSalmZ/o7xpbKqCJ3CAEfvOCRV
 1wP746xLApt0dufYRnrZyxeULBrFx/ErzIOYzI6K5Hh/EctcavP5AABZn/68gbsVLN869ahlgYy
 WPfuY42Ri7B5XcvhcXyuyPLizakkZZtg7y+Hg1jzZC0A==
X-Forward-Email-ID: 67c442264a29b97c03d4df09
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.59
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <b92c0f59-c721-4e91-ac41-267a81758916@kwiboo.se>
Date: Sun, 2 Mar 2025 12:33:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] arm64: dts: rockchip: Add SDMMC/SDIO controllers for
 RK3528
To: Yao Zi <ziyao@disroot.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Frank Wang <frank.wang@rock-chips.com>,
 Shresth Prasad <shresthprasad7@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Detlev Casanova <detlev.casanova@collabora.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20250301104250.36295-1-ziyao@disroot.org>
 <20250301104749.36423-1-ziyao@disroot.org>
 <9fd51bcb-3e6a-46b6-b1f7-ff16fa562d9e@kwiboo.se> <Z8MMm7X31p_CrStZ@pie>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <Z8MMm7X31p_CrStZ@pie>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_033405_462176_1E05839F 
X-CRM114-Status: GOOD (  20.50  )
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

Hi Yao Zi,

On 2025-03-01 14:33, Yao Zi wrote:
> On Sat, Mar 01, 2025 at 01:47:47PM +0100, Jonas Karlman wrote:
>> Hi,
>>
>> On 2025-03-01 11:47, Yao Zi wrote:
>>> RK3528 features two SDIO controllers and one SD/MMC controller, describe
>>> them in devicetree. Since their sample and drive clocks are located in
>>> the VO and VPU GRFs, corresponding syscons are added to make these
>>> clocks available.
>>>
>>> Signed-off-by: Yao Zi <ziyao@disroot.org>
>>> ---
>>>  arch/arm64/boot/dts/rockchip/rk3528.dtsi | 62 ++++++++++++++++++++++++
>>>  1 file changed, 62 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
>>> index 5b334690356a..078c97fa1d9f 100644
>>> --- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
>>> +++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
>>> @@ -7,6 +7,7 @@
>>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>  #include <dt-bindings/interrupt-controller/irq.h>
>>>  #include <dt-bindings/clock/rockchip,rk3528-cru.h>
>>> +#include <dt-bindings/reset/rockchip,rk3528-cru.h>
>>>  
>>>  / {
>>>  	compatible = "rockchip,rk3528";
>>> @@ -122,6 +123,16 @@ gic: interrupt-controller@fed01000 {
>>>  			#interrupt-cells = <3>;
>>>  		};
>>>  
>>> +		vpu_grf: syscon@ff340000 {
>>> +			compatible = "rockchip,rk3528-vpu-grf", "syscon";
>>
>> vpu_grf is also used for gmac1, so should possible be a "syscon",
>> "simple-mfd", or have I misunderstood when to use simple-mfd ?
> 
> Just as Heiko explained, "simple-mfd" is only required when the child
> nodes should be populated automatically. Here these two GRFs are only
> referenced and have no child, thus "simple-mfd" compatible isn't useful.

Thanks for the explanations.

> 
>>> +			reg = <0x0 0xff340000 0x0 0x8000>;
>>> +		};
>>> +
>>> +		vo_grf: syscon@ff360000 {
>>> +			compatible = "rockchip,rk3528-vo-grf", "syscon";
>>
>> similar here, vo_grf is also used for gmac0.
>>
>>> +			reg = <0x0 0xff360000 0x0 0x10000>;
>>> +		};
>>> +
>>>  		cru: clock-controller@ff4a0000 {
>>>  			compatible = "rockchip,rk3528-cru";
>>>  			reg = <0x0 0xff4a0000 0x0 0x30000>;
>>> @@ -251,5 +262,56 @@ uart7: serial@ffa28000 {
>>>  			reg-shift = <2>;
>>>  			status = "disabled";
>>>  		};
>>> +
>>> +		sdio0: mmc@ffc10000 {
>>> +			compatible = "rockchip,rk3528-dw-mshc",
>>> +				     "rockchip,rk3288-dw-mshc";
>>> +			reg = <0x0 0xffc10000 0x0 0x4000>;
>>> +			clocks = <&cru HCLK_SDIO0>,
>>> +				 <&cru CCLK_SRC_SDIO0>,
>>> +				 <&cru SCLK_SDIO0_DRV>,
>>> +				 <&cru SCLK_SDIO0_SAMPLE>;
>>> +			clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
>>> +			fifo-depth = <0x100>;
>>> +			interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
>>> +			max-frequency = <150000000>;
>>> +			resets = <&cru SRST_H_SDIO0>;
>>> +			reset-names = "reset";
>>> +			status = "disabled";
>>> +		};
>>> +
>>> +		sdio1: mmc@ffc20000 {
>>> +			compatible = "rockchip,rk3528-dw-mshc",
>>> +				     "rockchip,rk3288-dw-mshc";
>>> +			reg = <0x0 0xffc20000 0x0 0x4000>;
>>> +			clocks = <&cru HCLK_SDIO1>,
>>> +				 <&cru CCLK_SRC_SDIO1>,
>>> +				 <&cru SCLK_SDIO1_DRV>,
>>> +				 <&cru SCLK_SDIO1_SAMPLE>;
>>> +			clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
>>> +			fifo-depth = <0x100>;
>>> +			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
>>> +			max-frequency = <150000000>;
>>> +			resets = <&cru SRST_H_SDIO1>;
>>> +			reset-names = "reset";
>>> +			status = "disabled";
>>> +		};
>>> +
>>> +		sdmmc: mmc@ffc30000 {
>>> +			compatible = "rockchip,rk3528-dw-mshc",
>>> +				     "rockchip,rk3288-dw-mshc";
>>> +			reg = <0x0 0xffc30000 0x0 0x4000>;
>>> +			clocks = <&cru HCLK_SDMMC0>,
>>> +				 <&cru CCLK_SRC_SDMMC0>,
>>> +				 <&cru SCLK_SDMMC_DRV>,
>>> +				 <&cru SCLK_SDMMC_SAMPLE>;
>>> +			clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
>>> +			fifo-depth = <0x100>;
>>> +			interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
>>> +			max-frequency = <150000000>;
>>> +			resets = <&cru SRST_H_SDMMC0>;
>>> +			reset-names = "reset";
>>
>> Suggest adding default pinctrl props here:
>>
>>   pinctrl-names = "default";
>>   pinctrl-0 = <&sdmmc_bus4>, <&sdmmc_clk>, <&sdmmc_cmd>, <&sdmmc_det>;
>>
>> And possible also for sdio0 and sdio1.
>>
>> Regards,
>> Jonas
> 
> It makes sense. As mentioned in the cover letter, I depended on the
> bootloader to setup pinctrl, to minimize dependency of the series.

BootROM typically setup pinctrl for the storage media when probing for
idblock and mainline U-Boot will setup pinctrl based on the board device
tree synced from Linux. Adding pinctrl early in Linux will help avoid a
need for using workarounds in U-Boot.

For RK3528 there only seem to be one option for sdmmc/sdio pins, adding
a default to soc dtsi should help reduce duplication in future board
device trees.

> 
> Will complete the pinctrl properties in next version.

Thanks :-)

Regards,
Jonas

> 
>>> +			status = "disabled";
>>> +		};
>>>  	};
>>>  };
>>
> 
> Best regards,
> Yao Zi


