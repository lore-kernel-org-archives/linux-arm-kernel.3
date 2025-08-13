Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6D6CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 00:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=30NEO6nNQCoOQHqcdOGh+EfygNykkrkbbzXmNaV5qWw=; b=z4zHM7zd09oJnT0p5eQhzrtu5o
	moDJS5mPRrt3BFK5Yr8h1YbUTPRB1jhEySZaGoIA7o/+UbQnmLhEJzYU9U1UA6r9vxwXYASwFhi+1
	7LlxD67hZ/vvh6iFogBayEyOX7+5BTuoGZyuSuyyR+3un0iCQqy8E/IubG8iN+SOxBlsP4S0kaHiM
	44nGFlhLCJyaGpslCOLgLmoK+enwcAAdIt3nuTRwMfezl7EWHEVv6ZmgHgyn+dtO+sO26nAKisa77
	lIHSKlHi5cFHdfAq/VE1M6zoCFnzpm468hdVbLDHMsZT3bYvjM7L3x3od5DeZwk2iTp8slYZnRu1Y
	mx5lEN7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulziJ-0000000CIdW-0nUG;
	Wed, 13 Aug 2025 00:51:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulzfm-0000000CIVY-3utR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 00:48:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5A653600B0;
	Wed, 13 Aug 2025 00:48:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95D3BC4CEF0;
	Wed, 13 Aug 2025 00:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755046138;
	bh=5ySabijytcLvAH8ERVSO35jFHmP0C94vF4wVqdhfde8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UEXwTYsMAAkO3PtYUlygaAHXIwGrutask0lqWR7MuSyf8nfPCpKjV6TAub/3pgpQk
	 tj47k2Y8AWXh4Gg8JU9eHWlrxsuz2hoR6DnWoraFfn14KhbrMKTgb5DfQtTepV7aUE
	 XysxZ5P4XATsGzSuwCxYVj/PyCNlcejBiSBDl4jq0da59p0o6RIQlhTjh24vGQTsJS
	 pldCOHEm3JyivFCdXMhUSU8kktR1HaFKKFuG33riYsirB5wsKbFhTBTrxo/AsItHY8
	 /zBQB3FDznxfysRfFkvl0o9aRRHCNdNBkua/mWSzOV6XWJdAFhyP331R9GLMaTv3iK
	 6GHI/3t8CAqzw==
Date: Wed, 13 Aug 2025 08:31:45 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] net: stmmac: add support for dwmac 5.20
Message-ID: <aJvc8S5CUfWH4MfO@xhacker>
References: <20250705090931.14358-1-jszhang@kernel.org>
 <b4091f34-8901-4a30-937a-a9aac35310b7@lunn.ch>
 <aGl3jiAjCiXMF_FK@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aGl3jiAjCiXMF_FK@shell.armlinux.org.uk>
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

On Sat, Jul 05, 2025 at 08:05:50PM +0100, Russell King (Oracle) wrote:
> On Sat, Jul 05, 2025 at 05:51:11PM +0200, Andrew Lunn wrote:
> > On Sat, Jul 05, 2025 at 05:09:30PM +0800, Jisheng Zhang wrote:
> > > The dwmac 5.20 IP can be found on some synaptics SoCs. Add a
> > > compatibility flag for it.
> > 
> > Is a compatible flag enough to make it actually work?

Yep, it's enough, we are using dwmac-generic.c for DT based platforms

> 
> Also, shouldn't there be a binding doc update?

The binding doc is already upstreamed by the following commit:
13f9351180aa ("dt-bindings: net: snps,dwmac: Add dwmac-5.20 version")

Hi Russell, Andrew,

Kindly let me know if I still need to do more to let this CL merged.

Thanks in advance

> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

