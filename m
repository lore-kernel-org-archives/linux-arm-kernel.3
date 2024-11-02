Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E05E677EE
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 07:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pX+/3FO2uxR1q2Xk+WQT3k8Oa1+H08pdqnymIX1S4ig=; b=g+RhQXsTcVjvVSG2OMr+XJ9yZ5
	ySqhBQSuQemHv7QRgWj/xoFYESVTwyDYqhRTvhjmmZQJC+hEtJHe4QqcMJbmyhM/b2KEIwR3woLAV
	ONJOMhhpstq1k1q/MuZxZGbLDmvtH1v2PgxKUXou9I9r2qOg8x7HCt/e2bAdDWQSoc8+PuHk+1klw
	AxQX30D7TnWw3aitHExQycBJ6B3ePgLo6h5Njp7FoTZcooOLncF1h/gJjBpRBEpqGeZWYKRSyCoHn
	+OPU0XnikE9nAJz3VFd2ORIH1mIamT1qZJrcohlNg5kMZZNuyHzGczBiHXtH/xTNM1qaXzRq7pL6/
	ZRPGZgRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t78Ue-00000009DJv-2SrK;
	Sat, 02 Nov 2024 07:24:20 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t78Sx-00000009CxR-2aSm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 07:22:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=pX+/3FO2uxR1q2Xk+WQT3k8Oa1+H08pdqnymIX1S4ig=;
	b=npTm+xwnOCJsurVHrgO9WDkItcIXCcbTn1Y5U0/SJ7OK5Ozb2MkZ3IAjxVk6KW
	M1XFx8eyW6MosYtE18EsCssXRS2rANsVZifIJdHTrIISB97DRIXjoLbEChIlG1qn
	ZzXl1KByQgyD5NFkkicJ5Q+/oE9R/3I0TzRHdz7YlXI9c=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAnJtIX0yVn_rx5AQ--.14994S3;
	Sat, 02 Nov 2024 15:22:01 +0800 (CST)
Date: Sat, 2 Nov 2024 15:21:58 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: linux@armlinux.org.uk, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	elinor.montmasson@savoirfairelinux.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v1] ARM: imx_v6_v7_defconfig: enable SND_SOC_SPDIF
Message-ID: <ZyXTFhEm9UCBii2c@dragon>
References: <20241030122128.115000-1-eichest@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030122128.115000-1-eichest@gmail.com>
X-CM-TRANSID: Mc8vCgAnJtIX0yVn_rx5AQ--.14994S3
X-Coremail-Antispam: 1Uf129KBjvJXoWruF4kWr4furWxGw1fCrWfKrg_yoW8JF15pF
	nrZrs7Jr48W3y5JrWUCrykWa95ZF9rXrW0qrW2ya45ZwsIy34FqF1jy342ga1DXr9a9r95
	CFyfGF9Ikr1DX3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jzc_fUUUUU=
X-Originating-IP: [117.62.23.195]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCQiLZWclsVNF3gAAsU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_002236_046762_E5A3B754 
X-CRM114-Status: GOOD (  13.52  )
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

On Wed, Oct 30, 2024 at 01:21:12PM +0100, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> Enable SND_SOC_SPDIF in imx_v6_v7_defconfig to support SPDIF audio. This
> change will fix commit d469b771afe1 ("ARM: dts: imx6: update spdif sound
> card node properties") which moves away from the old "spdif-controller"
> property to the new "audio-codec" property.
> 
> Fixes: d469b771afe1 ("ARM: dts: imx6: update spdif sound card node properties")

It doesn't look a fix to me.

Shawn

> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> ---
>  arch/arm/configs/imx_v6_v7_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
> index 333ef55476a30..c771d7dbcadcd 100644
> --- a/arch/arm/configs/imx_v6_v7_defconfig
> +++ b/arch/arm/configs/imx_v6_v7_defconfig
> @@ -321,6 +321,7 @@ CONFIG_SND_SOC_IMX_SGTL5000=y
>  CONFIG_SND_SOC_FSL_ASOC_CARD=y
>  CONFIG_SND_SOC_AC97_CODEC=y
>  CONFIG_SND_SOC_CS42XX8_I2C=y
> +CONFIG_SND_SOC_SPDIF=y
>  CONFIG_SND_SOC_TLV320AIC3X_I2C=y
>  CONFIG_SND_SOC_WM8960=y
>  CONFIG_SND_SOC_WM8962=y
> -- 
> 2.43.0
> 


