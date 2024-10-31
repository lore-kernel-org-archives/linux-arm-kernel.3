Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72467E6B27C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 13:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PaSCk1MHt+u/5badwaXms6hxT3puo6uFmbWra7A0GpU=; b=npYLmbueFMI4allHnBt3dLNdOx
	tfpmKH7OZhkTHa+/VQz0majme5EwXormN9Oame/jcSO63K9RzFBdkHi9VlUbpM5TzFMtxnXd2Lh81
	eEgCbXeWH7VIBnMWdhCXFq5yKG55BFI5leQPQAjWqAgABA0Hz2+M6ouORnpPDI33uVt1GRpnGW80G
	WScBrXckp5cP5quj7h8PthWWj5WKK7ifw8sqPyYoTqj+qJkc2nk5covRbBaccxBx9LKdVTybDUNy/
	3rDLizfAe0Dy2H4eOJ+KGJDvpIJHLCIuEWbcqvFd60MJty9ewNgblnhD386t/umTwqC0jVXe4dBeD
	tywMhHRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6s5j-00000007F1J-3jSl;
	Fri, 01 Nov 2024 13:53:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6s41-00000007EaD-4BPC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 13:51:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3B2375C82FD;
	Thu, 31 Oct 2024 07:46:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6387C4CEC3;
	Thu, 31 Oct 2024 07:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730360835;
	bh=+/mNFZoyqAhBMU/EtC0vUn4wU+EAjbWZapa9iLdQ8T8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fQL2gxToMy+8NOIC7Gmp4FSHqzDYm0232ya07iuTjCBh1gDrN6cmaa4vf7JNs6OrD
	 t81UJuDLafZDl3lqjPIrAUtaT6UgYG0IjYp2d5ZL8LJz9z8x8dxgvZece4qLy88xG/
	 hhY4ey7Vcxxj2+pwoZktd1tzXW0cpT/MlbPZoydzrYTRdnPY2eEchErpSD/eZImKrV
	 XPIKsC8vhFo7Me+fD5li8UD8EU5lTp+ZEcCcjStqvbQj9BLfgH1hizXVfjH0ay6DHa
	 4z7cVOoztW+dFRSbPTWMARf8F5rZkEb2VdVe+e9PVvlrLz30vnUe3BM7B2FMBGjkTS
	 hTk1xqst4Uahg==
Date: Thu, 31 Oct 2024 08:47:11 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	alexandre.belloni@bootlin.com, magnus.damm@gmail.com, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v5 10/10] arm64: defconfig: Enable VBATTB clock and
 Renesas RTCA-3 flags
Message-ID: <6eekxqtmsyaiafhyvos22eyo2mmp747uj3dkuivtou3jjees3y@hj5mp4pahngr>
References: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
 <20241030110120.332802-11-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241030110120.332802-11-claudiu.beznea.uj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_065146_106825_6B75AB46 
X-CRM114-Status: GOOD (  16.71  )
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

On Wed, Oct 30, 2024 at 01:01:20PM +0200, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Enable the Renesas VBATTB clock and RTCA-3 RTC drivers. These are
> available on the Renesas RZ/G3S SoC. VBATTB is the clock provider for
> the RTC counter.
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
> 
> Changes in v5:
> - none
> 
> Changes in v4:
> - squashed w/ patch "arm64: defconfig: Enable Renesas RTCA-3 flag" from v3
> - updated patch description
> - collected tags
> 
> Changes in v3:
> - update patch title and description
> - dropped CONFIG_MFD_RENESAS_VBATTB
> 
> Changes in v2:
> - added CONFIG_MFD_RENESAS_VBATTB
> - added vendor name in the VBATTB clock flag
> 
>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 0fad83642034..4f4fe8d9125c 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1222,6 +1222,7 @@ CONFIG_RTC_DRV_IMX_SC=m
>  CONFIG_RTC_DRV_MT6397=m
>  CONFIG_RTC_DRV_XGENE=y
>  CONFIG_RTC_DRV_TI_K3=m
> +CONFIG_RTC_DRV_RENESAS_RTCA3=y

This should be module.

>  CONFIG_DMADEVICES=y
>  CONFIG_DMA_BCM2835=y
>  CONFIG_DMA_SUN6I=m
> @@ -1371,6 +1372,7 @@ CONFIG_SM_VIDEOCC_8250=y
>  CONFIG_QCOM_HFPLL=y
>  CONFIG_CLK_GFM_LPASS_SM8250=m
>  CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
> +CONFIG_CLK_RENESAS_VBATTB=y

This as well.

Best regards,
Krzysztof


