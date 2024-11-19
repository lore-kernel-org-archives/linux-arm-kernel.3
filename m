Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E35D4417A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 15:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qnQRqocn/VRT/81Ql3s0QeMFooHZBkWosHmPORCjQhA=; b=g7vZgD51QCeI4svlRPLUej5b4x
	40dvpa7b4jYE3A2OD7wYAgeAAe0ci10PBz/lhFsfQ1kGiLzdQ5YN0ylo6gzujpLrUYpDhaDZOLAhZ
	PToxzNPxCMt0hIRsFKU1EXqXspsxjFQ9TVcEKuhDZcxwnKT7UHrGe0lPnS8sjSOble9GU7d3fubNM
	N5lqxRydOPbucjSGWNKFMZ2HkQsuzCHaMrp66hQcQMxTQgkC9MMZA7txSNFWkN5E03aCY731XcUyf
	DIzs5LOGwiwQmz0jY/HUdJCLsDRNUXF5IKyHFFi6yMklWujuEQZJ0vXMrt59h5upFOGGaXwZrzmyl
	+lsAay0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDQUw-0000000CvkN-17KI;
	Tue, 19 Nov 2024 15:50:38 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDQU0-0000000CvWC-0pNg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 15:49:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qnQRqocn/VRT/81Ql3s0QeMFooHZBkWosHmPORCjQhA=; b=nyQm/C7/PauPVNEBcpCuSxF7q4
	aPVRUgpsV908uUmyAlEBhyWBM37HjkDLD6/0nPF98GBKVYheUF2PL1stCIJgYpoY7acJ1Do+0EEhr
	sEGkrWgEj8fg249awdbsUtKlB/met1b4Pavt8UcTtdrx3VsaTu7jc4Yd8BGqtVKoE23RulUZPqfyR
	CmibYEdiY4SfR/9pcTF/gNkmpDsalkxhC3TJXsDuMPzIUdBfvB8qch/DhFDk8ndTcJZldNI/jZifI
	FojM7t7Ns944esyRn50m4fJVDg81mFr+dtx2ivmmQ+k40xCXudGkJ1rvpStA5Pl7g7rvQJJ5AsVgG
	aHGm10QQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40134)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tDQTn-0003qf-20;
	Tue, 19 Nov 2024 15:49:28 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tDQTk-0006AN-2Y;
	Tue, 19 Nov 2024 15:49:24 +0000
Date: Tue, 19 Nov 2024 15:49:24 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Andrew Lunn <andrew@lunn.ch>, Suraj Gupta <suraj.gupta2@amd.com>,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, michal.simek@amd.com,
	radhey.shyam.pandey@amd.com, horms@kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, git@amd.com, harini.katakam@amd.com
Subject: Re: [PATCH net-next 2/2] net: axienet: Add support for AXI 2.5G MAC
Message-ID: <ZzyzhCVBgXtQ_Aop@shell.armlinux.org.uk>
References: <20241118081822.19383-1-suraj.gupta2@amd.com>
 <20241118081822.19383-3-suraj.gupta2@amd.com>
 <ZztjvkxbCiLER-PJ@shell.armlinux.org.uk>
 <657764fd-68a1-4826-b832-3bda91a0c13b@linux.dev>
 <9d26a588-d9ac-43c5-bedc-22cb1f0923dd@lunn.ch>
 <72ded972-cd16-4124-84af-8d8ddad049f0@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72ded972-cd16-4124-84af-8d8ddad049f0@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_074940_232650_5C960FDC 
X-CRM114-Status: GOOD (  25.93  )
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

On Tue, Nov 19, 2024 at 10:26:52AM -0500, Sean Anderson wrote:
> On 11/18/24 20:35, Andrew Lunn wrote:
> > On Mon, Nov 18, 2024 at 11:00:22AM -0500, Sean Anderson wrote:
> >> On 11/18/24 10:56, Russell King (Oracle) wrote:
> >> > On Mon, Nov 18, 2024 at 01:48:22PM +0530, Suraj Gupta wrote:
> >> >> Add AXI 2.5G MAC support, which is an incremental speed upgrade
> >> >> of AXI 1G MAC and supports 2.5G speed only. "max-speed" DT property
> >> >> is used in driver to distinguish 1G and 2.5G MACs of AXI 1G/2.5G IP.
> >> >> If max-speed property is missing, 1G is assumed to support backward
> >> >> compatibility.
> >> >> 
> >> >> Co-developed-by: Harini Katakam <harini.katakam@amd.com>
> >> >> Signed-off-by: Harini Katakam <harini.katakam@amd.com>
> >> >> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
> >> >> ---
> >> > 
> >> > ...
> >> > 
> >> >> -	lp->phylink_config.mac_capabilities = MAC_SYM_PAUSE | MAC_ASYM_PAUSE |
> >> >> -		MAC_10FD | MAC_100FD | MAC_1000FD;
> >> >> +	lp->phylink_config.mac_capabilities = MAC_SYM_PAUSE | MAC_ASYM_PAUSE;
> >> >> +
> >> >> +	/* Set MAC capabilities based on MAC type */
> >> >> +	if (lp->max_speed == SPEED_1000)
> >> >> +		lp->phylink_config.mac_capabilities |= MAC_10FD | MAC_100FD | MAC_1000FD;
> >> >> +	else
> >> >> +		lp->phylink_config.mac_capabilities |= MAC_2500FD;
> >> > 
> >> > The MAC can only operate at (10M, 100M, 1G) _or_ 2.5G ?
> >> 
> >> It's a PCS limitation. It either does (1000Base-X and/or SGMII) OR
> >> (2500Base-X). The MAC itself doesn't have this limitation AFAIK.
> > 
> > 
> > And can the PCS change between these modes? It is pretty typical to
> > use SGMII for 10/100/1G and then swap to 2500BaseX for 2.5G.
> 
> Not AFAIK. There's only a bit for switching between 1000Base-X and
> SGMII. 2500Base-X is selected at synthesis time, and AIUI the serdes
> settings are different.

Okay. First it was a PCS limitation. Then it was a MAC limitation. Now
it's a synthesis limitation.

I'm coming to the conclusion that those I'm communicating with don't
actually know, and are just throwing random thoughts out there.

Please do the research, and come back to me with a real and complete
answer, not some hand-wavey "it's a limitation of X, no it's a
limitation of Y, no it's a limitation of Z" which looks like no one
really knows the correct answer.

Just because the PCS doesn't have a bit that selects 2500base-X is
meaningless. 2500base-X is generally implemented by upclocking
1000base-X by 2.5x. Marvell does this at their Serdes, there is
no configuration at the MAC/PCS for 2.5G speeds.

The same is true of 10GBASE-R vs 5GBASE-R in Marvell - 5GBASE-R is
just the serdes clocking the MAC/PCS at half the rate that 10GBASE-R
would run at.

I suspect this Xilinx hardware is just the same - clock the transmit
path it at 62.5MHz, and you get 1G speeds. Clock it at 156.25MHz,
and you get 2.5G speeds.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

