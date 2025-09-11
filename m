Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9864CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 12:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v+5rP8nGZfUE7JovJkiq3wIxYuLAUJaHuDcq9FK6N2o=; b=GVoq/zPy/1X39yeGxnAdkYGsDK
	Lp4weM9sLw6CE8oIpI5q1NrzwXnmIr7Lp/Qx4WCLgtPpu1QLQOzrgHT6SS7kUOMRT5qgkKAtEXHMj
	MTfvaQj6rOxmMIVZzF1xBVFUf0e+SfHN237LVL5c1yYZ2G+8XgYgmiUfOidsTdLaRcIC8ts0DGsyp
	vJqDobbMognDoGsL/3qzHtAv1fXU3mrxRuyCv0YP6G1N+LFF7sIMVk1WKjdF8P7RVgYlwoER+ztLQ
	HLWS+WZ6EAnGdjZrKU7pRNkXzFuLHGZtqK+jCqtDCq/34IiYfBrzIaUpbvYb3C1GsBWQT49q8R7Kg
	Xb2iNAGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwgm7-000000034oN-2Gqh;
	Thu, 11 Sep 2025 12:51:43 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwgm4-000000034no-3r8f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 12:51:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=v+5rP8nGZfUE7JovJkiq3wIxYuLAUJaHuDcq9FK6N2o=; b=j5jyOipc7CF+6IrtAD8U6rzM+N
	VTg3B4CS4xefU8x9b56O+oumZqqhJmMFMn8HWy5FCrix6LQr53E1wrfwJTwUpIUmqymE2YohLIxPS
	gGyhFS4UJq4MZKJbb2zL550hMOTzkwsUupEOFC7cu3uYP2+W9pN13nrPYDUv70mJAZafsfIj5gWlW
	pjyGeqxb7eNyjrmiPdXnc6kEGwQt3GfP/8mc6kEMg4yzBNOvjWYti9tdhcpM7AES2/U1fPDlicDVP
	fhm2341mm88VopLKqpBw1gPHdv8RnHXiI+NnARfvJ9GGomDSp4TPJid8PxYrvLOdzDa9TTiDXWUrn
	Ihz5WVRg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44464)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uwglt-0000000032i-2qAs;
	Thu, 11 Sep 2025 13:51:29 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uwglp-000000002Mx-3vtO;
	Thu, 11 Sep 2025 13:51:25 +0100
Date: Thu, 11 Sep 2025 13:51:25 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: rohan.g.thomas@altera.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Matthew Gerlach <matthew.gerlach@altera.com>
Subject: Re: [PATCH net-next] net: stmmac: est: Drop frames causing HLBS error
Message-ID: <aMLFzSLBHxsk9YI8@shell.armlinux.org.uk>
References: <20250911-hlbs_2-v1-1-cb655e8995b7@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-hlbs_2-v1-1-cb655e8995b7@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_055140_954687_933C70CB 
X-CRM114-Status: GOOD (  10.95  )
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

On Thu, Sep 11, 2025 at 04:38:16PM +0800, Rohan G Thomas via B4 Relay wrote:
> @@ -109,6 +109,11 @@ static void est_irq_status(struct stmmac_priv *priv, struct net_device *dev,
>  
>  		x->mtl_est_hlbs++;
>  
> +		for (i = 0; i < txqcnt; i++) {
> +			if (value & BIT(i))
> +				x->mtl_est_txq_hlbs[i]++;
> +		}

There's no need for the parens around the for loop.

I'm afraid I can't provide much more of a review as I don't have the
documentation for GMAC4 or XGMAC.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

