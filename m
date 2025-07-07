Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A292EC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 09:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vyklAUbbO9HgYSarbfvrSepbaUCt1uYyW4m9xUB5+0U=; b=k4MEIMDQMvnh+bnt19Ke1BJnjM
	+3W7FsXe6AX7FJmVmQxrMemVOGsS6qvM7wXdJhmuP0igehBuOfAzg8O7wCSfaueVX17f7GgqhMKJD
	fuAOp0quYRYQHdPu3sFFVIRA81BlhkSpEX7y00nIYnwpuAJEkQ3owiWWYGquVJOLtcWc0f88EuGiu
	zcRL58e93n8t2kDy8KvFiru8yRN9K6uBxCvBzOn4i9/5LbmasdA1Lge8z3+T77imL3FJ2uo1YcS83
	tqcdIjhiN/tP++wzSg17Nm0Fn72fNhmIJOwjbvptrHr9EM5jJKxEqatlYI/T+7dpVBNYsUvAieIg5
	yRnif1uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYi1d-00000001xuC-24bt;
	Mon, 07 Jul 2025 09:20:37 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYh6F-00000001qOk-383B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 08:21:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=vyklAUbbO9HgYSarbfvrSepbaUCt1uYyW4m9xUB5+0U=;
	b=ZFXZbWaiUtmErHFH9CffaxylkyhJZiklvZF3zyWzwJbFsFIqCcji6E+nRqzpcS
	CqdA8hk9foYTKXTFj1/3HhRH8184sstDUTL8/ePOtJqQZAJF1d0P/0Pzgre5lwbo
	JViGqloIsfAZFnZ73mJUe2vHDpqMrcWZm8t8IFu0qJna8=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDXfxBsg2toWId5AA--.22061S3;
	Mon, 07 Jul 2025 16:21:02 +0800 (CST)
Date: Mon, 7 Jul 2025 16:21:00 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Xu Yang <xu.yang_2@nxp.com>, Frank Li <Frank.Li@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, jun.li@nxp.com
Subject: Re: [PATCH] arm64: dts: imx95: add some USB3 PHY tuning properties
Message-ID: <aGuDbE1_9Sbug-NH@dragon>
References: <20250627031348.3455547-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627031348.3455547-1-xu.yang_2@nxp.com>
X-CM-TRANSID: Ms8vCgDXfxBsg2toWId5AA--.22061S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7KF1kKw47tF1rGw1DXF45GFg_yoW8ZrW3pr
	4kCFsrXr1fKF1fC3s2qF18Kr98Jan3G3srurWUWr1UKrZxZrnrtF4ftF4fWw4j9r4xua1r
	WF1kuF97ZrnFgw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jowZcUUUUU=
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRyDZWhrVpmjQQAAsd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_012120_145493_6F32C994 
X-CRM114-Status: GOOD (  14.54  )
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

On Fri, Jun 27, 2025 at 11:13:48AM +0800, Xu Yang wrote:
> Add some USB3 PHY tuning properties to imx95-15x15-evk and
> imx95-19x19-evk boards to improve USB signal quality.
> 
> Reviewed-by: Jun Li <jun.li@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts | 6 +++++-
>  arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts | 4 ++++
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
> index 6c47f4b47356..b26e9db7832a 100644
> --- a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
> @@ -1069,8 +1069,12 @@ usb3_data_hs: endpoint {
>  };
>  
>  &usb3_phy {
> -	orientation-switch;
> +	fsl,phy-pcs-tx-deemph-3p5db-attenuation-db = <17>;
> +	fsl,phy-pcs-tx-swing-full-percent = <100>;
>  	fsl,phy-tx-preemp-amp-tune-microamp = <600>;
> +	fsl,phy-tx-vboost-level-microvolt = <1156>;
> +	fsl,phy-tx-vref-tune-percent = <100>;
> +	orientation-switch;
>  	status = "okay";

It conflicts with what I applied from Frank [1].

Shawn

[1] https://lkml.org/lkml/2025/6/6/920

>  
>  	port {
> diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> index 6886ea766655..e212f12f869a 100644
> --- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> @@ -514,7 +514,11 @@ usb3_data_hs: endpoint {
>  };
>  
>  &usb3_phy {
> +	fsl,phy-pcs-tx-deemph-3p5db-attenuation-db = <17>;
> +	fsl,phy-pcs-tx-swing-full-percent = <100>;
>  	fsl,phy-tx-preemp-amp-tune-microamp = <600>;
> +	fsl,phy-tx-vboost-level-microvolt = <1156>;
> +	fsl,phy-tx-vref-tune-percent = <100>;
>  	orientation-switch;
>  	status = "okay";
>  
> -- 
> 2.34.1
> 


