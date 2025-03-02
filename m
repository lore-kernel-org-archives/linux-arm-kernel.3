Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458FDC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 11:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5yKjuNQgVLhguVs5lWSzRacCXnEfMSyFuE69y4uYr1E=; b=sN/wE617qKNKQMC4xf4SDF7woF
	o7qAf76ep7HMS4D/pLErOTkU86GmoNEONkqXTNViP5tfnX09ud4jl+Df0+XwCIRXMnKbD5SrYa5EY
	8a7/piHC+m0lCHsIDTZUVsaPjKyEUIBh+c6YkqRYZR6ldiFKQzh441EVJqCt9eXODb2dZudvIZiTN
	haeHpsBONVCKu6nz1C4Hxxr0HPoSTFIlBNZUiL4adn4B/HSPWT5rUdnLNYN7h0MpkIe2CXVxOyFpS
	hUnapMxOKwBUNuyA1SSGFXL+/kVIb5JKRp0t6fahg1naGY+edIZJdLxb4xitBtmcnmg0D18uxMm+a
	rutRYDrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toh6S-0000000FsIO-20bo;
	Sun, 02 Mar 2025 11:03:24 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toh4u-0000000Fs6S-2UCY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Mar 2025 11:01:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1740913305;
 bh=5yKjuNQgVLhguVs5lWSzRacCXnEfMSyFuE69y4uYr1E=;
 b=uN1V14cfptyOLEZqo+p3z1halxc8NIlAc2FDZitQv/2cTzTaFPBVd2LI7rx7plEplc/B5IAWQ
 DAXtZz1omeDEbZjP0WxhO47LmmLqfveQavbYsKPKfXoDb3asMKjIqYImQfXjnhb6q8YnISr0JVP
 wi6NaBTZ87mVmxEjCR8x0r8RKkQt3zEjRxtnRrG0CzLShT1PTf7C6a7lzjDU9ie629qu1EPNMgT
 tFyMJXNI2Jutv3SH9EbjXQBDetM01p2BXR+RlqU9dgRqr7CEpI2uPKOVZBLpRB8uhbE2qF1Zj/R
 o6pmOMp+n+ljG2E/LjN43Hlgl2656Vki3LQxQcmUsffA==
X-Forward-Email-ID: 67c43a8f4a29b97c03d4da98
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <3cb87f70-1838-4492-b78e-0cd98457cb83@kwiboo.se>
Date: Sun, 2 Mar 2025 12:01:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] arm64: dts: rockchip: Add SDMMC/SDIO controllers for
 RK3528
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Yao Zi <ziyao@disroot.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
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
 <9fd51bcb-3e6a-46b6-b1f7-ff16fa562d9e@kwiboo.se> <3574922.QJadu78ljV@diego>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <3574922.QJadu78ljV@diego>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_030149_028513_753E8A66 
X-CRM114-Status: GOOD (  18.19  )
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

Hi Heiko,

On 2025-03-01 13:55, Heiko Stübner wrote:
> Hey Joas,
> 
> Am Samstag, 1. März 2025, 13:47:47 MEZ schrieb Jonas Karlman:
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
> simple-mfd is needed when the additional device is completely contained
> inside the particular syscon.
> 
> For example, the usb2phy0 on rk3588 is completely living inside the
> usb2phy0-grf.
> 
> Similarly the power-domains are living inside the rk3588 pmugrf.
> But the pmugrf also contains more stuff, so the power-domains are a
> subset of the pmugrf.
> 
> Both of these above are a case for a simple-mfd.
> 
> 
> Similarly, gmac1 on rk3588 is ethernet@fe1c0000 , so a completely separate
> io-memory area, but references both the sysgrf as well as the php-grf
> as syscons for additional settings.
> 
> So here the syscon does not need to be a simple-mfd.
> 
> 
> Hope that helps a bit

Thanks for this explanation, it helped me better understand the meaning
of simple-mfd :-)

Regards,
Jonas

> Heiko
> 
> 


