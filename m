Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C00C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 15:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2BsDj+OD3jmm2d0vUWYrsDBY27j7hSBdc7EYok2mERc=; b=ZpQSMyubUmp28cZVtq0bDkEcet
	bIvWyfkbmmrarDJg9dmA1BNxVvPiUKiYUI6Bf40gpbq1YAhQjatnSfyVUpFmxFXda1p8E0mLtdb+g
	3mWa3DAxa8GHvU1SzHBJWc330rqDN8TDa/CHpctP/YgesdNZwO3Mtz9V3ct6g7wylGwIkWDhjSM4p
	7ZqUhcKudcexIycrVwhCmNH/rW88OKeDNGnZPZ05MjXP941dLehvth8L+LcFMEpsQ2iWQXnLOzp5C
	ImJiMXhJbBuzn4MKHaMCz/lo6kvmi0eurdApgzvK3zHEaetlY5lai5U6NxIcfgMgTfAWVRY3PUQr/
	uKNEOKag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhV5t-00000003weo-3ECO;
	Thu, 31 Jul 2025 15:21:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhUlZ-00000003ueW-40mM
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 31 Jul 2025 15:00:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2BsDj+OD3jmm2d0vUWYrsDBY27j7hSBdc7EYok2mERc=; b=BZLK+D5gSFwlGVVVyalw7gdF54
	6zyT5fe8sePLYoubdYWdE/SBAlyPCd/Jm3p+qhOGRvpGs95Gwa+bMjufvwot4pjKHt1T4E8BzJcHq
	oxeyTFmjLQQImdrYIuu0W9NueD+KePHG355/02exmEMCvCFrgsCcedhSqEBLtFWdfWbM27RzG9CML
	/sUobTVzeGf5fjwzc0uhc58K9YAbjNsBgLZXh2cA/Vbx1rWVe6GgkuG3PcanSXi64UHMaccoMqQez
	BmhYrlVUDZaE8OTQp61Tv+NX89q3ru8b0FNmiujBxmbc/LBThRg3TH8rHATZZ5Kn86BvjxCBS4NG0
	el4IyUVQ==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhUlX-0000000D4j4-0aSG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 15:00:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=2BsDj+OD3jmm2d0vUWYrsDBY27j7hSBdc7EYok2mERc=; b=Nvj3uKfcgNT4vQpK0q6CpPxUSo
	6cnf9DJvy5RE0nKp2DUu2vCr8H0Q/QaqHQrBng7OYduawjQrfL+Tv15KieEdEjrAuS78PzWuNp8ZQ
	xgpok0OiGR8dd25lkOaSSex2FPAqKAdF0VcmBlg2eDFLbJMLKyWmZDq29jOZzlp/Mmy0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uhUlQ-003NgA-99; Thu, 31 Jul 2025 17:00:12 +0200
Date: Thu, 31 Jul 2025 17:00:12 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: MD Danish Anwar <danishanwar@ti.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Meghana Malladi <m-malladi@ti.com>,
	Himanshu Mittal <h-mittal1@ti.com>,
	Ravi Gunasekaran <r-gunasekaran@ti.com>,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, srk@ti.com,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Roger Quadros <rogerq@kernel.org>
Subject: Re: [PATCH net] net: ti: icssg-prueth: Fix emac link speed handling
Message-ID: <e9a886f2-527b-4375-bb2c-15f38b56675f@lunn.ch>
References: <20250731120812.1606839-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250731120812.1606839-1-danishanwar@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_160019_284996_54BCBFD7 
X-CRM114-Status: GOOD (  11.74  )
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

On Thu, Jul 31, 2025 at 05:38:12PM +0530, MD Danish Anwar wrote:
> When link settings are changed emac->speed is populated by
> emac_adjust_link(). The link speed and other settings are then written into
> the DRAM. However if both ports are brought down after this and brought up
> again or if the operating mode is changed and a firmware reload is needed,
> the DRAM is cleared by icssg_config(). As a result the link settings are
> lost.
> 
> Fix this by calling emac_adjust_link() after icssg_config(). This re
> populates the settings in the DRAM after a new firmware load.

It is only safe to access phydev members when the phydev lock is
held. When phylib calls emac_adjust_link() it is holding this lock, so
MAC drivers don't need to worry about it. However, if you call it
directly, without the lock, bad things will happen.

    Andrew

---
pw-bot: cr

