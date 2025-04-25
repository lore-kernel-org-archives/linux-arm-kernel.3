Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB7EC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 11:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+hgsSoW5escKGuyH+qvE+QoIRRp1etqeugtEPrXybU=; b=RqvZedB43UM/UNEGdVTJdHr1Wd
	cbR4sXAU90IK2xvWudooy7XQHhh62yRwSQJdN/Y9kxwe5kvdi79eg/3AsCTzGCgIwHqi+tN3VCZHR
	i0KTtssF+xt0xB+6D+cxwi+PZhmnEEF0M8b4vFfzB16Fa6FBcOk2Kp2qEDp33Y6sN2f2mX+jD5jJL
	gX85GCBdLEbBbJ+TaD7W2Tt2bHaoefDvWVzR31ry6wal3aNGjyIn305ZkSYxJNhWvOI1OSH0HDQKD
	HqisE6WS2vA9i98/N17+Hd469kvj8yUBlm2hARYQ+Gj4jQbJX849K/Rhemd4oX4zqY1S91NkknoPn
	ylKL+zjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8H9n-0000000Gx2h-0T1x;
	Fri, 25 Apr 2025 11:23:47 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Fqy-0000000Gdzm-3AOL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 10:00:18 +0000
Received: from localhost.localdomain (unknown [119.122.214.249])
	by smtp.qiye.163.com (Hmail) with ESMTP id 131fd5406;
	Fri, 25 Apr 2025 18:00:10 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: dlan@gentoo.org
Cc: amadeus@jmu.edu.cn,
	andre.przywara@arm.com,
	andrew+netdev@lunn.ch,
	conor+dt@kernel.org,
	davem@davemloft.net,
	devicetree@vger.kernel.org,
	edumazet@google.com,
	jernej.skrabec@gmail.com,
	krzk+dt@kernel.org,
	kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	mripard@kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	samuel@sholland.org,
	wens@csie.org
Subject: Re: [PATCH 4/5] arm64: dts: allwinner: a527: add EMAC0 to Radxa A5E board
Date: Fri, 25 Apr 2025 18:00:05 +0800
Message-Id: <20250425100005.103807-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250425074621-GYC50408@gentoo>
References: <20250425074621-GYC50408@gentoo>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaHx4aVh9JHx5KTE8dHUsYH1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKT1VJT0JZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSEJVSktLVU
	pCS0tZBg++
X-HM-Tid: 0a966c63efae03a2kunm131fd5406
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MSI6Cgw*PzIBET0LPjIcFiM5
	PhBPCQNVSlVKTE9OTkxOSUpJSkJLVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpPVUlPQllXWQgBWUFKQktJNwY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_030016_957478_CF2EF75F 
X-CRM114-Status: GOOD (  10.69  )
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

Hi,

> > > On Radxa A5E board, the EMAC0 connect to an external YT8531C PHY,
> > > which features a 25MHz crystal, and using PH8 pin as PHY reset.
> > >
> > > Tested on A5E board with schematic V1.20.
> >
> > Although the schematic says it is YT8531C, the PHY on the V1.20 board
> > is Maxio MAE0621A. The article of cnx-software also mentioned this:
>
> IMO, then the schematic should be updated, I could definitely adjust
> the commit message to reflect this change, but don't know if further
> action need to take, like writing a new phy driver, I guess a fallback
> to generic phy just works?

The schematic on the radxa website is still V1.10. [1]
So how did you test it on the A5E board? Both PHYs
on the board (V1.20) are Maxio MAE0621A.

dmesg should show the PHY driver used:
dwmac-sun8i ... eth0: PHY [stmmac-0:01] driver [YT8531 Gigabit Ethernet] (irq=POLL)

[1] https://radxa.com/products/cubie/a5e/#downloads

Thanks,
Chukun

--
2.25.1


