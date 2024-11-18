Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9181D49207
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 16:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gZuZhrm0652z1EXnExgABXIbM9+BwJr+Kdt0AwKAMU0=; b=s/WhD5f0LMGyN8L5GDl3rOMkGt
	FwPwFgQevvwZD0TDQ7nojcyJSOvPnSK+VvkaHCyN0Zr6g60PBCP0BWCy1bfOdVdGj22hyB0EGijpn
	jw0bL3pOeaNlucMTpZRQw5OeRp13ltb2oo5/jSvvbswNgKkPgbr5MeggDkizys1gs2gza6w8Fdl4l
	je4jti+e3k6dpBdWpnz/dTnPAJobfzKdmrCdIBu7an3BiXHq1Z4J03FbiQtlkltP7uosyYMCgiGoZ
	Cu47AqGtrQUJAyIOUkqBLC8GHVddeuLAosyghQMye1QXJPnNGx0PCApC+6IYGU4+tBhZZe8JzGOwR
	a0sHy6fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD4KG-0000000A21a-2rsF;
	Mon, 18 Nov 2024 16:10:08 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD4JK-0000000A1uU-377a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 16:09:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gZuZhrm0652z1EXnExgABXIbM9+BwJr+Kdt0AwKAMU0=; b=Jll7pIfW2nbVFGgch2ygidFhCi
	Rni6unl3BkZ0/wVEt3lFfCADnKXeLCyPqdBABrpZwSDpgYj5FLsaLlnJXTMNv/y+ClQbt2b0f36OZ
	+FM7RXKbCAuJO8c9OOAyXcSYm4I22ACS1h+6ifnLGK7lP2UBMdv2wHoqnkzNJiDqsJx065CvnZjA0
	xu+dr81JSNDFLIVaclttjsTnfq4ffyiSNKLyEVq+AaD+kqPXXnH1TzRYyAoYEhErk6bhtBU0A4Qtg
	pySkMgQrCqJCTuqff3Tf34Qb+vDFmPy3CBCny60KZOAiYxcDadZQQPDh2/pnDG4teftKcdCBkQe6A
	0e/SxJig==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33504)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tD4J6-00026H-1z;
	Mon, 18 Nov 2024 16:08:57 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tD4J5-0005CY-1G;
	Mon, 18 Nov 2024 16:08:55 +0000
Date: Mon, 18 Nov 2024 16:08:55 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Suraj Gupta <suraj.gupta2@amd.com>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, michal.simek@amd.com,
	radhey.shyam.pandey@amd.com, horms@kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, git@amd.com, harini.katakam@amd.com
Subject: Re: [PATCH net-next 2/2] net: axienet: Add support for AXI 2.5G MAC
Message-ID: <Zztml-Te38P3M7cM@shell.armlinux.org.uk>
References: <20241118081822.19383-1-suraj.gupta2@amd.com>
 <20241118081822.19383-3-suraj.gupta2@amd.com>
 <ZztjvkxbCiLER-PJ@shell.armlinux.org.uk>
 <657764fd-68a1-4826-b832-3bda91a0c13b@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <657764fd-68a1-4826-b832-3bda91a0c13b@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_080910_778182_21E58CBD 
X-CRM114-Status: GOOD (  18.51  )
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

On Mon, Nov 18, 2024 at 11:00:22AM -0500, Sean Anderson wrote:
> On 11/18/24 10:56, Russell King (Oracle) wrote:
> > On Mon, Nov 18, 2024 at 01:48:22PM +0530, Suraj Gupta wrote:
> >> Add AXI 2.5G MAC support, which is an incremental speed upgrade
> >> of AXI 1G MAC and supports 2.5G speed only. "max-speed" DT property
> >> is used in driver to distinguish 1G and 2.5G MACs of AXI 1G/2.5G IP.
> >> If max-speed property is missing, 1G is assumed to support backward
> >> compatibility.
> >> 
> >> Co-developed-by: Harini Katakam <harini.katakam@amd.com>
> >> Signed-off-by: Harini Katakam <harini.katakam@amd.com>
> >> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
> >> ---
> > 
> > ...
> > 
> >> -	lp->phylink_config.mac_capabilities = MAC_SYM_PAUSE | MAC_ASYM_PAUSE |
> >> -		MAC_10FD | MAC_100FD | MAC_1000FD;
> >> +	lp->phylink_config.mac_capabilities = MAC_SYM_PAUSE | MAC_ASYM_PAUSE;
> >> +
> >> +	/* Set MAC capabilities based on MAC type */
> >> +	if (lp->max_speed == SPEED_1000)
> >> +		lp->phylink_config.mac_capabilities |= MAC_10FD | MAC_100FD | MAC_1000FD;
> >> +	else
> >> +		lp->phylink_config.mac_capabilities |= MAC_2500FD;
> > 
> > The MAC can only operate at (10M, 100M, 1G) _or_ 2.5G ?
> 
> It's a PCS limitation. It either does (1000Base-X and/or SGMII) OR
> (2500Base-X). The MAC itself doesn't have this limitation AFAIK.

That means the patch is definitely wrong, and the proposed DT
change is also wrong.

If it's a limitation of the PCS, that limitation should be applied
via the PCS's .pcs_validate() method, not at the MAC level.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

