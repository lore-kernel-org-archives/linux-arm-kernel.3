Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA13CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 20:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QO5CCKZz8K+FxHChucX6dPFxnD74Zj4nIadAyB4UqqY=; b=XTcT68+GeNRIgT8jkMveriuUl2
	tgH4O0kmSTBZBQAdjcs0zf3wLPwuj0RKwB9t2FrWGv+3WxCOxXyEzTmeaMNrau3ZIlBYTIEQYq1QS
	JbhqNvAh85a2JHrM6xlXrWc+VPWPXWCNi+ZcJx7fESW+CsfADm8ivEjJN6lS6bNRMtCO1dL5xyt07
	neV5BGRpbwHa0rTvqaR6BY7jlQQVmCaR3GUohcbPAzD7DYFD2u5mSzbD5BPAXfcpCqi3Bo4XcqBD7
	Cd5/DOQJma+t8IMs61w/vTRp9dE5u0WHRadoSyjPl87tmkGOMYxgEh4oB+vZoRj4twHQ2zHrThFqU
	0ENZ3M9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vADhV-0000000ARFu-3tTW;
	Sat, 18 Oct 2025 20:38:53 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vADhT-0000000AREm-3abj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 20:38:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=QO5CCKZz8K+FxHChucX6dPFxnD74Zj4nIadAyB4UqqY=; b=219YyT2koGh9ZG2kniua6hTtA3
	kytbSTUCvH09jHO6xXuf3x3Wc6W3WX0VChfdQ3HfTBaGmxtTF3F1A+cM12lNgHKF8d4kUx4gV6pGN
	HNsUb3N8w6uO6+o2yuRj2Ps5j/XN2dRTfCiXoXBz1mu5HGG5Y8Zmz1huUjGQhGi+zR64=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vADgv-00BOZC-9S; Sat, 18 Oct 2025 22:38:17 +0200
Date: Sat, 18 Oct 2025 22:38:17 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Han Gao <rabenda.cn@gmail.com>, Icenowy Zheng <uwu@icenowy.me>,
	Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <ziyao@disroot.org>,
	netdev@vger.kernel.org, sophgo@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH] net: stmmac: dwmac-sophgo: Add phy interface filter
Message-ID: <c16e53f9-f506-41e8-b3c6-cc3bdb1843e1@lunn.ch>
References: <20251017011802.523140-1-inochiama@gmail.com>
 <34fcc4cd-cd3d-418a-8d06-7426d2514dee@lunn.ch>
 <i5prc7y4fxt3krghgvs7buyfkwwulxnsc2oagbwdjx4tbqjqls@fx4nkkyz6tdt>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <i5prc7y4fxt3krghgvs7buyfkwwulxnsc2oagbwdjx4tbqjqls@fx4nkkyz6tdt>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_133851_892243_939B2208 
X-CRM114-Status: GOOD (  18.59  )
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

On Sat, Oct 18, 2025 at 08:42:07AM +0800, Inochi Amaoto wrote:
> On Fri, Oct 17, 2025 at 08:16:17PM +0200, Andrew Lunn wrote:
> > On Fri, Oct 17, 2025 at 09:18:01AM +0800, Inochi Amaoto wrote:
> > > As the SG2042 has an internal rx delay, the delay should be remove
> > > when init the mac, otherwise the phy will be misconfigurated.
> > 
> > Are there any in tree DT blobs using invalid phy-modes? In theory,
> > they should not work, but sometimes there is other magic going on. I
> > just want to make sure this is not going to cause a regression.
> > 
> 
> I see no SG2042 board using invalid phy-modes. Only rgmii-id is used,
> which is vaild.

Great, thanks for checking.

> 
> > Also, does the DT binding document list the valid phy-modes?
> > 
> 
> It does not list. Is it better for me to add a list for it?

It would be nice to list the valid modes, to match the code.

   Andrew

