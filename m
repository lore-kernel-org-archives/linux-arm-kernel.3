Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24118F419A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 12:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k1puqjkx70xR77cxDwbqQolTS/KLwYlYFTOWLOqnzlM=; b=ExnVNkYs3vQNDJdqsKiteN3Rtr
	oHhocNu9R5DxajUEK6p/IkwAOTVM7pgO4ZN8NNkYPfSoghqUHVFjmtFGQGT6L85d0ffNWS5V1av/5
	QkyS17vyhqEGqOLLBD+GTAURa3mdwjSYk77U71eav8/2ZyN1wm1DXGl4D7plPymavoeXh/E2Cl0QR
	o0hczBqqrfTkY73xtG9VEEzwPFnXjrTtvV+pAvzgY2hyyyvIoG4E9NU23NCdXxjpgFoQbvnK+dkQV
	g7tw491e5QDwKl2nOfOm1rpy3cnrDKRTkdUFpZazqLD0I50Us/KxgACNQgNnId1niighaUjczUxaT
	sU9CPQRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCzqK-000000019t4-0iJO;
	Wed, 15 Apr 2026 12:59:44 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCzqI-000000019si-0y3P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 12:59:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=k1puqjkx70xR77cxDwbqQolTS/KLwYlYFTOWLOqnzlM=; b=aFyriBXuIy8LHVTejW1TUXwLSI
	SOGtjKg/MRydcxHRxyQwoWq1ZMD5bmH+zHEXuwt9s/TgJKEIQvXYmU/CVhy/JjHCom2U4e8bU6qLo
	87W1gK0L3wGZJMrRowFSZIdUb+E5XAcib8X4LG7+rupk+ph3+nYjveF29ZNvTl7ss6iIIRG/g6FZK
	mcPmRJ4JcBkbfPOt09h5TjV0eVBiQPuuQ3xMWChxR/IXz3YuKsLinJOie1NfDpQDAxDgIo7K1PSuK
	TL5zcIE/On68zsFvm6Mc7BgNzAyjhZay+pKmXU5Qcc3uqdKZTDhOF93nE+/MPpFU6TeMtUwXoDDkv
	m8g+Ib8A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59050)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wCzqA-0000000026f-2wkF;
	Wed, 15 Apr 2026 13:59:34 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wCzq8-000000002EM-3sFk;
	Wed, 15 Apr 2026 13:59:32 +0100
Date: Wed, 15 Apr 2026 13:59:32 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 5/6] net: stmmac: move PHY handling out of
 __stmmac_open()/release()
Message-ID: <ad-LtOBrKREM1tCk@shell.armlinux.org.uk>
References: <aNKDqqI7aLsuDD52@shell.armlinux.org.uk>
 <E1v11A3-0000000774G-3PKY@rmk-PC.armlinux.org.uk>
 <8409022.LvFx2qVVIh@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8409022.LvFx2qVVIh@steina-w>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_055942_272959_6823A70F 
X-CRM114-Status: GOOD (  17.32  )
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

On Wed, Apr 15, 2026 at 08:08:40AM +0200, Alexander Stein wrote:
> Hi,
> 
> Am Dienstag, 23. September 2025, 13:26:19 CEST schrieb Russell King (Oracle):
> > Move the PHY attachment/detachment from the network driver out of
> > __stmmac_open() and __stmmac_release() into stmmac_open() and
> > stmmac_release() where these actions will only happen when the
> > interface is administratively brought up or down. It does not make
> > sense to detach and re-attach the PHY during a change of MTU.
> 
> Sorry for coming up now. But I recently noticed this commit breaks changing
> the MTU on i.MX8MP. Once I simply change the MTU I run into some DMA error:
> $ ip link set dev end1 mtu 1400
> imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-0
> imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-1
> imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-2
> imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-3
> imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-4
> imx-dwmac 30bf0000.ethernet end1: Link is Down
> imx-dwmac 30bf0000.ethernet end1: Failed to reset the dma
> imx-dwmac 30bf0000.ethernet end1: stmmac_hw_setup: DMA engine initialization failed

This basically means that a clock is missing. Please provide more
information:

- what kernel version are you using?
- has EEE been negotiated?
- does the problem persist when EEE is disabled?
- which PHY is attached to stmmac?
- which PHY interface mode is being used to connect the PHY to stmmac?

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

