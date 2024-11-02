Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91312E677E8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 04:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RSva9Fm4DdnQOzRczihH79KDZgo8W27y6ubCk4Wafgs=; b=NjahpWg2qn4/CJW9g7gboOn5kf
	AnO3ZwZgQD5fqnrZN08i8BG0cD2OZmGk7lUuahm0AAAg8xBMvuvJlTrboNB1KoGMB4jNyPnehF/2x
	KrTsTApajuDxy7SKeUjxfDVkPbzYy7ejr62UMMOOpbaUFjhrEg1jNSKdfeFO4Fi8yn381kpq7hp5w
	joNl0RxtW22CtkTi6shzH2v4q7omdQiMcuM1zye8V4W28uh3wE36jcM6cLGBQEdnHMgFq2j0vAYHS
	F+d6YP3yo6PDVl6MeRSAU8IWSI7zFT4OjYl5Eak4KCvX1nDTZh5ZjKUOCG9O1ZUm0lrfei2SIf0rS
	MoisuTOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t769H-0000000921h-2dxu;
	Sat, 02 Nov 2024 04:54:07 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t767c-000000091vv-0PDr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 04:52:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=RSva9Fm4DdnQOzRczihH79KDZgo8W27y6ubCk4Wafgs=;
	b=ey6APnmdNnEpy+lrsiNQtnH+4VQ6EJTlGzJ0QAnqGl4jhsxX7TH6fQzKEvXl25
	BPEMeMh4HG8w+rNOLP/AS2bLlZWXO8hNn8zQgGT5D+lD7y56SWqV+SRjZHTKsfzE
	SHAQLTbVTTFUeQlRjDpQfpxFkbugWsUr9VIsWwSOyszi8=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgA3G6z5ryVno2x3AQ--.14482S3;
	Sat, 02 Nov 2024 12:52:10 +0800 (CST)
Date: Sat, 2 Nov 2024 12:52:08 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, francesco.dolcini@toradex.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v1 1/2] arm64: dts: imx8mm-verdin: add single-master
 property to all i2c nodes
Message-ID: <ZyWv+BVp91xYr4UZ@dragon>
References: <20241025095915.22313-1-eichest@gmail.com>
 <20241025095915.22313-2-eichest@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025095915.22313-2-eichest@gmail.com>
X-CM-TRANSID: Mc8vCgA3G6z5ryVno2x3AQ--.14482S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ww1DtrWkCFWfGryUArW5ZFb_yoW8ZFWfpa
	1akrs5trnagF4aqF1DXr1xurZak34rArWkCrWjgry093Z8AFy7XF4UGw4fWr4YgrWUXw4S
	kF1rAr109w4fZ3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jc18PUUUUU=
X-Originating-IP: [117.62.23.195]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAg6LZWclZYuaowAAs3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_215224_474377_7E3C2911 
X-CRM114-Status: GOOD (  15.27  )
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

On Fri, Oct 25, 2024 at 11:58:02AM +0200, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> By default we expect all i2c nodes to be single-master, we do not have
> any module or carrier board that uses multi-master mode on any i2c
> controller. With this property set, we benefit from optimisations made
> exclusively for single-masters.
> 
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> index 5fa3959141911..95d5d2333ca1e 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> @@ -367,6 +367,7 @@ &i2c1 {
>  	pinctrl-1 = <&pinctrl_i2c1_gpio>;
>  	scl-gpios = <&gpio5 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>  	sda-gpios = <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	single-master;

Hmm, I do not see this property is documented in i2c-imx bindings.

Shawn

>  	status = "okay";
>  
>  	pca9450: pmic@25 {
> @@ -561,6 +562,7 @@ &i2c2 {
>  	pinctrl-1 = <&pinctrl_i2c2_gpio>;
>  	scl-gpios = <&gpio5 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>  	sda-gpios = <&gpio5 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	single-master;
>  	status = "disabled";
>  };
>  
> @@ -574,6 +576,7 @@ &i2c3 {
>  	pinctrl-1 = <&pinctrl_i2c3_gpio>;
>  	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>  	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	single-master;
>  };
>  
>  /* Verdin I2C_1 */
> @@ -584,6 +587,7 @@ &i2c4 {
>  	pinctrl-1 = <&pinctrl_i2c4_gpio>;
>  	scl-gpios = <&gpio5 20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>  	sda-gpios = <&gpio5 21 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	single-master;
>  
>  	gpio_expander_21: gpio-expander@21 {
>  		compatible = "nxp,pcal6416";
> -- 
> 2.43.0
> 


