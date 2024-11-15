Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCBE4D68BDA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 23:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pz1F5XEr2lFpMG+OE06etCaUnufQXQZKei7SwxgGMjA=; b=LQbMxv+HBPxHSCMEQrjUE3s2lC
	WrtE2XwkY3MUHJdoxOJcUyza+JQacwijvkGSua2DIl15C8ZXnieBG9F+e7QynoCL7OVy71l1osNtc
	KMsyjcJwGGcWjB+N+MbIJN8ouqLKb6REdStq2+uaxWZHaxKWThji+pv9/7mqzTfI5xzt2UiwCQ829
	DyaQtRi8T07sy835rOiYFPh9Y5/p4DGpgewMx1e5uCRObUMgRAPf4GBxiIRaWL7YvzkoW6RlShUWc
	OZXotycm4Fimmtn2aAguiRdNSEQ0RRmaMK6C5jgp/MFjvRZ8spHDfi+IgL2LYZqjCY8P1jeky80o/
	jdWmm2iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC5IY-00000004URN-2tVA;
	Fri, 15 Nov 2024 23:00:18 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC5Hd-00000004UHN-2C6M;
	Fri, 15 Nov 2024 22:59:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DA2C9A41DB9;
	Fri, 15 Nov 2024 22:57:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B642EC4CECF;
	Fri, 15 Nov 2024 22:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731711560;
	bh=fUh5s7BsCwoaZmYFGIY2veyC4azYYi1dCvhz9yokXG0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=eu4cs5Wf05VYisSHEwhIeVyub9YTwSD6bDuvbIuAC+BhUmUpPzMeybF4t20rSew0k
	 eAp+tOXT1vRizIbTAeM5kZ9qJ8pWIWwTbyAAnzbAA5cs/aQnaOCkLNdBS4dR+S/eG5
	 pYxHNlclxuoUjkpHSdGDi6RBZ+do8EovBK2pooEO3b/cznfsvGh+X7XVy3KYwx3qx3
	 yUQdEHosRJ0W1x13K+leNe8DHoVIZ7NxeVUDhuHx+yb/qMK+Mx+plzTiuLRjGn915E
	 7n2jtcBIyVSXjC/1b1IpdU7wWRTNvo7A9TdZcs2mWtZVIcYVo30HAsyt2H2OoqUVyB
	 MVmD+rElBmTdg==
Date: Fri, 15 Nov 2024 14:59:18 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit
 <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, upstream@airoha.com
Subject: Re: [net-next PATCH v5 3/4] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
Message-ID: <20241115145918.5ed4d5ec@kernel.org>
In-Reply-To: <6737c439.5d0a0220.d7fe0.2221@mx.google.com>
References: <20241112204743.6710-1-ansuelsmth@gmail.com>
	<20241112204743.6710-4-ansuelsmth@gmail.com>
	<20241114192202.215869ed@kernel.org>
	<6737c439.5d0a0220.d7fe0.2221@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_145921_626013_E428539F 
X-CRM114-Status: GOOD (  14.68  )
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

On Fri, 15 Nov 2024 22:59:18 +0100 Christian Marangi wrote:
> On Thu, Nov 14, 2024 at 07:22:02PM -0800, Jakub Kicinski wrote:
> > On Tue, 12 Nov 2024 21:47:26 +0100 Christian Marangi wrote:  
> > > +	MIB_DESC(1, 0x00, "TxDrop"),
> > > +	MIB_DESC(1, 0x04, "TxCrcErr"),  
> > 
> > What is a CRC Tx error :o 
> > Just out of curiosity, not saying its worng.
> >  
> 
> From Documentation, FCS error frame due to TX FIFO underrun.

Interesting

> > > +	MIB_DESC(1, 0x08, "TxUnicast"),
> > > +	MIB_DESC(1, 0x0c, "TxMulticast"),
> > > +	MIB_DESC(1, 0x10, "TxBroadcast"),
> > > +	MIB_DESC(1, 0x14, "TxCollision"),  
> > 
> > Why can't these be rtnl stats, please keep in mind that we ask that
> > people don't duplicate in ethtool -S what can be exposed via standard
> > stats
> >   
> 
> Ok I will search for this but it does sounds like something new and not
> used by other DSA driver, any hint on where to look for examples?

It's relatively recent but I think the ops are plumbed thru to DSA.
Take a look at all the *_stats members of struct dsa_switch_ops, most
of them take a fixed format struct to fill in and the struct has some
extra kdoc on which field is what.

