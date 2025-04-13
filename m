Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DEC5C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 21:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fLQJM6ERhkCMHtQZ6mtLOBHjWODKm8YrfDgknSKdTe8=; b=jT33VfkLA9BFrJf/BqqWteuK+5
	jPjcUtLPKJ96gRpyvT2gyz2+9LMdFG4ppE4RbNyv7IYHtu4h69wUscaUEHeuPkQul/7kHgFlZDKgp
	gkUZpLZ+nb4AaCrB62nvTkFHb17yP2zDlmUGd6mD7X7l6W7SAcIJzB7Lu8Z9t2VZn/sidfeMFqQc3
	6i+BCQ5wEPBTdZIxFbJD4YOpVU+HKkc0CXqkn1ko6JGpwu2cNeX5f4xpmWLoSbRhV7WPdSVZ7X7VH
	bkGfh6dQq4zcnzT5SXrqwQ2A16IXseJg1v+zZGm0US3GLnQgdSggwJydI1JJEElxC7ixsgaiO1WFB
	HcDMnMoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u44dP-000000009Ov-0wGW;
	Sun, 13 Apr 2025 21:12:59 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u44YT-000000008n2-45Zu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 21:07:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=fLQJM6ERhkCMHtQZ6mtLOBHjWODKm8YrfDgknSKdTe8=; b=HbxVu7op+iMZef01zHEWtTlLoc
	vkxskzULTOzdYdM3wl9lP+CARJK2/7DrS5W2i5jrGSIeHjt0Dy3X17vU+yeQB8bfqGtKb1AxVfnlB
	t4YcYdQaXOyEblnmu19EQSPl3MojSyjBneWn+ujnq3yAnF4N5cCxTQBt/EWfIBrjpbD0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u44YP-0096JL-9z; Sun, 13 Apr 2025 23:07:49 +0200
Date: Sun, 13 Apr 2025 23:07:49 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 4/4] net: stmmac: qcom-ethqos: remove
 speed_mode_2500() method
Message-ID: <9987dc3b-8ec4-4c13-8054-73b2b52020e5@lunn.ch>
References: <Z_p0LzY2_HFupWK0@shell.armlinux.org.uk>
 <E1u3bYa-000EcW-H1@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1u3bYa-000EcW-H1@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_140754_014445_5DBFD569 
X-CRM114-Status: UNSURE (   8.37  )
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

On Sat, Apr 12, 2025 at 03:10:04PM +0100, Russell King (Oracle) wrote:
> qcom-ethqos doesn't need to implement the speed_mode_2500() method as
> it is only setting priv->plat->phy_interface to 2500BASE-X, which is
> already a pre-condition for assigning speed_mode_2500 in
> qcom_ethqos_probe(). So, qcom_ethqos_speed_mode_2500() has no effect.
> Remove it.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

