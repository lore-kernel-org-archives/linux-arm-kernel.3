Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E4810D1489
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 21:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d4q09W+eD8Stqj42zbiz4smzDCvADGAs3rAaGG5Y1sM=; b=HRvfNyfv6PcjDh595T+030hPIe
	O8hKC+maFiKFFO0RPqLqxmp15ge0bebtQL8xzJoOjXjlyh7/POAv5sbjXysNurzVJDP1PBKfVVHTq
	4RvdovzYu13+Tswtb+5e1cqWaqh7ZCMojRMFoUTkKXInn1XgmzarXlv77oWXF+UhkLCCLrxvA/TNn
	f2Cmbp0If6r7ztG17OAjZdX75rOAX/x4UW/2fdH6M9Na7GhS3e6fRkUKTrC4GeIEs0HrnkgZ6ESjy
	7JMZquTb6Jzmv689ZmvwRW+ZRxna/L5gf8HDI7Nj/ooxanz9Adz+QImVDq+GSwrhA/u9RCgIFYpnQ
	RqGWo5zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6bKd-00000009JbV-1Kv3;
	Sat, 28 Mar 2026 21:36:35 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6bKa-00000009Jb8-1KvA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 21:36:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=d4q09W+eD8Stqj42zbiz4smzDCvADGAs3rAaGG5Y1sM=; b=c76FFFg4SPPzxGrdE9k3KDYBbf
	7LiMnn3gM32EcuvjgEcVqHX2wWFyXkK4CtbCJFeZDgBRAZz1bf+Xa8BsBFvgOci99LVIEFsXVuAeo
	0IYP+d+cWqRsVs6n+6AKbnW3wrPtizSR7rNZjOXJBdrEST6BXu5YI9M1IJ0MSQRvVGB6LF1aSAd/G
	NIehs9P2f1lf32ICYauQW289EMGoxwvkRBg6L3nrzN+2r/JE2jm3mlYyosUpxkDgP4BRliPGm1HM1
	cYfdk8hNG/jh1f8rlnqwd8S4NOVla7vjWEs6nOcildmY97BalsXYZX4fviNY8vf1D9jI16O0wiu4+
	cj9p+Y7Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40630)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w6bKT-000000007RJ-0s5p;
	Sat, 28 Mar 2026 21:36:25 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w6bKP-0000000010D-1PC3;
	Sat, 28 Mar 2026 21:36:21 +0000
Date: Sat, 28 Mar 2026 21:36:21 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Ong Boon Leong <boon.leong.ong@intel.com>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 00/10] net: stmmac: TSO fixes/cleanups
Message-ID: <achJ1dfeT6Q8rBuX@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_143632_360380_30885914 
X-CRM114-Status: GOOD (  16.74  )
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

Hot off the press from reading various sources of dwmac information,
this series attempts to fix the buggy hacks that were previously
merged, and clean up the code handling this.

I'm not sure whether "TSO" or "GSO" should be used to describe this
feature - although it primarily handles TCP, dwmac4 appears to also
be able to handle UDP.

In essence, this series adds a .ndo_features_check() method to handle
whether TSO/GSO can be used for a particular skbuff - checking which
queue the skbuff is destined for and whether that has TBS available
which precludes TSO being enabled on that channel.

I'm also adding a check that the header is smaller than 1024 bytes,
as documented in those sources which have TSO support - this is due
to the hardware buffering the header in "TSO memory" which I guess
is limited to 1KiB. I expect this test never to trigger, but if
the headers ever exceed that size, the hardware will likely fail.

I'm also moving the VLAN insertion for TSO packets into core code -
with the addition of .do_Features_check(), this can be done and
unnecessary code removed from the stmmac driver.

I've changed the hardware initialisation to always enable TSO support
on the channels even if the user requests TSO/GSO to be disabled -
this fixes another issue as pointed out by Jakub in a previous review
of the two patches (now patches 5 and 6.)

I'm moving the setup of the GSO features, cleaning those up, and
adding a warning if platform glue requests this to be enabled but the
hardware has no support. Hopefully this will never trigger if everyone
got the STMMAC_FLAG_TSO_EN flag correct.

Also move the "TSO supported" message to the new
stmmac_set_gso_features() function so keep all this TSO stuff together.

 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |   3 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 135 ++++++++++++++--------
 2 files changed, 92 insertions(+), 46 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

