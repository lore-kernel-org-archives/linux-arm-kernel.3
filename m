Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE5DD3EE60
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 13:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wHvbVKv9/zKXVJFpreFL9ZeQOMLHCXmdTB4TETl1fLM=; b=wQQabvVjmQF17hNzo2BNAyHiZ8
	t5r6O4DerWG9To5JeZPpxVL1H4DdbDTVnmm2fLnZfyHfGpsfn5/hmsNgbY8eJlVhF5jCFi1xxrvD7
	BM5g3nCA7atqpIWfyjQYtnrQRS3+aTghNnWRBslRq95isd5xFlkhFelVtEOGBfRYJXIIumUO4JfhA
	AupIPyTU+i1erc5nA+Kemkw4BmK5yijNiuytcEryVtmD7Z5MYaQBPS+qZJ6rA5mo9dmVGKyMPhgDO
	G6n+fLzFRDzKHIJ3gzP3ABo6s7RsdsUvVFiej247eOdb10e3y88RC6OwkG2MEaplk6Ogt4Br0+Xiq
	lyC88fOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viuQw-000000076uj-1xtK;
	Thu, 22 Jan 2026 13:09:10 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viuQt-000000076uA-2OvH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 13:09:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=wHvbVKv9/zKXVJFpreFL9ZeQOMLHCXmdTB4TETl1fLM=; b=WrJ+q7qdUPhJYKCLJ7eUEzhepc
	oyWzi2KU26WuvcFOpquRXdXv0XFOY4Cc+iznUZt/2eEC82CBXPVwTdSgQy1FrqVRnrFeTbevXQkmC
	GT8CZTbMnw2yAQdZCeWySss/LW6koGoaaAarzqpPLCQWSxlYFf1jPqaiuSbjPOK+Z9Iw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1viuQi-003yFR-9F; Thu, 22 Jan 2026 14:08:56 +0100
Date: Thu, 22 Jan 2026 14:08:56 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	hkallweit1@gmail.com, linux@armlinux.org.uk,
	linux-stm32@st-md-mailman.stormreply.com,
	maxime.chevallier@bootlin.com, francesco.dolcini@toradex.com,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH net-next v3 2/3] net: phy: micrel: add option to keep the
 preamble before sfd for KSZ9131
Message-ID: <949e9bc1-9016-45e6-8b94-d1160dc51c3d@lunn.ch>
References: <20260120203905.23805-1-eichest@gmail.com>
 <20260120203905.23805-3-eichest@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120203905.23805-3-eichest@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_050907_611140_FCBEF267 
X-CRM114-Status: GOOD (  10.38  )
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

On Tue, Jan 20, 2026 at 09:30:03PM +0100, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> If the PHY_F_KEEP_PREAMBLE_BEFORE_SFD flag is set in the
> phy_device::dev_flags field, the preamble will be kept before the start
> frame delimiter (SFD) on the KSZ9131 PHY. This flag is not officially
> documented by Micrel. However, information provided by NXP and Micrel
> indicates that this flag ensures the PHY sends the full preamble instead
> of removing it. The full discussion can be found on the NXP forum:
> https://community.nxp.com/t5/i-MX-Processors/iMX8MP-eqos-not-working-for-10base-t/m-p/2151032
> 
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

