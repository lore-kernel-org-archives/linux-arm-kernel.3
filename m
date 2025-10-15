Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60EDCCCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 20:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cwc+e4Rpngqo67pzn388X3qIyI1ppAOSDxoC/CtDb78=; b=JUqANqCZ5Mt8ObQFqW2o5uPn0A
	qXKXUB7o1hlPQL6EjqGEYSxs1Tadbkr96MSWGUOkqjlqb1yXPHftoqg+JWOz1xojoGjDyfzRz0vKS
	eM3E0Ui91H7vjwjKQRyS1q7fINjvPc2zBHa1LvotZ6W/JKPj0VhcgIJ6g/x1plPJizeUcG25HTMmk
	QZiAKE4lEzi8Ya6luTpjnE9InN/JZLCyVZ2DZgyzKsj4I5nIJuWE2k66PkNqgNSEQ7/DY2rZC1fKe
	u66OUFDE4cBslm0zH6vMl5joaU2XRQquixr5b+ir14nQIBgIsks+S05yqyYNdIb6jVWjiR06J92aT
	G12M9ftA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98Sl-00000002sa2-0egX;
	Wed, 15 Oct 2025 20:51:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98Sk-00000002sZu-1RT0
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 15 Oct 2025 20:51:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cwc+e4Rpngqo67pzn388X3qIyI1ppAOSDxoC/CtDb78=; b=jlxer3iy5/gXZd7LlNL1yqjQJC
	OuD0x9OaUuHwAk5D+8jajxe2JfeYEOyfd+ABxDzEIZ3m6Gb7cLHB3mkDBQMsfULFOdyjuPzPsW1Y5
	Gz1iykZuUZqt9sm3oUFrUqP92LCH/uZnSrJ+hSXA53D9wctiZ+UiSnQtN4+BLts3m7SUZ9C2tc0cn
	5sotOjiY4P93aX0RirTvfhIlim7SbjBIbYJ47eq4eQMYs4ghRnI3CyYMNiuduj9MIUISet48Atsrm
	iKaG6DHM/e5JP27hQ+d+tk7/2uLs1LGatv9gB5uEte4FF8vSYap5EL8oLtgifPr6u+XrqKqL4nt5W
	4SUOvy6A==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98Se-00000006Fhy-02Pa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 20:51:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=cwc+e4Rpngqo67pzn388X3qIyI1ppAOSDxoC/CtDb78=; b=rnVt/FyfromKBtQ39d3u5xvhj+
	go2gf7yFrroPjJeesO43avEAIKKLLYyZ5Kmvp555jt7Bs/SqEDETPdGHsmNNdR/sxWAd1kcrw8x93
	K5xejYBZnuf11/3onXbe5Fe3E19uwf88aakv/3NQQBLxe5FRWhjUsefJkVwVuFQALGog=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v98SM-00B4eI-4g; Wed, 15 Oct 2025 22:50:46 +0200
Date: Wed, 15 Oct 2025 22:50:46 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Abhishek Chauhan <quic_abchauha@quicinc.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexis Lothore <alexis.lothore@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Drew Fustini <dfustini@tenstorrent.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Eric Dumazet <edumazet@google.com>,
	Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
	Furong Xu <0x1207@gmail.com>, Inochi Amaoto <inochiama@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	Jisheng Zhang <jszhang@kernel.org>, Kees Cook <kees@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthew Gerlach <matthew.gerlach@altera.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
	netdev@vger.kernel.org, Oleksij Rempel <o.rempel@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>,
	Rohan G Thomas <rohan.g.thomas@altera.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Simon Horman <horms@kernel.org>,
	Song Yoong Siang <yoong.siang.song@intel.com>,
	Swathi K S <swathi.ks@samsung.com>,
	Tiezhu Yang <yangtiezhu@loongson.cn>, Vinod Koul <vkoul@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH net-next 05/14] net: stmmac: remove unused PCS loopback
 support
Message-ID: <811c57ee-ee6f-4bc4-9818-e2ee02d5e339@lunn.ch>
References: <aO-tbQCVu47R3izM@shell.armlinux.org.uk>
 <E1v92MY-0000000AmGn-3iSe@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1v92MY-0000000AmGn-3iSe@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_215105_881622_ED25C945 
X-CRM114-Status: UNSURE (   7.98  )
X-CRM114-Notice: Please train this message.
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

On Wed, Oct 15, 2025 at 03:20:22PM +0100, Russell King (Oracle) wrote:
> Nothing calls stmmac_pcs_ctrl_ane() with the "loopback" argument set to
> anything except zero, so this serves no useful purpose. Remove the
> argument to reduce the code complexity.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

