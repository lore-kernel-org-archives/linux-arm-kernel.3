Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50269CAC59D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 14:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ZxtDJ8NDcYS0cSetpXt7raMXbyInlYYiFA0w5yReZ0=; b=iR3ZJfnW7aLXST6TYkl1SkIYjP
	KQmIfFEaIdTfnrjtXtsc7W533P7h4+bjtXkkcT67iiChCkS5TE//UphY7ItvP6mxcquZ/DHSySby2
	57sBzSlOVGm9/n9+da/WbLCGA31ImcBlILD4EEIKKTJi5hCxs2XYCMs0d69Kf4HEf/e8AnJ9xOSdG
	SZ//FmuK6Gnqqs0GPs2bGiQjbY2CapKaFrvysHrvC9bLwebAsXwumvYR2zZBlVQfzzmdyMCxZokn0
	RA/7sd+68Fz2hXJ7H15podcWQhFzDmuz+CE5Sq/mdqHbDXdOLn5dJhtIYA+QZUsNpT6XaDqNs37xb
	H29AcgpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyt70-0000000CCpS-1ofq;
	Wed, 17 Sep 2025 14:26:22 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyt6x-0000000CClc-12jU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 14:26:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/ZxtDJ8NDcYS0cSetpXt7raMXbyInlYYiFA0w5yReZ0=; b=vr0eQWPgmDBkic8/GVQiu43zFP
	uc/rYJqtnhoAciwrfHu+jkE3Ox8j2JAlJfTbQ//7gO9xX2bnoIFPZYxUgxHeulz+hKj56q+1r29E3
	7Lk5XS9KE3VP41UrUye2FWA5ucMVt6cF/H8fkRLCseZYqDZNlkZSkz43uCc3DwmJB10uN9LEffXGD
	vGYXokojPtUciD2QFQ4ZfTUAxF6BihQsZjLSG+TMWEji9mdGYre38hjcPP5xyGLMV/fwkix62hy7j
	YyrFUnU92vsZK12eC4FE8kEhqUv1mwAn6cN9K1zvhn7ySvBjKs+wbjEOo1A5HdsSpoRpm3cCCbriP
	sGt/buQQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44676)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uyt6l-000000004Ti-01AJ;
	Wed, 17 Sep 2025 15:26:07 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uyt6h-000000000Fo-2Qq3;
	Wed, 17 Sep 2025 15:26:03 +0100
Date: Wed, 17 Sep 2025 15:26:03 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	UNGLinuxDriver@microchip.com, jacob.e.keller@intel.com,
	Robert Marko <robert.marko@sartura.hr>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: sparx5/lan969x: Add support for ethtool
 pause parameters
Message-ID: <aMrE-9rtW20A9Xnj@shell.armlinux.org.uk>
References: <20250917-802-3x-pause-v1-1-3d1565a68a96@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917-802-3x-pause-v1-1-3d1565a68a96@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_072619_292924_77DDDF22 
X-CRM114-Status: GOOD (  13.17  )
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

On Wed, Sep 17, 2025 at 01:49:43PM +0200, Daniel Machon wrote:
> Implement get_pauseparam() and set_pauseparam() ethtool operations for
> Sparx5 ports.  This allows users to query and configure IEEE 802.3x
> pause frame settings via:
> 
> ethtool -a ethX
> ethtool -A ethX rx on|off tx on|off autoneg on|off
> 
> The driver delegates pause parameter handling to phylink through
> phylink_ethtool_get_pauseparam() and phylink_ethtool_set_pauseparam().
> 
> The underlying configuration of pause frame generation and reception is
> already implemented in the driver; this patch only wires it up to the
> standard ethtool interface, making the feature accessible to userspace.
> 
> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>

It is nice to see drivers not having to implement complicated code
to add support for pause configuration!

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

