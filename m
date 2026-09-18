Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F63C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 06:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YaeovCCcKo4LXDy70ugQFFbgV9Ov4ukWmKtdxBtxQ+w=; b=uAMx7X9L0ckrnbKZot8O1OiXgy
	fRPVg1OXuwKTTRJ61xQd+vjxlqwjj77v0xUkzfDih1XQ5vb/2A0kRosbW8GFIenpSqQyjMLwch6R1
	/7jYYbOKzC4HwnNsFBpTIlZrJCo9UbCBk99nCRqHlF/KItf2bs2qsnhDLXNt5IEe+fYBeAbe4tVo6
	ib6lz04eRfuvCpSNNE4FNaV7knarnRk3rDqr3+HMZUBd3DUSvby1LQl13OdQeZBiWatxmIt1AXNpI
	JxGteCgWe7YI04TmCnsCPfLiagABi6+RMbJhohGxdzhJLmLPwcrLNJBde2Ng6HnwfR0RWRbhii8nT
	WUgarR1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7S5N-0000000DZbU-0qGV;
	Fri, 18 Sep 2026 06:28:37 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7S5J-0000000DZav-2G3q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 06:28:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 43200C5846A;
	Fri, 18 Sep 2026 06:29:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 79C7E60649;
	Fri, 18 Sep 2026 06:28:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D826811C7B021;
	Fri, 18 Sep 2026 08:28:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789712909; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=YaeovCCcKo4LXDy70ugQFFbgV9Ov4ukWmKtdxBtxQ+w=;
	b=c2PMFaP2a+305bFeri5vtlqTR+1XwXfM/gXP6oKloXDIAu/G/wPE5IQKnaG4aJ8zkXArPV
	kyhhYv50l773fscKGmHA8H2tJBz3tW6WdrWkoXgq3Y6UGS8iF2wBfCYardyKZczx5DoCX4
	bdRrfNyr9/dDtpq6jJsyFZ1VkPhW0tE0NjTDYNZ1b733PZR7SBVEMgeeIkGvsNpkn16oWg
	kPuVjf19HuCUK/f2+bRfy6FU5nwnefwKZG02zWQ4LSuz2zaXR1qiTbTEjsW3ixhtlH46po
	+olofKih/bQ4WOtvVtPAPjSyEwaVkjjBL/XjxM56BgPgAE7J3i5tBDNdEYD6QA==
Message-ID: <a5b6164c-776a-432a-906f-b98d67c529db@bootlin.com>
Date: Fri, 18 Sep 2026 08:28:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 3/3] net: stmmac: sun8i: add support for
 Allwinner H616 EMAC1
To: James Hilliard <james.hilliard1@gmail.com>,
 Richard Genoud <richard.genoud@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Alastair D'Silva <alastair@d-silva.org>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260917-submit-h616-emac1-v1-v3-0-62cb8316e19b@gmail.com>
 <20260917-submit-h616-emac1-v1-v3-3-62cb8316e19b@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260917-submit-h616-emac1-v1-v3-3-62cb8316e19b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_232833_768282_E99CBE89 
X-CRM114-Status: GOOD (  16.98  )
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

On 9/17/26 19:55, James Hilliard wrote:
> The H616 secondary EMAC uses a separate system-control clock register
> and supports only RMII at 10/100 Mbps. It connects internally to the
> co-packaged AC200 or AC300 EPHY and has no external PHY pins.
> 
> Add an EMAC1 variant using the dedicated register and enable only RMII.
> Leave PHY initialization to the PHY driver instead of using the H3
> internal-PHY controls. No RX or TX clock delays are configured for this
> RMII-only variant.
> 
> Co-developed-by: Richard Genoud <richard.genoud@bootlin.com>
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Thanks :)

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 4523a14f5e0c..1020168f1c3a 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -81,6 +81,13 @@ static const struct reg_field sun8i_syscon_reg_field = {
>  	.msb = 31,
>  };
>  
> +/* EMAC1 clock register @ 0x34 in the "system control" address range */
> +static const struct reg_field sun8i_syscon_reg_field_emac1 = {
> +	.reg = 0x34,
> +	.lsb = 0,
> +	.msb = 31,
> +};
> +
>  /* EMAC clock register @ 0x164 in the CCU address range */
>  static const struct reg_field sun8i_ccu_reg_field = {
>  	.reg = 0x164,
> @@ -143,6 +150,13 @@ static const struct emac_variant emac_variant_h6 = {
>  	.tx_delay_max = 7,
>  };
>  
> +static const struct emac_variant emac_variant_h616_emac1 = {
> +	.syscon_field = &sun8i_syscon_reg_field_emac1,
> +	/* The co-packaged AC200/AC300 PHY does not use the H3 PHY controls. */
> +	.soc_has_internal_phy = false,
> +	.support_rmii = true,
> +};
> +
>  #define EMAC_BASIC_CTL0 0x00
>  #define EMAC_BASIC_CTL1 0x04
>  #define EMAC_INT_STA    0x08
> @@ -1276,6 +1290,8 @@ static const struct of_device_id sun8i_dwmac_match[] = {
>  		.data = &emac_variant_a64 },
>  	{ .compatible = "allwinner,sun50i-h6-emac",
>  		.data = &emac_variant_h6 },
> +	{ .compatible = "allwinner,sun50i-h616-emac1",
> +		.data = &emac_variant_h616_emac1 },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, sun8i_dwmac_match);
> 


