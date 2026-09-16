Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3283CC88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 06:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jabO0Vkelw7YcG1ABQs8mqKscqLCLVOyf7S9T+mfSyc=; b=DeV8VvKdvFZFHfdSiz65dSSo8R
	E8u+dl1RLUR3VK1yDyzFKdam1YvNnYrBnjjcIQY1BD48MRw5a5PAUx0dXOqR+LGYjeUjCPrnmCziK
	Bx6KLKugxLMAwvoxtSfB1Ym5K/FSaXqWctAkhncx3LCQT79K5pNTyggSIgIm1xKuR3Kf497ENakjA
	7sjyDMtJ8sKLrqOAdawVxwxNSEQXqes7Wkh4VMz2nf1d0bEnPPbItcAL24CudmR7Zoop+aXKNxVfs
	/Wav/im2ZJju7Ib1Ji1KsETVjLETyBvqjwihPZIgsdI3vjv/Q5mdfVzZmhYW1948I+YzAqKD6Gt0y
	4Gqj5YQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6j4u-00000008TUA-1dKl;
	Wed, 16 Sep 2026 06:25:08 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6j4r-00000008TTM-0uFK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 06:25:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EE0A21A0887;
	Wed, 16 Sep 2026 06:25:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B74B160337;
	Wed, 16 Sep 2026 06:25:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 18C7511C7AFE7;
	Wed, 16 Sep 2026 08:24:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789539900; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=jabO0Vkelw7YcG1ABQs8mqKscqLCLVOyf7S9T+mfSyc=;
	b=Y98w0ZPF+sNCwXVAxHFjCeiyJ+M9FlZR3R2c9wasf1cNUtPJWT+zItZFrYnxjaf/YyRCOp
	/o1iCcX1HWCVrDa83SMc189JL9PmH0jyIGJ/26KZMtGdoqIIPv9UWQI2eTMjpNTD1+kVz8
	Qiui8abKYXvE4i2bKCh30zvX50N+mHfx98VbT3kbeCBlCO1WHj5oQttlJnQM8EF9H8jSmj
	YJ17jBpkkDhejj8OCzCObk/+E+0NFIGOPB/MGouT4/z56X1cGwZMYRi5ccNlIqoDX622qI
	3+s57szpuuFoD7udZRPVCTT7Si6RD61IvtnqJiW2WFL9zefMNlMyQTAKPn9jKw==
Message-ID: <579d7650-583e-49bd-aa51-02fc52940ea1@bootlin.com>
Date: Wed, 16 Sep 2026 08:24:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 4/4] net: stmmac: dwmac-sun8i: Add Allwinner H616
 EMAC clock index and internal PHY support
To: Alastair D'Silva <alastair@d-silva.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, James Hilliard <james.hilliard1@gmail.com>,
 richard.genoud@bootlin.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
References: <20260916044119.475666-1-alastair@d-silva.org>
 <20260916044119.475666-5-alastair@d-silva.org>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260916044119.475666-5-alastair@d-silva.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_232505_421230_333C7BE5 
X-CRM114-Status: GOOD (  16.74  )
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

Hi,

On 9/16/26 06:41, Alastair D'Silva wrote:
> Support EMAC1 and the internal Fast Ethernet PHY (AC300) on Allwinner
> H616 and H618 SoCs:
> - Allow reading a register index from the syscon property to offset the
>   regmap field for EMAC1's dedicated clock control register.
> - Add emac_variant_h616_internal with support for internal PHY, MII,
>   RMII, and RGMII modes.
> - Delay the MAC software reset until sun8i_dwmac_init() when using the
>   internal PHY, ensuring the PHY has powered on and begun generating
>   the receive clock before the MAC attempts to reset.
> - Skip setting H3_EPHY_SELECT for H616 internal EMAC, which does not
>   use the H3-style EPHY select bit.
> - Handle -EPROBE_DEFER cleanly during clock and reset control acquisition
>   in get_ephy_nodes().
> 
> Assisted-by: LLM
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---

Even if this is a duplicate some of the work done by James Hilliard, this
raises interesting points.

> Notes:
>     Tested on Mellow Fly-C5 (Allwinner H618) under Armbian, verifying stable
>     EMAC1 probe, deferred soft reset with the internal AC300 EPHY, and 100M full
>     duplex operation under load.
> 
>  .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 65 ++++++++++++++++---
>  1 file changed, 55 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 48c52eb96233..1728893589a6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -130,6 +130,16 @@ static const struct emac_variant emac_variant_a64 = {
>  	.tx_delay_max = 7,
>  };
>  
> +static const struct emac_variant emac_variant_h616_internal = {
> +	.syscon_field = &sun8i_syscon_reg_field,
> +	.soc_has_internal_phy = true,
> +	.support_mii = true,
> +	.support_rmii = true,
> +	.support_rgmii = true,
> +	.rx_delay_max = 31,
> +	.tx_delay_max = 7,
> +};
James's series [1] says this SoC only supports RMII (yet includes RGMII timing
control), and here for seemingly the same device, there's MII and RGMII
support listed.

[1] : https://lore.kernel.org/r/20260915-submit-h616-emac1-v1-v1-0-195de0bb1f8a@gmail.com

Maybe you can coordinate with one another, can we connect that SoC to a non-internal PHY ?
If so, can we use MII, RMII and RGMII ? or is it just RMII ?

Maxime

