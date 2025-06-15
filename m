Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F91AC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Jun 2025 14:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ru6/x/qcDhMxYX+dfMi+hmDfuYIk3ou35X/HoxBCMhQ=; b=sN6Kxi+LPJPLO2MD13bJ8TMx39
	xJIsvx5Ty1BmiNlZhDg5RLe7a5OSvKuXU3A/yBJ1CpepUaopKam5SVBcS9wzplDHK0Gn1EYaJ7vQM
	G0NEN9epo/fstmLS5QUcRkIoFNwY5jrSm2uYzd8X4sYen2lWz3V46wH8xR5iRh+xdXMGdHUcICHJU
	zH3Up/kjg0OClY3zOwsmUvkt/j2Tcsg8h2TnGLpMzUE7RuzuD+6XzGllJ8nVAqstn6yrmINpbt3aP
	rnvWGHrxjh+YDWv+/48MYoiYLxMaHTR5zouuSo40BFSV+13Um2uNPZ/d9oTFxhvHDcLxv7/RbzNXS
	47l/7+lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQo6l-00000002YHc-0agr;
	Sun, 15 Jun 2025 14:13:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQo4Z-00000002YBg-0IHJ;
	Sun, 15 Jun 2025 14:10:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 25C0460007;
	Sun, 15 Jun 2025 14:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01641C4CEE3;
	Sun, 15 Jun 2025 14:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749996657;
	bh=QtHS0PfBzmKWEUuNMaPdgcaW9LU7WVfSi9AbPYocR1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s/cv/xKWJC8D/wF/dB2xPITXjR5Q2Lwk9W1drragQXVPyhyVGL73lGeWW69EZvskC
	 VmxyUztCI68bmoRN2K1XG4sH4vrs+AZ3Uh0wkuJqrXl32q8cIi25cWU+gYTPKxCfJs
	 J+jKYR7s4yVMDrJ0WmzJTDXoWtwRnvvyVKN77qpEOxQFuCCfasKsrFfCWUfTe8BkqA
	 bQYgmAFEBBA0mMacHfEqywDHvdhdvT84ny/Gc3libme3l+unF/atEHOMe5beNFKN5n
	 Nm18uP/1SECp3jjgX7TqXrhk8/Q/szxmKnvGU4U9Ezb1MKvl8UIMhDCNsXtbJrP8A0
	 nzM1HBsi+DM2A==
Date: Sun, 15 Jun 2025 19:40:53 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Enric Balletbo i Serra <eballetb@redhat.com>,
	Roger Quadros <rogerq@kernel.org>, kishon@kernel.org,
	sjakhade@cadence.com, thomas.richard@bootlin.com,
	christophe.jaillet@wanadoo.fr, u.kleine-koenig@baylibre.com,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, srk@ti.com
Subject: Re: [PATCH v3 1/2] phy: cadence-torrent: Add PCIe multilink
 configuration for 100 MHz refclk
Message-ID: <aE7UbTT0UHgEliDM@vaman>
References: <20250109121614.754466-1-s-vadapalli@ti.com>
 <20250109121614.754466-2-s-vadapalli@ti.com>
 <fccedc26-0bb9-4078-8a94-4199f6b383c1@kernel.org>
 <CALE0LRsdsTU-NLN4fgh2c8qnS-pPP1BDJvjnvsSOnud8amk3=A@mail.gmail.com>
 <6b747de0-9d10-43e9-a2b1-23a129301538@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6b747de0-9d10-43e9-a2b1-23a129301538@ti.com>
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

On 12-06-25, 15:34, Siddharth Vadapalli wrote:
> On Thu, Jun 12, 2025 at 10:48:20AM +0200, Enric Balletbo i Serra wrote:
> 
> Hello Enric,
> 
> > Hi all,
> > 
> > On Thu, Jan 9, 2025 at 5:35 PM Roger Quadros <rogerq@kernel.org> wrote:
> > >
> > >
> > >
> > > On 09/01/2025 14:16, Siddharth Vadapalli wrote:
> > > > From: Swapnil Jakhade <sjakhade@cadence.com>
> > > >
> > > > Add register sequences to support PCIe multilink configuration for 100MHz
> > > > reference clock. Maximum two PCIe links are supported.
> > > >
> > > > Signed-off-by: Swapnil Jakhade <sjakhade@cadence.com>
> > > > Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> > >
> > > Reviewed-by: Roger Quadros <rogerq@kernel.org>
> > >
> > 
> > These patches seem good and have been reviewed but look stalled here.
> > There is any chance to rebase it on top of the mainline?
> 
> The patches apply cleanly on the latest linux-next tagged next-20250612.

Can you repost


-- 
~Vinod

