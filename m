Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377E1C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 17:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a51LPLjOt3wwZB6mg+Y3S9/fHKpsOrF0RHXl8dP5K9o=; b=arqM5NKf86t6IIKdB4zdjYGP53
	iYlkZj0qR+Izq33Hs4iuoG2iS3Gcp2IKT4G+q+kHPvBEckelc7HJG22bZFOAKZiIEf3ZsKG6VYmhP
	eqcNorZzdwSGYZ+fCaAhgOx/+Arf8QLCKyByKH96oaXxco4NIl2VjWMQafxiwZ5Rqh10mIUaDFuBX
	XIGgU9dHd+U27BYQESP7aTpHEWG07exsGe/6Ih5FieYr2QNe/egh4JOmi76QMjHVKjmBhlKXHI7tW
	qb8oDKNZlJ5GuP8FxoI+AKOy3qrX8EMpg4UCU+TLc24mTKWEH2Td4Z99jgJWH52X+FRXprRvaOXxK
	2db2QRuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjWW-000000049zf-2Zxr;
	Wed, 05 Feb 2025 17:49:16 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjSg-000000048bZ-1UQv;
	Wed, 05 Feb 2025 17:45:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=a51LPLjOt3wwZB6mg+Y3S9/fHKpsOrF0RHXl8dP5K9o=; b=YFke/Ib8EU5hGyNz5OI18D/jXb
	LgKzeb6g4CeABgLgLmj3yzRSwdQnFVfTrNyBnLB5+V6yIz8fDaBI2KMVhjMYTVO2Tc92tOL4IFXtM
	myCRnncf5o8lh85f8iYKOTArbHfFqFTA3wgxnkFM9Ws3L2Zxg8WwpPPZ66uOiIhNTkwou8AEj0yQG
	Xx7m1YTkkBfv+9n80iYQ3U+/s9B9mBadOs6h5bTqCmNqY8QA+fk9zw6p2xOkO6U0a4ctamQHzFlOM
	KxyMPIqjLiaq9/7m6gfVLlVIU/wQ3V6JLsRlheTDy89eWAL5MsvXtiHAIwcbkIpv++7MN0a7plBaA
	3XSQWG0w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52386)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tfjSR-0007tq-0B;
	Wed, 05 Feb 2025 17:45:03 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tfjSN-0002bu-08;
	Wed, 05 Feb 2025 17:44:59 +0000
Date: Wed, 5 Feb 2025 17:44:58 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Simon Horman <horms@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Steven Price <steven.price@arm.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
	stable@vger.kernel.org
Subject: Re: [PATCH netdev] net: stmmac: dwmac-rk: Provide FIFO sizes for
 DWMAC 1000
Message-ID: <Z6OjmtiZ4A8BzvsP@shell.armlinux.org.uk>
References: <20250204161359.3335241-1-wens@kernel.org>
 <20250204134331.270d5c4e@kernel.org>
 <CAGb2v641vvtVKv8QbiEfHnMWngcKYTJZAgfH5k+G_nOvZcbC9g@mail.gmail.com>
 <20250205173824.GJ554665@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250205173824.GJ554665@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_094518_390830_BC9DFE62 
X-CRM114-Status: GOOD (  16.68  )
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

On Wed, Feb 05, 2025 at 05:38:24PM +0000, Simon Horman wrote:
> On Wed, Feb 05, 2025 at 11:45:17AM +0800, Chen-Yu Tsai wrote:
> > On Wed, Feb 5, 2025 at 5:43 AM Jakub Kicinski <kuba@kernel.org> wrote:
> > >
> > > On Wed,  5 Feb 2025 00:13:59 +0800 Chen-Yu Tsai wrote:
> > > > Since a fix for stmmac in general has already been sent [1] and a revert
> > > > was also proposed [2], I'll refrain from sending mine.
> > >
> > > No, no, please do. You need to _submit_ the revert like a normal patch.
> > > With all the usual details in the commit message.
> > 
> > Mine isn't a revert, but simply downgrading the error to a warning.
> > So... yet another workaround approach.
> 
> I think the point is that someone needs to formally
> submit the revert. And I assume it should target the net tree.

For what I think is the third time today (fourth if you include the
actual patch...)

https://lore.kernel.org/r/E1tfeyR-003YGJ-Gb@rmk-PC.armlinux.org.uk

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

