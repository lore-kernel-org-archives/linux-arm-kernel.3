Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E809ACCD193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 21:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/UUBwbfmVL4sGFj/GLilqDN9Jt7D7NF8Dxz8jPhNnLs=; b=Vvqk9gMEhNO+dUIIN6DiRwV57V
	NvC8z5ZCQ19eU8NG262lxmsSJp7No76OccD5MdMZsqsoxXsSwG6c9LrGXTiIaNo1fs9/kcVOMOyEh
	xnYmOkpdN7iA3h0heUtVXcCQ2PYBHO2Hi7Hy0XXQFxaJ1HIj6Fk0m/P5RQIS/ayU0HbfluEE8cXVi
	VvZXJUposBb0SMisSTzkKMSQALpsUwaziq6bdYYle0u0JmLzAPK05+py9bBc+z8vFd5EKdcGE/rAO
	iQr2eHAQ8in26qeUqj2XCNrwhUw/5YXYpIhD1xAFOSU4BYWzrV4GUESvCUfXVVB/hqJh75nL6CaO1
	ILZOEbZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v996u-00000002wxZ-3mE4;
	Wed, 15 Oct 2025 21:32:40 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v996s-00000002wwV-3Qet
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 21:32:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/UUBwbfmVL4sGFj/GLilqDN9Jt7D7NF8Dxz8jPhNnLs=; b=WqREv1Qgfd1EfNtd3ps7chdP4O
	14bpo7XvjBgl19XBh0KGb9l/6IYCvd8J0N5Zu4zQLmhTEmG8zqMqg7b5rNKHLeAq0qMhXXbtVBk7R
	JIVUJX0x5SSq625vF4eG3diKV7Wj5OG+hmcqr7Sz45THbuxb8j1nSH+MLMS6XmR+cpJyLoDgOaT6A
	Db4Ml2a25jbY92ennRKu6tzEtMcXpZCumdbIHQdB4HS1c7qSEzBtim0BSicLK2h8Z/FOSNNLObTib
	WN7+r9Xgi+rdlFuq3V1czeIA2pRU6j54BFGoPjoUd+lLux6ykjBlhPRunR0ZGL/3kB8Ald8Z3UZh3
	Nl6ISwfQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50056)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1v996R-000000005TK-4AjF;
	Wed, 15 Oct 2025 22:32:12 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1v996G-000000002cV-1O1R;
	Wed, 15 Oct 2025 22:32:00 +0100
Date: Wed, 15 Oct 2025 22:32:00 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
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
Subject: Re: [PATCH net-next 13/14] net: stmmac: provide PCS initialisation
 hook
Message-ID: <aPAS0J32l2ueVhcK@shell.armlinux.org.uk>
References: <aO-tbQCVu47R3izM@shell.armlinux.org.uk>
 <E1v92NE-0000000AmHd-15fv@rmk-PC.armlinux.org.uk>
 <96842284-8d92-46b8-8b28-2b20755c3523@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96842284-8d92-46b8-8b28-2b20755c3523@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_143238_856253_79A99D30 
X-CRM114-Status: GOOD (  14.46  )
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

On Wed, Oct 15, 2025 at 11:11:22PM +0200, Andrew Lunn wrote:
> > +	/* Unimplemented PCS init (as indicated by stmmac_do_callback()
> > +	 * perversely returning -EINVAL) is non-fatal.
> > +	 */
> > +	ret = stmmac_mac_pcs_init(priv);
> > +	if (ret != -EINVAL)
> > +		return ret;
> 
> Oh, that's ugly.

Yes, I completely agree, and...

> which added this, i don't actually see a user of the returned EINVAL.
> EOPNOTSUPP would of been better. But changing it now will need quite a
> bit of review work :-(

Yes. Maybe at some point in the future it can be addressed - it will
become an issue if we end up with an implementation of these methods
that returns -EINVAL to really mean failure.

However, it's a non-zero chunk of work to go through every single
caller of numerous methods to make the change. It may be possible to
introduce a new base-helper that returns -EOPNOTSUPP and switch
groups of methods... but given my present backlog, it's not something
I'm going to rush to do!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

