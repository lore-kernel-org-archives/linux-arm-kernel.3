Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A84C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 13:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gR0lq2R8NskzCfbSMLb8IMLoPerOeBsRsJsnYVXF+4s=; b=2RQ/lZBW/rpoDWjUpslmauWUCU
	IfXTe+nJxYWuENDNyWEaYe6gz+a8RcjFtZyMfSGJolj02MrlGUN/4D418mwfvGQGqXthRq9znRtSl
	f1anckxvCuFQsSpF0htGUm1te49LLit134IDAIa2OKteP6qD2uSDzcVoQxkjicT8G8RvaNi0Nre+8
	kUGIRJZCaRSisv2tYVxniDIgRgpdy630xeuMFE8H5EZRm7MKAQ2KiEgJLTE47MfBsWQswk0KLkByu
	PnsvFpgs14sMBUtOhYJRnQZELKXL7P6bD0MFujXbcOYA8GQvK7xkWjAi4Kd7X1fJmh5qnJ63pNUQO
	jHatR04A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFC3f-0000000FBmC-03Z1;
	Wed, 14 May 2025 13:22:03 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFAvm-0000000Ez50-0r1I;
	Wed, 14 May 2025 12:09:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=gR0lq2R8NskzCfbSMLb8IMLoPerOeBsRsJsnYVXF+4s=; b=FPZ4rhXTiKsUN3Trjl9BvKpKQu
	oAbXd3SqCcB9iceCXJxRpyGZDqADqKWzvqIO43OZ+MrDU1+FyAtVczJyqlcruLupGYu7l6eHgy75s
	cTbdb0R8ZGmxqmT51E2MsC+6saVq2qKm/yyfEtuIxxbxuxlNj3Vu2ve8CZKdvjGp9/Ug=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uFAvM-00CYMX-QN; Wed, 14 May 2025 14:09:24 +0200
Date: Wed, 14 May 2025 14:09:24 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sky Huang <SkyLake.Huang@mediatek.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	balika011 <balika011@gmail.com>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Steven Liu <Steven.Liu@mediatek.com>
Subject: Re: [PATCH net-next v3 1/2] net: phy: mediatek: Sort config and file
 names in Kconfig and Makefile
Message-ID: <2147e0e3-44c0-4fd8-916d-53291dc86a6a@lunn.ch>
References: <20250514105738.1438421-1-SkyLake.Huang@mediatek.com>
 <20250514105738.1438421-2-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514105738.1438421-2-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_050950_323944_44B7FB6E 
X-CRM114-Status: GOOD (  10.31  )
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

On Wed, May 14, 2025 at 06:57:37PM +0800, Sky Huang wrote:
> From: Sky Huang <skylake.huang@mediatek.com>
> 
> Sort config and file names in Kconfig and Makefile in
> drivers/net/phy/mediatek/ according to sequence in MAINTAINERS.

If you use "make menuconfig" you will notice PHYs are sorted by
tristate string. So having Gigabit before Soc is correct.

> --- a/drivers/net/phy/mediatek/Makefile
> +++ b/drivers/net/phy/mediatek/Makefile
> @@ -1,4 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
> +obj-$(CONFIG_MEDIATEK_GE_SOC_PHY)	+= mtk-ge-soc.o
>  obj-$(CONFIG_MTK_NET_PHYLIB)		+= mtk-phy-lib.o
>  obj-$(CONFIG_MEDIATEK_GE_PHY)		+= mtk-ge.o
> -obj-$(CONFIG_MEDIATEK_GE_SOC_PHY)	+= mtk-ge-soc.o

These should be in alphabetic order based on CONFIG_. So
CONFIG_MTK_NET_PHYLIB is what should move.

    Andrew

---
pw-bot: cr

