Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A6821090225
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 13:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mXlN5DoBtmc48+CasdwvQDpS+DXItTqESoFoYWJajJ0=; b=Hm9Vc8hl4IqSoLswOAMeXc56Wc
	f/SdSsICnKtCk5cdD7s90PDMUoNO5FIbJZIjZ4PzaLz0o4Wbz0bDexsxZ87zTGW2vyssmaiQy1Cmt
	4DOo3aKQeeWJFu6CyI1b0qdAHkxMR/aL2vfCCqvxWdbUeHFYRuUtLuiF1vDoij5KvqFClK2kA8Lfq
	A3EB6r3u1c0hNJ2vUKqYDs4ikwJbumiZDZvrZro4u744qc7/8rdVLeyxJ1x9jHeOajSKSk9m77GWj
	i6yuQrUncNMxYt5SIPE5o/OMBIoNosRB7aGPjUAY93zx00QdKfA0WQ3dNfbn2wFNwee1oJn350VuU
	gBbVK1fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3DRn-0000000Agmq-1qwK;
	Thu, 19 Mar 2026 13:29:59 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3DRk-0000000Aglw-0jMP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 13:29:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: References: Cc:
 To: From: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1773926994;
 bh=mXlN5DoBtmc48+CasdwvQDpS+DXItTqESoFoYWJajJ0=;
 b=xaN8pnuMa2uWRPVh1e+MPJeQxLpBE0Tdg5jPDdxa5wAyMIZdw+qRDFV5QJJ/qCOekDU9/MdIO
 +ZbnOeL5LoARmpI1VYdZoN8ZcPEXht+Qqv28olJ6j67Dkx65V/cGKbomWMjmURoCn7JcpE0z/D+
 z0m1AHkjCaM+jhdHcWtfrsb5bqKW81KJreTCQI1h1rozA+sDQDDx5S8jLSFRK/RMKumU/w/OSeG
 cehgrjC2bt0JzyrHTlKHqwstQXrKzgNzWyvMCy1rvQ7f5y8pmjqtnwReeV/lspvGR1kQiFUI4oS
 JIAY98Mx/Tmr7o+8ATP661GUPafXr7t48j5hhmxLMUIw==
X-Forward-Email-ID: 69bbfa5193199f63becdd5bc
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.6.50
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <384dfd20-cf74-415a-a2df-a2c257d8032f@kwiboo.se>
Date: Thu, 19 Mar 2026 14:29:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: rockchip: rock-3b: Model PI6C20100 as
 gated-fixed-clock
From: Jonas Karlman <jonas@kwiboo.se>
To: MidG971 <midgy971@gmail.com>
Cc: "linux-rockchip@lists.infradead.org"
 <linux-rockchip@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "heiko@sntech.de" <heiko@sntech.de>,
 "shawn.lin@rock-chips.com" <shawn.lin@rock-chips.com>
References: <20260319102247.32260-1-midgy971@gmail.com>
 <0adb7e19-62ea-4578-a448-f5d1e709ee28@kwiboo.se>
Content-Language: en-US
In-Reply-To: <0adb7e19-62ea-4578-a448-f5d1e709ee28@kwiboo.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_062956_268315_ECE7D514 
X-CRM114-Status: GOOD (  21.51  )
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

Hi again,

On 3/19/2026 2:19 PM, Jonas Karlman wrote:
> Hi,
> 
> On 3/19/2026 11:22 AM, MidG971 wrote:
>> The Radxa ROCK 3B uses a PI6C20100 PCIe reference clock buffer to
>> provide a 100MHz reference clock to the PCIe 3.0 PHY and controllers.
>> This chip is currently modeled only as a fixed regulator
>> (vcc3v3_pi6c_03), with no clock output representation.
>>
>> The PI6C20100 is a clock generator, not a power supply. Model it
>> properly as a gated-fixed-clock, following the pattern established
>> for the Rock 5 ITX and other boards with similar PCIe clock buffer
>> chips.
>>
>> The regulator node is kept as-is since it controls the power supply
>> to the PI6C20100 chip via GPIO0_D4. The new gated-fixed-clock node
>> references this regulator as its vdd-supply and provides a proper
>> 100MHz clock output. The pcie3x2 node is updated to include the
>> pipe and reference clocks, matching the approach used in
>> rk3588-rock-5-itx.dts.
>>
>> Assisted-by: Claude:claude-3-opus
>> Signed-off-by: MidG971 <midgy971@gmail.com>
> 
> Typically you should use your real name in SoB line, kernel docs state:
> 
>   using a known identity (sorry, no anonymous contributions.)
> 
> https://docs.kernel.org/process/submitting-patches.html
> 
>> ---
>>
>> Changes since v2 [1]:
>>  - Fix AI attribution: use Assisted-by tag instead of Signed-off-by (Shawn)
>>  - Add missing pipe clock (CLK_PCIE30X2_PIPE_DFT) to pcie3x2 clocks
>>    override (Shawn, referencing David's patch [2])
>>
>> Changes since v1 [3]:
>>  - Drop phy-supply approach entirely (Jonas, Shawn)
>>  - Model PI6C20100 as gated-fixed-clock instead
>>  - Wire reference clock to pcie3x2 controller
>>  - Follow pattern from rk3588-rock-5-itx.dts
>>
>> [1] https://lore.kernel.org/linux-rockchip/20260304132957.684616-1-midgy971@gmail.com/
>> [2] https://lore.kernel.org/linux-rockchip/d981fa84-bd05-ac9d-98ca-89ee47177829@rock-chips.com/T/#m6a8289609e6a60691d3c06358b6322c7aa5e43d1
>> [3] https://lore.kernel.org/linux-rockchip/20260213151452.535527-1-midgy971@gmail.com/
>>
>>  arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts | 21 ++++++++++++++++++++-
>>  1 file changed, 20 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
>> index c5f67dd6dfd9..1a2b3c4d5e6f 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
>> +++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
>> @@ -56,7 +56,16 @@
>>  		};
>>  	};
>>
>> -	/* pi6c pcie clock generator */
>> +	/* PI6C20100 PCIe reference clock buffer (100MHz) */
>> +	pcie30_refclk: pcie-clock-generator {
>> +		compatible = "gated-fixed-clock";
>> +		#clock-cells = <0>;
>> +		clock-frequency = <100000000>;
>> +		clock-output-names = "pcie30_refclk";
>> +		vdd-supply = <&vcc3v3_pi6c_03>;
> 
> The vcc3v3_pi6c_03 regulator should also be removed in this patch,
> as you state in the commit message, it is not a power supply.
> 
> Please convert to use enable-gpios prop.

I looked at wrong schematics, please disregard this comment :-)

Regards.
Jonas

> 
> Regards,
> Jonas
> 
>> +	};
>> +
>> +	/* PI6C20100 power supply - active-high GPIO0_D4 */
>>  	vcc3v3_pi6c_03: regulator-3v3-vcc-pi6c-03 {
>>  		compatible = "regulator-fixed";
>>  		enable-active-high;
>> @@ -553,6 +562,15 @@
>>  };
>>
>>  &pcie3x2 {
>> +	clocks = <&cru ACLK_PCIE30X2_MST>, <&cru ACLK_PCIE30X2_SLV>,
>> +		 <&cru ACLK_PCIE30X2_DBI>, <&cru PCLK_PCIE30X2>,
>> +		 <&cru CLK_PCIE30X2_AUX_NDFT>,
>> +		 <&cru CLK_PCIE30X2_PIPE_DFT>,
>> +		 <&pcie30_refclk>;
>> +	clock-names = "aclk_mst", "aclk_slv",
>> +		      "aclk_dbi", "pclk", "aux",
>> +		      "pipe", "ref";
>>  	pinctrl-names = "default";
>>  	pinctrl-0 = <&pcie30x2m1_pins>;
>>  	reset-gpios = <&gpio2 RK_PD6 GPIO_ACTIVE_HIGH>;
>> --
>> 2.39.5
>>
> 


