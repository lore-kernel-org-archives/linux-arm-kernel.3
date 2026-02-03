Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CDAE87849
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 16:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tO4MCHIfI13sBng9YukPUeiTeKdsgXUfkhfeAw3ZIYU=; b=C+8WNHMQmrNzKFkBWWkdiPFjRB
	yTeEeesaGs9aRN0QY0Ug68Rahw24o+b3FeWMDznR3Uv2yn1fHuqd4E/Cya7sGx4mGC/z3TM8m1xaj
	S/v/te20vdTXIm1mS6kVHy/+CueYVXXEB1fn1eAPWHLwyUwSipd+xKq35f9+9iUNwJSjxDi8lE/Uv
	vodkP7EMoDye4NGwo1JZWjkyFy5npIO+bVidNSpVev3JVh1M1C/9lBoqMFC8JIhhUlIFbqVcB7iQt
	BQ+V/Msb0F9FMPFjEKJ667fmI6Z1feAMtrnn1tQvCet3CcvCE5hS6NMtbFOkzNMwI7FVkGm1sD5bs
	ctibu/Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJci-00000006zG7-1ALS;
	Tue, 03 Feb 2026 16:51:32 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJcf-00000006zFU-0PFx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 16:51:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tO4MCHIfI13sBng9YukPUeiTeKdsgXUfkhfeAw3ZIYU=; b=vVtm7rCa/w3TlowDnkEtK0gDAD
	YBqCD5mXeS9JHvwaXbl42RbPXE86tuamam67zsu8h611FE7lXDkbPJfsKhbi+PINu5J/EeegOSrKa
	w7RoAaEDgwvrllqwFMMwRmF4qjtI9JZt7ICPjzblWEM96iwuSNsZnFCSWDfAz/wnWbN5f1ocXkqsV
	hXPVtlbEad+K9kCdWUqwGSxdfbi/WNi1WpAodwG9ftNm1gdnwUrEWBaGHDP+mCAXDrvmFSQJcD4iZ
	wYJQyTyKoqrVeilb0PLh6YGIpUYFZKvZ0e4wrPn26fw53fLbH6TjJbb8yG1ga3llmJxAgg3W+hxYw
	4F52w/3g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58266)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vnJcY-000000005KU-09NM;
	Tue, 03 Feb 2026 16:51:22 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vnJcT-000000004X5-467z;
	Tue, 03 Feb 2026 16:51:18 +0000
Date: Tue, 3 Feb 2026 16:51:17 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	"David S. Miller" <davem@davemloft.net>,
	Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>, imx@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Wei Fang <wei.fang@nxp.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH RFC net-next] net: stmmac: provide flag to disable EEE
Message-ID: <aYInheFgxBXh-bp1@shell.armlinux.org.uk>
References: <E1vNUjC-0000000FhjR-0h6P@rmk-PC.armlinux.org.uk>
 <f95f73b9-d024-4697-bca1-02fb8bc044af@gmail.com>
 <aYEj8VM5AfvcDHrl@shell.armlinux.org.uk>
 <ea2434e6-d1db-4ea2-90f4-0a77961b7918@gmail.com>
 <aYIXmsIG_ZJO-cg4@shell.armlinux.org.uk>
 <434bff80-0b89-4fe5-beb2-4b70a4b600d8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <434bff80-0b89-4fe5-beb2-4b70a4b600d8@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_085129_137053_4A9563FD 
X-CRM114-Status: GOOD (  14.16  )
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

On Tue, Feb 03, 2026 at 06:28:45PM +0200, Ovidiu Panait wrote:
> >> Thanks for fixing this. I did some testing on the Renesas RZ/V2H board
> >> with this patch and didn't see any issues:
> >>
> >> Tested-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> > 
> > Would you say this is a regression or a new problem?
> 
> I don't think it is a regression per se. AFAICT this behavior was always
> present as long as EEE is enabled, but I only noticed it after I changed
> the network switch the board was connected to.

Thanks, I've just sent the patch for net-next, as you would have seen.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

