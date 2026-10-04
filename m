Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A646CA5FEC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 21:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nXPXirW3eRDsSI9mvG4DFF7E3a00ea/RwmInqyXUVd4=; b=UgE5xrHCbxWoUe8+38PAXYw6iw
	2pS/1Cadp4aJBbPyO5pTh4gb4RTK3a53rwikjgXVabvb8c4JUzh6SdgAIFyVSo9J6pJtZP/Y5GZuT
	BfXg/0MFkzzT6cu6Off37d850VepQevw1B0xLFDmD50qdpLgNSTmIrwNEoaOewMFr0oRC8Et0KJRz
	qAf7PAUc0HvYyR9tkiBQUd8YWMbbLFArGKcJ8DXkh9epqSrtoWbPT6SXIytj5c8oglsfL7EGe6oAq
	jP4RT9VRLnS2wT3F/C6ahEaVXDvQfOmVAwEssPM6DTXft97fmexrma4cz9bANBhefFZ/8wMuUGYAx
	NonBGcIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDTWi-0000000FKhC-3TYB;
	Sun, 04 Oct 2026 21:13:44 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDTWg-0000000FKgZ-02vA;
	Sun, 04 Oct 2026 21:13:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 252944E41168;
	Sun,  4 Oct 2026 21:13:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D2DFD604FE;
	Sun,  4 Oct 2026 21:13:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DD9731032820F;
	Sun,  4 Oct 2026 23:13:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791148417; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=nXPXirW3eRDsSI9mvG4DFF7E3a00ea/RwmInqyXUVd4=;
	b=kCUsydxHi1pBYG/VMU/FQcimtNJep3NIuesye/jvgOjSjEhH/76NRdMy4W334dzAh2mwqL
	NAJrzK4xjqvAQEWVQPuKKWXqgC7W993Gfw7IanqW/t0bd2hSCIZ8YHThNyq8lPs7XLmL+c
	sj8d3hdOigyOeVezUEzMB0h6XSzD+4RUTVJHTD+EoVPHOHXabzSdpDL6RrFoqjTImoGhlX
	xk6jjh850A9O8vO5ZjhDzfrhIrbACQKXO3O/G6ycuany91IVzTe3wlEXh6S7EltG9da2Eo
	INQJBZJLmavvZBTml0LeAhLl7Mt9OxbwWQKNXhSHnfHzXN3ud2jt/NntjLibew==
Message-ID: <aafea01f-546e-47de-9e1d-e404450e78c5@bootlin.com>
Date: Sun, 4 Oct 2026 23:13:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/6] net: stmmac: dwmac-meson8b: add support for the
 Amlogic T7
To: Lucas Tanure <tanure@linux.com>, xianwei.zhao@amlogic.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20261004144046.391444-1-tanure@linux.com>
 <20261004144046.391444-4-tanure@linux.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261004144046.391444-4-tanure@linux.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_141342_195531_CA67C175 
X-CRM114-Status: GOOD (  14.66  )
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

Hi Lucas,

On 10/4/26 16:40, Lucas Tanure wrote:
> The glue registers on the T7 are laid out exactly as the G12A ones, RX
> delay field included, so the T7 can reuse the G12A settings.
> 
> What the T7 does not share is how the controller reaches DRAM: the bus
> path goes through a pipeline stage with a gate of its own, and no device
> other than the controller has any use for that gate. Claim it and hold
> it enabled for as long as the controller is bound, otherwise it is
> switched off as unused and a transfer that has been started can never
> complete.
> 
> Give the T7 match data of its own so that only it looks the clock up,
> and require the clock instead of treating it as optional: the controller
> cannot do DMA without it, and failing the probe with a clear message
> beats booting and hitting an undiagnosable hang later.
> 
> Assisted-by: LLM
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---

[...]

>  
> +static const struct meson8b_dwmac_data meson_t7_dwmac_data = {
> +	.set_phy_mode = meson_axg_set_phy_mode,
> +	.has_prg_eth1_rgmii_rx_delay = true,

Hmpf sorry this falls onto your series, but looking at the code it seems
that this glue has the RGMII handling backwards...

In meson8b_init_rgmii_delays :

         switch (dwmac->phy_mode) {                           
         case PHY_INTERFACE_MODE_RGMII:                       
                 delay_config = tx_dly_config | rx_adj_config;
                 break;                                       
         case PHY_INTERFACE_MODE_RGMII_RXID:                  
                 delay_config = tx_dly_config;                
                 cfg_rxclk_dly = 0;                           
                 break;                                       
         case PHY_INTERFACE_MODE_RGMII_TXID:                  
                 delay_config = rx_adj_config;                
                 break;                                       
         case PHY_INTERFACE_MODE_RGMII_ID:                    
         case PHY_INTERFACE_MODE_RMII:                        
                 delay_config = 0;                            
                 cfg_rxclk_dly = 0;                           

This is the behaviour one would expect from a PHY perspective.

And indeed, 66 amlogic dts have "phy-mode = rgmii".

grep "phy-mode = \"rgmii\"" $(find arch/ | grep amlogic) | wc -l
66

I really think all these 66 "rgmii" instance should have been "rgmii-id"...

It's probably too late to change that though :(

Maxime

