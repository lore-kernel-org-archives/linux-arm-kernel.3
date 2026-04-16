Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E121DF8D76E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 19:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HASfmhv4rUG5GHgvnGz8cmO8OTo9CENeqWoVTI5Y+4Q=; b=e5xkp2KcUJNi1aa3q5g7woda7s
	xOowlOQiab/KNhHB3G44pvMzCjDzcgje4nXxrz6nQ4o7Yoi1hiBMz3AHywD8rwZjnSZT9XuJO4syU
	NM+lGZxpFSvIuhLQhI4/QqU1z07soBk3Yl8PMF9mF1GS4rrEKMrKAkXIqas8e6BIXZpOOoervVqk+
	qx3K9VJNyUOSQvpNCzG6TTim2AY8DWWq/xbhmJHSGVuOb81t+5xEeDpvIFIA+hJO1cPBoxrEo6WZE
	S5TDxU7sWoiSiDWGHR4icXQyqmODsdQ9jLA2MJbusnqycNU2+svpg+8v+fNNsd1EzRcuxQ74e+Js7
	2EufrBWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDSfo-00000002uoQ-2N6G;
	Thu, 16 Apr 2026 19:46:48 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDSfl-00000002unq-3Yby
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 19:46:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HASfmhv4rUG5GHgvnGz8cmO8OTo9CENeqWoVTI5Y+4Q=; b=lpA7J4PwOr6GgUySmqbcuobRqj
	wFji3X5wBStapZ+y3eyYuQcQDu5bAH97dw377gaIYNYl6D00xkjzXiW+6n5G4ujfVqmlTfXJF8yWc
	azw+sUd9yNQZBV/RJzp5IOHRg0n1iEzaBPqaj3QIsQYKXzluvkqkZXBt+rNZO/oV65DysECG8HKvs
	Z4csOLuA7UQw6GB0wDUA8woWlMJQJ/t4FoUa+V1xAZJB3mZbLfCplRK9loVN2vlqEQl/ivd7KvnH4
	2g7u+dVoEBx+RIZt/7gpcR31XcxpcjLYq4EOEBn1CICDaDY5c9tfo+nWCLx8Tm3UMo3mSudzKppN5
	dk7cQeVA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37416)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wDSfd-000000003Vs-0REi;
	Thu, 16 Apr 2026 20:46:37 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wDSfa-000000003UF-1AiS;
	Thu, 16 Apr 2026 20:46:34 +0100
Date: Thu, 16 Apr 2026 20:46:34 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 5/6] net: stmmac: move PHY handling out of
 __stmmac_open()/release()
Message-ID: <aeE8mpXy9FRHvN9q@shell.armlinux.org.uk>
References: <aNKDqqI7aLsuDD52@shell.armlinux.org.uk>
 <5987484.DvuYhMxLoT@steina-w>
 <aeC-tc2CooYDoBok@shell.armlinux.org.uk>
 <2410317.ElGaqSPkdT@steina-w>
 <aeDSTIS9-TDSihbX@shell.armlinux.org.uk>
 <aeDojTdDTELfpT0X@shell.armlinux.org.uk>
 <20260416090826.1c5ca018@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416090826.1c5ca018@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_124646_211497_C60EFD91 
X-CRM114-Status: GOOD (  15.37  )
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

On Thu, Apr 16, 2026 at 09:08:26AM -0700, Jakub Kicinski wrote:
> On Thu, 16 Apr 2026 14:47:57 +0100 Russell King (Oracle) wrote:
> > The next problem will be netdev's policy over reviews vs patches
> > balance which I'm already in deficit, and I have *NO* *TIME*
> > what so ever to review patches - let alone propose patches to
> > fix people's problems.
> > 
> > So I'm going to say this plainly: if netdev wants to enforce that
> > rule, then I won't be fixing people's problems.
> 
> Do you have a better proposal?
> I'm under the same pressure of million stupid projects from my employer
> as you are. Do y'all think that upstream maintainers have time given by
> their employers to do the reviews? SMH.

Are you really under the same pressure? I have one of my parents in
hospital right now, and was in A&E yesterday afternoon through into
the evening. I've been down at the hospital since 2pm today, only
just come back to feed the other parent and head back down for what
could be a long night. Then there's supposed to be an appointment
that will take up to 3 hours tomorrow morning...

Yea, I'm sure you have the same pressures and worry from your
employer - except my pressures are medical, looking after my parents.

Thank you for your lack of understanding.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

