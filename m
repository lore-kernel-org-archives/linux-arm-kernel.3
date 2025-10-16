Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D15CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 20:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BGLd34hIZHRW5MNCTkdPJkRpfLEkBJVVn5hZXllY0To=; b=qGsCURt/EO9E1/9iXySfkXTAHI
	k2BuEWs7Ny/oSu0siUpOtQfIepBM0E0+lCoSd8bpwjcdP6Z7fhYQDFiBB/5hP6q6M5aRINeKkPDnP
	VCp2cAba6LS6wvlDyOXt0FTFBEtf7gk+iLUuKxtItwCBIwLns7EFTTq9u50+1/NieIOeCAmZ7zUvQ
	CoVJT6vafLyQc1f0SOUNt2BDoWnvt6TSyJn+7pX6FidysFd1L8TI1hm6nTIbiv4yTJBM2b6kfY/X+
	+usgrkXzN96COOc3pYWmirRz4mQK8ubu4i2rZIOwiFa6tGvqjEuOl25RBrNo7AhJ0ycGqW2E0Z1Pm
	RIrcFvjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9UVz-00000005sqX-0WKX;
	Thu, 16 Oct 2025 20:23:59 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9UVw-00000005sqC-2QLC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 20:23:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=BGLd34hIZHRW5MNCTkdPJkRpfLEkBJVVn5hZXllY0To=; b=FGvUtLIFOUfxnZ47G1lPtE79I8
	Mhv0YlsgEEEiBFjVWyoDQ5MTJKinh6+yAgVFUSbdtOESG8r5czG5g96cBV4rlOCR9MQ5YqVDniNuU
	xg340BukDunTmJJeWXWHsLwz3HqXoFr5l8/l3i507lDWujxmo54GfibJvCESVMmx6z5A=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v9UVq-00BCi6-DS; Thu, 16 Oct 2025 22:23:50 +0200
Date: Thu, 16 Oct 2025 22:23:50 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 5/5] net: stmmac: rename stmmac_phy_setup() to
 include phylink
Message-ID: <e6685414-6378-4b1c-84e2-e4357fe041f3@lunn.ch>
References: <aO_HIwT_YvxkDS8D@shell.armlinux.org.uk>
 <E1v945d-0000000Ameh-3Bs7@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1v945d-0000000Ameh-3Bs7@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_132356_612501_4C037A89 
X-CRM114-Status: UNSURE (   8.00  )
X-CRM114-Notice: Please train this message.
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

On Wed, Oct 15, 2025 at 05:11:01PM +0100, Russell King (Oracle) wrote:
> stmmac_phy_setup() does not set up any PHY, but does setup phylink.
> Rename this function to stmmac_phylink_setup() to reflect more what
> it is doing.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

