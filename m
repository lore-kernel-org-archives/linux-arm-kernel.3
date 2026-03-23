Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3852EC01A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 09:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ze5ETx/U/7MNxR8MXWbZ3oXcMSugHqDKn2wVuG7ra88=; b=T45oMsr3kKmi9AwHHBPU/+Q9Gq
	MvAUfPYTDpGTxwRGTBqLC+RlfnKmg5E9pLVj2xOyt7LPD81pE27lPcATeiiiXu4XkhAxQySlveHiu
	mR7uZCc4CMAjFY5I8ksBdq2Jw0Sv8YL7j+dy5foGufynjyIu8VZG45cXjxSAwBwxLccdT9JvDpt67
	zQTUn5G9pnrAbBdA9fNyQ64wBDIV2OOpqsTe81yT3LdSgbRXOAm/aw6hLJW4AuzWv2zunAmWWXl0a
	KR0tCMnayOBUg+B2Blwt8ly5pMIrl6ZY15np88BHYqexdxmayYYlHXky5MBJ4bunAXvMF04SGs6fH
	vZbF5HQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bSQ-0000000GMjt-3NWE;
	Mon, 23 Mar 2026 09:20:22 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bSO-0000000GMiz-2CAa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 09:20:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ze5ETx/U/7MNxR8MXWbZ3oXcMSugHqDKn2wVuG7ra88=; b=eUGrZECNA51voE32i31QjaUAjf
	7OkBg63xFi7AlouLEgoG7RhJiyKaFD8UNYjySI3YXHajS8/lsDmdcUaiEfzWm7j+h4JrTGkNPstq0
	gaLR8j09J+NralvErg9+2AqahEiteJHprUmtvwdRKQGwvpisOaKOTCXr8i611xKiWG3QOGEr58KHR
	Rz36iy8O6wkx+5sdmC3XfHxNrsKsqC2HATT/StCU0d6fwNHx0HeU0CTYpWKQMShRe1WRqjo05fllQ
	YZuuy2ehGzP+qKTk5NjXTQIIY2p35atMT/+Laf4vhLNVycY5M8n+8k8dphiOqmJdaXNOYnIlmValW
	3pH+dkUw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58016)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w4bS9-000000000Bx-0XtG;
	Mon, 23 Mar 2026 09:20:05 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w4bS6-000000003uf-0hU7;
	Mon, 23 Mar 2026 09:20:02 +0000
Date: Mon, 23 Mar 2026 09:20:02 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, f.fainelli@gmail.com,
	frank.li@nxp.com, chleroy@kernel.org, horms@kernel.org,
	andrew@lunn.ch, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v2 net-next 13/14] net: dsa: netc: initialize buffer bool
 table and implement flow-control
Message-ID: <acEFwqmAvWls_9Ef@shell.armlinux.org.uk>
References: <20260323060752.1157031-1-wei.fang@nxp.com>
 <20260323060752.1157031-14-wei.fang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323060752.1157031-14-wei.fang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_022020_559690_AC760C95 
X-CRM114-Status: GOOD (  10.98  )
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

On Mon, Mar 23, 2026 at 02:07:51PM +0800, Wei Fang wrote:
> @@ -1288,7 +1411,17 @@ static void netc_mac_link_up(struct phylink_config *config,
>  		netc_port_set_rmii_mii_mac(np, speed, duplex);
>  	}
>  
> +	if (duplex == DUPLEX_HALF) {
> +		/* As per 802.3 annex 31B, PAUSE frames are only supported
> +		 * when the link is configured for full duplex operation.
> +		 */
> +		tx_pause = false;
> +		rx_pause = false;
> +	}

I keep seeing this totally unnecessary code in reviews of mac_link_up()
methods. See phylink_resolve_an_pause().

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

