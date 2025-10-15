Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 589F7CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 20:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fpT7/qpOc901ywWUApzY2WvHcwUb6gU4BpI3odiblaU=; b=Zju7MPiKkKHMZYRx5VCSVXe12H
	ytT9ysVcecJF+bAZvtd568KfDrL9ZlRrReH4lkR7YTxS9HKAzkqEZYoloIDT6xYhnAS7go43jHAf0
	ArGiOTgbQiN4XarSveCVdi4HUFDA2W8uuxhbKP2ddE1PwXLE47dKw85EBshmXlxxhn3Q2lo7Te0yh
	2TD+QKDBIDY2LPuz/i+sWOyOHo5ljmmVWejm/1IMlpA5tilifQKpiqw7Y6JnHu/B9/9fimJOaCcny
	7qOpigunVnL8Xo4qV/oy0+9cpI108BofuTTHwoFKE+hNv3zrDXNnmm/agDBqHiAjwpUrHY6YtHgRF
	UWEhmZyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98QU-00000002sIa-3RN9;
	Wed, 15 Oct 2025 20:48:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98QU-00000002sIO-1Cu9
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 15 Oct 2025 20:48:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fpT7/qpOc901ywWUApzY2WvHcwUb6gU4BpI3odiblaU=; b=JpwEHsmUky2rCSPLLH82BUz8xm
	4L0Pjmzijp1/nGmGE2gqAYqYG2V7Vb9QK5FyVODRwafv3NfYdtM3eknN/VrkcOCm2Xh3AOkxhj//K
	LTTs6tyzx/3GcSVhplsisnZQjx09OiCbrzhAiYm6AJYGrLx44KTHJTeWw0kXcbV78cnq/kJ5SRNy9
	2+obRDId2cTMpyxR5onWatvz0v6dCTkDH69cqanoZ2i4WTPTDk3bl1SjespwdGXOJiUivqG0xns+Y
	fNgyaeCG293gduQKWB07+ApXggV30DIuXqhcI3X9oKL8F9Tei9UCMNRg31nYSjdEhVxL7I7Mkng3B
	WHrIJi0Q==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98QP-00000006FTf-0CPO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 20:48:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=fpT7/qpOc901ywWUApzY2WvHcwUb6gU4BpI3odiblaU=; b=PMWRDZzESdsJM3zKSY4rlCM7K6
	KUtM/pAOfEKANJQ1dhoZMWvG8UYO2yUW8hobk8Mowd0+67A3CTwkO9UDppdsvmh6BeK/W37VWJtOf
	E35liXO/YCIA+F1VGgibqHeDH2lidAoFz48tNQGTqZzE/ugTVJqLoTHLcLZhm3sgv4sI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v98QA-00B4cN-Jk; Wed, 15 Oct 2025 22:48:30 +0200
Date: Wed, 15 Oct 2025 22:48:30 +0200
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
Subject: Re: [PATCH net-next 04/14] net: stmmac: remove PCS "mode" pause
 handling
Message-ID: <2bd68727-79f2-4073-bff0-256499126837@lunn.ch>
References: <aO-tbQCVu47R3izM@shell.armlinux.org.uk>
 <E1v92MT-0000000AmGV-3HvK@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1v92MT-0000000AmGV-3HvK@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_214846_465119_BBFBA152 
X-CRM114-Status: UNSURE (   9.83  )
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

On Wed, Oct 15, 2025 at 03:20:17PM +0100, Russell King (Oracle) wrote:
> Remove the "we always autoneg pause" forcing when the stmmac driver
> decides that a "PCS" is present, which blocks passing the ethtool
> pause calls to phylink when using SGMII mode.
> 
> This prevents the pause results being reported when a PHY is attached
> using SGMII mode, or the pause settings being changed in SGMII mode.
> There is no reason to prevent this.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

