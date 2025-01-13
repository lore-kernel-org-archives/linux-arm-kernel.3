Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43ADFE7719F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 08:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V24IXTryrVGcjHqIUfjWLveVF6uP2q3j+D/mtRq378w=; b=HnS8TIb6E77Vh55rITEuHMMjr4
	kMkeBdFxFxbINwERQiKO0VtHpknS/b+StLqNIs7aGWJlV4ZtFaBU5IJ4AtzfL8btIlZ2UwWx8iUQT
	dE+5Mfhby3igxunawZM3mXsK3zZiXPFLyNPyHB5ZaLXaeZYBrEqQx4J4wjsr9o+UfBJi5LvrYVoAx
	fsHVSmWuy3po4TrJiUxeWsp8ipcb74RpNt9KiZpuspxwO7LHIBLSPe2qwf73WaUyJFcVNjeKoWL7J
	+1u5taKPfnAOSfPme4SZCtfyHTjOFoyxQ4diWyGx6boHSWweua/X2yy668Cs36FT0mN3Kn6yRO1yA
	O6rUZs9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXFgD-00000004Mqb-1aLK;
	Mon, 13 Jan 2025 08:20:13 +0000
Received: from [129.204.178.38] (helo=classfun.cn)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXFeS-00000004MP4-2XVh;
	Mon, 13 Jan 2025 08:18:26 +0000
Received: from [192.168.0.160] (unknown [222.77.7.241])
	(Authenticated sender: bigfoot)
	by classfun.cn (Postfix) with ESMTPSA id 64ADF7817F;
	Mon, 13 Jan 2025 16:18:11 +0800 (CST)
DKIM-Filter: OpenDKIM Filter v2.11.0 classfun.cn 64ADF7817F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=classfun.cn;
	s=default; t=1736756295;
	bh=V24IXTryrVGcjHqIUfjWLveVF6uP2q3j+D/mtRq378w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rA7lYVdN5Hh4AQKwBodrNJQFyoyXZDDh39M71ZklGOPkNl5vNeT8Q2z80o9bmR5JX
	 POPCVNKc6wHyZtidh/DeBLZ8pCxdF9Df2y1gHBZtNdJt004mxNZIicRHudtObTW9CQ
	 9pnnpwOHdf5LwHULUluFc30RgYlOd8QBZ8NsAfeg=
Message-ID: <54b5dac0-5791-4b20-a237-dac6fd03c259@classfun.cn>
Date: Mon, 13 Jan 2025 16:18:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] arm64: dts: rockchip: add dts for Ariaboard
 Photonicat RK3568
To: Dragan Simic <dsimic@manjaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Jonas Karlman <jonas@kwiboo.se>, Chukun Pan <amadeus@jmu.edu.cn>,
 FUKAUMI Naoki <naoki@radxa.com>, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Junhao Xie <bigfoot@classfun.cn>
References: <20250112073344.1976411-1-bigfoot@classfun.cn>
 <20250112073344.1976411-4-bigfoot@classfun.cn>
 <1e72cc9cdc390e79e97806fe4f7d8abf@manjaro.org>
 <35f8fe37-b06f-49eb-b0c2-430421f1ff3b@classfun.cn>
 <7b55c7469774c41d9896df3100df1630@manjaro.org>
Content-Language: en-US
From: Junhao Xie <bigfoot@classfun.cn>
In-Reply-To: <7b55c7469774c41d9896df3100df1630@manjaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_001825_094882_B98DC471 
X-CRM114-Status: GOOD (  15.24  )
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

On 2025/1/13 12:25, Dragan Simic wrote:
> Hello Junhao,
> 
> On 2025-01-12 23:16, Junhao Xie wrote:
>> On 2025/1/12 16:47, Dragan Simic wrote:
>>> On 2025-01-12 08:33, Junhao Xie wrote:
>>>> Add dts for Ariaboard Photonicat RK3568.
>>>>
>>>> Working IO:
>>>>     Debug UART
>>>>     SDIO QCA9377 WiFi and Bluetooth
>>>>     M.2 E-Key PCIe WiFi and Bluetooth
>>>>     M.2 B-Key USB Modem WWAN
>>>>     Ethernet WAN Port
>>>>     MicroSD Card slot
>>>>     eMMC
>>>>     HDMI Output
>>>>     Mali GPU
>>>>     USB Type-A
>>>>
>>>> Not working IO:
>>>>     Ethernet LAN Port (Lack of SGMII support)
>>>>     Power management MCU on UART4 (Driver pending)
>>>>
>>>> Not working IO in MCU:
>>>>     Battery voltage sensor
>>>>     Board temperature sensor
>>>>     Hardware Power-off
>>>>     Hardware Watchdog
>>>>     Network status LED
>>>>     Real-time clock
>>>>     USB Charger voltage sensor
>>>>
>>>> About onboard power management MCU:
>>>>     A heartbeat must be sent to the MCU within 60 seconds,
>>>>     otherwise the MCU will restart the system.
>>>>     When powering off, a shutdown command needs to be sent to the MCU.
>>>>     When the power button is long pressed, the MCU will send a shutdown
>>>>     command to the system. If system does not shutdown within 60 seconds,
>>>>     the power will be turned off directly.
>>>>     MCU only provides voltage for charger and battery.
>>>>     Manufacturer removed RK8xx PMIC.
>>>
>>> Unless the design of the board is proprietary, it would be good
>>> to provide a link to the board schematic, for those interested
>>> in verifying the board DT file.
>>>
>>> As a note, I already tried to find the board schematic with no
>>> success, so the design might be proprietary.
>>
>> Yes, this board is proprietary. I asked the manufacturer and
>> they don't provide schematics.
>>
>> But I found a partial schematic diagram of some of connectors
>> on the board here
>> https://dl.ariaboard.com/photonicat_rk3568/Photonicat%20rk3568%20EVB%20Board%20spec.pdf
> 
> Yes, I also found that PDF file.  It's somewhat similar to what
> Raspberry Pi provides with its reduced schematics -- helpful to
> an extent, but still leaving a lot to be desired.
> 
> Out of curiosity, what did you actually use as a reference to create
> the board dts file?  Perhaps some downstream dts file provided by
> the manufacturer or found in some operating system image?

I wrote this device tree based on other rk3568 devices in mainline, and downstream board dts:
https://github.com/photonicat/rockchip_rk3568_kernel/blob/novotech-5.10/arch/arm64/boot/dts/rockchip/rk3568-photonicat-base.dtsi

Best regards,
Junhao


