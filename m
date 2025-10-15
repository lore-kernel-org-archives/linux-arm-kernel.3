Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FFC3CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 20:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o17vOS8hSXdTgpGJRLHlfCKxxyXXgIV5kt7Ks+sfQXw=; b=fhjcw7uAlOtNyzFtmDpN/8wkjF
	4HOrzDTryHmzpFMBoNXhoYfxkLxwgRTpnowEuM7IcOmvikoENFzZ+6//rUCqwysc8KEGXP4aFKrh/
	0S8TMueRCJ5Yvl2VkMfXDbXLRT2TINpewj7ZZGKovqr2pSugekdG74ByCvVFYESVUtDVT2KxR3Uic
	e3qgZVMNJ2WUSrM8I/oX5Kziy1VPKoSoIztBU2zMJtmKBHygBKq334uSDGZBJDQoURj5JS8a+aJLm
	jwj2f2qKx1LGt3iSby1pTiPSnuSmSUvBKWR7/hMM8nQS6PsYE00MRO95ErlTPQPLNQXzsksHjXnCh
	gftQaBGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98PR-00000002sCD-1us4;
	Wed, 15 Oct 2025 20:47:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98PQ-00000002sBQ-0hev
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 15 Oct 2025 20:47:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=o17vOS8hSXdTgpGJRLHlfCKxxyXXgIV5kt7Ks+sfQXw=; b=C/IA2gCUH+K62Q71u1VrBSbhbD
	pt/CLzBhJT2+rG2Mg6i9QxUwmsfOAlDgOq9hH4937IOTVIO6dwCil0Vf7lo6BsYiogThjP7o0estX
	zL1o9pAH/WKLJAFDBYuQWcWLo7rfhBugyOjzW+Ow48Q8tlHzRfa9aLk35CqXtuzgFWzGoNY3zdPhJ
	omlbR8PFuF1eF+gcrxf38jpq1K45L0sl//axGz2xub6oss95KAUWmyTgtoViZ2x15sz34aq1v3TC4
	LiHiVOupAkMa1DMo2SctlxjWorksEqI30ikWVdKh2vBNgM5Qn+aJrAM8A/23XcLskkfetevoBBOZe
	C/N6oDyw==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98PB-00000006FNS-28ZM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 20:47:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=o17vOS8hSXdTgpGJRLHlfCKxxyXXgIV5kt7Ks+sfQXw=; b=sKpucV16yshgSqr7P4tWlrQNd6
	h+AedhHrLnXnX/wpcG1EmtEtTSqnG4+kPszdyAABkyAN3moO+F5GMdMrthN//xGRh0TuamVv7Z/0T
	+IX+GTwIcqK5uyqv2bGU+98Lsz/a+tQJ2LU38TCOcBSb+1BlvAw0XonlBfWSCvoKZgjE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v98Or-00B4ab-Hq; Wed, 15 Oct 2025 22:47:09 +0200
Date: Wed, 15 Oct 2025 22:47:09 +0200
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
Subject: Re: [PATCH net-next 03/14] net: stmmac: remove SGMII/RGMII/SMII
 interrupt handling
Message-ID: <807939bb-c143-407e-922c-131c711edd2b@lunn.ch>
References: <aO-tbQCVu47R3izM@shell.armlinux.org.uk>
 <E1v92MO-0000000AmGP-2hFV@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1v92MO-0000000AmGP-2hFV@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_214738_715800_EF958BC4 
X-CRM114-Status: UNSURE (   9.86  )
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

On Wed, Oct 15, 2025 at 03:20:12PM +0100, Russell King (Oracle) wrote:
> Now that the only use for the interrupt is to clear it and increment a
> statistic counter (which is not that relevant anymore) remove all this
> code and ensure that the interrupt remains disabled to avoid a stuck
> interrupt.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

