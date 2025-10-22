Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6108CCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 13:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rkViBGu74KDxz9qDROM+0Y+EYcnboJC0J4JeqwsrGfw=; b=wQhWNMeFvxtdrL/iDxsO8AsuYd
	lpvAFZC0db4nzCRz3ivEc7NnwwVHbeV5NYLV/XDxfO5bbCUr+9fD+3VLh2jqcnqZ/lWeQ3TMYcLwp
	h6QoOoFk27yKRCKY6CaEdgMePQaVVmGvJrYOmKu0fEUknQtF1pwMu1Q31VLNX1qv4jBZooSl2RYkN
	A1sHyI+zc1rJ9cc3Fy4iKYCMyyTT3pb1mLT04KPq1BLzHcflAxMQekGOeJmGbKh5Pu23dMD6Utdhi
	YSYyxNiSG2CT7LjfZztd8VCGRU9FEwBdUOLe7MAh618YGlEAG06XMEdZsryJYHYXEfIPsQnGAz4ys
	txmDy7SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYz7-000000031FI-1lSx;
	Wed, 22 Oct 2025 13:34:37 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYz3-000000031BB-3grn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 13:34:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C342E1A15C8;
	Wed, 22 Oct 2025 13:34:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7D83E606DC;
	Wed, 22 Oct 2025 13:34:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8D361102F242F;
	Wed, 22 Oct 2025 15:34:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761140067; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=rkViBGu74KDxz9qDROM+0Y+EYcnboJC0J4JeqwsrGfw=;
	b=GlLCGWYivjHGhUt5UODhGa9mb++fg96pBZX0r044UV3KnmUGCn8/IVIiJoBTybhz4peGdy
	gdPWSBp/m26CR680XAnYDUjFnrPv54dOpLD5kS2pm5YHGQGoH/T6LuC7RYckY5V+6q8iKK
	D4C0K1aTkN9/x3Rxs6MdPx59TzRARq/MFhxp5ZN8JdinR0cF6JsoPDSqd0/PLVRi1jefkr
	U8F+cCMCFnjK4bt+ZJ8mD78OCeVKLDsvddhGwXe7z3QZJaTFsgFTp/TZQzOZrX+AvTCV6r
	NgY/fmcEmKNMpB6ktQQVpYPzFptSymM9UmJNwxHrKiqhEPR4vnZyMX5T0mo5gg==
Message-ID: <1e4d3ec3-2e20-46a3-95d3-d3e3c22db4bc@bootlin.com>
Date: Wed, 22 Oct 2025 15:34:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/6] net: phy: add phy_can_wakeup()
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <aPIwqo9mCEOb7ZQu@shell.armlinux.org.uk>
 <E1v9jCJ-0000000B2NQ-0mhG@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1v9jCJ-0000000B2NQ-0mhG@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_063434_526497_48DE37F0 
X-CRM114-Status: GOOD (  12.14  )
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



On 17/10/2025 14:04, Russell King (Oracle) wrote:
> Add phy_can_wakeup() to report whether the PHY driver has marked the
> PHY device as being wake-up capable as far as the driver model is
> concerned.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  include/linux/phy.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/include/linux/phy.h b/include/linux/phy.h
> index 3c7634482356..3eeeaec52832 100644
> --- a/include/linux/phy.h
> +++ b/include/linux/phy.h
> @@ -1379,6 +1379,18 @@ static inline void phy_disable_eee_mode(struct phy_device *phydev, u32 link_mode
>  	linkmode_clear_bit(link_mode, phydev->advertising_eee);
>  }
>  
> +/**
> + * phy_can_wakeup() - indicate whether PHY has driver model wakeup capabilities
> + * @phydev: The phy_device struct
> + *
> + * Returns: true/false depending on the PHY driver's device_set_wakeup_capable()
> + * setting.
> + */
> +static inline bool phy_can_wakeup(struct phy_device *phydev)
> +{
> +	return device_can_wakeup(&phydev->mdio.dev);
> +}
> +
>  void phy_resolve_aneg_pause(struct phy_device *phydev);
>  void phy_resolve_aneg_linkmode(struct phy_device *phydev);
>  


