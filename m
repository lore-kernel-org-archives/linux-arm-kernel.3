Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF175CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 09:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+ZLNq20gUlnf3bdwNOW2uRTHNHYyeqWixETQkP5DOA=; b=ThonVeFNt9CluRxHkGxLMyvKwb
	DF1c0WrvXxP5pAwCqso7VYrbWAQdeZRW3yFB9sUsvcXiffDd+eucyfhS6KWG+QjRlpYwkTroGxgzn
	Hv4jOThvODOznCSjmH0qt/kP780OSM92sxCjeDF3cU4QoUf0KXf50VXAQ5EZgNjx2rOzVxRaDb/ul
	FnCb8EGgK3kHoDzgAoO4YydUemPjdovMrYBuiPVzHKM/Tw8R8HAxlDWi51+tOVE564wSKsObkQ1in
	hQd9wYxLWnyJGcbrY1+xGHs0gyr67cqjVI3XxZBHOC2t7ht9H/P4DNwtLD1X6sG6wM+4xvDHnB8cO
	uC7uKpQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyRpd-00000007LMu-0MX1;
	Tue, 16 Sep 2025 09:18:37 +0000
Received: from mail-m1973195.qiye.163.com ([220.197.31.95])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyRpa-00000007LLh-0C99;
	Tue, 16 Sep 2025 09:18:35 +0000
Received: from [172.16.12.153] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 22f959761;
	Tue, 16 Sep 2025 17:18:22 +0800 (GMT+08:00)
Message-ID: <352856bb-76b6-4861-8a3f-80f94f7c7375@rock-chips.com>
Date: Tue, 16 Sep 2025 17:18:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: Enable DisplayPort for rk3588-evb2
To: Quentin Schulz <quentin.schulz@cherry.de>, Chaoyi Chen
 <kernel@airkyi.com>, Heiko Stuebner <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Dragan Simic <dsimic@manjaro.org>,
 FUKAUMI Naoki <naoki@radxa.com>, Jonas Karlman <jonas@kwiboo.se>,
 Peter Robinson <pbrobinson@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250916080802.125-1-kernel@airkyi.com>
 <50379c05-c8b7-4858-98ff-da7ebdc06863@cherry.de>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <50379c05-c8b7-4858-98ff-da7ebdc06863@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9951d168ea03abkunm555e9ccfd7dfc3
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUsZSlYZSE0YGkxPQhgaTUxWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=F+EKq4gg4qlo8nAJoc5lrQgMP4zh4inm470+Tn1Ez5Z1/jWE0eyReVlBcRVwLvs726xdBuUQJZ7PbENDGxdwldDSnJisgqnGREb7KNoUhIc55WLPns3O56z44O5S4NCjFNrJKbYS7ojCngYVMA212F9tRS6B4s+zQg0AzCUwUGA=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=b+ZLNq20gUlnf3bdwNOW2uRTHNHYyeqWixETQkP5DOA=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_021834_616984_F5A1DB67 
X-CRM114-Status: GOOD (  17.74  )
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

On 9/16/2025 4:41 PM, Quentin Schulz wrote:
> Hi Chaoyi Chen,
>
> On 9/16/25 10:08 AM, Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> The rk3588 evb2 board has a full size DisplayPort connector, enable
>> for it.
>>
>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>> ---
>>   .../boot/dts/rockchip/rk3588-evb2-v10.dts     | 39 +++++++++++++++++++
>>   1 file changed, 39 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dts
>> index 91fe810d38d8..0e5af61f66fe 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dts
>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dts
>> @@ -25,6 +25,18 @@ chosen {
>>           stdout-path = "serial2:1500000n8";
>>       };
>>   +    dp-con {
>> +        compatible = "dp-connector";
>> +        label = "DP OUT";
>> +        type = "full size";
>
> This isn't valid according to the dt binding. It should be "full-size" instead.

Will fix in v2.


>
>> +
>> +        port {
>> +            dp_con_in: endpoint {
>> +                remote-endpoint = <&dp0_out_con>;
>> +            };
>> +        };
>> +    };
>> +
>>       hdmi-con {
>>           compatible = "hdmi-connector";
>>           type = "a";
>> @@ -106,6 +118,24 @@ vcc5v0_usbdcin: regulator-vcc5v0-usbdcin {
>>       };
>>   };
>>   +&dp0 {
>> +    pinctrl-0 = <&dp0m0_pins>;
>> +    pinctrl-names = "default";
>> +    status = "okay";
>> +};
>> +
>> +&dp0_in {
>> +    dp0_in_vp2: endpoint {
>> +        remote-endpoint = <&vp2_out_dp0>;
>> +    };
>> +};
>> +
>> +&dp0_out {
>> +    dp0_out_con: endpoint {
>> +        remote-endpoint = <&dp_con_in>;
>> +    };
>> +};
>> +
>>   &gpu {
>>       mali-supply = <&vdd_gpu_s0>;
>>       sram-supply = <&vdd_gpu_mem_s0>;
>> @@ -916,6 +946,8 @@ &usb_host1_xhci {
>>   };
>>     &vop {
>> +    assigned-clocks = <&cru DCLK_VOP2_SRC>;
>> +    assigned-clock-parents = <&cru PLL_V0PLL>;
>
> This is surprising, the only other board which has the DP0 enabled (the CoolPi 4B) doesn't set these two.
>
> Does HDMI still work as well as it used to with these new properties? Why are those needed? Some context in the commit log or as a comment in the DT would be most welcome!

Yes, HDMI and DP can work normally whether these new properties removed or not.

The key point is that when using V0PLL, we can get more usable resolution because DP requires a precise clock. If V0PLL is not explicitly specified here, then dclk_vop2 (VP2) may be divided down on GPLL, CPLL, etc. In this case, only a few frequency points are available. In my case, when V0PLL is not used, only resolutions such as 1024x768 and 640x480 are available.

For HDMI, I think it will use clk_hdmiphy_pixel0/1 as clock parent which is provided by the HDMI PHY when it work on TMDS mode so that we don't need to set it .

I will add more comment in v2.



