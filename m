Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA885C79FBF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 18:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NCSCPPuYHaQkAspiPMvoQKxLvMSwoarAK+y1e0lenDw=; b=slCkwGrtzkrTsiaMeo+sdkZQa7
	KOWBwmsy01Rx1Z3YDxVk12oB9h+u+Zloizv5InNRP8ms4fEPlbG7z2Pt/07zc+LW1ozI9vs/Vmgxe
	YraBCud+mMjMKtOhfq4NFkqEgreUz+MVcds4mzJHzQN0Xg+lB5RDVdca+VP3cGLzZn9gIBmuI1/Jy
	46y6WatishevFQtpuvR2SEFS7jKx/04NoPGzpOxHB6N2nQi2ll/DF5C+0X0O8JkCSe5QOkQ/UxXBh
	HrML1XQNLSXxapsulWwW3yHvF9mdx9GncKMU5PmAQfduMbILeTg1WMCy4zGhOAYIvKKFAT0o7AYKH
	3g9ukkbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jHL-0000000F8BX-0ufY;
	Thu, 10 Sep 2026 18:13:43 +0000
Received: from mail.tipi-net.de ([2a03:4000:43:185::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jHJ-0000000F8Aj-16OS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 18:13:42 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F04CCA0580;
	Thu, 10 Sep 2026 20:13:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1789064019; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NCSCPPuYHaQkAspiPMvoQKxLvMSwoarAK+y1e0lenDw=;
	b=AJ4z/JRxku+KUEDMbabI7GEjsv6B5Tzpbt7Q1vurzT6b1NHk7IgI5EkN2k5KncP9WSnDS6
	IlYvdO8bku7rTDKct2ndEl/pqAhm6jlwW65ovQshFnm/TzUDVxGCRT7pl2cOhqTRPJ2sz7
	c1xrLFzWV8oNQeTvjJhtk59aWwc+nqL4Zz7i5z/8blsDwQj3ogg8pAJpJi+mswfDnQ3kH7
	2qobBEX2cSULtfGcZCIaDWs3Y2o1w1OXHnr+p64KL51JNnfj2iha1pJtBm0VE24m7VV091
	WeDWyC0lHSSlQwF7/hZnYlPLWAgsgt1CxzVMNU41pyWCJZ2iGacf4STZIwWpdw==
MIME-Version: 1.0
Date: Thu, 10 Sep 2026 20:13:37 +0200
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
Subject: Re: [PATCH net v2 4/6] net: stmmac: selftests: Capture all packets
 for vlan checks
In-Reply-To: <20260910151404.976753-5-maxime.chevallier@bootlin.com>
References: <20260910151404.976753-1-maxime.chevallier@bootlin.com>
 <20260910151404.976753-5-maxime.chevallier@bootlin.com>
Message-ID: <ffa7e2ca24b7a0d6a66d8213a8fb5daf@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_111341_465356_4D545D0C 
X-CRM114-Status: GOOD (  16.97  )
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
> While we use vlan_vid_add to trigger the tag filtering machinery
> in the driver, there's no netdev associated to the VLAN. This causes 
> the
> skb to arrive with empty skb->vlan_tci fields, as the packet is marked
> OTHERHOST in __netif_receive_skb_core(), and we fail our validation.
> 
> Let's use the proxy mechanism introduced for DSA, that registers a
> ETH_P_ALL packet handler that runs earlier, before the vlan netdev
> lookup, then filters for the correct ethertype before passing an skb
> clone to our validation function.
> 
> Fixes: 091810dbded9 ("net: stmmac: Introduce selftests support")
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c 
> b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
> index f3a533bc6bb6..ec56ee0031ab 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
> @@ -241,6 +241,7 @@ struct stmmac_test_priv {
>  	__be16 packet_type;
>  	int (*func)(struct sk_buff *skb, struct net_device *ndev,
>  		    struct packet_type *pt, struct net_device *orig_ndev);
> +	bool capture_all;
>  	int double_vlan;
>  	int vlan_id;
>  	int ok;
> @@ -343,7 +344,7 @@ static void stmmac_sft_add_pack(struct packet_type 
> *pt)
>  {
>  	struct stmmac_test_priv *tpriv = pt->af_packet_priv;
> 
> -	if (netdev_uses_dsa(tpriv->pt.dev)) {
> +	if (netdev_uses_dsa(tpriv->pt.dev) || tpriv->capture_all) {
>  		tpriv->packet_type = tpriv->pt.type;
>  		tpriv->func = tpriv->pt.func;
> 
> @@ -994,6 +995,7 @@ static int __stmmac_test_vlanfilt(struct 
> stmmac_priv *priv)
>  	tpriv->pt.dev = priv->dev;
>  	tpriv->pt.af_packet_priv = tpriv;
>  	tpriv->packet = &attr;
> +	tpriv->capture_all = true;
> 
>  	/*
>  	 * As we use HASH filtering, false positives may appear. This is a
> @@ -1088,6 +1090,7 @@ static int __stmmac_test_dvlanfilt(struct 
> stmmac_priv *priv)
>  	tpriv->pt.dev = priv->dev;
>  	tpriv->pt.af_packet_priv = tpriv;
>  	tpriv->packet = &attr;
> +	tpriv->capture_all = true;
> 
>  	/*
>  	 * As we use HASH filtering, false positives may appear. This is a
> @@ -1366,6 +1369,7 @@ static int stmmac_test_vlanoff_common(struct 
> stmmac_priv *priv, bool svlan)
>  	tpriv->pt.af_packet_priv = tpriv;
>  	tpriv->packet = &attr;
>  	tpriv->vlan_id = 0x123;
> +	tpriv->capture_all = true;
>  	stmmac_sft_add_pack(&tpriv->pt);
> 
>  	ret = vlan_vid_add(priv->dev, htons(proto), tpriv->vlan_id);

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks,
Nicolai

