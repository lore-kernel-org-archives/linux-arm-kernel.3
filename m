Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F8D10706F5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 18:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TJXDOAuibrTACPFJ3gdjAYh5dbMS4QxQVjJNGrVmr0o=; b=f3zDnUSMqmmnJJdWDkMgRWOUE9
	3d567YYnfYuFwle5IlG7ea/Dx9Yhbpb4ANJmdGHho60ZCLAUmjMCD0SJAEvey8aJzaw8w49bocu/b
	y+TS3Q1Y7ZQvqOFNWOTTfIV+tAl/mEqdP5p2allFnVpmvzglifNO5OEDMTQSONCpAxHU2W3IkhsH3
	NYgQ0klCstuV2NbGz4hCpjttCwB3ntiRFGsoCrwYXjdZrS2eqiw/G4O2aZ+55aYD8ngSsrcB2LKMl
	yurBAPKyNVAdjwmcTObyLgy2AxilG3o7k2X4hDaUyrvUPe2bFBsaNFuaNkBhQUMquSHr2ESKl16yn
	ZWqGJPrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1TyO-000000025H2-1gb1;
	Sat, 14 Mar 2026 18:44:28 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1TyL-000000025Gg-1XbG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 18:44:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TJXDOAuibrTACPFJ3gdjAYh5dbMS4QxQVjJNGrVmr0o=; b=IPLnu5VZ1CAdIU5GB5g/Hnmhug
	s60qZYxorCKslsE8hFzZ0E7qXflq7dcOGeml53EG8J1cW5MzmvJn9y+anEaI9qTH/vvkb7KSYLMtf
	LpIft26AG/SK5O+XdQ9nfqXgE+zHLpN2wLI+CE7/qdLQuH7la7IlifUI96E177OXnQlXZd4Dvqzhf
	/ZLo7KDtjW/Lw6shHB0L2s4FqH7UvpLEo3ywI7cfXYqS0y59c+apj/TQVJPcDApzrQeDTZ2j8eljl
	ZUJEUc3xv09gioNtK4uM3668fJF9z21BMvEdhdqk9qswhfafoq4Pw7UuEKNfuuA8gQbZP9kPm7y9H
	Oihs8TXA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46488)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w1TyD-000000002Ny-276D;
	Sat, 14 Mar 2026 18:44:17 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w1TyA-0000000010B-409f;
	Sat, 14 Mar 2026 18:44:14 +0000
Date: Sat, 14 Mar 2026 18:44:14 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next] net: stmmac: avoid passing pci_dev
Message-ID: <abWsfr7XZE5zFulv@shell.armlinux.org.uk>
References: <E1w0evI-0000000CzY7-1fyo@rmk-PC.armlinux.org.uk>
 <20260314094423.6a908938@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260314094423.6a908938@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_114425_404791_436DB29E 
X-CRM114-Status: GOOD (  10.89  )
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

On Sat, Mar 14, 2026 at 09:44:23AM -0700, Jakub Kicinski wrote:
> On Thu, 12 Mar 2026 12:13:52 +0000 Russell King (Oracle) wrote:
> > To avoid unexpectedly exposing the device name through ethtool where
> > it wasn't provided before, add a flag priv->plat->provide_bus_info
> > to enable this, which only dwmac-intel needs to set.
> 
> Seems fine, but maybe as a separate patch we can expose it for all
> devices? Is there anything special about platform devices here?

Apart from the obvious UAPI change, I don't think so, and I don't
know why the driver hasn't exposed it for platform devices as well,
other than maybe nobody caring about this.

If there's no objections, then priv->plat->provide_bus_info can be
removed and we can expose dev_name(priv->device) unconditionally.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

