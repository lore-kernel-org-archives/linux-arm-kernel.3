Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9251FC44500
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 09:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XBeM8FpMwD3pKufhetzZqJBiCZzgpSkF0FmvSwNMHYc=; b=uw+qCB3FqoAodm7K56cgkBETBs
	B4eC5jnb0VOVr3piyJbZiLhjgBfcvnjpSaQHbKn+Zynv8zSIn4ywjI0b4ZhbLEgGhoagh5z0+heqk
	eHvNivjNjsQVAKgFsR/ooLBNq4gExvoJDTxuOSR8kngQoSDOwO9F5K1t1cwgPu3C86jd1ymxZN/3l
	BEffoyZtvWF/ZUnSFLsUPGZhWVAWCmW1Icw157PQGXk1mHZr1AaK3/O0dXUqdCyh0AQ4gz0XcWTaq
	HAHYqnA65OJHKX3IAUsXPRQfCPN980sXcGB1fmobYJgFFW46IGqXjSGi9nwh3zehcpj6WRqZjMJC8
	8M7+ZuiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1k1-0000000EZKg-3riA;
	Tue, 07 Jul 2026 09:05:21 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1jz-0000000EZJl-2Myl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 09:05:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 85BBE1A0EB6;
	Tue,  7 Jul 2026 09:05:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5580B601A3;
	Tue,  7 Jul 2026 09:05:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 097F311BC1136;
	Tue,  7 Jul 2026 11:05:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783415115; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=XBeM8FpMwD3pKufhetzZqJBiCZzgpSkF0FmvSwNMHYc=;
	b=tfJBErtWIOOK6XwhgohMEmN6kP0kMYICUQVd/LcoQiS2XsF6PT9MIlZe+fH08AFMP3i5Hb
	HkSRb9JyRhXNE3zc4IlsOwTTjOBEOn6bo8r8kegmQFvdCLmJfZ+pJG0XYnvEb4DXbnlhri
	v9dBaC7ZkZ6unqYXJyzg3YJChvJOncjmIL6W4ZH0QbyP0DKP2FsUCJZNTvhICHUVBERXzO
	ovYKlGAffZyHWCoesT6uDt2C3+aMAJ88JKnaJ07HBoOfT/V9FSpuoAt5zq9x6Qrx9BKfOW
	00ivLLF45LxeApvxGmxgmes9ymYMN6XiCqyOZ7TvOG3+Mazs69pHFSJKeIt49Q==
Message-ID: <5dbd217b-8df5-42cd-9197-36e0fb91ffe7@bootlin.com>
Date: Tue, 7 Jul 2026 11:05:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 3/6] net: stmmac: mediatek: rename MT2712 and
 MT8195 variant methods
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Biao Huang <biao.huang@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: rmk+kernel@armlinux.org.uk, kernel@collabora.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260707-dwmac-mediatek-mt8189-v1-0-17f345eaaca3@collabora.com>
 <20260707-dwmac-mediatek-mt8189-v1-3-17f345eaaca3@collabora.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260707-dwmac-mediatek-mt8189-v1-3-17f345eaaca3@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_020519_737951_ACAA0D9E 
X-CRM114-Status: GOOD (  13.10  )
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



On 7/7/26 10:21, Louis-Alexis Eyraud wrote:
> In preparation of newer SoC support, rename MT2712 and MT8195 variant
> methods and sub functions to more generic names.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-mediatek.c   | 32 +++++++++++-----------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> index 0cabab4fd89a..28e87990b0a1 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> @@ -110,7 +110,7 @@ static const char * const mt8195_dwmac_clk_l[] = {
>  	"axi", "apb", "mac_cg", "mac_main", "ptp_ref"
>  };
>  
> -static int mt2712_set_interface(struct mediatek_dwmac_plat_data *plat,
> +static int set_phy_interface_v1(struct mediatek_dwmac_plat_data *plat,
>  				u8 phy_intf_sel)

What does this naming of "v1 / v2" refer to ?

I personally don't find it much better than the current one prefixed by the SoC
name. You still end-up using registers that have the "MT8195_" prefix in their
names in the 'v2' variants of these functions, so it still sound SoC-family specific :)

I'd say you can keep the original names as-is, or if you really want a rename,
maybe use the mt81xx_ prefix for MT8195 and MT8189 ?

Maxime

