Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44720C28B23
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 10:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YT4fyw15FhC7ENEFEWrArUC0UmuVlfAgskEDQIOVO24=; b=sv0i5MS8H+eWNpUbqG3JIhN/6I
	IhsvlNSNzBABhd67ANZoO5XZKYr0pBVAg5wvbtfOrP58G5YG9nrlM+sbL+fYgL7N2TfbgSyai29Am
	S5ASoRnOnqnXqbXcjmHgK4nZ1ll4I4JZtN+amYk6CbbtLjQH79ZQMCRn3R5d9re20SIHsH1f9WX88
	OTeh2wHerjzkyHdAjgIK4q3L48/UtPrX3t5+oaWEtPLHFx+Dm4TRfaPR6GXXBp+90hqUtmmmil19N
	O0pEZZZoiY4XwaWMFsqqRfI+4cVpwOAFeNBe3GIYXnK4+fDuHdHSHNCMX1ILl/GZ2X6uTTWp3L4jz
	V67prVaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8CZ-0000000Aau2-47hw;
	Thu, 06 Mar 2025 10:11:39 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq7yr-0000000AYvX-1auu
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Mar 2025 09:57:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YT4fyw15FhC7ENEFEWrArUC0UmuVlfAgskEDQIOVO24=; b=LQQO45zthZBeUXPkP9cZjYPDMs
	UopQYhao0EzROyVXwPLxofjo+KrrQT77H4aKDHfuFzIwNzd3poez2MjYEZsIuloyaH1hjREYf67P4
	00uipXLCXTS5U2RD+xFJ3VwB0SFpwctl7AL0eVxMyZKFRBmeUDcVuh84yxNazg/blu7Dmm3aT7BJ4
	GrW1w4DgUmm47g/jCtXqHnxJoDBMHxf0bBPORqbQzLH5teq+lENvv3jboB/1i9fpm5M7IaFu46890
	45SRDtAoUpfOBNnv3YEUGxznX1s+4lLg+JwnwMFYZlUFzcZH47kO9OUmKlsmjry7gSS0+oVJUYRmk
	GUaOHWUg==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq7yn-00000007C7K-3Duz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 09:57:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4C44D5C4B74;
	Thu,  6 Mar 2025 09:54:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 335F6C4CEE2;
	Thu,  6 Mar 2025 09:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741255035;
	bh=wsDrmZWqNwZ8Z92QvIsMkJWkfZRuwXzjXEV5bkQIeE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BkUmWWfq0wnktTbrQMOzFCxZ1idiOiZOA0Td5RKlwaMZLIzNz8MCsANI6ruO+VVZp
	 gbGm7NG8dpfDTk4y3ua5cy3hTFiR8v4JXyYFNoQE450Jkq+dXHs9gXxrUbNs7B7+q4
	 xySW/R9nLFVa21UfFdAEhuSjeQJh/tp6GlJbhPT3tEcjlRW6hLVnCgjQ0rtGnls/dz
	 tlLYsYOaP4jm3eK0Ipat41qGStDjxly3buRLC7i+x/V7WgMlU7AerBmYZ26g9j/0Fi
	 hLTgZNC0sfOIk976NyWco3xeMZQ5uQndGt+QKyO3FUfl5L3DdTnKUCV1f0RFX7wxY9
	 QETTN5tbBhK3w==
Date: Thu, 6 Mar 2025 09:57:10 +0000
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
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
Subject: Re: [PATCH net-next] net: stmmac: simplify phylink_suspend() and
 phylink_resume() calls
Message-ID: <20250306095710.GR3666230@kernel.org>
References: <E1tpQL1-005St4-Hn@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tpQL1-005St4-Hn@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_095725_931062_104A9E93 
X-CRM114-Status: GOOD (  10.00  )
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

On Tue, Mar 04, 2025 at 11:21:27AM +0000, Russell King (Oracle) wrote:
> Currently, the calls to phylink's suspend and resume functions are
> inside overly complex tests, and boil down to:
> 
> 	if (device_may_wakeup(priv->device) && priv->plat->pmt) {
> 		call phylink
> 	} else {
> 		call phylink and
> 		if (device_may_wakeup(priv->device))
> 			do something else
> 	}
> 
> This results in phylink always being called, possibly with differing
> arguments for phylink_suspend().
> 
> Simplify this code, noting that each site is slightly different due to
> the order in which phylink is called and the "something else".
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Simon Horman <horms@kernel.org>

