Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A5BC79FBF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 18:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/+pU6ZgQAiGZKGcKxP3SC863oMBmGRN04Vxg/9uCdkE=; b=UH+Tl81SNwcD59Slo0o7J+HFHa
	OwNedpiZIrAgCcH6au0GXKOMJGqcbkqVTXnvrUrMf+kXW3QqsAyY0ja7WCoKH3JV5gx0CMOAdc+eQ
	dOdTHcX34OcnG0C1sSgQD5BejZmsHPlu8AyogPIRCNvrzKWkHQuK4YEgHod/GR6G4zHzRO4zj5u58
	+Jec4y42SGQI3u2LAVwKJgKDg0BEUdYLkNJ3P5SdujIquP7+ccFy5K7TNeDTlg3JiD7q4Q6moeFd6
	Vk6Zfc8Khb2N+4xaB7H/cSap+b6+2eYhovpJh/Th+LWCeXtRWo7EJMf2jus0vK0nwLeU17aAV1Tt9
	39VcflIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jH2-0000000F87G-0PBO;
	Thu, 10 Sep 2026 18:13:24 +0000
Received: from mail.tipi-net.de ([2a03:4000:43:185::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jGz-0000000F86Q-20WU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 18:13:22 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7980AA02B3;
	Thu, 10 Sep 2026 20:13:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1789063999; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/+pU6ZgQAiGZKGcKxP3SC863oMBmGRN04Vxg/9uCdkE=;
	b=VI4/m9b8+KveIb6M++Yu+/SnXHxT+c8vDBoisi18XKnjSogthyL85LHqFX8A7eHGZ9YLyO
	+hPN4bOayxcq4RyenVOcOtkHZZsZmxXAK7P9JvVqhFTUUUO7UVnRNsDMJYlsiPbP2CRRJp
	aWY5SCSt71jBcI8HXRBjyDlvehpSq17SX8799SCEujdBfBBWwEAGgC5/d8md8ekx8YKbxj
	xfCn3xXIFuESXtLdOIUDXkAw+nmkl3zfkltXhT+0w8glRqWiOfERpbmG+6ZSilUOPa0BYY
	YTFkIkpDS+je2IiDNtZH8FeYHBw57ta+6gQTUfW3jQ34eNhpDGUfyh1U6xy2Cw==
MIME-Version: 1.0
Date: Thu, 10 Sep 2026 20:13:18 +0200
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>, Heiner Kallweit
 <hkallweit1@gmail.com>, =?UTF-8?Q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Emil Renner Berthing
 <kernel@esmil.dk>, Minda Chen <minda.chen@starfivetech.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jan Petrous <jan.petrous@oss.nxp.com>,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>, Jose.Abreu@synopsys.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, PKneuper@dspace.de, David Laight
 <david.laight.linux@gmail.com>
Subject: Re: [PATCH net v2 3/6] net: stmmac: selftests: Check the
 dev->features for S-TAG offload testing
In-Reply-To: <20260910151404.976753-4-maxime.chevallier@bootlin.com>
References: <20260910151404.976753-1-maxime.chevallier@bootlin.com>
 <20260910151404.976753-4-maxime.chevallier@bootlin.com>
Message-ID: <cad778a3c7ad53119325ca091f879fc5@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_111321_678798_F3D2968E 
X-CRM114-Status: GOOD (  15.67  )
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

On 10.9.2026 17:14, Maxime Chevallier wrote:
> The S-TAG offload insertion incorrectly checks the dvlan (double vlan)
> DMA cap, which is different than S-TAG support. Use
> NETIF_F_HW_VLAN_STAG_TX to check if the feature is supported instead.
> 
> Note that this flag isn't set in stmmac yet, but contrary to ARP
> offload, this is a feature that has a chance to get there eventually so
> let's leave the selftest here for now. It'll report -EOPNOTSUPP in the
> meantime.
> 
> Fixes: 091810dbded9 ("net: stmmac: Introduce selftests support")
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c 
> b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
> index a8280834185c..f3a533bc6bb6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
> @@ -1405,7 +1405,7 @@ static int stmmac_test_vlanoff(struct stmmac_priv 
> *priv)
> 
>  static int stmmac_test_svlanoff(struct stmmac_priv *priv)
>  {
> -	if (!priv->dma_cap.dvlan)
> +	if (!(priv->dev->features & NETIF_F_HW_VLAN_STAG_TX))
>  		return -EOPNOTSUPP;
>  	return stmmac_test_vlanoff_common(priv, true);
>  }

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks,
Nicolai

