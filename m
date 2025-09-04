Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C360FCA1012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xTiDOTyQs4o2KTqHJ5rl2nvLZ6nilRCAZAsj4RoV+iw=; b=JlNPOUWCw2CUDq6Fl3Mp+n4x3J
	eMc0F2rrVqMmQypMiXvjnw2xaSdXdZNECKdo34+OAclN/A41g3p1OSrNWBseiAv24rIySokvIB5jf
	j9CvD4ba0dRmipR4FchQUNmS4YOeQKBbgFYs33VyogPiLHVkWAJudM0caKZMyALIW9DDX2Cn1RplB
	td8FKJuRLF/L8Q/B/6NsExZeu79Te4DFzfrEBK0JT8C1ml6L5YMzobqoMAjXs2/9nxKQI86celcXj
	Arm1Pw8WhS3hdx6t9oMH55oiYxBRZmjts47hOUYlRLplzGHNN5wHLiaB9jfUWGUQP1+Vfk5ZjxJKC
	RQX89yHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM1D-0000000FygH-1q51;
	Fri, 05 Sep 2025 02:17:39 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuF9N-0000000Dlwt-1UCC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 18:57:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xTiDOTyQs4o2KTqHJ5rl2nvLZ6nilRCAZAsj4RoV+iw=; b=RuX5dCrsF8J5h3npPIEwhd6p1F
	J2N+TqNVCqSV7s2Q6lfCFIxm2jnzk9yjEg85k9LeSVyqYs5kChyzThEWEzPvlOR3O0J/p2MHXyHT7
	1CDt79LQmAhNPZwOlmV7vM1JI0K7MurJ1LT/6SdKBjXck89KBPf4HplcIgyc3xeb3yKE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uuF9H-007G2z-7n; Thu, 04 Sep 2025 20:57:31 +0200
Date: Thu, 4 Sep 2025 20:57:31 +0200
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
Subject: Re: [PATCH net-next v2 03/11] net: stmmac: mdio: provide
 priv->gmii_address_bus_config
Message-ID: <91aaefa9-a594-4336-918a-5c50654ecb50@lunn.ch>
References: <aLmBwsMdW__XBv7g@shell.armlinux.org.uk>
 <E1uu8o2-00000001vog-1LyK@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1uu8o2-00000001vog-1LyK@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_115737_390586_F0C49A74 
X-CRM114-Status: UNSURE (   7.40  )
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

On Thu, Sep 04, 2025 at 01:11:10PM +0100, Russell King (Oracle) wrote:
> Provide a pre-formatted value for the MDIO address register fields
> which remain constant across the various different transactions
> rather than recreating the register value from scratch every time.
> Currently, we only do this for the CR (clock range) field.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

