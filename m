Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 046CCCCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 13:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vTeelEGQAyHJj0V/pXZ4TfRy6Rmpt2ra9UbEea3FvGM=; b=YZoEQJ7d7w2fygXD/MuBoeXBFf
	iaMUaS1zw7E3gqBN3I3GiaKgMqVSjX1dOpZZgTc0kXliHDoXC2iAIxaR0yp+vDrJXoKpuCy3PG6Kh
	qNJC3ZP8Kvszz8UM6wj10BDer2Vp2EjdHvvY5COk4v0eeULC1c0ACyZxbDI2yuykNDn5kzRH4Bexf
	Xf8uJEeW4d1qWG0Sz57KwDXc1Uz7GcR3d292/L93FFwqDaVWH3D0PsZX0cte37vGl/Owfc2KD+mwY
	e0N6ZnYnocHeOIU3MqS22GtAw3sH1ZW7U6AxStW4XCmt8haK8a+l6LzZwpBc62C8tW68lh0fFM/Ws
	IJ0tVL7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFupW-00000009w9c-1VSw;
	Mon, 03 Nov 2025 13:42:42 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFupU-00000009w8v-1wVp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 13:42:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=vTeelEGQAyHJj0V/pXZ4TfRy6Rmpt2ra9UbEea3FvGM=; b=5dJvQh3nkBSumMNUbicC64Sw0N
	6OC48RINmck6vt7BNz/aKLyobhC2TcNH8WG3frAiJ69uMTIheZcu6fjfLvQjNpjcV6lHLJURXY2Ur
	itstKLi1BInug605I2wLRu/m5BaLHEcL0YTo9VUF3qQuBwV+3Ld6ORNiEKJ86dzdvu4g=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vFupI-00CmeX-PU; Mon, 03 Nov 2025 14:42:28 +0100
Date: Mon, 3 Nov 2025 14:42:28 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 2/4] net: altera-tse: Warn on bad revision at
 probe time
Message-ID: <db7e920d-a03e-40fd-9b37-71e836f0faf8@lunn.ch>
References: <20251103104928.58461-1-maxime.chevallier@bootlin.com>
 <20251103104928.58461-3-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103104928.58461-3-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_054240_527674_7829049B 
X-CRM114-Status: GOOD (  12.29  )
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

On Mon, Nov 03, 2025 at 11:49:25AM +0100, Maxime Chevallier wrote:
> Instead of reading the core revision at probe time, and print a warning
> for an unexecpected version at .ndo_open() time, let's print that
> warning directly in .probe().
> 
> This allows getting rid of the "revision" private field, and also
> prevent a potential race between reading the revision in .probe() after
> netdev registration, and accessing that revision in .ndo_open().
> 
> By printing the warning after register_netdev(), we are sure that we
> have a netdev name, and that we try to print the revision after having
> read it from the internal registers.
> 
> Suggested-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

