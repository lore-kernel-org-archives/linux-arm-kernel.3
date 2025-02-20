Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54989C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 11:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OMt4+h4M2hi9bh1j74Xva35n6PD/Vbe0tDN67Tdnx4w=; b=rPAQDXcgu/nXoCOncy6QuQauQi
	nrSBLcm3j//6nEyBmf49pvI/GAnbQy+pfnGQhqcS+30NGOPVWJGIZtt3GSPk4CljN5zHyoJmUTMXA
	3knyDE2bmMdA8+UysMDSFQ6iNfJPStFDvj3JzAFUUO5JMGFP5Xzk/Z4w2KDkCVB6ddbuDfKldopZE
	+KY1wQEC631XkJCQvDEYmzlSAHHZRL+9QyA8G5EdTu+Ip1eNbryePyGKh1bEYHWy/onEPWJRHenkc
	EoZvLq5zSXhI6hOdEbp7yuuj2Mvxki2gCc1PHrq+d4rjSDugjB7eHtGzF3CdUSDQzXBTcuJAfBRCc
	g98Bh7XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl50Q-00000000dAB-3LRJ;
	Thu, 20 Feb 2025 11:46:14 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl4yv-00000000cob-0tlo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 11:44:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OMt4+h4M2hi9bh1j74Xva35n6PD/Vbe0tDN67Tdnx4w=; b=xt5DFqDvVS+9dt404mDOkGLP+E
	1fyXCW3pqplrlhIIjhaQEICw6ArRyUhDDKMZd21/ALbjtqYBc1DvJQNHlIjHP4EiSUy8obeO4BviH
	/h5rYxya6ZA0d0sJl3WgV32fccXeoV0Xo+2C+IH34+2DYD3tig4tX44Pk7yfPkaYEXG1Jz3SdpUse
	9ghw7gaj3bvKMnwLV5qkZQFtr+2eE89jzJhJ16pUw374/yDw38JMMEjOWGn3w7OLSnbZMxnvIaV+L
	2AM3Sz3//5OAL0/lES7735aRaZ3YsKDPgM9o0Pa/EQwZBE6cSFyFztT2qtR/XfIflhAbW67EFjW95
	ylRToIDQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46900)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tl4yg-0000om-0U;
	Thu, 20 Feb 2025 11:44:26 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tl4yd-0000x2-1n;
	Thu, 20 Feb 2025 11:44:23 +0000
Date: Thu, 20 Feb 2025 11:44:23 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Gupta, Suraj" <Suraj.Gupta2@amd.com>
Cc: Sean Anderson <sean.anderson@linux.dev>, Andrew Lunn <andrew@lunn.ch>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"Simek, Michal" <michal.simek@amd.com>,
	"Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>,
	"horms@kernel.org" <horms@kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"git (AMD-Xilinx)" <git@amd.com>,
	"Katakam, Harini" <harini.katakam@amd.com>
Subject: Re: [PATCH net-next 2/2] net: axienet: Add support for AXI 2.5G MAC
Message-ID: <Z7cVlwPDtJ2fdTbY@shell.armlinux.org.uk>
References: <20241118081822.19383-1-suraj.gupta2@amd.com>
 <20241118081822.19383-3-suraj.gupta2@amd.com>
 <ZztjvkxbCiLER-PJ@shell.armlinux.org.uk>
 <657764fd-68a1-4826-b832-3bda91a0c13b@linux.dev>
 <9d26a588-d9ac-43c5-bedc-22cb1f0923dd@lunn.ch>
 <72ded972-cd16-4124-84af-8d8ddad049f0@linux.dev>
 <ZzyzhCVBgXtQ_Aop@shell.armlinux.org.uk>
 <BL3PR12MB6571FE73FA8D5AAB9FB4BB3CC9C42@BL3PR12MB6571.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL3PR12MB6571FE73FA8D5AAB9FB4BB3CC9C42@BL3PR12MB6571.namprd12.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_034441_251557_AD4081DE 
X-CRM114-Status: GOOD (  16.43  )
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

On Thu, Feb 20, 2025 at 11:30:52AM +0000, Gupta, Suraj wrote:
> Sorry for picking up this thread after long time, we checked
> internally with AMD IP and hardware experts and it is true that you
> can use this MAC and PCS to operate at 1G and 2.5G both. It is also
> possible to switch between these two speeds dynamically using
> external GT and/or if an external RTL logic is implemented in the
> FPGA. That will include some GPIO or register based selections to
> change the clock and configurations to switch between the speeds.
> Our current solution does not support this and is meant for a
> static speed selection only.

Thanks for getting back on this.

Okay, so it's a synthesis option, where that may be one of:

1. SGMII/1000base-X only
2. 2500base-X only
3. dynamically switching between (1) and (2).

> We'll use MAC ability register to detect if MAC is configured for
> 2.5G. Will it be fine to advertise both 1G and 2.5G in that case?

Please document in a comment that the above are synthesis options,
and that dynamically changing between them is possible but not
implemented by the driver. Note that should anyone use axienet for
SFP modules, then (1) is essentially the base functionality, (2) is
very limiting, and (3) would be best.

Not only will one want to limit the MAC capabilities, but also the
supported interface modes. As it's been so long since the patch was
posted, I don't remember whether it did that or not.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

