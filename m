Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA80F105F79A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 11:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=04gqaMJ7nWJ/la8QtGxvljhh8gpBd2Y7ie/l7eGhAn4=; b=0g+3ODkpTEL50qp+gZJUqabK/W
	Eqj4gGIp40dBCd5saE773wduCo0C9MWPpKF17yXAA8rh3Vyr+ujuUA9+CVKGbKATcpJAhLotWr0En
	GG5M1fyd1ZBl8bT5BjCV4DT0bCOBkWR5xB+zkvAb/YrOsdLHPEIMojSBz/28/3dZZqGCRT7BV4p0/
	OFjP4tpVWwyk5Gasz6l/sr0jU1U1g4fjrrNAPD79BmdfHUkWYwe3Jca6tNJNt24lIa60lUFa9l8r0
	NIgUsJL7Tm/YSbfQ6rJ3c5StaLBQKKHroX8nWuqH9K9cK9zIJCSz5WEXbqsBD55+1Svk9hGKAZ/9P
	xPTQbEsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10Nf-0000000HZmC-00JJ;
	Fri, 13 Mar 2026 11:08:35 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10Nb-0000000HZkd-44G5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 11:08:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=04gqaMJ7nWJ/la8QtGxvljhh8gpBd2Y7ie/l7eGhAn4=; b=tlJw/A1UbK0Q9vbFr93ejntT8I
	Nx2iJiwkgP75sChivKom8AZW7s/EOxvo/Ru3oDOMoC69QkTIzdqfG1XBfEkGwV4Q5o7EcXv1a117s
	R+1GRBsMit93xU/oBixJPaXPcmjmf8Q5R1UwEHvJN8hX1QcWhFMEp3+9CD0tgSS9DHHmCtWyTjflZ
	myvFkHzbjmwpr67coCFDb2rlXm0aTx13cfyLaumHRkiNpG2ZvCtrSio0v0fHkPHH/WJ98ZTHygxIv
	/pVJpimEzyjiqdOo1EOcgj52QvpqQ5ovJNa1nHHdp+0e798YiZEJ2Pjzs0n9AazKO/XUdL4QNT2Ny
	pKctI1AA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53580)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w10NP-000000000o3-05kB;
	Fri, 13 Mar 2026 11:08:19 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w10NK-0000000089x-2nw7;
	Fri, 13 Mar 2026 11:08:14 +0000
Date: Fri, 13 Mar 2026 11:08:14 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Christophe Roullier <christophe.roullier@foss.st.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linusw@kernel.org,
	antonio.borneo@foss.st.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] net: stmmac: fix pinctrl management during
 suspend/resume
Message-ID: <abPwHh12MLwMwOIs@shell.armlinux.org.uk>
References: <20260313105718.359614-1-christophe.roullier@foss.st.com>
 <20260313105718.359614-2-christophe.roullier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313105718.359614-2-christophe.roullier@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_040832_020110_9029A964 
X-CRM114-Status: UNSURE (   8.16  )
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

On Fri, Mar 13, 2026 at 11:57:16AM +0100, Christophe Roullier wrote:
> In the deepest low-power modes, the pinctrl configuration is lost
> and is never restored if the interface is down.
> This commit ensures that the pinctrl state is set in all cases.

Shouldn't the pin state be restored by the pinctrl layer?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

