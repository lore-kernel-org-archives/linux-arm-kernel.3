Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF5D5C02187
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jan 2025 15:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+BKApviZbKOtFG0ErRA2dV5y3fesSYbnNbVtybZaCtU=; b=T+1sHmyAlvpQSrXuiNp//VunWJ
	X984c9LIYZv/BC/b1MstmPkOIefAdEF1cNTy0KBsy5+fT4L6wTHPE1RmeK3CCX8aPZ/Rfbew5245Q
	IgnvAHxuIG6YehGABJQAAah06oy/vyd8JyBmLWKNbaE+3JR+6CUX3wq+vNSVSKhbivREshlVPVdLb
	2Gn5b8EUtwN3qv8gUzq9eJLtzkphbXjLiFCLXYoXp3jy8KTMmO9lc1FBmbYuTxcDpZf2HbnyYLbtW
	6h0Mh3pD86QMtKSDcLW5tVZj/7HZ8Be7TVKXoZ97GgT+T9dKxIJf0TR/x1rGiiLnk6EzCgWswf47L
	DI9yUAGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZX33-000000042ND-2P9x;
	Sun, 19 Jan 2025 15:17:13 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZX1m-0000000425j-2bCY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jan 2025 15:15:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+BKApviZbKOtFG0ErRA2dV5y3fesSYbnNbVtybZaCtU=; b=pbECHzt3CWWowzwNxNLHPHRLqG
	0A3VY0/MxcS8EmxS7lO3wqSIAKucmP87CDuP8pos4U/1KN/4tClv4YrDUjQl2UhYsTnZ3AiKAyhtg
	LqbHGhMPUXClOqKAmyDN6TJlCago8EJOs+GAVq9S1+C88HEft9Xew0TG3mnJUwpTMCqO3x2oO8Qf4
	wODyDaRbAh1ATDOM47YVjVxMpxFcW93N5hV/FYHZmcdw3NzeSYJXUEeu/I8Dsr4iEYy7fq4jmX6os
	QA7LXPQcpIY9+aisNHz3XKlnJuNM+NdeQRAS5zaQeKVjw/lTvKxeWY289B2rLHBOd60ev3eJyMtpS
	xprBzxIA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45824)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tZWzZ-0005Kg-20;
	Sun, 19 Jan 2025 15:13:37 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tZWzV-0001xB-2z;
	Sun, 19 Jan 2025 15:13:33 +0000
Date: Sun, 19 Jan 2025 15:13:33 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Oleksandr Makarov [GL]" <Oleksandr.Makarov@qsc.com>
Cc: Eric Dumazet <edumazet@google.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: BUG: UDP Packet Corruption Issue with stmmac Driver on Linux
 5.15.21-rt30
Message-ID: <Z40WnTc09OOnCZ3p@shell.armlinux.org.uk>
References: <BLAPR16MB392407EDC7DFA3089CC42E3CF0BE2@BLAPR16MB3924.namprd16.prod.outlook.com>
 <CANn89iL_p_pQaS=yjA2yZd2_o4Xp0U=J-ww4Ztp0V3DY=AufcA@mail.gmail.com>
 <BLAPR16MB392430582E67F952C115314CF0BE2@BLAPR16MB3924.namprd16.prod.outlook.com>
 <BLAPR16MB3924BB32CE2982432BAE103FF0622@BLAPR16MB3924.namprd16.prod.outlook.com>
 <BLAPR16MB3924E3DF8703DDCBC1C033BBF0E42@BLAPR16MB3924.namprd16.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BLAPR16MB3924E3DF8703DDCBC1C033BBF0E42@BLAPR16MB3924.namprd16.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_071554_659987_78EE5DF0 
X-CRM114-Status: GOOD (  10.13  )
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

On Sun, Jan 19, 2025 at 12:46:54PM +0000, Oleksandr Makarov [GL] wrote:
> I bisected kernel from 6.12, where the issue with trimming fragmented UDP packets was fixed, down to 5.15.21.
> 
> I have identified that commit  "47f753c1108e287edb3e27fad8a7511a9d55578e net: stmmac: disable Split Header (SPH) for Intel platforms" is fixing the problem.

It sounds like you're saying that it's been fixed on mainline, but the
fix hasn't been backported to 5.15.21. Well, it won't ever be. 5.15.21
is one instance of the 5.15-stable kernel tree, and the 5.15-stable
tree is now at 5.15.176.

Try moving your stable kernel forward. If you're locked in to 5.15.21
by an upstream vendor, then you need to complain to them.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

