Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A6FDC369B4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 12:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MRuXrPBW/chMOMwl0EQaQVFmxdvAMs4cWLYBDeeV3FA=; b=VQ1nj9Le59fz1uTh99Sh2CHSy2
	T/wYOpAp2tpf/I6nfp0a+Uld5V72XqzD+P8/ev65+FnKbeu36xLGFQjERKpew2Ay+8RvzZ9yztflW
	wjLL+peBwgm0cukTfXTk0Dfuh7UYlX0kMt4G88i5/kwhEPPya8xzmfLrSX5zKOCt9pwmzW8PNaiFK
	U7E0ByWM7U325Iu/P224h0Z+0uBlj2UYeXY6cpGiD+jJa0GJGUGSts/qmQ/ltu+MPMqnDP/elT1H9
	l2RjRAr/ybuDIeiSXBQzyt7mWXYPsC70ovVsM0ehBv5G/QNIkLZJZigOd+qmHx/Fb4jbk+p9wqU+z
	0//6tbWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4fQd-00000005kNy-327v;
	Tue, 15 Apr 2025 12:30:15 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4e56-00000005Rzf-2Jpx;
	Tue, 15 Apr 2025 11:03:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744715035;
	bh=lUToVI8Z/K9zO1OtdRIhMl49m6xry/jiX60OGbZaB2k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YB2LeLK53zM5wnal3/5LdwZuEdiAdT6qJeQDYro80Ax9Xfju3AE5UYo53K5ZVlP1N
	 P71Z5m12GuH2SU6nOKGx1TFoiBrEPQj455/XXZd68Eo0rYAllkLu10H0a8w7d7B8AK
	 DdPcjsQQzLqfFitTp8VsYcpMA5Yzalxw5YnDeylb5koIkmblOwfvoT9BNxHXkeY8MJ
	 LRr64TSiXxaulbM6yCnRAPdzFCcbdj5yjXMpOHMqlewuBBz71K8rreuEGhUOJ3kmeg
	 GuBnBhHNKLehg+EAtoyG0hfQLNC4exwT1+hAaNMPB4Ke9ubV3ghwPWz0qN9v1hSkAi
	 Iz3JOSY8GUzWA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0FEDA17E0B2D;
	Tue, 15 Apr 2025 13:03:54 +0200 (CEST)
Message-ID: <b29cfa5e-da21-4c6a-be44-dd091e109650@collabora.com>
Date: Tue, 15 Apr 2025 13:03:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next PATCH] net: phy: mediatek: init val in
 .phy_led_polarity_set for AN7581
To: Christian Marangi <ansuelsmth@gmail.com>,
 Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Simon Horman <horms@kernel.org>
References: <20250415105313.3409-1-ansuelsmth@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250415105313.3409-1-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_040356_743208_CD2F1D30 
X-CRM114-Status: GOOD (  14.65  )
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

Il 15/04/25 12:53, Christian Marangi ha scritto:
> Fix smatch warning for uninitialised val in .phy_led_polarity_set for
> AN7581 driver.
> 
> Correctly init to 0 to set polarity high by default.
> 
> Reported-by: Simon Horman <horms@kernel.org>
> Fixes: 6a325aed130b ("net: phy: mediatek: add Airoha PHY ID to SoC driver")
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>   drivers/net/phy/mediatek/mtk-ge-soc.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/net/phy/mediatek/mtk-ge-soc.c b/drivers/net/phy/mediatek/mtk-ge-soc.c
> index fd0e447ffce7..cd09684780a4 100644
> --- a/drivers/net/phy/mediatek/mtk-ge-soc.c
> +++ b/drivers/net/phy/mediatek/mtk-ge-soc.c
> @@ -1432,8 +1432,8 @@ static int an7581_phy_probe(struct phy_device *phydev)
>   static int an7581_phy_led_polarity_set(struct phy_device *phydev, int index,
>   				       unsigned long modes)
>   {
> +	u16 val = 0;
>   	u32 mode;
> -	u16 val;

....but that's double initialization then, so....


	u32 mode;
	u16 val;

	if (index >= MTK_PHY_MAX_LEDS)
		return -EINVAL;

	if (modes == 0)
		val = 0;

	for_each_set_bit(.....

Cheers,
Angelo


>   
>   	if (index >= MTK_PHY_MAX_LEDS)
>   		return -EINVAL;
> @@ -1444,7 +1444,6 @@ static int an7581_phy_led_polarity_set(struct phy_device *phydev, int index,
>   			val = MTK_PHY_LED_ON_POLARITY;
>   			break;
>   		case PHY_LED_ACTIVE_HIGH:
> -			val = 0;
>   			break;
>   		default:
>   			return -EINVAL;


