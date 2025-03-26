Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BB7C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 13:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=woq4Ws3S18XYVJpP2olLOVDzz5HvlN2ip72DX9s9ClY=; b=wqONrSXr9QEVmJl4M98w7jnYdN
	VolXR39VG1UlU+lW96HhD9xSyZqfknCWthgFslbnYafnoC43dlCeZ2iPgasKH9eaaovR06VsP+f+k
	9aQAIYNi+zUNdweDFnGhzddmQQlnumF3tFG2iucYlicTGwPWzi2yDXlZ6th0+VbG5FYG3sK6Ovt3T
	afL0L2rk+W8rqI0vuzFtXEcNG4x8n4hPDZhTJsq7Ai7WXe9fNlXEoFsYah8zRL6LUkzwEBvVXCcvZ
	5jDFq5WBk05u9VMqgochrE75YRrI1sPuX/S7YpKj41q3T/UGHi+Ts8qcpJmLcHuzbFma38IMIty2s
	ipiqpvOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txQgY-00000008XlK-2Jco;
	Wed, 26 Mar 2025 13:20:46 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txQen-00000008XY4-39l8;
	Wed, 26 Mar 2025 13:18:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=woq4Ws3S18XYVJpP2olLOVDzz5HvlN2ip72DX9s9ClY=; b=5qdfKNjkUR8BygJiqjz9XfexAv
	AbsoIPNCFJCwMXoAhJl7jNzVt71lOlp+G5deiQ/UtJWilSkwghbaRZLcTncOX6xCorfibWtpRU4eG
	TME82MvdisQ8vvxubngwX8u6nF21fPTMS7TJJqf6hdWCp2V7FGs1ISbzafn8xKnWlEnY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1txQeU-007Ach-9u; Wed, 26 Mar 2025 14:18:38 +0100
Date: Wed, 26 Mar 2025 14:18:38 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, tudor.ambarus@linaro.org,
	pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
	richard@nod.at, vigneshr@ti.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 3/3] ARM: dts: microchip: sama5d29_curiosity: Add
 nvmem-layout in QSPI for EUI48 MAC Address
Message-ID: <eed1531a-353a-4244-a10a-95e67c8416ae@lunn.ch>
References: <20250326072140.172244-1-manikandan.m@microchip.com>
 <20250326072140.172244-4-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326072140.172244-4-manikandan.m@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_061857_792836_EE5B8BD6 
X-CRM114-Status: GOOD (  19.55  )
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

On Wed, Mar 26, 2025 at 12:51:40PM +0530, Manikandan Muralidharan wrote:
> Add nvmem-layout in QSPI to read the EUI48 Mac address by the
> net drivers using the nvmem property.The offset is set to 0x0
> since the factory programmed address is available in the
> resource managed space and the size determine if the requested
> address is of EUI48 (0x6) or EUI-64 (0x8) type.
> This is useful for cases where U-Boot is skipped and the Ethernet
> MAC address is needed to be configured by the kernel
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  .../arm/boot/dts/microchip/at91-sama5d29_curiosity.dts | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dts
> index 35756cc01e68..6c5ff08f0b3f 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dts
> +++ b/arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dts
> @@ -478,6 +478,16 @@ flash@0 {
>  		label = "atmel_qspi1";
>  		status = "okay";
>  
> +		nvmem-layout {
> +			compatible = "fixed-layout";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			mac_address_eui48: mac-address@0 {
> +				reg = <0x0 0x6>;
> +			};
> +		};
> +

I've not looked too deeply how this all works. Don't you need a
reference in the ethernet node pointing to this?

And are there ordering issues? Boards used to use the MAC address from
somewhere else now start using this address, causing a change in
behaviour. I would expect somewhere a comment that this MAC address
will be used last, after all other options have been tried, in order
to avoid regressions.

   Andrew

