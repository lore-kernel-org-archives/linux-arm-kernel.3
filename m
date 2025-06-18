Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A17BC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 19:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mbpyUcV8WJEkmNQrYOMEQSj4rAFYVKz/rtUgfOJMyew=; b=NTB+1/t/Yy3ap64cshNmDu2YXc
	3mi+5HN0tknlslrUk+elETEH4zy9Ql+El3pUoL8O227KFGJoyg9Zdp41K93wCO2qN3gpIF6vY2oeZ
	DylCOX25XEB5Cl4tx+AGr87pQ4OsnbRwN7dfxy7MihPoiWAFPUwYb39r53uYdMZ1h1ZTTq0s506RD
	SwfsQlWtPxUbf8dGs5oHSf3tafj1h480tbXwYn1pSCtfktWS0OA5sjxjSOAPAgZsUX+eg9lseQdyi
	VlziJRkm56fR0we3xAdHRhpr7nOS/nLP0iYqQS8EJvy18et62LOeVIFze9iiKgej/Jf1v3Gr9Gvkq
	1JPMUPMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRyfP-0000000BEhf-2Ndk;
	Wed, 18 Jun 2025 19:41:51 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRyRb-0000000BDYr-46PU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 19:27:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=mbpyUcV8WJEkmNQrYOMEQSj4rAFYVKz/rtUgfOJMyew=; b=EaIfnTLGw+4JwC3Kzt5QUG2/YL
	t24i+RjeQafPTa8HWidbHGlIousYnbhxaqPsVwx9Wekyhryw/B+I0T/xRZRIbbklISomjvy5dLIMn
	4OJSC8Y4EJMhQnRFFcpqYfYs/9bXSBXQi0+dlfOtH4Uc85y91CI6/yYxq6Xr2loroqBk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uRyRM-00GKRb-Q0; Wed, 18 Jun 2025 21:27:20 +0200
Date: Wed, 18 Jun 2025 21:27:20 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 1/2] net: stmmac: loongson1: provide match data
 struct
Message-ID: <ac285b47-ccb0-4f85-8f28-cf0067b1334c@lunn.ch>
References: <aFKXzlno7HkG-cNh@shell.armlinux.org.uk>
 <E1uRqE9-004c7G-CB@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1uRqE9-004c7G-CB@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_122736_094173_B7C1BE5C 
X-CRM114-Status: UNSURE (   7.90  )
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

On Wed, Jun 18, 2025 at 11:41:09AM +0100, Russell King (Oracle) wrote:
> Provide a structure for match data rather than using the function
> pointer as match data. This allows stronger type-checking for the
> function itself, and allows extensions to the match data.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

