Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFFFCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 11:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oRwpANH20f3O41DZeZFj63uF99IcxizRzfbRD2S6WOw=; b=HKzjGHfqU8Wy/UaOZ1YCY0qeNp
	V5IenK2Y4z80UAielOpErllksYhtpkNZylDeIck8EXDZffmt5CTBPkRz355ql1mDqDW/Symd7IUuZ
	1VDdG+rZHBsIR3WWrpUJIiZXhyJgos5M3CWPuNOpgY++0n1mVt7Uub7y+wl0hClEVr2op05SOaF9Z
	AuJiHCma4ruitgBnooLEEsq0LeqxRHsTsW0VWfR2+IAEpvRKMBpSHRw4lrl8OWLNjgh+268XEuBRs
	z+GGgDP9Picwp4BLT0S75k4ESzPmwgUOxm6EQAqNi+kDWEq3AcXxlJJAKc4EIuhGo1fFPeSZhYp6Y
	uXVcMHsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzCp0-0000000HDmQ-3BpV;
	Thu, 18 Sep 2025 11:29:06 +0000
Received: from mail-m1973196.qiye.163.com ([220.197.31.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzCox-0000000HDkD-15Nd;
	Thu, 18 Sep 2025 11:29:05 +0000
Received: from [172.16.12.153] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 23446c063;
	Thu, 18 Sep 2025 19:28:53 +0800 (GMT+08:00)
Message-ID: <404b35bb-e32b-4830-8d34-d0cfd0a262ff@rock-chips.com>
Date: Thu, 18 Sep 2025 19:28:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: rockchip: Enable DisplayPort for
 rk3588-evb2
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
References: <20250918062825.194-1-kernel@airkyi.com>
 <ecc96b5a-2062-43f4-9959-b4e2b126d9f3@cherry.de>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <ecc96b5a-2062-43f4-9959-b4e2b126d9f3@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a995c959e2a03abkunmced0bb073b07de
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0kYTlYZTUNCSE9DTktNShhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=elkMJm4McaadIkkxl9fxLZoKq6Ze48UUrVlEjcI3WVLV40memdMgXm0I6AlCiX9ppEReD/3c/Nm7xJFq6PpWmPM2GkBysoDpOXA7mmd0Zi3S9um4ewP5ED4b9LA5oLOuzjAq6qC//pV6KmZVkqUt5oA+K/XdNzWO1RJv+q3qbuo=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=oRwpANH20f3O41DZeZFj63uF99IcxizRzfbRD2S6WOw=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_042903_786458_5994182E 
X-CRM114-Status: GOOD (  17.24  )
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

On 9/18/2025 6:39 PM, Quentin Schulz wrote:
> Hi Chaoyi Chen,
>
> On 9/18/25 8:28 AM, Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> The rk3588 evb2 board has a full size DisplayPort connector, enable
>> for it.
>>
>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>> ---
>>
>> Changes in v2:
>>
>> - Link to V1: https://lore.kernel.org/all/20250916080802.125-1-kernel@airkyi.com/
>> - Fix invalid DP connector type
>> - Add more comment about dclk_vp2 parent clock
>>
>>   .../boot/dts/rockchip/rk3588-evb2-v10.dts     | 48 +++++++++++++++++++
>>   1 file changed, 48 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dts
>> index 91fe810d38d8..60ba6ac55b23 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dts
>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dts
>> @@ -25,6 +25,18 @@ chosen {
>>           stdout-path = "serial2:1500000n8";
>>       };
>>   +    dp-con {
>> +        compatible = "dp-connector";
>> +        label = "DP OUT";
>> +        type = "full-size";
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
>> @@ -916,6 +946,17 @@ &usb_host1_xhci {
>>   };
>>     &vop {
>> +    /*
>> +     * If no dedicated PLL was specified, the GPLL would be automatically
>> +     * assigned as the PLL source for dclk_vop2. As the frequency of GPLL
>> +     * is 1188 MHz, we can only get typical clock frequencies such as
>> +     * 74.25MHz, 148.5MHz, 297MHz, 594MHz.
>> +     *
>> +     * So here we set the parent clock of VP2 to V0PLL so that we can get
>> +     * any frequency.
>> +     */
>> +    assigned-clocks = <&cru DCLK_VOP2_SRC>;
>> +    assigned-clock-parents = <&cru PLL_V0PLL>;
>
> Are those board-specific? Considering the VOP and DP/HDMI/... controllers/PHYs are all internal to the SoC, would it make sense to have those specified in the SoC DTSI? I'm not familiar with the video output stack so maybe it doesn't apply here or is a bad idea, so I'm not actually asking for a change here, just asking a question :)

Yep, they are board-specific. Because the V0PLL may be used for non-display applications.



>
> Cheers,
> Quentin
>
>
-- 
Best,
Chaoyi


