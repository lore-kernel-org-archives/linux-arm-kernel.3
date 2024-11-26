Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2787DD5A6E7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 06:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IE2s7n1D+/XIamQ+uy61hz8GK+yDRDiKRqOlbPTIkSA=; b=VdoUDECZhHKnStze5gj/q1rh1Z
	u3b02KO/HSxgEYmyke5O6qpdnXp4IYUdtxubLodQqwjgJ/qbY9wkLWgb3jL37qV6DKgdRfLwtspTG
	DI50Bw6BQp7DqptMT18cBp86EZQp6Lyj30b9uUBI13R1TR7VXrXGggkdiTXq6czCSa4S1t2Hzjcb0
	pPRr43cFZfCxyNiaMf2iIwB2vpKJgzHRPGkxcfA60tLBJnwDiYLG7C2ZGauuTfNOpgcrvy4LefpKT
	jn4ucMK+ZS3xRHybhehuWJcC/gAhs7Srnz/u95UeJBaf0/qVOXPpEFrOlnRg3tl7FxGjL1PPUFmOn
	PvQpvpzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFpPh-00000009mfP-44PH;
	Tue, 26 Nov 2024 06:51:09 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFpNu-00000009mL5-1iUX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 06:49:19 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tFpNh-0000ba-00; Tue, 26 Nov 2024 07:49:05 +0100
Message-ID: <f8d5e367-5648-4941-9d65-adfbe6d3c0dc@pengutronix.de>
Date: Tue, 26 Nov 2024 07:49:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: Add dsp rproc related mem regions
To: Daniel Baluta <daniel.baluta@nxp.com>, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 frank.li@nxp.com, aisheng.dong@nxp.com, daniel.baluta@gmail.com,
 laurentiu.mihalcea@nxp.com, shengjiu.wang@nxp.com, iuliana.prodan@nxp.com
References: <20241125152427.136883-1-daniel.baluta@nxp.com>
 <20241125152427.136883-7-daniel.baluta@nxp.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20241125152427.136883-7-daniel.baluta@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_224918_454699_71574A08 
X-CRM114-Status: GOOD (  17.32  )
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

On 25.11.24 16:24, Daniel Baluta wrote:
> With imx8mp-evk board we are now configuring 'dsp' node for rproc usage,
> so add rproc specific memory regions.
> 
> Also, enable dsp node because it is ready to be used.
> 
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

> ---
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> index d26930f1a9e9..c732ee79772d 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> @@ -291,6 +291,16 @@ &aud2htx {
>  	status = "okay";
>  };
>  
> +&dsp_reserved {
> +	status = "okay";
> +};
> +
> +&dsp {
> +	memory-region = <&dsp_vdev0buffer>, <&dsp_vdev0vring0>,
> +			<&dsp_vdev0vring1>, <&dsp_reserved>;
> +	status = "okay";
> +};
> +
>  &eqos {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_eqos>;


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

