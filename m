Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 439A9C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 19:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=slXVbmqApyOHbsfGp414/BpQy7xFw2pc7utHOpiQIVM=; b=3RfQODJ/rFiXWo7bcHAelp8OPl
	HL2b20zg3JpAR5Fv2pwFKY3IAzAk4JPE7cYlDTmxRjzWyQdMiYMSPvSxmiY+U3MlrWB3Z9vQq4XGU
	F0hvEiMnCiQwDaAYrHXcAI59RQYhuFIADU+eDmKxdW8bwtvlEHBYaeOnp0eNlj/1a4DCiv7uQlUoy
	O2RqP0TmV0NXzIuNudNqwmE52aloPpjr+k7VGzpAANHed37o+yk0ALrfn59MvTmnAWv12zp3uHBos
	kQqyk4ZlZGd4F7i7XbLkvdXQSGcshm/AfOOuqmpth2iQyC+JrgkVq9zh9OM7A72vhLYJpSO3NuTT8
	6Eql/awA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRyBt-0000000B9Jq-2G4X;
	Wed, 18 Jun 2025 19:11:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsaL-0000000AG6t-48X3
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Jun 2025 13:12:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=slXVbmqApyOHbsfGp414/BpQy7xFw2pc7utHOpiQIVM=; b=pvTjXYGoHvchyEDR7cz1A2CiTB
	i/NuIPehSROtMG7o7sa9Q53quyTgtRFDWRD1lrB4ORVTTci6tXOQJ3maynl9/Dj78p+WRmoMWCMkx
	394Jwnpty667zAVRPCDUf3/3aPRDsYrYEA8E+xNJl6WkeZ+KRmgqG7IRh29LVnlwIzRSjLpoogNAE
	NU19magGoVZwKVpGTd6O4AJrgBnmSL9fG6grRjGPEBGmfLggVj7ksLtK7YINnU8QJem1+RgGRnTnz
	E2RUbkwZdYLAUarA8mqEVkOgh8zFcS8dCh99yYmc8gHuAFMt/e+WvyPrCyqqYy/Da3u0DNrfnf1dR
	iwxvRmpg==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsaJ-000000042hb-27xg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 13:12:13 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uRsZs-0003ce-3M; Wed, 18 Jun 2025 15:11:44 +0200
Message-ID: <7b863418-1554-4948-a863-e71991ef6442@pengutronix.de>
Date: Wed, 18 Jun 2025 15:11:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v4 PATCH 2/2] arch: arm64: dts: add big-endian property back
 into watchdog node
To: Meng Li <Meng.Li@windriver.com>, krzk+dt@kernel.org, linux@roeck-us.net,
 s.hauer@pengutronix.de, kernel@pengutronix.de,
 linux-watchdog@vger.kernel.org, imx@lists.linux.dev, shawnguo@kernel.org,
 robh@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250608030616.3874517-1-Meng.Li@windriver.com>
 <20250608030616.3874517-3-Meng.Li@windriver.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
In-Reply-To: <20250608030616.3874517-3-Meng.Li@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_141211_698382_7606F516 
X-CRM114-Status: GOOD (  17.23  )
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

On 6/8/25 05:06, Meng Li wrote:
> Watchdog doesn't work on NXP ls1046ardb board because in commit
> 7c8ffc5555cb("arm64: dts: layerscape: remove big-endian for mmc nodes"),
> it intended to remove the big-endian from mmc node, but the big-endian of
> watchdog node is also removed by accident. So, add watchdog big-endian
> property back.
> 
> In addition, add compatible string fsl,ls1046a-wdt, which allow big-endian
> property.
> 
> Fixes: 7c8ffc5555cb ("arm64: dts: layerscape: remove big-endian for mmc nodes")
> Cc: stable@vger.kernel.org
> Signed-off-by: Meng Li <Meng.Li@windriver.com>

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> index 0baf256b4400..983b2f0e8797 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> @@ -687,11 +687,12 @@ lpuart5: serial@29a0000 {
>  		};
>  
>  		wdog0: watchdog@2ad0000 {
> -			compatible = "fsl,imx21-wdt";
> +			compatible = "fsl,ls1046a-wdt", "fsl,imx21-wdt";
>  			reg = <0x0 0x2ad0000 0x0 0x10000>;
>  			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
>  					    QORIQ_CLK_PLL_DIV(2)>;
> +			big-endian;
>  		};
>  
>  		edma0: dma-controller@2c00000 {

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


