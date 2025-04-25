Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BCD1C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 23:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=imM+ks2tbggHAW5y2t+eA5BzrhcUOcSnoz31iIz0VjI=; b=TmPJs6vbbPxXZ4sHHckH7a1fnh
	DxQPAtZQUJFjPCBv1q2j8hhPig/ZrwdbzjWY3nVO/FDv1PZmCUNEMp3EGdM+QmTHCSwSpOe1Zxr6J
	LX+MEi/JMD4E+7GaVs0cnXeVFEG3fsXqGxDK5w1+qTacy7n95vsgoTZke5/RJoQl7Pmv+MjkHx0uM
	4h5DW2ZQ6bDicVeSGG16LDdUFWzIEB8bz0clZz29tObAxbZX+/KaI25kkG9tau/4u8z85oYhBqI+w
	ig0bR9UT2bbAvQu0IDedl5CZuioozXr3nm04eR+B2xQqaeCP/UtJC01iVnUoawBs6pyc23ShsYGi6
	/jxGxvng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8SBh-000000016BA-0E28;
	Fri, 25 Apr 2025 23:10:29 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8S9p-0000000163D-2Evu;
	Fri, 25 Apr 2025 23:08:34 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1u8S3r-000000006ep-4AcF;
	Fri, 25 Apr 2025 23:08:19 +0000
Date: Sat, 26 Apr 2025 00:08:16 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Eric Woudstra <ericwouds@gmail.com>, Elad Yifee <eladwf@gmail.com>,
	Bo-Cun Chen <bc-bocun.chen@mediatek.com>,
	Sky Huang <skylake.huang@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next] net: ethernet: mtk_eth_soc: add support for
 MT7988 internal 2.5G PHY
Message-ID: <aAwV4AOKYs3TljM0@makrotopia.org>
References: <ab77dc679ed7d9669e82d8efeab41df23b524b1f.1745617638.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab77dc679ed7d9669e82d8efeab41df23b524b1f.1745617638.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_160833_572962_B3D8F166 
X-CRM114-Status: GOOD (  17.63  )
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

On Fri, Apr 25, 2025 at 10:51:18PM +0100, Daniel Golle wrote:
> The MediaTek MT7988 SoC comes with an single built-in Ethernet PHY
> supporting 2500Base-T/1000Base-T/100Base-TX/10Base-T link partners in
> addition to the built-in MT7531-like 1GE switch. The built-in PHY only
> supports full duplex.
> 
> Add muxes allowing to select GMAC2->2.5G PHY path and add basic support
> for XGMAC as the built-in 2.5G PHY is internally connected via XGMII.
> The XGMAC features will also be used by 5GBase-R, 10GBase-R and USXGMII
> SerDes modes which are going to be added once support for standalone PCS
> drivers is in place.
> 
> In order to make use of the built-in 2.5G PHY the appropriate PHY driver
> as well as (proprietary) PHY firmware has to be present as well.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> [...]
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> index 88ef2e9c50fc..e3a8b24dd3d3 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> [...]
> @@ -587,6 +603,10 @@
>  #define GEPHY_MAC_SEL          BIT(1)
>  
>  /* Top misc registers */
> +#define TOP_MISC_NETSYS_PCS_MUX	0x84

This offset still assumes topmisc syscon to start at 0x11d10000.
If the pending series[1] adding that syscon at 0x11d10084 gets merged
first, this offset will have to be changed to
#define TOP_MISC_NETSYS_PCS_MUX	0x0

[1]: https://patchwork.kernel.org/project/linux-mediatek/patch/20250422132438.15735-8-linux@fw-web.de/

