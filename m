Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8D2CF65E2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 01:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LvO5XQ+hJ+bO6yYuL4I5nYEstcN+CoP2zxmc7kZjaHA=; b=tauDUoe6bQ0UWmVLU7IGQY4LLT
	uHwnv9XNBFOgtcYGrI1TnzO4+Snml2Q/x7d416eRViW2Q5f6jUWy3PSBGuXh7p0R3ONUZqYrjEsjz
	YiZlnGKq6Z4AZKpg9j9SyWlVoOIPynYCbZ71NpTS2bhfsXYdZICFvcAhypLV4i1d9wz2YZHYTubAf
	v3BIGzTPimtfiaRCcfN+KT0s9Oshb2RJT5NptcYMRwmZB/8+s7J+kxums1gLd7MWP368qVuN0rQhm
	m7UM8L2qOA1U2I5e8NntQANpiOThq8no3byZ3pcUygfDkG4A9jmnreEtdLnMVv1qW+FxJhzKkzFqv
	hRsFfFpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkYIz-0000000DSef-2oXL;
	Tue, 27 Jan 2026 01:55:45 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkYIw-0000000DSeG-1176;
	Tue, 27 Jan 2026 01:55:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LvO5XQ+hJ+bO6yYuL4I5nYEstcN+CoP2zxmc7kZjaHA=; b=K73u5pQrlQ8ZLV9RxyHv2J/jwb
	9aR25JTtJYKT8McR4etdr9G5J1IwvVSnsqBfzSAWRF2Xs04MHMmaaIk2HKIuZzucV8DfZgDCogub5
	sHQO6jFzMTR4S8yPAo1aWvXX6FbTXBTINf3sp2BO6tar7XkhFZZAIi/4SLGV0tjm4dauvCLoN9c1w
	nR5f7Uh3cpcqPMnH07wE6MBFCchZp2babQSwibPJZIyJcrF7GdNy0WcLqJs1uorvMUraFtiNQa0AX
	TPqZ8MGFz/TW7126NU2Tamj3H6qp7zK4GYfC4gx7Myi/MzdpajEEK4CKcbbwdzjffkq3W1dTlg2sa
	Gq//ZoRg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44380)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vkYIo-000000005WJ-0PkD;
	Tue, 27 Jan 2026 01:55:34 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vkYIj-000000005Ta-3Dv2;
	Tue, 27 Jan 2026 01:55:29 +0000
Date: Tue, 27 Jan 2026 01:55:29 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v2 06/22] net: stmmac: rk: add SoC specific
 ->init() method
Message-ID: <aXgbEYvjcXqQKRIx@shell.armlinux.org.uk>
References: <aXdTi4ViCkhhXvFI@shell.armlinux.org.uk>
 <E1vkL28-00000005usi-30YC@rmk-PC.armlinux.org.uk>
 <aXd7aSk7KIxlQd5z@shell.armlinux.org.uk>
 <20260126165144.25055591@kernel.org>
 <aXgN2UjiI_OxWHH-@shell.armlinux.org.uk>
 <20260126171606.6153aa1a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126171606.6153aa1a@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_175542_286488_B4888EAD 
X-CRM114-Status: GOOD (  26.68  )
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

On Mon, Jan 26, 2026 at 05:16:06PM -0800, Jakub Kicinski wrote:
> On Tue, 27 Jan 2026 00:59:05 +0000 Russell King (Oracle) wrote:
> > > > and there's no way to find out for about 9 hours (more like 19 hours
> > > > for me because of the timezone) as the AI reviews are not accessible
> > > > until then.  
> > > 
> > > The patchwork checks are for maintainers. If someone wants to build
> > > a public CI for contributors that'd be great. We can even provide
> > > funds from the netdev foundation. But let us be clear that the current
> > > setup is until now maintained primarily by me for me on the weekends.
> > > Unless you make an effort to actually help I don't think it is in good
> > > taste to complain.  
> > 
> > This sounds like my contributions to netdev aren't valued, and if that's
> > the case, I will stop.
> 
> Quite the opposite, what I'm saying is that your complaints make me
> feel like the weekends spent on trying to make this project come out 
> of stone age testing-wise are not appreciated. Of course your
> contributions are appreciated.
> 
> The AI code reviews on existing buggy code are indeed very painful.
> Not sure what we can do here to make the contributing easier.
> It costs us around $2 now to review a single patch so we can't afford
> public access. I think Google is working on making Gemini code reviews
> public and free, hopefully that materializes.

For a series of this size and complexity, the AI reviews are valued
because it's finding real issues that I can't test for.

The big problem is that the AI only finds one issue with a patch, not
all the issues. So, it's going to take multiple submissions to get to
a point where the AI review of this series is clean.

I suspect the problem with "AI only finds one issue" is that the AI
systems aren't advanced enough to do anything else yet.

So, do I continue fixing the AI issues each day and resubmitting a new
version of this series each day this week, costing $44 each time? Do
we reach a point where it gets merged even though the AI review still
has issues?

These are honest questions... and if they haven't been considered, I
think they need to be, because I can see this series becoming very
expensive.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

