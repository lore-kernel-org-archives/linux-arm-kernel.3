Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D83E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 08:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TOB+Fxp49rSShIZTVjtd1jIBj8qsd4mGBRlOc0nOjoY=; b=Y7cVA/gqWFFe0rjthDRro+ri7I
	NTR8ssRWm6EOajD02vD2+Zhn/Z9hh2AhfAq00xMf2zGZdo5YzygtkQQagwuFAsIgeAuslJMKLiGuT
	EPaV5qpc/+HAi2UZJkH8/etvkC8iXTsk6I5YqhFbk9GBX86/ftlYh2c8NWAUAuW2/l3AMcisL+jkx
	vmG7iYoM0VczpPmVhE+tasQ8AU7P6RoEQ/WYdnSKJvKYcSiVGgwM9QV2thULdF/vFCv9pe+7maXUn
	1l0ejKq4nBojGaRCI9Pz2luFCXaMwkrDMr2vHH3MG4FpUzP5V7kwVWJ1X1NwXbbXgURImz3ZyjPFU
	GoF9SQPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLIP7-0000000EHPI-2mIN;
	Wed, 11 Dec 2024 08:49:09 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLINS-0000000EGwI-15Zh;
	Wed, 11 Dec 2024 08:47:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TOB+Fxp49rSShIZTVjtd1jIBj8qsd4mGBRlOc0nOjoY=; b=fFDwsdp22wcbCT+bR3kubCHU7P
	RgjeyO2qzR2mrXOHIzbvyXNyJmiTtyixsDWmkL+7GTA458f+BQtAlLKGR5M0koTY12SzYatQzcfAT
	KVFy/duNKx3RB/Ay3zxnrJX+o9QFscjXydr3HfVAiNkVEWgy0R6uIce38V3EsH2n3WpWN7rkr1YGS
	G29nCmuM0v4Ss6poRMfMmEd6faZJrAEpe7in/bMwYsBCZy1lNZqzTmHebq2W/HjDUbaka33acg0HH
	T3kBCi086tPHtknNMKNEtd+jjETUR+6Nl5NdgwcVJf7OunvqLCf4v1iMWTNzGHjDeZFCVM+Xkx90y
	xhDC3BFQ==;
Received: from i53875bc4.versanet.de ([83.135.91.196] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tLIN0-0000Bg-N9; Wed, 11 Dec 2024 09:46:58 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Alexandre ARNOUD <aarnoud@me.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/4] Add support for HDMI1 output on RK3588 SoC
Date: Wed, 11 Dec 2024 09:46:57 +0100
Message-ID: <12942826.iMDcRRXYNz@diego>
In-Reply-To: <20241211-rk3588-hdmi1-v2-0-02cdca22ff68@collabora.com>
References: <20241211-rk3588-hdmi1-v2-0-02cdca22ff68@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_004726_342668_B4D8D8C1 
X-CRM114-Status: GOOD (  23.92  )
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

Hi Cristian,

Am Mittwoch, 11. Dezember 2024, 00:06:13 CET schrieb Cristian Ciocaltea:
> The patches provide the basic support to handle the second HDMI output
> port found on Rockchip RK3588 SoC.
> 
> For now I enabled it on Radxa ROCK 5B only, the board I've been using to
> validate this.
> 
> ** IMPORTANT **
> 
> The series has a runtime dependency on "phy: phy-rockchip-samsung-hdptx:
> Don't use dt aliases to determine phy-id", a patch submitted recently by
> Heiko [1].  Without applying it, the functionality on both HDMI TX ports
> will break.

Looking at the drm/rockchip patch, that should not cause disruptions on
its own, right?

Only with the dts-parts enabled would we run into phy-issue.
(Asking, because things go through different trees and the drm
part looks ready)


Heiko


> Furthermore, please note this is subject to the same limitations as
> HDMI0 when it comes to the supported display modes.  The fixes provided
> via [2] are not applicable to HDMI1, hence I will handle it separately
> as soon as all dependencies are merged.
> 
> Thanks,
> Cristian
> 
> [1] https://lore.kernel.org/lkml/20241206103401.1780416-3-heiko@sntech.de/
> [2] https://lore.kernel.org/all/20241116-vop2-hdmi0-disp-modes-v1-0-2bca51db4898@collabora.com/
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
> Changes in v2:
> - Override hdmi1 pinctrl-0 on rock-5b as it requires hdmim0_tx1_cec
>   instead of hdmim2_tx1_cec (fixes a pin conflict when enabling
>   CONFIG_SPI_ROCKCHIP_SFC)
> - Link to v1: https://lore.kernel.org/r/20241207-rk3588-hdmi1-v1-0-ca3a99b46a40@collabora.com
> 
> ---
> Cristian Ciocaltea (4):
>       drm/rockchip: dw_hdmi_qp: Add support for RK3588 HDMI1 output
>       arm64: dts: rockchip: Add PHY node for HDMI1 TX port on RK3588
>       arm64: dts: rockchip: Add HDMI1 node on RK3588
>       arm64: dts: rockchip: Enable HDMI1 on rock-5b
> 
>  arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi  |  62 ++++++++++++
>  arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts |  44 ++++++++-
>  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c  | 119 +++++++++++++++++++-----
>  3 files changed, 200 insertions(+), 25 deletions(-)
> ---
> base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
> change-id: 20241207-rk3588-hdmi1-704cbb7cd75f
> 
> 





