Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B509CF58D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 19:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dg+ZfMlkkva2YqCScrw1/cbaetvEkaxgzLwIQZgnGh4=; b=bPZ6UheocT+Hp3xMaUw88yd2u6
	XUEYaGJCQNOaJiKWdnYR4iuPRW11UA+pUClxTU4Mitib5C9QhP47S395CElvBhNBaGHOCIxfTCwcT
	oRZuYI7Y4Cwrgg1ekECMGsUNH1ubYGFA3ZhxQq4cGYg0YQoD5aWlrNIw2mI5NQYHV1gy0Vme4P9vn
	0RVjEHz7Ezv6jBsF03UUsIhCReCeWKxJzhopmmx0CkhTRmrTQ2vIa0X+TVLn0i9gJZDfhNxwqxaj7
	jcUG9py7mtpuusAWvi7YxMK5kC7AhlkJdjjxdb+Fxx/B0gmu1eHjqDXIuaPyqDRfOel+l+mOLyPKq
	p3E45erg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLoDd-00000005Cf1-1YLB;
	Wed, 19 Nov 2025 19:51:57 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLoDa-00000005CdB-3r2c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 19:51:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Dg+ZfMlkkva2YqCScrw1/cbaetvEkaxgzLwIQZgnGh4=; b=F6pln4dJ+YqiJig6hY3QPemhNm
	tATG9SMWl+R1km6OTNq4RfvHlZtEwuQT9ulsgU0GvI49LLfrH3XtwI2O4tXKZ6HsT4/apTp3Hic6L
	HTEmW2NCTyFaoZHUley8+ZUMgcsLyTtHwyInPy532n1gMnU3NWGz9UldZ3vU8g91c3bI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vLoDP-00EXnU-35; Wed, 19 Nov 2025 20:51:43 +0100
Date: Wed, 19 Nov 2025 20:51:43 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 resend] net: stmmac: add support for dwmac 5.20
Message-ID: <c73c4683-6bc4-42e9-9f5b-9b5bcd2f0aa6@lunn.ch>
References: <20251119153526.13780-1-jszhang@kernel.org>
 <aR3snSb1YUFh9Dwp@shell.armlinux.org.uk>
 <aR3p4NBK-AnCGK6a@xhacker>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aR3p4NBK-AnCGK6a@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_115154_977726_15DF6448 
X-CRM114-Status: GOOD (  21.34  )
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

On Thu, Nov 20, 2025 at 12:01:36AM +0800, Jisheng Zhang wrote:
> On Wed, Nov 19, 2025 at 04:13:17PM +0000, Russell King (Oracle) wrote:
> > On Wed, Nov 19, 2025 at 11:35:26PM +0800, Jisheng Zhang wrote:
> > > The dwmac 5.20 IP can be found on some synaptics SoCs. 
> > > 
> > > The binding doc has been already upstreamed by
> > > commit 13f9351180aa ("dt-bindings: net: snps,dwmac: Add dwmac-5.20
> > > version")
> > > 
> > > So we just need to add a compatibility flag in dwmac generic driver.
> > 
> > Do we _need_ to add it to the generic driver? Do the platforms that are
> > using this really not need any additional code to support them?
> > 
> > Looking at all the DT that mention dwmac-5.20 in their compatible
> > strings, that is always after other compatibles that point to other
> > platform specific drivers.
> > 
> > So, can you point to a platform that doesn't have its own platform
> > glue, and would be functional when using the dwmac-generic driver?
> 
> Synatpics platforms use the dwmac-generic driver, it's enough now.
> But we haven't upstreamed related platforms, but will do soon.

Please make this patch part of the patchset when you upstream the
platforms. We prefer to only add things which have users.

    Andrew

---
pw-bot: cr

