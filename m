Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B58E77184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Dec 2024 12:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tvo6xwYWGeSnCsDnjEWAgafbwiwjvh049xe5Nk5dpNg=; b=yFJsaVuj3X1alh9zsaEeO603Y7
	wCWQwsWdC20nPA3GS5mxNxaM/VbpWkyjdCJ4LcAoyGLFurgZEKhgUMeL11DJRwDKVSo34fDjlcEvv
	ZW2eDG7ZqEeZWEAsR8ZEuo8MNuD70ZuQ1PHnt1GWykt8UMY7+jnbcqM8UNiiS09SWPdwOez3850lf
	RWJ8ikBbheszmdEzS8qNPk1Z8C4v8YtEBCMj2TYaDDcqRIkTGhc2wHhnBZQ0ACfkUh1wM0Xvj3VmS
	k3fyDt2PB8MRR3BIqTKxQLX+VTx/iDOFiBlRCHr81vkK+HiLLUIngstSKUR26gHoB6efOsugywCVu
	g1geBZVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOz24-00000006zTo-0Plt;
	Sat, 21 Dec 2024 12:56:36 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOz0s-00000006zPc-0pHp;
	Sat, 21 Dec 2024 12:55:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Tvo6xwYWGeSnCsDnjEWAgafbwiwjvh049xe5Nk5dpNg=; b=xZ6bak7BpkQBZ6tVs1jszJBZgY
	2CC/heXQBljSq1+UnQj/pnQd+QVanLlfBQGcBRmIhQdmL2p7gXWOQyEyTM2Ag6SEzXVXG9Xz5if8L
	blJSkMIW15bhu9sGbs1as/6txHDYYtb1hE1FM8GGlT5dBFjTzGdjEBQuE4g4gHL5uF4wZOT6053lE
	/xYdiD08XmIfBXrRKTWC3+izfjyGfabO4OXRVl3wlihMEyEXvPhYuft/W8se4laZwvi4z3PHN0pZ3
	kUpVr6NVyOnzmvGeIB6nvKe+o4Qn5zLWUlZpkPazLsCDchbWK6yNGBlvIQa0lamk3Bn7AIk/hxJcg
	jNxua1LA==;
Received: from i53875bfb.versanet.de ([83.135.91.251] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tOz0Y-0008N9-TD; Sat, 21 Dec 2024 13:55:02 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: dsimic@manjaro.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, krzk+dt@kernel.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH] arm64: dts: rockchip: aliase sdhci as mmc0 for rk3566 box demo
Date: Sat, 21 Dec 2024 13:55:02 +0100
Message-ID: <24438615.ouqheUzb2q@diego>
In-Reply-To: <20241221104920.4193034-1-andyshrk@163.com>
References: <20241221104920.4193034-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_045522_269676_DD409FE2 
X-CRM114-Status: GOOD (  20.12  )
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

Hi Andy,

Am Samstag, 21. Dezember 2024, 11:49:07 CET schrieb Andy Yan:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Follow most others rk356x based boards, and u-boot only use mmc0/1
> as mmc boot targets, so aliase sdhci as mmc0.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
> 
>  arch/arm64/boot/dts/rockchip/rk3566-box-demo.dts | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3566-box-demo.dts b/arch/arm64/boot/dts/rockchip/rk3566-box-demo.dts
> index 41b4cd5a4220..7d0eedf1bd0d 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3566-box-demo.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3566-box-demo.dts
> @@ -19,9 +19,9 @@ / {
>  
>  	aliases {
>  		ethernet0 = &gmac1;
> -		mmc0 = &sdmmc0;
> -		mmc1 = &sdmmc1;
> -		mmc2 = &sdhci;
> +		mmc0 = &sdhci;
> +		mmc1 = &sdmmc0;
> +		mmc2 = &sdmmc1;

sorry, but that won't be possible :-( .

The original aliases for the mmc order were added over 2 years ago
(november 2022) and became part of the ABI then.

Imagine someone using that board with a rootfs=/dev/mmcblk2p1 part
in the commandline to mount the old sdhci-part1 as rootfs, but now
you reorder the controllers, so so that commandline would try to access
sdmmc1, so their system won't boot anymore after just a simple kernel
update.

Breaking people's setup is one of those big no-go-s in the kernel, so
sadly you'll need to live with the existing order.


Heiko



