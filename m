Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65F3C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 16:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zveFC+DCeyUy9R6NLpUSASrc6x7PEEiqzijTWhrIo/M=; b=iXNrT0Vi2z/opMR123pAubqltn
	JvdlfX8sw1p0CyCFj0QFkl1HxVcY2n7gtWM9XOaXSZe3RKV0pLe5FrSGU4fTF2Lvaw0T6HGCk/FgG
	zeOnauYtXJ1eMFEx8eI7ugK8gHc2Nnd1KRUOd1YN35lMAoPgVMXGNam8jXhxXMcwOWMqikC/s28a2
	ufWaXGrG9Fqs8pC8nRKQfRgn0D2LcTViLoxFYkxxNkn84sM9HwOO0xQ+TKDn+CxgipdCbvbK7D8n3
	aCeXgOEZZPrqZI+ZToezFc02UB2gDvM/aoujOqyoR7Sf3NK2T2+DqjhPfW62ma2SEOF7OZ82Tw7vq
	omlO0vHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2BRE-00000004juu-2Yqw;
	Tue, 08 Apr 2025 16:04:36 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2BLr-00000004itJ-3QWY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 15:59:04 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1u2BLa-000000000U3-0ZJW;
	Tue, 08 Apr 2025 15:58:46 +0000
Date: Tue, 8 Apr 2025 16:58:39 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Simon Horman <horms@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.or
Subject: Re: [net-next PATCH 1/2] net: phy: mediatek: permit to compile test
 GE SOC PHY driver
Message-ID: <Z_VHr8ub-uXJy53y@makrotopia.org>
References: <20250408155321.613868-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408155321.613868-1-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_085903_846541_D9136A32 
X-CRM114-Status: GOOD (  18.56  )
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

On Tue, Apr 08, 2025 at 05:53:13PM +0200, Christian Marangi wrote:
> When commit 462a3daad679 ("net: phy: mediatek: fix compile-test
> dependencies") fixed the dependency, it should have also introduced
> an or on COMPILE_TEST to permit this driver to be compile-tested even if
> NVMEM_MTK_EFUSE wasn't selected. The driver makes use of NVMEM API that
> are always compiled (return error) so the driver can actually be
> compiled even without that config.
> 
> Fixes: 462a3daad679 ("net: phy: mediatek: fix compile-test dependencies")
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Acked-by: Daniel Golle <daniel@makrotopia.org>

> ---
>  drivers/net/phy/mediatek/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/phy/mediatek/Kconfig b/drivers/net/phy/mediatek/Kconfig
> index 2a8ac5aed0f8..c80b4c5b7b66 100644
> --- a/drivers/net/phy/mediatek/Kconfig
> +++ b/drivers/net/phy/mediatek/Kconfig
> @@ -16,7 +16,7 @@ config MEDIATEK_GE_PHY
>  config MEDIATEK_GE_SOC_PHY
>  	tristate "MediaTek SoC Ethernet PHYs"
>  	depends on (ARM64 && ARCH_MEDIATEK) || COMPILE_TEST
> -	depends on NVMEM_MTK_EFUSE
> +	depends on NVMEM_MTK_EFUSE || COMPILE_TEST
>  	select MTK_NET_PHYLIB
>  	help
>  	  Supports MediaTek SoC built-in Gigabit Ethernet PHYs.
> -- 
> 2.48.1
> 

