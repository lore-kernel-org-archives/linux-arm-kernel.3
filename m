Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74654E7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 04:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0i/rYtONain48RRX0u5I3QgFdCO9Q8AGBJWpvj/+2GM=; b=ZaHkHAW2RZZ/moEVTEqCPJNGNM
	wNF8CkL7nEZvWO0/6THpI5h6GG8d/+Is06Y/JTbsXi7Lkhrrb6SVoYk4J6LbvlDZ4U30MxTJb3bJK
	FOQLjniAmZmf7TkwxI46kwgPITJVmMEBO8MVdX/Og7sKKbkLVg6czM5/qxwlhsXIxWLGW9tStoiDt
	2I+mNee1U1asTUnKRammKqIzpZju2VyA+8u8yvJi3ANjgjDTDDBrIHWE8av5BoCwSIXMNgeFHwF38
	sw1tBsPD0mJUkm/S1gUtEduxbr4M5ajUMKGoILuAkCx62qwar3Mw40Wz24qrLMvTKO5WFkncDVsVU
	FTnzQ9oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXC2c-00000003yq7-3yDP;
	Mon, 13 Jan 2025 04:27:06 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXC1M-00000003ygn-0yJ9;
	Mon, 13 Jan 2025 04:25:49 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1736742345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0i/rYtONain48RRX0u5I3QgFdCO9Q8AGBJWpvj/+2GM=;
	b=LNbCiOsqcKhBuhmC+ka4eaFtsvRGNV9N9yDGYt065LSqN2h6wpjt8HqKqdgfh5AK9pL53e
	Gu4PRBhlJXoyPCukxwzdmhXC4kKch/mepdvJfwC4vVgRclFaCTEYAhV2wZRdPc+sqXYHuW
	W95mRt5Ep8+aiqxsll2kRwseXuUxzD82QBikOLPbtjuivLN94k77gZUtW/1qRWidCaLx2n
	hJLFjQwL1sg7RTR7Kb5D7lXePybHDfKjzPwgLV9I3gqLCw2pttN6QJK2J4JTnyIgxfKjs1
	i6YIFqWzCuzDpZHZqOszZ7zLPHd5+v71P14vuHEdNTg8ipZPw3oASDRVh4UBRQ==
Date: Mon, 13 Jan 2025 05:25:44 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Junhao Xie <bigfoot@classfun.cn>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Jonas
 Karlman <jonas@kwiboo.se>, Chukun Pan <amadeus@jmu.edu.cn>, FUKAUMI Naoki
 <naoki@radxa.com>, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] arm64: dts: rockchip: add dts for Ariaboard
 Photonicat RK3568
In-Reply-To: <35f8fe37-b06f-49eb-b0c2-430421f1ff3b@classfun.cn>
References: <20250112073344.1976411-1-bigfoot@classfun.cn>
 <20250112073344.1976411-4-bigfoot@classfun.cn>
 <1e72cc9cdc390e79e97806fe4f7d8abf@manjaro.org>
 <35f8fe37-b06f-49eb-b0c2-430421f1ff3b@classfun.cn>
Message-ID: <7b55c7469774c41d9896df3100df1630@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_202548_582795_BFBCB7E7 
X-CRM114-Status: GOOD (  13.69  )
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

Hello Junhao,

On 2025-01-12 23:16, Junhao Xie wrote:
> On 2025/1/12 16:47, Dragan Simic wrote:
>> On 2025-01-12 08:33, Junhao Xie wrote:
>>> Add dts for Ariaboard Photonicat RK3568.
>>> 
>>> Working IO:
>>>     Debug UART
>>>     SDIO QCA9377 WiFi and Bluetooth
>>>     M.2 E-Key PCIe WiFi and Bluetooth
>>>     M.2 B-Key USB Modem WWAN
>>>     Ethernet WAN Port
>>>     MicroSD Card slot
>>>     eMMC
>>>     HDMI Output
>>>     Mali GPU
>>>     USB Type-A
>>> 
>>> Not working IO:
>>>     Ethernet LAN Port (Lack of SGMII support)
>>>     Power management MCU on UART4 (Driver pending)
>>> 
>>> Not working IO in MCU:
>>>     Battery voltage sensor
>>>     Board temperature sensor
>>>     Hardware Power-off
>>>     Hardware Watchdog
>>>     Network status LED
>>>     Real-time clock
>>>     USB Charger voltage sensor
>>> 
>>> About onboard power management MCU:
>>>     A heartbeat must be sent to the MCU within 60 seconds,
>>>     otherwise the MCU will restart the system.
>>>     When powering off, a shutdown command needs to be sent to the 
>>> MCU.
>>>     When the power button is long pressed, the MCU will send a 
>>> shutdown
>>>     command to the system. If system does not shutdown within 60 
>>> seconds,
>>>     the power will be turned off directly.
>>>     MCU only provides voltage for charger and battery.
>>>     Manufacturer removed RK8xx PMIC.
>> 
>> Unless the design of the board is proprietary, it would be good
>> to provide a link to the board schematic, for those interested
>> in verifying the board DT file.
>> 
>> As a note, I already tried to find the board schematic with no
>> success, so the design might be proprietary.
> 
> Yes, this board is proprietary. I asked the manufacturer and
> they don't provide schematics.
> 
> But I found a partial schematic diagram of some of connectors
> on the board here
> https://dl.ariaboard.com/photonicat_rk3568/Photonicat%20rk3568%20EVB%20Board%20spec.pdf

Yes, I also found that PDF file.  It's somewhat similar to what
Raspberry Pi provides with its reduced schematics -- helpful to
an extent, but still leaving a lot to be desired.

Out of curiosity, what did you actually use as a reference to create
the board dts file?  Perhaps some downstream dts file provided by
the manufacturer or found in some operating system image?

