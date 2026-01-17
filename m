Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B5D8D4A5F5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 06:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B7CwSmX6pQEv46D5Fmo3BQff6hKXUs1tZ9xD4ZXofqc=; b=CVh4S4Z8CyvMhZeJLYV729P/f2
	snUkUe2nJFLZNpmNp+x+ZldxJGG9jnCB9C7o7EOMr1yz65t27td+oRjOoWsOviaFQDIoK0McnhBFv
	vNQRVSYFhLdM8ZHlDVvSsSyXgjRHKSBIeS8GdFH+NsHP168rsXXZfp+gopfy56cConSLTpcSX6NJ9
	4KYGWP8UH6EMLWfp4Vy1gkAEO42SmAHufn2Yn6WWYdwM/csZBLPRWmz1moyIe7wyjWjZR2I7gh72W
	C1Cr1C9f/xgS4Ke03Qu1J8zmQK04YqDHeBqqs5d0t5u/dWaHAKks1udVIKKZuedz0qVq/DJi+7KOA
	3Exq4cuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgzLx-0000000FJTo-3s3P;
	Sat, 17 Jan 2026 06:00:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgzLw-0000000FJTi-1f0S
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 06:00:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6510960127;
	Sat, 17 Jan 2026 06:00:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7319DC4CEF7;
	Sat, 17 Jan 2026 05:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768629602;
	bh=5wA58oCXUxGlCXvDN5IdgcPYcqa5jAaI+xL+nK4vmFc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YY/aAuj64PKTk0mvb0ZcnevakmRwNpgxG6RmISrViFchP9gSnHba0il5lVXA7kd7Y
	 Y//m5bCyNBMTGQZljnQeAm/ccxfL/CmuNuL2uYMdLIwmU8ODKNftrB8Z9XNs/cHI9w
	 fL749X44EuHp3b479guI3n8qdPIBOdPvkHKZpH2cifNqxEW1mSV0bMw29AZ60KAIEL
	 vBL/rEFzLdche39zSpKajiCJ4Ud+NXVDX9FOdl5+J8dJSLspG4psqTFrGZXec6OJPq
	 i3ay70egpvrOXxDL2oPk9ZMyKba5O+7dwdNVnrfTnQC8P3ksEd7Xn5lJsrtuOvQI3s
	 pk73whqwKIHWA==
Date: Sat, 17 Jan 2026 13:59:56 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Josua Mayer <josua@solid-run.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ARM: imx_v4_v5_defconfig: update for v6.19-rc1
Message-ID: <aWslXMyRc3w6rkos@dragon>
References: <20260104-armv45defconfig-v3-1-f712476d44d1@solid-run.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260104-armv45defconfig-v3-1-f712476d44d1@solid-run.com>
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

On Sun, Jan 04, 2026 at 11:38:52AM +0200, Josua Mayer wrote:
> The i.MX ARM v4/v5 defconfig has gone out of sync with some dead options,
> some removed and some missing.
> 
> 1. Add missing options no longer enabled by default:
> - CONFIG_I2C=y
> - CONFIG_LCD_CLASS_DEVICE=y
> 
> 2. Remove options enabled by default:
> - CONFIG_CS89x0=y
> - CONFIG_MEDIA_CAMERA_SUPPORT=y
> 
> 3. Remove options that have no effect:
> - # CONFIG_INET_XFRM_MODE_TRANSPORT is not set
> - # CONFIG_INET_XFRM_MODE_TUNNEL is not set
> - # CONFIG_INET_XFRM_MODE_BEET is not set
> 
> 4. Remove options that have been removed completely from the kernel:
> - CONFIG_USB_EHCI_MXC=y
>   Removed by commit e7018751d2e6 ("usb: host: ehci-mxc: Remove the
> driver").
> - CONFIG_SMC911X=y
>   Removed by commit a2fd08448f2b ("net: remove smc911x driver").
> - -CONFIG_SND_SOC_MX27VIS_AIC32X4=y
>   Removed by commit 3fbb01fb583f ("ASoC: mx27vis-aic32x4: Remove unused
> driver").
> - CONFIG_SND_SOC_PHYCORE_AC97=y
>   Removed by commit 440534a0ecfd ("ASoC: phycore-ac97: Remove unused
> driver").
> - CONFIG_SND_SOC_IMX_MC13783=y
>   Removed by commit 83e7e2278680 ("ASoC: imx-mc13783: Remove unused
> driver").
> 
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Applied, thanks!

