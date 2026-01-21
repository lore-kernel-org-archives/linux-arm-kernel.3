Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E7D0D262B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 02:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2eh4KD7y1g6vQGusKiA5g415ChW3lPdxO7SBQzAgVns=; b=zU/XBIy/StRMuro87aHKdv4r69
	oRc3k9LgMPZvvVZI/eYN5ylLJXzM0WUF1361l2KOu6FcwsVThd6QFRmtghouIPO8MqOwR1ctHmYrk
	Qx4o7wcAu63liry7sNun4Qx25K8maxfYmYjF8UqGKlkARjgBwNBebIuC5+Zxp52guCH0fXIeVej8U
	sxxjAMpXjd4buPWYtUB4KkZBdMWDjKKG+ipS3KIqQHwdDPGkGxkRKFzVjDw/b1sJBhgT8bumLu/en
	HRwxVhKTq4bqJaLyHvBFInwJeYmjNsjW//8HpPAzNu/Rgkl5853PAYIa/6nlmVBYwBmHmxi91xYJU
	n9iKsGJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNyL-00000004n3s-08QO;
	Wed, 21 Jan 2026 02:29:29 +0000
Received: from mail-m1973194.qiye.163.com ([220.197.31.94])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNyH-00000004n2j-3JLF;
	Wed, 21 Jan 2026 02:29:27 +0000
Received: from [172.16.12.51] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3160d3b68;
	Wed, 21 Jan 2026 10:29:16 +0800 (GMT+08:00)
Message-ID: <e9cf22c2-a41d-464e-b6cb-ec36149aeb50@rock-chips.com>
Date: Wed, 21 Jan 2026 10:29:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: rockchip: Add rk3576 evb2 board
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Chaoyi Chen <kernel@airkyi.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Quentin Schulz <quentin.schulz@cherry.de>, Jonas Karlman <jonas@kwiboo.se>,
 Hsun Lai <i@chainsx.cn>, John Clark <inindev@gmail.com>,
 Jimmy Hon <honyuenkwun@gmail.com>, Dragan Simic <dsimic@manjaro.org>,
 Michael Riesch <michael.riesch@collabora.com>,
 Peter Robinson <pbrobinson@gmail.com>, Alexey Charkov <alchark@gmail.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Andy Yan <andy.yan@rock-chips.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260121015357.291-1-kernel@airkyi.com>
 <20260121015357.291-3-kernel@airkyi.com>
 <07082578-f56a-4ad2-9ea0-a4ef20a86cfe@rock-chips.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <07082578-f56a-4ad2-9ea0-a4ef20a86cfe@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9bde62830503abkunm076ac87eafb1c1
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGR4eHVZOTE9JQxhPSUJLSB5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=JITe9yhlKbMe3EXkJwwJc/dpKo2i2d37oUt6cOXPuLbzPmU575Zk9T6dwQeBv0Z9F0QGFEUdGHWmBzzzQPgn/IcwNow6/o0HlrePFp8cpTk7rjXYBqJpl7RQ5VA49kfhxALCFvwIEUMHB0XQwk1z7o7vWyZkwXDwqRHRV58jOMI=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=2eh4KD7y1g6vQGusKiA5g415ChW3lPdxO7SBQzAgVns=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_182926_303855_AAE27CF6 
X-CRM114-Status: GOOD (  12.04  )
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

Hi Shawn,

On 1/21/2026 10:09 AM, Shawn Lin wrote:
> 在 2026/01/21 星期三 9:53, Chaoyi Chen 写道:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> General features for rk3576 evb2 board:
>>      - Rockchip RK3576
>>      - LPDDR4/4X
>>      - eMMC5.1
>>      - RK806-2x2pcs + DiscretePower
>>      - 1x HDMI2.1 TX / HDMI2.0 RX
>>      - 1x full size DP1.4 TX (Only 2 Lanes)
>>      - 2x 10/100/1000M Ethernet
>>      - 5x SATA3.0 7Pin Slot
>>      - 2x USB3.2 Gen1 Host
>>      - 3x USB2.0 Host
>>      - WIFI/BT
>>      - ...
>>
>> Tested with eMMC/SDMMC/HDMI/USB/Ethernet/WIFI/BT module.
>>
>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>> Reviewed-by: Alexey Charkov <alchark@gmail.com>
>> ---
> 
> ---8<----
> 
>> +
>> +&sdio {
>> +    #address-cells = <1>;
>> +    #size-cells = <0>;
>> +    bus-width = <4>;
>> +    cap-sd-highspeed;
>> +    cap-sdio-irq;
>> +    disable-wp;
> 
> disable-wp is not used for SDIO case, could be removed.
> 
> 

Will fix in v5.

>> +    keep-power-in-suspend;
>> +    max-frequency = <150000000>;
>> +    mmc-pwrseq = <&sdio_pwrseq>;
>> +    no-sd;
>> +    no-mmc;
>> +    non-removable;
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&sdmmc1m0_bus4 &sdmmc1m0_clk &sdmmc1m0_cmd>;
>> +    sd-uhs-sdr104;
>> +    status = "okay";
>> +
>> +    brcmf: wifi@1 {
>> +        compatible = "brcm,bcm4329-fmac";
>> +        reg = <1>;
>> +        interrupt-parent = <&gpio0>;
>> +        interrupts = <RK_PB0 IRQ_TYPE_LEVEL_HIGH>;
>> +        interrupt-names = "host-wake";
>> +        pinctrl-names = "default";
>> +        pinctrl-0 = <&wifi_host_wake>;
>> +    };
>> +};
>> +
>> +&sdhci {
>> +    bus-width = <8>;
>> +    full-pwr-cycle-in-suspend;
>> +    mmc-hs400-1_8v;
>> +    mmc-hs400-enhanced-strobe;
>> +    no-sdio;
>> +    no-sd;
>> +    non-removable;
>> +    status = "okay";
>> +};
>> +
>> +&sdmmc {
>> +    bus-width = <4>;
>> +    cap-sd-highspeed;
>> +    cd-gpios = <&gpio0 RK_PA7 GPIO_ACTIVE_LOW>;
>> +    disable-wp;
>> +    no-sdio;
>> +    no-mmc;
>> +    sd-uhs-sdr104;
>> +    vqmmc-supply = <&vccio_sd_s0>;
> 
> Should use vmmc-supply to contrl the power, the same as EVB1[1].
> 
> [1] https://lore.kernel.org/linux-rockchip/1768524932-163929-5-git-send-email-shawn.lin@rock-chips.com/T/#u
> 

That make sense. Will fix in v5.

>> +    status = "okay";
>> +};
>> +
>> +&u2phy0 {
>> +    status = "okay";
>> +};
>> +
> 
> 
> 
> 

-- 
Best, 
Chaoyi


