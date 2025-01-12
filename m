Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBADEE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 22:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RoHFwPnzubAPJIkPrQOyLxopMCG5P6p0JRNj3ERZDMA=; b=Oxl8j1xjt4w+3gmpz7djP50828
	HfwbNi2lkaqmsZM3Caei5+QE+tf881G8STzYLXWO1n6P9x3xsAEALFaSpdoC7qRJwcPZiYfOvd7Dw
	zCw5MY2WqZouv1htcVvruQfp/wN+YtdGG4T2l8KUWpLOV4TF5K/qgCxPqMJRvV2o6TSC2HeK6AP3b
	qiIwg4bWbsvZMIeODVmeTKx5VTHApYf0bEyemTEMLO+LXfGCD24ASTXt5AoWWy0a/hjVqw+9lcrG1
	HMPx+xuApZi4L7nezX26Gl3wRz0ddHSHap+SZxOU15JoPrBdeuvFG53HksCYgko4op3xX6iLT786w
	zDyOlljg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tX6Hh-00000003WIv-2EyD;
	Sun, 12 Jan 2025 22:18:17 +0000
Received: from [129.204.178.38] (helo=classfun.cn)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tX6GQ-00000003WBh-289E;
	Sun, 12 Jan 2025 22:17:00 +0000
Received: from [192.168.0.160] (unknown [222.77.7.241])
	(Authenticated sender: bigfoot)
	by classfun.cn (Postfix) with ESMTPSA id 72611788FD;
	Mon, 13 Jan 2025 06:16:45 +0800 (CST)
DKIM-Filter: OpenDKIM Filter v2.11.0 classfun.cn 72611788FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=classfun.cn;
	s=default; t=1736720208;
	bh=RoHFwPnzubAPJIkPrQOyLxopMCG5P6p0JRNj3ERZDMA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=egF7VdNCF+Vq49RsjR995uWsuj2WZbNuEm1a/ulEsnxoSVAZEghcxrggbEcWEA8rc
	 B62Ud5gfna9J4CCLEh45TfesFRemK+5OdAq6jrpMx9xQpkpR8JHn5fj7E3KBNmdL9o
	 xP3q+MbIIjfUqReU+g1oFrj2S1jKqZ7TLpj4KAHA=
Message-ID: <35f8fe37-b06f-49eb-b0c2-430421f1ff3b@classfun.cn>
Date: Mon, 13 Jan 2025 06:16:42 +0800
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
Content-Language: en-US
From: Junhao Xie <bigfoot@classfun.cn>
In-Reply-To: <1e72cc9cdc390e79e97806fe4f7d8abf@manjaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_141659_086199_C25437FA 
X-CRM114-Status: GOOD (  13.21  )
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

On 2025/1/12 16:47, Dragan Simic wrote:
> Hello Junhao,
> 
> On 2025-01-12 08:33, Junhao Xie wrote:
>> Add dts for Ariaboard Photonicat RK3568.
>>
>> Working IO:
>>     Debug UART
>>     SDIO QCA9377 WiFi and Bluetooth
>>     M.2 E-Key PCIe WiFi and Bluetooth
>>     M.2 B-Key USB Modem WWAN
>>     Ethernet WAN Port
>>     MicroSD Card slot
>>     eMMC
>>     HDMI Output
>>     Mali GPU
>>     USB Type-A
>>
>> Not working IO:
>>     Ethernet LAN Port (Lack of SGMII support)
>>     Power management MCU on UART4 (Driver pending)
>>
>> Not working IO in MCU:
>>     Battery voltage sensor
>>     Board temperature sensor
>>     Hardware Power-off
>>     Hardware Watchdog
>>     Network status LED
>>     Real-time clock
>>     USB Charger voltage sensor
>>
>> About onboard power management MCU:
>>     A heartbeat must be sent to the MCU within 60 seconds,
>>     otherwise the MCU will restart the system.
>>     When powering off, a shutdown command needs to be sent to the MCU.
>>     When the power button is long pressed, the MCU will send a shutdown
>>     command to the system. If system does not shutdown within 60 seconds,
>>     the power will be turned off directly.
>>     MCU only provides voltage for charger and battery.
>>     Manufacturer removed RK8xx PMIC.
> 
> Unless the design of the board is proprietary, it would be good
> to provide a link to the board schematic, for those interested
> in verifying the board DT file.
> 
> As a note, I already tried to find the board schematic with no
> success, so the design might be proprietary.

Yes, this board is proprietary. I asked the manufacturer and
they don't provide schematics.

But I found a partial schematic diagram of some of connectors on the board here
https://dl.ariaboard.com/photonicat_rk3568/Photonicat%20rk3568%20EVB%20Board%20spec.pdf

Best regards,
Junhao


