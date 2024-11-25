Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B47DD58062
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 10:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hmQWA+nwpDDcGMMWDzj5b5llGkioHK+B9GAwscWHsf8=; b=Ea6HvwUnxbWy3Ye/ww8ESwbcPp
	YNFU64OKP6nl2Z6Vy+TQ+CWCPXH93MopPlM7hvXvNmBoZQDZyJhYaQlpDHXe3Sc4A4u68ZGZMeVFU
	smsI7ci6En+alavweQqYPgmNt1CoxYqsKhH3NKQtC3wpEfB9KCX7oIgLgyZLWzqsq1X8uCltSIAbu
	iF4Njg5Tlgds89yZ2Kzbsj2M1ViLZfpphiXj04Kd1zvWNcyX+A0tTgrNNEZ9+JEr6wD1Rxqy0YquX
	HYoKrNm99H7QonuzSqpS+w8dD+Y5mA8nX+OuXVbgZomAm/AIpzEmpKX7zuZx0VTvTFuX67Bsf+Jsi
	AobIRIMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFWjD-00000007p6I-2crL;
	Mon, 25 Nov 2024 10:54:03 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFWiG-00000007ow6-2erP;
	Mon, 25 Nov 2024 10:53:06 +0000
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 1E756262A7;
	Mon, 25 Nov 2024 11:52:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1732531978;
	bh=hmQWA+nwpDDcGMMWDzj5b5llGkioHK+B9GAwscWHsf8=;
	h=Received:From:To:Subject;
	b=ZYfrj838yqQBq+MD5xjL1RdFq/zTs84dqXtTqrLEVI0BvgjI7PabTQ+4t8f3ceZx1
	 +bgbcTJZG7kJm4sOAnseL56ApNbSwEcXv/OEmNp6qXqdzdEkw1FK5JlaHxMKxaFuzT
	 Mvi8WDOvCkgBqs6ZuhRkXzc0NC56CBxP7xMrpBfZ4ltng4O+6hYdQvaxyo0xd/x+aK
	 a7I2mVi6aU8U9duQei/4IcijBLyfFagIRTjS5R4R4qCxTPaulnhlTbOLpex4GQvrdX
	 d86c5tDbtN75uV2MqQ/fauaRApXM9BOtbWOQmhUhhqHd8TNHTBcouEc1vNdB8K8C75
	 8VrGTNu6GvA9g==
Received: by gaggiata.pivistrello.it (Postfix, from userid 1000)
	id ADFCE7F996; Mon, 25 Nov 2024 11:52:57 +0100 (CET)
Date: Mon, 25 Nov 2024 11:52:57 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, glx@linutronix.de,
	vkoul@kernel.org, kishon@kernel.org, aisheng.dong@nxp.com,
	agx@sigxcpu.org, francesco@dolcini.it, frank.li@nxp.com,
	dmitry.baryshkov@linaro.org
Subject: Re: [DO NOT MERGE PATCH v4 16/19] arm64: dts: imx8qxp: Add display
 controller subsystem
Message-ID: <Z0RXCYZ_7fBvpcvd@gaggiata.pivistrello.it>
References: <20241125093316.2357162-1-victor.liu@nxp.com>
 <20241125093316.2357162-17-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241125093316.2357162-17-victor.liu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_025304_827263_7E1912A7 
X-CRM114-Status: GOOD (  10.12  )
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

On Mon, Nov 25, 2024 at 05:33:13PM +0800, Liu Ying wrote:
> Add display controller subsystem in i.MX8qxp SoC.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

...

> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> index 05138326f0a5..35cc82cbbcd1 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> @@ -20,6 +20,27 @@ / {
>  	#size-cells = <2>;
>  
>  	aliases {
> +		dc0 = &dc0;
> +		dc0-constframe0 = &dc0_constframe0;
> +		dc0-constframe1 = &dc0_constframe1;
> +		dc0-constframe4 = &dc0_constframe4;
> +		dc0-constframe5 = &dc0_constframe5;
> +		dc0-display-engine0 = &dc0_display_engine0;
> +		dc0-display-engine1 = &dc0_display_engine1;
> +		dc0-extdst0 = &dc0_extdst0;
> +		dc0-extdst1 = &dc0_extdst1;
> +		dc0-extdst4 = &dc0_extdst4;
> +		dc0-extdst5 = &dc0_extdst5;
> +		dc0-fetchlayer0 = &dc0_fetchlayer0;
> +		dc0-fetchwarp2 = &dc0_fetchwarp2;
> +		dc0-framegen0 = &dc0_framegen0;
> +		dc0-framegen1 = &dc0_framegen1;
> +		dc0-layerblend0 = &dc0_layerblend0;
> +		dc0-layerblend1 = &dc0_layerblend1;
> +		dc0-layerblend2 = &dc0_layerblend2;
> +		dc0-layerblend3 = &dc0_layerblend3;
> +		dc0-tcon0 = &dc0_tcon0;
> +		dc0-tcon1 = &dc0_tcon1;

what would you use those aliases for?

Francesco


