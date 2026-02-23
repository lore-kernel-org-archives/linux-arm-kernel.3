Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04171EA4FAE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 11:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yVvxS2osg3afF5QxBmdLydqPQProiRbBV5PcFjFO3rw=; b=k744bWkhpRlwwXI0fCcm2NjFPL
	ppHBYjy+sqECrWsRBxvmHzNg3pswHYQjUi01mxvKmMN6yOZmaolF6b1YH88E8KzqWAyMqvi1ym5va
	17vP5USftHK5D90Kq1/bfHpBv4M/xO0anQVv3OSBr35oEgE+X3ZDFl400UYtlhOQjYNVv35dIrm0o
	k4dkxXEy/SUZzF5uiSjpEtcnnkNUT2ybKaq7s6e7XbOvKXC7btU0gMo0kg8WEqTLhfBzQWjjzL0Xc
	qzg/wcjIxCnj717MefyxENR4k9I90cNTc7evvaevzynO+OihTPBt2qQuSc87tZs137wryg46J4qrN
	T8fzrF2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuUJq-00000000Cmb-3zoE;
	Mon, 23 Feb 2026 11:41:42 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuUJo-00000000CmB-1rUp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 11:41:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yVvxS2osg3afF5QxBmdLydqPQProiRbBV5PcFjFO3rw=; b=iDELU8NHAmM6JhFcM9spRAW3nh
	MhRfYpQt65BSWM3wU/oUk6yTzlvCcLa3rpVBUcbV9KG6nZNcMuq5JlYKVBZ7M8uWwig9BTNaF3OYz
	XVLy7xgQ8v+s4FSQEyaC5XBxXNFylV8UCsbCRdb1RTM9/hUkSmBXuKwIczv3XltY34oBttO5vAe80
	ip03Q6NNCCap1+Fxx1EgC+KE/n2Uisgo0uHARbWoAOTGJyo5lFHh9PL4mGwRVvJQlUyx7POUhbjV/
	JgwdWGtNY681CcsZFJU8uIqpCauHgsEnCXANGDBDhocJ8H472QQHODWEAlGqj642ttfWpF4420Tmt
	vTasf/cQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47186)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vuUJi-000000003zE-1EVx;
	Mon, 23 Feb 2026 11:41:34 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vuUJe-000000007L7-1JHc;
	Mon, 23 Feb 2026 11:41:30 +0000
Date: Mon, 23 Feb 2026 11:41:30 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 0/2] net: stmmac: fix interrupt coalescing
Message-ID: <aZw86hpjQ-3w3xqJ@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_034140_483527_6AB18163 
X-CRM114-Status: UNSURE (   9.45  )
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

Hi,

While cleaning up the descriptor handling, I noticed that the accounting
of transmit "packets" for interrupt coalescing was buggy in that it
takes the difference of the two indexes into the circular list of
transmit discriptors and merely subtracts one from the other without
regard for the indexes wrapping.

This can result in a negative number or very large positive number
which would have the effect of either reducing tx_q->tx_count_frames
or making that very large.

Either way, the result is numerically incorrect, and could trigger
interrupts or not trigger interrupts when required.

This series converts stmmac to use the circ_buf helpers, and then fixes
this problem.

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 28 ++++++++---------------
 1 file changed, 10 insertions(+), 18 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

