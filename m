Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713DBEF9002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 16:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xYK5YnD6PK/wRtLBidA/fCTqYSAI3vOMVTapurd9A8Y=; b=dRyt91bOe23gl69z22AuHRTec5
	oUmJp2RP0Wo0tLptNc96IgQuajNwwGoBggorMm6V/gEkAkw1fjVSkaieTNAXTfZYDqkm6jit7B7+O
	EMSbV3XsqrtendicYh39Ccto4UPp7BzVnCeyfPx2xttrXlTK/ZmAETfzR0A2qD5Cxq4Rr0/RkaxZ3
	y3XROscCRA77NopsEFiDewi3qHBYoBU5YdeCYkmDGtR6bxfRt7OuIQJuaB5fPglFTzR22lUMN+clK
	Zs0DJoY1fzu043DjloTNBNmUUKbHSzfMqL5Duii1Xy8CmolK+r/x/gGwHz0pc0AIg9PpQDuOwh+l5
	2u+h6bsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxp0i-000000004LL-0MsS;
	Wed, 04 Mar 2026 16:23:44 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxp0f-000000004Kc-220P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 16:23:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9AE3E4E42542;
	Wed,  4 Mar 2026 16:23:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6EF075FF5C;
	Wed,  4 Mar 2026 16:23:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 283D410369745;
	Wed,  4 Mar 2026 17:23:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772641418; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=xYK5YnD6PK/wRtLBidA/fCTqYSAI3vOMVTapurd9A8Y=;
	b=yGk6nEO0rstImCcR4sXznwq84+ePnnVkTr6gEwdBElr3pI/cDPbrjQaxQP0UfyIHkCs774
	Z2adwc+dB4YfTmgMM9/qs2jAj8vXpsc5osuo5k2ZUqSwpx1Co9+Mf7G2mQOILt0QcBP8Rh
	U5IV7CVWBOEwI6ST4iQxnaWK8fDguHvQ/henEU0zb5D9wBEV0CyNYfRtbsiyi7G1AT2gTQ
	LSkDw29j+3ZS8vNFagkVhAsjvpQ0afMCcnoaeeq6m1Hi2lKH3JyPrgWsztIzsGDPYxdZKE
	EdDztObWY5q1egJhJcLS1hkbRnCn/2UDLFwdIeHiMX4gO4gKVaDfPWP7p5qvtQ==
Message-ID: <2069cdfb-7c67-4047-a35f-f1e976a03122@bootlin.com>
Date: Wed, 4 Mar 2026 17:23:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC net-next v2 3/7] net: stmmac: use integrated PCS for
 BASE-X modes
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <aafxqCvJ_XY4YbWw@shell.armlinux.org.uk>
 <E1vxhuo-0000000BqGW-0YDF@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vxhuo-0000000BqGW-0YDF@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_082341_661604_094C3EB1 
X-CRM114-Status: GOOD (  20.94  )
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

Hi Russell,

On 04/03/2026 09:49, Russell King (Oracle) wrote:
> dwmac-qcom-ethqos supports SGMII and 2500BASE-X using the integrated
> PCS, so we need to expand the PCS support to include support for
> BASE-X modes.
> 
> Add support to the prereset configuration to detect 2500BASE-X, and
> arrange for stmmac_mac_select_pcs() to return the integrated PCS if
> its supported_interfaces bitmap reports support for the interface mode.
> 
> This results in priv->hw->pcs now being write-only, so remove it.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/common.h      | 4 ----
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 ++------
>  2 files changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
> index 42a48f655849..91116acf3273 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/common.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/common.h
> @@ -277,9 +277,6 @@ struct stmmac_safety_stats {
>  #define FLOW_TX		2
>  #define FLOW_AUTO	(FLOW_TX | FLOW_RX)
>  
> -/* PCS defines */
> -#define STMMAC_PCS_SGMII	(1 << 1)
> -
>  #define SF_DMA_MODE 1		/* DMA STORE-AND-FORWARD Operation Mode */
>  
>  /* DMA HW feature register fields */
> @@ -634,7 +631,6 @@ struct mac_device_info {
>  	unsigned int unicast_filter_entries;
>  	unsigned int mcast_bits_log2;
>  	unsigned int rx_csum;
> -	unsigned int pcs;
>  	unsigned int num_vlan;
>  	u32 vlan_filter[32];
>  	bool vlan_fail_q_en;
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 029e9b518160..2e7edc3e82f2 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -945,11 +945,8 @@ static struct phylink_pcs *stmmac_mac_select_pcs(struct phylink_config *config,
>  			return pcs;
>  	}
>  
> -	/* The PCS control register is only relevant for SGMII, TBI and RTBI
> -	 * modes. We no longer support TBI or RTBI, so only configure this
> -	 * register when operating in SGMII mode with the integrated PCS.
> -	 */
> -	if (priv->hw->pcs & STMMAC_PCS_SGMII && priv->integrated_pcs)
> +	if (priv->integrated_pcs &&
> +	    test_bit(interface, priv->integrated_pcs->pcs.supported_interfaces))
>  		return &priv->integrated_pcs->pcs;
>  
>  	return NULL;
> @@ -1208,7 +1205,6 @@ static void stmmac_check_pcs_mode(struct stmmac_priv *priv)
>  
>  	if (priv->dma_cap.pcs && interface == PHY_INTERFACE_MODE_SGMII) {
>  		netdev_dbg(priv->dev, "PCS SGMII support enabled\n");
> -		priv->hw->pcs = STMMAC_PCS_SGMII;
>  
>  		switch (speed) {
>  		case SPEED_10:


