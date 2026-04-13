Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6139EBFD0A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 07:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6UfJz29jZ/mDOwE6MDp0t4YF4VN3Gzp/B3Pai9lhUsA=; b=TUOtC78BQtkHRKI0Wluut/6zGs
	wxC4g1AK60lSLOd3bsXZIBicIE5pHqa+NgDagwjOcqee8NQkh/uXmltdpb1ynHzxzmafo7S58tDJr
	QOBl38Xh3NqrlmUw3W998Io0DELCsPAjZJ8iFgT+9/8+YQzD6dqHtEfoT/qzilWriD6+5oNmUzVBR
	Ync98uRONkufRSmnBF8ttPx+Yh7LUFwd/RB0a8KLnUiOLvzzsTkgTqKys1az2NQf+RFvq3a1BnElI
	9xnEJtgQHVzgdg/y38zv8JCi+C79Zbey2u3Q+zehzf8DXHIPLBEmVzk6dLV0l0JWVbc1gqPJ46wp7
	kBPLOZKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBfV-0000000F8Ij-3Vz8;
	Mon, 13 Apr 2026 07:25:13 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBfS-0000000F8IC-2xpz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 07:25:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6UfJz29jZ/mDOwE6MDp0t4YF4VN3Gzp/B3Pai9lhUsA=; b=F3c8B0/QIt2+9CIrfCWknmZZeO
	5Gf3AK+0v92dafXSnLeBS75fQ9GiSAly37Nj7hrIoodHNglk5igk4AQajg8JvH6I7004BiBhj/dqn
	/rA+qCS+ZpUSuEC9nYvPG74mx5IJqqAeh0Zi/PKybmy2TqW9rYLNr5ThCTC0vr/3khdxT61xBmODh
	MQSILXKl68l/YGqt/nrTa/TEUCXf3eMTaHe5UKjXYK97VimUhvO7Q7hpZclik3Z7umtTlU9ggy0dm
	4mS4quRmPdlSpg8MIRb6SDmjM5v63Y2nGJVrST02wNvd+23aoVVATa42Jeyat3wqzvEJm5b7d0gs3
	E4MBzHhw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45994)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wCBfK-000000007vb-44FK;
	Mon, 13 Apr 2026 08:25:03 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wCBfH-000000008Rc-0zFk;
	Mon, 13 Apr 2026 08:24:59 +0100
Date: Mon, 13 Apr 2026 08:24:59 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sam Edwards <cfsworks@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next] net: stmmac: enable RPS and RBU interrupts
Message-ID: <adyaS3EauyrNrjMy@shell.armlinux.org.uk>
References: <E1wBBaR-0000000GZHR-1dbM@rmk-PC.armlinux.org.uk>
 <266998d8-7e38-4bae-a4df-2f889538fe88@bootlin.com>
 <aduq7Lvkfrz971Rb@shell.armlinux.org.uk>
 <CAH5Ym4hEX15dmJhGBqhhk--_PoFRKRSyE1AomY4D3ipwAz+pKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5Ym4hEX15dmJhGBqhhk--_PoFRKRSyE1AomY4D3ipwAz+pKg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_002510_772740_46BE2254 
X-CRM114-Status: GOOD (  22.73  )
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

On Sun, Apr 12, 2026 at 06:42:04PM -0700, Sam Edwards wrote:
> On Sun, Apr 12, 2026 at 7:23 AM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> > As the dwmac 5.0 core receive path seems to lock up after the first
> > RBU, I never see more than one of those at a time.
> >
> > Right now, I consider this pretty much unsolvable - I've spent quite
> > some time looking at it and trying various approaches, nothing seems
> > to fix it. However, adding dma_rmb() in the descriptor cleanup/refill
> > paths does seem to improve the situation a little with the 480Mbps
> > case, because I think it means that we're reading the descriptors in
> > a more timely manner after the hardware has updated them.
> 
> Hey Russell,
> 
> I'd like to repro this but I currently can't boot net-next. My issue
> is the same as [1], and the patch to fix it [2] isn't yet committed
> anywhere apparently.
> 
> This prevents my Jetson Xavier NX from starting at all (and after
> enough attempts, corrupts eMMC); I'm surprised you're not suffering
> the same effects. But because this bug lives in the IOMMU subsystem
> (and it has somewhat inconsistent effects), perhaps this is just a
> different way it manifests? Could you confirm whether your dwmac hang
> happens with IOMMU disabled, and/or with [1] reverted or [2] applied?
> 
> I'm using a defconfig build and a fairly minimal cmdline (just
> console=, root=, and rootwait).
> 
> Cheers,
> Sam
> 
> [1] https://lore.kernel.org/all/8800a38b-8515-4bbe-af15-0dae81274bf7@nvidia.com/
> [2] https://lore.kernel.org/all/0-v1-664d3acaabb9+78b-iommu_gather_always_jgg@nvidia.com/

In the second link, there is this sub-thread:

https://lore.kernel.org/all/ee2c2044-e329-4cdd-ac35-9365824d3677@arm.com/

which was committed into -rc as:

7e0548525abd iommu: Ensure .iotlb_sync is called correctly

which does fix IOMMU problems which caused net-next which reports itself
as v7.0-rc6 failing to boot with ext4 errors. See:

https://lore.kernel.org/r/adZTGOjjJrVJOcT8@shell.armlinux.org.uk

which resulted in it being merged into v7.0-rc7 just before Thursday's
net tree merge. Due to the way net-next is operated, that means that
net-next on Thursday evening gained this fix.

Involving Linus in the problem meant he was aware of it, and explaining
how netdev works allowed him to delay the merging of the net tree to
ensure net-next gained the fix.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

