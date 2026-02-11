Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED573EA3F27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 10:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x26RJEZzvywxmqhbMuzA7A8coQZewEhYsgXJn0+8VIw=; b=Jxim2ySemARPhonzyLM6owSkNK
	61VQjxQvjnjBchr1xqVjEWAcbm5AiGkxq9TAGfmkNYFilqfldfPxxOknTyFm46UQoID7s2l54CPzs
	NFFsTVr/iJ8IgM6xrxuSc1cPgMP9jpo3PcikAzN534gTgiagHsHtaQGQqygWw0yl4XSU2e6M1eROJ
	TugDgEzzOC6scH8bfSjhPRckjHjXqu9xx+QwxOEeaddbgXYHcSEevgrvHaU7YgK4Z+Y5LHVKTnfAQ
	+Pg3ISqTGfe7jBfnTs8tjVAoqggt0uYAs4O+zDB5JMqp/JCw1kidkvvBNwr+3h8yj7JZteD2d9ovB
	GNZRiktQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq7Mb-00000000Uig-3HxD;
	Wed, 11 Feb 2026 10:22:29 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq7MZ-00000000UiG-0Jtr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 10:22:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=x26RJEZzvywxmqhbMuzA7A8coQZewEhYsgXJn0+8VIw=; b=z4W1LRrYkYWx83Y554+BLK4ps/
	kVIQ8R/xWaPBtSIVRSxNeQxUZR9q/qriUgI3IuFK/p+PhIWjaONg3mJu2RR/6f8/QTOZlhlqusSwg
	fkFoLU6UFJH/2vU5HeOMWorE3bHSPb5/aGh3gmzBViiPULwhubt4MLzZ00LMDV8A/V2u3P8UMCZUJ
	gT3QvTwSTWt7MvCSEIysqM6eXS6tX5YmDPQOBIjSfWpOX1z5pE60m5+Z8SR6jlEBJurVc3bBM+/1V
	BRp3ICKDwKulxr0GcBRYHmaLH4jh+TUOf1wacGWYe0JN6tDHwSQhA0J7sP2wDET0dBBh1GwXRPq0R
	JHoTO1jQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55616)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vq7MD-000000003Ij-10GA;
	Wed, 11 Feb 2026 10:22:05 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vq7M6-000000003hT-07hu;
	Wed, 11 Feb 2026 10:21:58 +0000
Date: Wed, 11 Feb 2026 10:21:57 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Joey Lu <a0987203069@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	richardcochran@gmail.com, alexandre.torgue@foss.st.com,
	joabreu@synopsys.com, ychuang3@nuvoton.com, schung@nuvoton.com,
	yclu4@nuvoton.com, peppe.cavallaro@st.com,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v12 3/3] net: stmmac: dwmac-nuvoton: Add dwmac
 glue for Nuvoton MA35 family
Message-ID: <aYxYRZZkVFz2jHaF@shell.armlinux.org.uk>
References: <20260210052226.3005666-1-a0987203069@gmail.com>
 <20260210052226.3005666-4-a0987203069@gmail.com>
 <aYsurPBMnzWDZCco@shell.armlinux.org.uk>
 <747b9ab4-6711-426d-95a5-4ce6c8732edd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <747b9ab4-6711-426d-95a5-4ce6c8732edd@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_022227_117358_454D44BE 
X-CRM114-Status: UNSURE (   7.97  )
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

On Wed, Feb 11, 2026 at 05:52:21PM +0800, Joey Lu wrote:
> > Is this register preserved over suspend/resume ?
> 
> It is not preserved by the GMAC suspend/resume flow and therefore needs to
> be treated as a system register rather than a GMAC local context.

That is another reason to use .set_phy_intf_sel as that will be called
just before GMAC soft-reset in the .ndo_open() and resume paths.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

