Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F36DCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 09:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pw5SlnDVGg7XnK8uA3BZSl59TvohLK7BdiQD5CmzpRU=; b=XiW8r6HjUY77D9uhYv7xnnUhhd
	9mfxlZiYhX2hgCrqrSZrtgESbIWuGQrhPkdCQ+U+bNzxvK8csc+BoPbWYpaRnHfkavOeJdV5QeexQ
	01ncnhjqI+9vQwEMo8MSGG8YCSkIxO6sf6YqRUkvtw+XTHP0zGmDo1w7yUTzBsWAe9Uc1miHrUeuI
	+hvhnmSn9mysQzOrV5y3vjSxpR0p18/g9wxxCmXhcpkJRA6Jt4vLnrrhoDLk5kTAqaYEpSZb4T38B
	44tFmg0XycHAM9T2Qhi5ZlSPYoC4ctqsh3kk2tYl6wDCjfdreLc7shKWNmqmo1C60SXnqBh4hig0R
	IRyxZV+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwgR-0000000FDHP-2QKx;
	Thu, 06 Nov 2025 09:53:35 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwgN-0000000FDGq-3GV2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 09:53:33 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C25D11A18F0;
	Thu,  6 Nov 2025 09:53:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 989D86068C;
	Thu,  6 Nov 2025 09:53:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2733811850340;
	Thu,  6 Nov 2025 10:53:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762422808; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=pw5SlnDVGg7XnK8uA3BZSl59TvohLK7BdiQD5CmzpRU=;
	b=WGba7FfjxUihzh5NJ092gkGULz4A3iRfaOMgrATtvO0V+mEdHkt5mu5RcaVNdbwVCdzchD
	YTSbI5Z5C+q7DSadJT5kMyAlLaBj+IGJfrMEb1JnpFktZA/AtG/q8OkLKNcotGflqsCylO
	V/y/y9Cdr6wOAc7xpgqUs00jLgfnp/14Pk6bFZ49b7AMras6N1mnEVkyhu9iLsi+fMsRkd
	ACIDLypulDjblLVtCvGMeVNaDyDHtZBu25DYTzIGxP+ipFsrGBdrDP4OaTVQ9gX640P3hX
	BlyG0qWrvXF9UcrHrYBDuz8NJKhROBbJcwIfLHxubyfeqHwhwZsRHdBjZTVw3w==
Message-ID: <bc412e39-7286-426d-924b-49989434b9bb@bootlin.com>
Date: Thu, 6 Nov 2025 10:53:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 03/11] net: stmmac: ingenic: use PHY_INTF_SEL_xxx
 to select PHY interface
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <aQtQYlEY9crH0IKo@shell.armlinux.org.uk>
 <E1vGdWp-0000000Clna-18SE@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vGdWp-0000000Clna-18SE@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_015331_980594_C4CF2802 
X-CRM114-Status: GOOD (  10.45  )
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



On 05/11/2025 14:26, Russell King (Oracle) wrote:
> Use the common dwmac definitions for the PHY interface selection field.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> index c6c82f277f62..5de2bd984d34 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> @@ -35,10 +35,10 @@
>  #define MACPHYC_RX_DELAY_MASK		GENMASK(10, 4)
>  #define MACPHYC_SOFT_RST_MASK		GENMASK(3, 3)
>  #define MACPHYC_PHY_INFT_MASK		GENMASK(2, 0)
> -#define MACPHYC_PHY_INFT_RMII		0x4
> -#define MACPHYC_PHY_INFT_RGMII		0x1
> -#define MACPHYC_PHY_INFT_GMII		0x0
> -#define MACPHYC_PHY_INFT_MII		0x0
> +#define MACPHYC_PHY_INFT_RMII		PHY_INTF_SEL_RMII
> +#define MACPHYC_PHY_INFT_RGMII		PHY_INTF_SEL_RGMII
> +#define MACPHYC_PHY_INFT_GMII		PHY_INTF_SEL_GMII_MII
> +#define MACPHYC_PHY_INFT_MII		PHY_INTF_SEL_GMII_MII
>  
>  #define MACPHYC_TX_DELAY_PS_MAX		2496
>  #define MACPHYC_TX_DELAY_PS_MIN		20


