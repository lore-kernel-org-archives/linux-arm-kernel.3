Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A74E674B9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 08:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=13yVRjwRQ4uP7MVZUkbCgvEr+0M4fhtWPCcnIh1nW8w=; b=aZR2xqdGCT3FQiL2bsLK6Yheqp
	P9Aw8XBaR6laQnw+ZpyvqKAaeYIGy9onID620lSdCndTaTuLDazehdI+9NYXxwq1D1k6DHFoqpIxb
	A4Z/i+r5tJCs795RRULV11xlFR68ZZbmMUWS6U01UQC1SNmJSmlYrX0DkPhTJZT4dGQPJXlpQ7jbV
	esTR0mcKSaErpFRQG41FWtUKMlJH40pXx4f1NKlSxyXl3gGh8jibVQxUoLBGVdNi8JIid3fA8qsi6
	WJ826rGyaPefbBx6v07i3/2hfDHzQjDvxm0WsHHRoQsteYAeeNEJqnJ8CNxkYZt5t4g2IAMuL0sxk
	cS8zxDGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6mv2-00000006FlR-3GiJ;
	Fri, 01 Nov 2024 08:22:08 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6mgc-00000006Crg-1viv;
	Fri, 01 Nov 2024 08:07:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=13yVRjwRQ4uP7MVZUkbCgvEr+0M4fhtWPCcnIh1nW8w=;
	b=QLLh9LOP/E+liaFug0/xHR+3DNJTnhSJ9LXyZYu4iDsHaq6EEgF72VYElDykYF
	F13/SwWbTowVdp9YU3L5aGvueYiPxpLC3R2tFmK4CGMi5qlLO61l7ymxcOp4o9tv
	NbgtP8pEieU88l4yX28Llt0KbTxq1/nEBjiYm6kohdi0I=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCX37wTjCRn9lFiAQ--.13649S3;
	Fri, 01 Nov 2024 16:06:44 +0800 (CST)
Date: Fri, 1 Nov 2024 16:06:42 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/5] arm64: dts: imx8dxl-ss-conn: change usbphy1
 compatible
Message-ID: <ZySMErIOlyRWzzrj@dragon>
References: <20240926073951.783869-1-xu.yang_2@nxp.com>
 <20240926073951.783869-3-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926073951.783869-3-xu.yang_2@nxp.com>
X-CM-TRANSID: Mc8vCgCX37wTjCRn9lFiAQ--.13649S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw4fJryfur17Ar4fCF48WFg_yoW8GrWUpa
	4Ykr4DZr1SgF1j9F9rXa10kr98Jws3Cr409ry8G3y8Kr98ua4Fqa97urna9rs5Zr4rCw43
	GFn5Wry2y3WUZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j5cTQUUUUU=
X-Originating-IP: [117.62.23.195]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAgqKZWckfBgxrQAAsc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_010714_935462_2EBEB6FA 
X-CRM114-Status: GOOD (  11.02  )
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

On Thu, Sep 26, 2024 at 03:39:48PM +0800, Xu Yang wrote:
> Make fsl,imx8dxl-usbphy compatible with fsl,imx7ulp-usbphy to fix below
> warning:
> 
> /home/nxf75279/work/linux-next/arch/arm64/boot/dts/freescale/imx8dxl-evk.dtb: usbphy@5b100000: 'nxp,sim' is a required property

A relative path might be a better fit:

arch/arm64/boot/dts/freescale/imx8dxl-evk.dtb: usbphy@5b100000: 'nxp,sim' is a required property

I applied all 4 DTS patches with this fix-up.

Shawn

>         from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi
> index 1e02b04494e9..9b114bed084b 100644
> --- a/arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi
> @@ -138,6 +138,10 @@ &gpmi {
>  	interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>  };
>  
> +&usbphy1 {
> +	compatible = "fsl,imx8dxl-usbphy", "fsl,imx7ulp-usbphy";
> +};
> +
>  &usdhc1 {
>  	compatible = "fsl,imx8dxl-usdhc", "fsl,imx8qxp-usdhc";
>  	interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
> -- 
> 2.34.1
> 


