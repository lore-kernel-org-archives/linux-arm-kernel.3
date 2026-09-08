Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF04C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 12:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+jN0CNGpu++wz2OfmG24unVE3E/eSCf8Ige67pFhPRQ=; b=Bv879hfxQLusM/pcnwxmy/yIsb
	PX2pQYe1FeoiwaIoGt/kzXawiS+bR3PB0MygGuOwCI/nSYoxWyBBsXFxVergEK7qqJrAI3vhvu06E
	2OCkbvYKAahKoHVsMW0axoaGsno7oM4Wivsng6UbypRCxYNO8Mca2dq2/1TQPIqktbJ9X06LoK9Fr
	G4VUwKCVKuSUlgGIA219pZDeowKzBe+llraQZHmkzoqYpN8PFblmbi+N2Y25YUie1kjy5Bf5XYKQr
	/IcvzMbKja2ppl784IEuz4/uO2YJaLJf/yjPXRihWj0mBwtc7SndMLeiAnb3SJ7TGVgiN2FIuurju
	gdfgUodg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3uZx-00000008yMZ-3VRV;
	Tue, 08 Sep 2026 12:05:33 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3uZo-00000008yL7-1rec
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 12:05:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=+jN0CNGpu++wz2OfmG24unVE3E/eSCf8Ige67pFhPRQ=; b=kcyfGyd4ICgVZ6ZnWgMnZy1xZy
	bAeUh6YAcYwtOhIFyrnHUaUCx/GfbEeLINs4dYI1r3PV4T3pGz5j+NXTJzYSwbFN0SM5umxz0Vz8S
	nxYlgvQwf6NeEfleHhjjmomgAWWltSsAznr3shmYd8/HLDm/L1/N1o69aYuFM3SYZxg8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x3uZ7-003sY9-UJ; Tue, 08 Sep 2026 14:04:41 +0200
Date: Tue, 8 Sep 2026 14:04:41 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Ratheesh Kannoth <rkannoth@marvell.com>
Cc: Hemanth Selam <hemanth.selam@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Chris Snook <chris.snook@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	GR-Linux-NIC-Dev@marvell.com, Geetha sowjanya <gakula@marvell.com>,
	Jakub Kicinski <kuba@kernel.org>, Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Manish Chopra <manishc@marvell.com>,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>, Rahul Verma <rahulv@marvell.com>,
	Russell King <linux@armlinux.org.uk>,
	Shahed Shaikh <shshaikh@marvell.com>, Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-parisc@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH net-next v3 07/10] net: marvell: fix typos in comments
Message-ID: <326477d4-a04e-4797-93f1-831bfb91ccb4@lunn.ch>
References: <20260908052602.27497-1-hemanth.selam@gmail.com>
 <20260908052602.27497-8-hemanth.selam@gmail.com>
 <ap-elz1ObdxcutDv@rkannoth-OptiPlex-7090>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ap-elz1ObdxcutDv@rkannoth-OptiPlex-7090>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_050524_494454_F29F127C 
X-CRM114-Status: GOOD (  10.19  )
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

On Tue, Sep 08, 2026 at 11:05:19AM +0530, Ratheesh Kannoth wrote:
> On 2026-09-08 at 10:55:59, Hemanth Selam (hemanth.selam@gmail.com) wrote:
> > Fix misspellings in comments, found with scripts/checkpatch.pl using
> > the misspelling list in scripts/spelling.txt.  Comments only, no code
> > changes.
> >
> 
> For below files
> 
> >  drivers/net/ethernet/marvell/octeontx2/af/npc.h         | 4 ++--
> >  drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c     | 2 +-
> >  drivers/net/ethernet/marvell/octeontx2/nic/cn10k.c      | 2 +-
> >  drivers/net/ethernet/marvell/octeontx2/nic/otx2_dcbnl.c | 2 +-
> 
> Reviewed-by: Ratheesh Kannoth <rkannoth@marvell.com>

For the rest of them:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

