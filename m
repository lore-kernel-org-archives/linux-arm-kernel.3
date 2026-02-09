Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3595FE81BC0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 13:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6/Bhdanj6O08thw4wV1ges687d1OPsjCQBMVncgJuLY=; b=g1nNGJyCsdg3YzMbQcGqMcVJWl
	MMN6MXTlxW8a5u+LK07+0nxj3F1xq2KugOEssDc8RSTOb/rkAjOlBkXGwV5ImGvJSrMJ64w1WeNUK
	bCPQXdh1bXzbr9aD8ldLgU7+omIHI9QpUAn/zoNdzo3gNSIVmxCP4WZ/eIJuwiSsDzxyHxU4N5d1g
	BuWNZ98A9vs6Bf3xQYre9XsQYd1x6PfLHvEdIGbZJWZje7z+0QlB4EOXNz+sO9iDV5fi8/AFI4CXo
	g086c5ZfrDb+KvoFBxtpWfLSDbEgHq46+U3EoFkJCEoE3NmdcQrl/1K41JYIOK06KYh+c+GufO6T7
	YCjWGJyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpR4a-0000000FPdw-0bx3;
	Mon, 09 Feb 2026 13:13:04 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpR4U-0000000FPdB-2yEK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 13:13:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6/Bhdanj6O08thw4wV1ges687d1OPsjCQBMVncgJuLY=; b=CyPJK8Vr26ROn4aWjw4xu1m28i
	d9JZu6nJ0LZKt2PXB5K8uAQzFiq4gOrOiOP9OQMzvWQ9tmyksBUxUdhxybwAKG4uom8vJLbj8k3Pa
	ZitDjBPPb/y1PzmwywrBPVD7cwiXACkOIq0Hbzuj0CUTNWCZD3Ohi9VNxwLrgtv758boEFNE4It6p
	ews14KhFv9oW3lGurtaQCv5EPtLN+4uXH+jiXo8ggqnYHTJRre+dQrXVuf+FrVgq31Iuon2b/Lrpy
	30tQQUMW78ab2oWaHd/vc0f8hxdMtkPIE74R56kaisUai67PKbNE8fuN3f3faX7qFsJHvKlhlFsJs
	BOWy/aXw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38542)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vpR42-000000001Zf-09zB;
	Mon, 09 Feb 2026 13:12:30 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vpR3x-000000001oO-376d;
	Mon, 09 Feb 2026 13:12:25 +0000
Date: Mon, 9 Feb 2026 13:12:25 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: netdev@vger.kernel.org, imx@lists.linux.dev,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Clark Wang <xiaoning.wang@nxp.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@denx.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frank Li <Frank.Li@nxp.com>, Heiko Schocher <hs@denx.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Joakim Zhang <qiangqing.zhang@nxp.com>, Joy Zou <joy.zou@nxp.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Martyn Welch <martyn.welch@collabora.com>,
	Mathieu Othacehe <othacehe@gnu.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Richard Hu <richard.hu@technexion.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Wei Fang <wei.fang@nxp.com>,
	Xiaoliang Yang <xiaoliang.yang_1@nxp.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] net: stmmac: imx: Disable EEE
Message-ID: <aYndOVkz7AOQK7qr@shell.armlinux.org.uk>
References: <20260208232931.2272237-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260208232931.2272237-1-laurent.pinchart@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_051258_767127_5B54C795 
X-CRM114-Status: GOOD (  14.38  )
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

On Mon, Feb 09, 2026 at 01:29:31AM +0200, Laurent Pinchart wrote:
...
> Fix the issue by disabling EEE completely on i.MX8MP.
> 
> [1] https://lore.kernel.org/all/20251026122905.29028-1-laurent.pinchart@ideasonboard.com/
> [2] https://lore.kernel.org/all/20251123053518.8478-1-laurent.pinchart@ideasonboard.com/
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> This patch depends on https://lore.kernel.org/r/20251026122905.29028-1-laurent.pinchart@ideasonboard.com

Are you sure? That's the one adding the DT property, not my patch that
adds the flag you need for this.

> @@ -355,7 +354,8 @@ static struct imx_dwmac_ops imx8mp_dwmac_data = {
>  	.addr_width = 34,
>  	.mac_rgmii_txclk_auto_adj = false,
>  	.set_intf_mode = imx8mp_set_intf_mode,
> -	.flags = STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY,
> +	.flags = STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY
> +	       | STMMAC_FLAG_EEE_DISABLE,

I thought we had a coding style comment about wrapping like this
(operators should be trailing on the previous line, not at the
beginning of the following line) but I can find nothing in
Documentation/process/coding-style.rst  Confused. Maybe it's
somewhere else in the re-organised documentation.

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

