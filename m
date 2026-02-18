Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CDEE9A03E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 08:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q9PdRsv4oqQEVjsON/ocmS3V9+KatKpnLZcn3ErO6qY=; b=f3ShnxVzwcNWCMlrcHMUSoti8J
	peEMDwVVrJ+VmaBseKc9e7acdIKLpBlahNktF4HfbzvKCeZC0QPgFr44nHVK5kHghb+85+4kKMN59
	JisBorHODzujb0yRJhSgT+SCsyHiquenKcOtwqbc/O3BAKeLNV21+y9pxRacmgjiRamLrtoVI2Xu/
	DAvKtHgyxuH6Nd+1UTLYnbobTHTH/yRVfpAP8NbQj+4HFhKwuYQy4rQ5ypuO0blzzg77shuh4CJtP
	r+rUBRm96qmkQJiubcy2VVI5B4aJikLH58fsI2w0ZIP9dNQAGqzpcCTrMJ/dMk/ILYTb5ESQQi2LR
	rlpL5o4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsdH8-00000009Ul4-0qdH;
	Wed, 18 Feb 2026 08:51:14 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsdH5-00000009Uka-2t4s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 08:51:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Q9PdRsv4oqQEVjsON/ocmS3V9+KatKpnLZcn3ErO6qY=; b=TfMyM0xSBrrKT1CiuQJKM0uc7k
	ucnbw5TizCFgds/lH6jRMqWhKLeihC0t/sGFqZ8H4ZpS/LWPxfpEatP1Oehtqtb4IN9tMFLoNf8h+
	RLC5TkwgqvC3wER391OsmS2HAL132OFwg4vlCiptgnJhfcoTgwRixYiu4Ax/IAdp903uZxoiFlAEC
	P0gTQTSA8veYQDHJ/ueDasVzVLNKtO1YgQ7i4k+D+PSEuPBMeSzPY10yBC5i+Pzdg66S0pY6nvKKe
	4+BhlKw3tvif5XqdAb9wIP1QjRX5zQDcoseo8usv24Afi7fMPoyP0+PLN3HSvf/cacQAnh1MDXZ5a
	xP/SGL9A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45412)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vsdGv-000000008ML-3Hpb;
	Wed, 18 Feb 2026 08:51:01 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vsdGt-0000000026z-3ltu;
	Wed, 18 Feb 2026 08:50:59 +0000
Date: Wed, 18 Feb 2026 08:50:59 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Christophe Roullier <christophe.roullier@foss.st.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] net: stmmac: manage error case during
 stmmac_dvr_probe
Message-ID: <aZV9c6lBeLX5s5Fo@shell.armlinux.org.uk>
References: <20260218083618.67805-1-christophe.roullier@foss.st.com>
 <20260218083618.67805-4-christophe.roullier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260218083618.67805-4-christophe.roullier@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_005111_730678_ED9B3863 
X-CRM114-Status: UNSURE (   7.21  )
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

On Wed, Feb 18, 2026 at 09:36:18AM +0100, Christophe Roullier wrote:
> In case of error during stmmac_mdio_register, pm_runtime is not
> cleaning before exit probe.
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

